#!/usr/bin/env bash
# ============================================================
# Generic Extraction Snapshot Test
#
# Schickt ein Test-Bundle (z.B. Fall 1) an Matchbox $transform mit
# der angegebenen StructureMap und vergleicht das Ergebnis mit einem
# geprüften Snapshot.
#
# Modes:
#   ./test-extraction-snapshot.sh obds                # alle Fälle, oBDS-Target
#   ./test-extraction-snapshot.sh oncobox fall1       # nur Fall 1, OncoBox
#   UPDATE_SNAPSHOTS=1 ./test-extraction-snapshot.sh obds fall1
#
# Targets:
#   obds      → SenologieToObdsMeldung
#   oncobox   → SenologieToOncoBoxBrust
#   iqtig     → SenologieToIqtigMammachirurgie181
#   iregg     → SenologieToIRegMeldung
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
MATCHBOX_URL="${MATCHBOX_URL:-http://localhost:8080}"
FHIR_URL="$MATCHBOX_URL/matchboxv3/fhir"
INPUT_DIR="$REPO_ROOT/validation/extractions/input"

target="${1:-}"
if [ -z "$target" ]; then
  echo "Usage: $0 <obds|oncobox|iqtig|iregg> [fall<N> ...]"
  exit 64
fi
shift

case "$target" in
  obds)    MAP_URL="https://www.senologie.org/fhir/StructureMap/SenologieToObdsMeldung" ;;
  oncobox) MAP_URL="https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust" ;;
  iqtig)   MAP_URL="https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181" ;;
  iregg)   MAP_URL="https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung" ;;
  *)       echo "Unknown target '$target'. Use one of: obds, oncobox, iqtig, iregg"; exit 64 ;;
esac

EXPECTED_DIR="$REPO_ROOT/validation/extractions/expected/$target"
ACTUAL_DIR="$REPO_ROOT/validation/extractions/actual/$target"
mkdir -p "$ACTUAL_DIR" "$EXPECTED_DIR"

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
    echo "  ✗ [$target] $case_name: input not found ($input)"
    fail=$((fail + 1))
    continue
  fi

  http_code=$(curl -sf -o "$actual.raw" -w "%{http_code}" \
    -X POST "$FHIR_URL/StructureMap/\$transform?source=$MAP_URL" \
    -H "Content-Type: application/fhir+json" \
    -H "Accept: application/fhir+json" \
    --data-binary "@$input" 2>/dev/null || echo "ERR")

  if [ "$http_code" != "200" ]; then
    echo "  ✗ [$target] $case_name: \$transform failed (HTTP $http_code)"
    head -c 300 "$actual.raw" 2>/dev/null; echo
    fail=$((fail + 1))
    continue
  fi

  python3 -c "
import json, sys, re
UUID_RE = re.compile(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\$')
# Volatile keys, deren Wert immer wieder neu generiert wird
VOLATILE_KEYS = {'meldungID', 'lastUpdated', 'versionId', 'source', 'meldungsID'}
def scrub(o):
    if isinstance(o, dict):
        out = {}
        for k, v in o.items():
            if k in VOLATILE_KEYS and isinstance(v, str):
                out[k] = '<volatile>'
            else:
                out[k] = scrub(v)
        return out
    if isinstance(o, list):
        return [scrub(x) for x in o]
    if isinstance(o, str) and UUID_RE.match(o):
        return '<uuid>'
    return o
d = scrub(json.load(open('$actual.raw')))
if 'meta' in d and not d['meta']:
    d.pop('meta')
print(json.dumps(d, indent=2, sort_keys=True, ensure_ascii=False))
" > "$actual"
  rm -f "$actual.raw"

  if [ "${UPDATE_SNAPSHOTS:-0}" = "1" ]; then
    cp "$actual" "$expected"
    echo "  ↻ [$target] $case_name: snapshot updated"
    pass=$((pass + 1))
    continue
  fi

  if [ ! -f "$expected" ]; then
    echo "  ? [$target] $case_name: no expected snapshot — run with UPDATE_SNAPSHOTS=1"
    fail=$((fail + 1))
    continue
  fi

  if diff -q "$expected" "$actual" > /dev/null; then
    echo "  ✓ [$target] $case_name"
    pass=$((pass + 1))
  else
    echo "  ✗ [$target] $case_name: diff to expected snapshot"
    diff -u "$expected" "$actual" | head -40
    fail=$((fail + 1))
  fi
done

echo
echo "── [$target] $pass passed, $fail failed ──"
exit $fail
