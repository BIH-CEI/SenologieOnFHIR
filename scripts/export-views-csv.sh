#!/bin/bash
# Export all SQL-on-FHIR ViewDefinitions from Aidbox as CSV files
# Usage: ./scripts/export-views-csv.sh [--output-dir DIR] [--base-url URL]

set -euo pipefail

AIDBOX_URL="${AIDBOX_URL:-http://localhost:8888}"
AIDBOX_AUTH="${AIDBOX_AUTH:-Basic cm9vdDpzZWNyZXQ=}"
OUTPUT_DIR="${1:-exports}"

mkdir -p "$OUTPUT_DIR"

echo "Exporting ViewDefinitions from $AIDBOX_URL → $OUTPUT_DIR/"
echo ""

# Fetch all ViewDefinition IDs
VIEWS=$(curl -s "$AIDBOX_URL/ViewDefinition?_count=100" \
  -H "Authorization: $AIDBOX_AUTH" | python3 -c "
import sys, json
bundle = json.load(sys.stdin)
for e in bundle.get('entry', []):
    print(e['resource']['id'])
" 2>/dev/null)

TOTAL=0
EXPORTED=0

for vd in $VIEWS; do
  TOTAL=$((TOTAL + 1))
  echo -n "  $vd... "

  result=$(curl -s -X POST "$AIDBOX_URL/fhir/ViewDefinition/$vd/\$run" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Accept: application/json" \
    -H "Content-Type: application/fhir+json" \
    -d '{"resourceType":"Parameters","parameter":[{"name":"_format","valueCode":"json"}]}' 2>/dev/null)

  rows=$(echo "$result" | python3 -c "
import sys, json, csv, io
try:
    data = json.load(sys.stdin)
    if not isinstance(data, list) or len(data) == 0:
        print('EMPTY', file=sys.stderr)
        sys.exit(0)
    out = io.StringIO()
    w = csv.DictWriter(out, fieldnames=data[0].keys(), extrasaction='ignore')
    w.writeheader()
    w.writerows(data)
    print(out.getvalue(), end='')
    print(len(data), file=sys.stderr)
except Exception as e:
    print(f'ERROR: {e}', file=sys.stderr)
    sys.exit(1)
" 2>"$OUTPUT_DIR/.count" )

  count=$(cat "$OUTPUT_DIR/.count")

  if [[ "$count" == "EMPTY" ]]; then
    echo "0 rows (skipped)"
  elif [[ "$count" == ERROR* ]]; then
    echo "$count"
  else
    echo "$rows" > "$OUTPUT_DIR/${vd}.csv"
    echo "$count rows → ${vd}.csv"
    EXPORTED=$((EXPORTED + 1))
  fi
done

rm -f "$OUTPUT_DIR/.count"

echo ""
echo "Done: $EXPORTED/$TOTAL views exported to $OUTPUT_DIR/"
ls -lh "$OUTPUT_DIR"/*.csv 2>/dev/null
