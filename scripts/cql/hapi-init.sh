#!/bin/sh
# ============================================================
# HAPI Init-Container: laedt Senologie-IG und Libraries/Measures in HAPI.
#
# Wird vom docker-compose.hapi.yaml als Init-Service ausgefuehrt, sobald
# der HAPI-Server "healthy" meldet.
# ============================================================
set -e

FHIR="http://senologie-hapi:8080/fhir"
IG=/ig

echo "Waiting for HAPI ready..."
until curl -sf "$FHIR/metadata" >/dev/null 2>&1; do sleep 2; done

# Resource-Typen in Reihenfolge ihrer Abhaengigkeiten:
#  1. CodeSystem (von ValueSets referenziert)
#  2. ValueSet (von Profiles referenziert)
#  3. ConceptMap
#  4. StructureDefinition (Profiles, Logical Models, Extensions)
#  5. Library (CQL)
#  6. Measure (referenziert Library)
load_type() {
  local rtype="$1"
  local pattern="$2"
  local ok=0
  local fail=0
  for f in $IG/${pattern}*.json; do
    [ -f "$f" ] || continue
    rid=$(grep -m1 '"id":' "$f" | sed -E 's/.*"id":[[:space:]]*"([^"]+)".*/\1/')
    code=$(curl -sf -o /dev/null -w "%{http_code}" \
      -X PUT "$FHIR/$rtype/$rid" \
      -H "Content-Type: application/fhir+json" \
      --data-binary "@$f" 2>/dev/null || echo "ERR")
    if [ "$code" = "200" ] || [ "$code" = "201" ]; then
      ok=$((ok+1))
    else
      fail=$((fail+1))
    fi
  done
  echo "  $rtype: $ok loaded, $fail failed"
}

echo "=== Loading IG into HAPI ==="
load_type CodeSystem CodeSystem-
load_type ValueSet ValueSet-
load_type ConceptMap ConceptMap-
load_type StructureDefinition StructureDefinition-
load_type Library Library-
load_type Measure Measure-

echo "=== HAPI init complete ==="
