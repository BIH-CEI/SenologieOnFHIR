#!/usr/bin/env bash
# ============================================================
# Form-Extraction Snapshot-Test
#
# Iteriert über validation/forms/fixtures/*.qr.json (vorgefertigte
# QuestionnaireResponses), POSTet jede an Aidbox /QR/$extract und
# vergleicht das Ergebnis-Bundle mit validation/forms/expected/<form>.bundle.json
#
# Usage:
#   ./scripts/extractions/test-form-extraction.sh             # alle Forms
#   ./scripts/extractions/test-form-extraction.sh diagnose    # nur Diagnose
#   UPDATE_SNAPSHOTS=1 ./scripts/extractions/test-form-extraction.sh   # Snapshots refreshen
# ============================================================
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
AIDBOX="${AIDBOX_URL:-http://localhost:8888}"
AUTH="${AIDBOX_AUTH:-root:secret}"
FIXTURES="$REPO/validation/forms/fixtures"
EXPECTED="$REPO/validation/forms/expected"

filter="${1:-}"
pass=0
fail=0
skip=0

# Normalize the bundle for stable diffing: remove urn:uuid:<uuid>, generated IDs
normalize() {
  /usr/bin/python3 -c "
import sys, json, re
b = json.load(sys.stdin)
# Strip volatile fields
def strip(o):
    if isinstance(o, dict):
        for k in ('id', 'meta', 'recorded'):
            o.pop(k, None)
        # Stable urn:uuid:<x> placeholder
        for k, v in list(o.items()):
            if isinstance(v, str) and v.startswith('urn:uuid:'):
                o[k] = 'urn:uuid:STABLE'
            else:
                strip(v)
    elif isinstance(o, list):
        for x in o: strip(x)
strip(b)
print(json.dumps(b, indent=2, ensure_ascii=False, sort_keys=True))
"
}

for qr_file in "$FIXTURES"/*.qr.json; do
  [ -f "$qr_file" ] || continue
  form_name=$(basename "$qr_file" .qr.json)
  if [ -n "$filter" ] && [[ "$form_name" != *"$filter"* ]]; then
    continue
  fi

  # POST to $extract
  body=$(/usr/bin/python3 -c "
import sys, json
qr = json.load(open('$qr_file'))
print(json.dumps({'resourceType':'Parameters','parameter':[{'name':'questionnaire-response','resource':qr}]}))
")
  resp=$(echo "$body" | /usr/bin/curl -s -X POST "$AIDBOX/fhir/QuestionnaireResponse/\$extract" \
    -u "$AUTH" -H "Content-Type: application/fhir+json" -d @-)
  
  # Extract the returned Bundle
  bundle=$(echo "$resp" | /usr/bin/python3 -c "
import sys, json
d = json.load(sys.stdin)
if d.get('resourceType') == 'Parameters':
    for p in d.get('parameter',[]):
        r = p.get('resource',{})
        if r.get('resourceType') == 'Bundle':
            print(json.dumps(r))
            exit(0)
# OperationOutcome
print(json.dumps(d))
exit(1)
")
  rc=$?
  
  if [ $rc -ne 0 ]; then
    echo "  ✗ $form_name: ERROR"
    echo "$bundle" | /usr/bin/python3 -c "
import sys, json
d = json.load(sys.stdin)
for i in d.get('issue',[])[:2]:
    print(f'      {i.get(\"diagnostics\",\"\")[:120]}')"
    fail=$((fail+1))
    continue
  fi

  expected_file="$EXPECTED/$form_name.bundle.json"
  actual_normalized=$(echo "$bundle" | normalize)
  
  if [ "${UPDATE_SNAPSHOTS:-0}" = "1" ]; then
    echo "$actual_normalized" > "$expected_file"
    echo "  ↻ $form_name: snapshot updated"
    continue
  fi
  
  if [ ! -f "$expected_file" ]; then
    echo "$actual_normalized" > "$expected_file"
    echo "  + $form_name: baseline created"
    pass=$((pass+1))
    continue
  fi
  
  expected_normalized=$(normalize < "$expected_file")
  if [ "$actual_normalized" = "$expected_normalized" ]; then
    echo "  ✓ $form_name"
    pass=$((pass+1))
  else
    echo "  ✗ $form_name: SNAPSHOT MISMATCH"
    diff <(echo "$expected_normalized") <(echo "$actual_normalized") | head -20 | sed 's/^/      /'
    fail=$((fail+1))
  fi
done

echo
echo "── $pass passed, $fail failed, $skip skipped ──"
exit $fail
