#!/bin/bash
# Import IG artifacts to Aidbox

AIDBOX_URL="${AIDBOX_URL:-http://localhost:8888}"
AIDBOX_AUTH="${AIDBOX_AUTH:-Basic cm9vdDpzZWNyZXQ=}"  # root:secret base64

echo "Importing to Aidbox at $AIDBOX_URL"

# Import StructureDefinitions
echo "=== Importing StructureDefinitions ==="
for f in fsh-generated/resources/StructureDefinition-*.json; do
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/StructureDefinition/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
done

# Import ValueSets
echo "=== Importing ValueSets ==="
for f in fsh-generated/resources/ValueSet-*.json; do
  [ -f "$f" ] || continue
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/ValueSet/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
done

# Import CodeSystems
echo "=== Importing CodeSystems ==="
for f in fsh-generated/resources/CodeSystem-*.json; do
  [ -f "$f" ] || continue
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/CodeSystem/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
done

# Import Examples
echo "=== Importing Example Instances ==="
for f in fsh-generated/resources/Condition-*.json; do
  [ -f "$f" ] || continue
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/Condition/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
done

echo "=== Done ==="
