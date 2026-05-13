#!/usr/bin/env bash
# ============================================================
# oBDS-Extraction Snapshot Test
#
# Schickt ein Test-Bundle (z.B. Fall 1) an Matchbox $transform mit
# der SenologieToObdsMeldung Map und vergleicht das Ergebnis mit
# einem geprüften Snapshot in validation/extractions/expected/obds/.
#
# Modes:
#   ./scripts/extractions/test-obds-snapshot.sh           # alle Fälle testen
#   ./scripts/extractions/test-obds-snapshot.sh fall1     # nur Fall 1
#   UPDATE_SNAPSHOTS=1 ./test-obds-snapshot.sh fall1      # Snapshot neu schreiben
#
# Prerequisites:
#   - Matchbox läuft  (docker compose -f docker-compose.matchbox.yaml up -d)
#   - IG ist gebaut   (output/ populiert via _genonce.sh)
#   - Maps geladen    (./scripts/matchbox/load-ig.sh)
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
MATCHBOX_URL="${MATCHBOX_URL:-http://localhost:8080}"
FHIR_URL="$MATCHBOX_URL/matchboxv3/fhir"
INPUT_DIR="$REPO_ROOT/validation/extractions/input"
EXPECTED_DIR="$REPO_ROOT/validation/extractions/expected/obds"
ACTUAL_DIR="$REPO_ROOT/validation/extractions/actual/obds"
MAP_URL="https://www.senologie.org/fhir/StructureMap/SenologieToObdsMeldung"

mkdir -p "$ACTUAL_DIR"

# Argumente: einzelner Fall oder alle
if [ $# -gt 0 ]; then
  CASES=("$@")
else
  CASES=()
  for f in "$INPUT_DIR"/fall*.json; do
    [ -f "$f" ] || continue
    CASES+=("$(basename "$f" .json)")
  done
fi

if [ ${#CASES[@]} -eq 0 ]; then
  echo "No test cases found. Build one with: python3 scripts/extractions/build-test-bundle.py <N>"
  exit 0
fi

# Matchbox erreichbar?
if ! curl -sf "$FHIR_URL/metadata" > /dev/null 2>&1; then
  echo "ERROR: Matchbox nicht erreichbar unter $MATCHBOX_URL"
  echo "       docker compose -f docker-compose.matchbox.yaml up -d"
  exit 3
fi

fail=0
pass=0

for case_name in "${CASES[@]}"; do
  input="$INPUT_DIR/$case_name.json"
  expected="$EXPECTED_DIR/$case_name.json"
  actual="$ACTUAL_DIR/$case_name.json"

  if [ ! -f "$input" ]; then
    echo "  ✗ $case_name: input not found ($input)"
    fail=$((fail + 1))
    continue
  fi

  # $transform aufrufen
  http_code=$(curl -sf -o "$actual.raw" -w "%{http_code}" \
    -X POST "$FHIR_URL/StructureMap/\$transform?source=$MAP_URL" \
    -H "Content-Type: application/fhir+json" \
    --data-binary "@$input" 2>/dev/null || echo "ERR")

  if [ "$http_code" != "200" ]; then
    echo "  ✗ $case_name: \$transform failed (HTTP $http_code)"
    head -c 300 "$actual.raw" 2>/dev/null
    echo
    fail=$((fail + 1))
    continue
  fi

  # Normalisieren (sort keys, strip volatile fields)
  python3 -c "
import json, sys
d = json.load(open('$actual.raw'))
# Strip volatile metadata
if 'meta' in d:
    for k in ('lastUpdated','versionId','source'):
        d['meta'].pop(k, None)
    if not d['meta']:
        d.pop('meta')
print(json.dumps(d, indent=2, sort_keys=True, ensure_ascii=False))
" > "$actual"
  rm -f "$actual.raw"

  if [ "${UPDATE_SNAPSHOTS:-0}" = "1" ]; then
    mkdir -p "$(dirname "$expected")"
    cp "$actual" "$expected"
    echo "  ↻ $case_name: snapshot updated"
    pass=$((pass + 1))
    continue
  fi

  if [ ! -f "$expected" ]; then
    echo "  ? $case_name: no expected snapshot — run with UPDATE_SNAPSHOTS=1"
    fail=$((fail + 1))
    continue
  fi

  if diff -q "$expected" "$actual" > /dev/null; then
    echo "  ✓ $case_name"
    pass=$((pass + 1))
  else
    echo "  ✗ $case_name: diff to expected snapshot"
    diff -u "$expected" "$actual" | head -40
    echo "    (full diff: diff -u $expected $actual)"
    fail=$((fail + 1))
  fi
done

echo
echo "── $pass passed, $fail failed ──"
exit $fail
