#!/usr/bin/env bash
# ============================================================
# Load Senologie IG into Matchbox and test StructureMap transform
# Usage: ./scripts/matchbox/load-ig.sh
# Prerequisites: Matchbox running on localhost:8080
# ============================================================
set -euo pipefail

MATCHBOX_URL="${MATCHBOX_URL:-http://localhost:8080}"
FHIR_URL="$MATCHBOX_URL/fhir"
OUTPUT_DIR="output"
RESULTS_DIR="output/transform-results"

# ── Wait for Matchbox ─────────────────────────────────────────
echo "Waiting for Matchbox at $MATCHBOX_URL ..."
until curl -sf "$FHIR_URL/metadata" > /dev/null 2>&1; do
  printf "."
  sleep 3
done
echo " ready."

# ── Check available StructureMaps ─────────────────────────────
echo ""
echo "=== Available StructureMaps ==="
SM_COUNT=$(curl -sf "$FHIR_URL/StructureMap?_summary=count" | python3 -c "import sys,json; print(json.load(sys.stdin).get('total',0))" 2>/dev/null || echo "?")
echo "StructureMaps loaded: $SM_COUNT"

if [ "$SM_COUNT" = "0" ] || [ "$SM_COUNT" = "?" ]; then
  echo ""
  echo "No StructureMaps found. Loading from output/package.tgz ..."

  # POST each StructureMap JSON individually
  for f in "$OUTPUT_DIR"/StructureMap-*.json; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .json)
    echo "  Loading $name ..."
    curl -sf -X PUT "$FHIR_URL/StructureMap/$name" \
      -H "Content-Type: application/fhir+json" \
      -d @"$f" > /dev/null
  done

  # Also load Logical Models (StructureDefinitions for targets)
  for f in "$OUTPUT_DIR"/StructureDefinition-obds-*.json \
           "$OUTPUT_DIR"/StructureDefinition-oncobox-*.json \
           "$OUTPUT_DIR"/StructureDefinition-ireg-*.json \
           "$OUTPUT_DIR"/StructureDefinition-iqtig-*.json; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .json)
    echo "  Loading $name ..."
    curl -sf -X PUT "$FHIR_URL/StructureDefinition/$name" \
      -H "Content-Type: application/fhir+json" \
      -d @"$f" > /dev/null
  done

  # Load ConceptMaps
  for f in "$OUTPUT_DIR"/ConceptMap-*.json; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .json)
    echo "  Loading $name ..."
    curl -sf -X PUT "$FHIR_URL/ConceptMap/$name" \
      -H "Content-Type: application/fhir+json" \
      -d @"$f" > /dev/null
  done

  SM_COUNT=$(curl -sf "$FHIR_URL/StructureMap?_summary=count" | python3 -c "import sys,json; print(json.load(sys.stdin).get('total',0))" 2>/dev/null || echo "?")
  echo "StructureMaps after loading: $SM_COUNT"
fi

# ── List all maps ─────────────────────────────────────────────
echo ""
echo "=== StructureMap Index ==="
curl -sf "$FHIR_URL/StructureMap?_elements=name,url&_count=100" \
  | python3 -c "
import sys, json
bundle = json.load(sys.stdin)
for e in bundle.get('entry', []):
    r = e.get('resource', {})
    print(f\"  {r.get('name','?'):45s} {r.get('url','')}\")
" 2>/dev/null || echo "(could not list)"

echo ""
echo "=== Ready for \$transform ==="
echo "Example:"
echo "  curl -X POST '$FHIR_URL/StructureMap/\$transform?source=https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose' \\"
echo "    -H 'Content-Type: application/fhir+json' \\"
echo "    -d @bundle-fall1.json"
