#!/usr/bin/env bash
# ============================================================
# Load Senologie IG resources into Matchbox for $transform
# Usage: ./scripts/matchbox/load-ig.sh
# Prerequisites: Matchbox running, IG built (output/ populated)
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

# ── Load resources ────────────────────────────────────────────
load_resources() {
  local pattern="$1"
  local type="$2"
  local count=0

  for f in $pattern; do
    [ -f "$f" ] || continue
    # Extract resource id from JSON
    id=$(python3 -c "import sys,json; print(json.load(open('$f')).get('id',''))" 2>/dev/null)
    if [ -z "$id" ]; then
      echo "  SKIP $(basename "$f") (no id)"
      continue
    fi
    status=$(curl -sf -o /dev/null -w "%{http_code}" -X PUT "$FHIR_URL/$type/$id" \
      -H "Content-Type: application/fhir+json" \
      -d @"$f" 2>/dev/null || echo "ERR")
    if [ "$status" = "200" ] || [ "$status" = "201" ]; then
      count=$((count + 1))
    else
      echo "  WARN $type/$id -> HTTP $status"
    fi
  done
  echo "  $type: $count loaded"
}

echo ""
echo "=== Loading Logical Models (StructureDefinitions) ==="
load_resources "$OUTPUT_DIR/StructureDefinition-obds-*.json" "StructureDefinition"
load_resources "$OUTPUT_DIR/StructureDefinition-oncobox-*.json" "StructureDefinition"
load_resources "$OUTPUT_DIR/StructureDefinition-ireg-*.json" "StructureDefinition"
load_resources "$OUTPUT_DIR/StructureDefinition-iqtig-*.json" "StructureDefinition"

echo ""
echo "=== Loading ConceptMaps ==="
load_resources "$OUTPUT_DIR/ConceptMap-*.json" "ConceptMap"

echo ""
echo "=== Loading StructureMaps ==="
load_resources "$OUTPUT_DIR/StructureMap-*.json" "StructureMap"

# ── Verify ────────────────────────────────────────────────────
echo ""
echo "=== Summary ==="
for type in StructureMap StructureDefinition ConceptMap; do
  total=$(curl -sf "$FHIR_URL/$type?_summary=count" \
    | python3 -c "import sys,json; print(json.load(sys.stdin).get('total',0))" 2>/dev/null || echo "?")
  echo "  $type: $total"
done

echo ""
echo "Done. Test with:"
echo "  curl -X POST '$FHIR_URL/StructureMap/\$transform?source=<map-url>' \\"
echo "    -H 'Content-Type: application/fhir+json' -d @bundle.json"
