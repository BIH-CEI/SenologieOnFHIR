#!/bin/bash
# Import IG artifacts to Aidbox

AIDBOX_URL="${AIDBOX_URL:-http://localhost:8888}"
AIDBOX_AUTH="${AIDBOX_AUTH:-Basic cm9vdDpzZWNyZXQ=}"  # root:secret base64

echo "Importing to Aidbox at $AIDBOX_URL"

# Install FHIR packages
echo "=== Installing FHIR Packages ==="
PACKAGES=(
  "hl7.terminology.r4@6.1.0"
  "hl7.fhir.r4.core@4.0.1"
  "de.basisprofil.r4@1.5.3"
  "hl7.fhir.uv.genomics-reporting@3.0.0"
  "de.medizininformatikinitiative.kerndatensatz.meta@2025.0.0"
  "de.medizininformatikinitiative.kerndatensatz.biobank@2025.0.4"
  "de.medizininformatikinitiative.kerndatensatz.diagnose@2025.0.0"
)

for pkg in "${PACKAGES[@]}"; do
  echo -n "  $pkg... "
  curl -s -X POST "$AIDBOX_URL/fhirpkg" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/json" \
    -d "{\"packageId\": \"$pkg\"}" | jq -r '.status // .error // "ok"'
done

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

# Import Senologie Diagnose Questionnaire
echo "=== Importing Senologie Diagnose Questionnaire ==="
f="input/resources/Questionnaire-senologie-diagnose-template.json"
if [ -f "$f" ]; then
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/Questionnaire/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
fi

# Import Dotbase Questionnaires
echo "=== Importing Dotbase Questionnaires ==="
for f in examples/dotbase-questionnaires/Questionnaire_*.json; do
  [ -f "$f" ] || continue
  id=$(jq -r '.id' "$f")
  echo -n "  $id... "
  curl -s -X PUT "$AIDBOX_URL/fhir/Questionnaire/$id" \
    -H "Authorization: $AIDBOX_AUTH" \
    -H "Content-Type: application/fhir+json" \
    -d @"$f" | jq -r '.id // .issue[0].diagnostics'
done

echo "=== Done ==="
