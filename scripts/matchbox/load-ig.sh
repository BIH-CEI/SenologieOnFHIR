#!/usr/bin/env bash
# ============================================================
# Load Senologie IG resources into Matchbox for $transform
# Usage: ./scripts/matchbox/load-ig.sh
# Prerequisites:
#   - Matchbox running (docker compose -f docker-compose.matchbox.yaml up -d)
#   - IG built (output/ populated via _genonce.sh)
# ============================================================
set -euo pipefail

MATCHBOX_URL="${MATCHBOX_URL:-http://localhost:8080}"
FHIR_URL="$MATCHBOX_URL/matchboxv3/fhir"
OUTPUT_DIR="output"

# ── Wait for Matchbox ─────────────────────────────────────────
echo "Waiting for Matchbox at $MATCHBOX_URL ..."
until curl -sf "$FHIR_URL/metadata" > /dev/null 2>&1; do
  printf "."
  sleep 3
done
echo " ready."

# ── Load Logical Models ───────────────────────────────────────
echo ""
echo "=== Loading Logical Models ==="
for f in "$OUTPUT_DIR"/StructureDefinition-obds-*.json \
         "$OUTPUT_DIR"/StructureDefinition-oncobox-*.json \
         "$OUTPUT_DIR"/StructureDefinition-ireg-*.json \
         "$OUTPUT_DIR"/StructureDefinition-iqtig-*.json; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .json)
  code=$(curl -sf -o /dev/null -w "%{http_code}" -X POST "$FHIR_URL/StructureDefinition" \
    -H "Content-Type: application/fhir+json" -d @"$f" 2>/dev/null || echo "ERR")
  printf "  %-50s %s\n" "$name" "$code"
done

# ── Load ConceptMaps ──────────────────────────────────────────
echo ""
echo "=== Loading ConceptMaps ==="
for f in "$OUTPUT_DIR"/ConceptMap-*.json; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .json)
  code=$(curl -sf -o /dev/null -w "%{http_code}" -X POST "$FHIR_URL/ConceptMap" \
    -H "Content-Type: application/fhir+json" -d @"$f" 2>/dev/null || echo "ERR")
  printf "  %-50s %s\n" "$name" "$code"
done

# ── Load StructureMaps (FML format) ───────────────────────────
echo ""
echo "=== Loading StructureMaps (FML) ==="
ok=0; fail=0
for f in input/maps/*.map; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .map)
  code=$(curl -sf -o /dev/null -w "%{http_code}" -X POST "$FHIR_URL/StructureMap" \
    -H "Content-Type: text/fhir-mapping" --data-binary @"$f" 2>/dev/null || echo "ERR")
  if [ "$code" = "201" ] || [ "$code" = "200" ]; then
    ok=$((ok + 1))
    printf "  %-50s OK\n" "$name"
  else
    fail=$((fail + 1))
    printf "  %-50s FAIL (%s)\n" "$name" "$code"
  fi
done

# ── Summary ───────────────────────────────────────────────────
echo ""
echo "=== Summary ==="
echo "  StructureMaps: $ok loaded, $fail failed"
sm_total=$(curl -sf "$FHIR_URL/StructureMap?_summary=count" \
  | python3 -c "import sys,json; print(json.load(sys.stdin).get('total',0))" 2>/dev/null || echo "?")
echo "  Total in server: $sm_total"
echo ""
echo "Test: curl -X POST '$FHIR_URL/StructureMap/\$transform?source=<map-url>' \\"
echo "        -H 'Content-Type: application/fhir+json' -d @bundle.json"
