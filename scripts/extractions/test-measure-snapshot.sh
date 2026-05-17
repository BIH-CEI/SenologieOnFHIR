#!/usr/bin/env bash
# ============================================================
# Measure Snapshot Test
#
# Ruft $evaluate-measure auf HAPI fuer jedes Senologie-Measure auf
# und vergleicht das gescrubbte MeasureReport mit einem Snapshot.
#
# Auswertung gegen die in HAPI geladenen Beispielpatienten — als CI-Hebel,
# damit Aenderungen an Profilen / CQL / Beispieldaten nicht unbemerkt die
# Kennzahlen kippen.
#
# Setup:
#   docker compose -f docker-compose.hapi.yaml up -d
#   ./scripts/cql/evaluate-measure.sh  # einmal zum Initialladen
#
# Usage:
#   ./scripts/extractions/test-measure-snapshot.sh                # alle Measures
#   ./scripts/extractions/test-measure-snapshot.sh qi-02 kb-12    # nur ausgewaehlte
#   UPDATE_SNAPSHOTS=1 ./scripts/extractions/test-measure-snapshot.sh
#
# Env:
#   HAPI_URL=http://localhost:8095/fhir
#   PERIOD_START=2020-01-01
#   PERIOD_END=2025-12-31
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
HAPI_URL="${HAPI_URL:-http://localhost:8095/fhir}"
PERIOD_START="${PERIOD_START:-2020-01-01}"
PERIOD_END="${PERIOD_END:-2025-12-31}"

EXPECTED_DIR="$REPO_ROOT/validation/extractions/expected/measures"
ACTUAL_DIR="$REPO_ROOT/validation/extractions/actual/measures"
mkdir -p "$ACTUAL_DIR" "$EXPECTED_DIR"

# Alle Measures aus fsh-generated/resources/
ALL_MEASURES=()
for f in "$REPO_ROOT"/fsh-generated/resources/Measure-senologie-measure-*.json; do
  [ -f "$f" ] || continue
  # senologie-measure-s3-qi-02 → qi-02
  id=$(basename "$f" .json | sed 's/^Measure-senologie-measure-//')
  ALL_MEASURES+=("$id")
done

# Filter from CLI args
if [ $# -gt 0 ]; then
  CASES=("$@")
else
  CASES=("${ALL_MEASURES[@]}")
fi

if [ ${#CASES[@]} -eq 0 ]; then
  echo "No measures found in fsh-generated/resources/. Run: sushi ."
  exit 0
fi

if ! curl -sf "$HAPI_URL/metadata" > /dev/null 2>&1; then
  echo "ERROR: HAPI nicht erreichbar unter $HAPI_URL"
  echo "       docker compose -f docker-compose.hapi.yaml up -d"
  exit 3
fi

fail=0
pass=0

for short_id in "${CASES[@]}"; do
  full_id="senologie-measure-$short_id"
  expected="$EXPECTED_DIR/${short_id}.MeasureReport.json"
  actual="$ACTUAL_DIR/${short_id}.MeasureReport.json"

  raw=$(curl -sf -w "\n__HTTP__%{http_code}" \
    "$HAPI_URL/Measure/$full_id/\$evaluate-measure?periodStart=$PERIOD_START&periodEnd=$PERIOD_END&reportType=population" \
    2>/dev/null) || raw="ERR"

  http=$(echo "$raw" | tail -1 | sed 's/__HTTP__//')
  body=$(echo "$raw" | sed '$d')

  if [ "$http" != "200" ]; then
    echo "  ✗ [measure] $short_id: \$evaluate-measure HTTP $http"
    echo "    $(echo "$body" | head -c 200)"
    fail=$((fail + 1))
    continue
  fi

  # Scrub volatile fields, keep only what matters for measure validation
  echo "$body" | python3 -c "
import json, sys, re
UUID_RE = re.compile(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\$')
VOLATILE_KEYS = {'date', 'id', 'lastUpdated', 'versionId', 'source', 'evaluatedResource'}

def scrub(o):
    if isinstance(o, dict):
        return {k: ('<volatile>' if (k in VOLATILE_KEYS and isinstance(v, str)) else scrub(v))
                for k, v in o.items() if k not in {'contained', 'evaluatedResource'}}
    if isinstance(o, list):
        return [scrub(x) for x in o]
    if isinstance(o, str) and UUID_RE.match(o):
        return '<uuid>'
    return o

d = scrub(json.load(sys.stdin))
print(json.dumps(d, indent=2, sort_keys=True, ensure_ascii=False))
" > "$actual"

  # Detect runtime errors (contained OperationOutcome was scrubbed; check via group counts)
  has_error=$(python3 -c "
import json
d = json.load(open('$actual'))
# Status 'error' on group counts (all populations 0 + no measureScore) is suspicious
groups = d.get('group', [])
if not groups:
    print('NO_GROUPS')
else:
    g = groups[0]
    score = g.get('measureScore', {}).get('value')
    pops = {p['code']['coding'][0]['code']: p.get('count', 0) for p in g.get('population', [])}
    ip = pops.get('initial-population', 0)
    if ip == 0 and score is None:
        print('ZERO_AND_ERROR')
    else:
        print('OK')
")

  if [ "${UPDATE_SNAPSHOTS:-0}" = "1" ]; then
    cp "$actual" "$expected"
    echo "  ↻ [measure] $short_id: snapshot updated ($has_error)"
    pass=$((pass + 1))
    continue
  fi

  if [ ! -f "$expected" ]; then
    echo "  ? [measure] $short_id: no expected snapshot — run with UPDATE_SNAPSHOTS=1"
    fail=$((fail + 1))
    continue
  fi

  if diff -q "$expected" "$actual" > /dev/null; then
    # Show measure values briefly for CI logs
    summary=$(python3 -c "
import json
d = json.load(open('$actual'))
for g in d.get('group', []):
    pops = {p['code']['coding'][0]['code']: p.get('count', 0) for p in g.get('population', [])}
    score = g.get('measureScore', {}).get('value', '-')
    print(f\"ip={pops.get('initial-population','-')} den={pops.get('denominator','-')} num={pops.get('numerator','-')} score={score}\")
")
    echo "  ✓ [measure] $short_id  $summary"
    pass=$((pass + 1))
  else
    echo "  ✗ [measure] $short_id: diff to expected snapshot"
    diff -u "$expected" "$actual" | head -30
    fail=$((fail + 1))
  fi
done

echo
echo "── [measure] $pass passed, $fail failed ──"
exit $fail
