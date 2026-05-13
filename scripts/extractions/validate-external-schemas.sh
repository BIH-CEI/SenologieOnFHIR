#!/usr/bin/env bash
# ============================================================
# Schema-Sanity-Check für externe XSDs
#
# Validiert die offiziellen Testdaten gegen die mit-committeten XSDs.
# Damit ist sichergestellt, dass:
#   - die XSDs intakt im Repo liegen
#   - die Testdaten kompatibel sind
#   - xmllint im CI verfügbar ist
#
# Das ist NICHT die Konformitäts-Prüfung unseres FHIR-Outputs gegen die
# Ziel-Schemas — dafür fehlt noch der Konverter FHIR-LM → Krebsregister-XML.
# Dies hier ist der Schema-Pipeline-Smoke-Test.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
fail=0
pass=0
skip=0

validate() {
  local label="$1"
  local schema="$2"
  local xml="$3"
  local expected="${4:-pass}"   # pass | fail | skip

  if [ ! -f "$schema" ]; then
    echo "  ? $label: schema not found ($schema)"
    skip=$((skip + 1)); return
  fi
  if [ ! -f "$xml" ]; then
    echo "  ? $label: xml not found ($xml)"
    skip=$((skip + 1)); return
  fi

  if [ "$expected" = "skip" ]; then
    echo "  ⊘ $label: skipped"
    skip=$((skip + 1)); return
  fi

  out=$(xmllint --noout --schema "$schema" "$xml" 2>&1) && rc=0 || rc=$?

  if [ "$expected" = "pass" ] && [ $rc -eq 0 ]; then
    echo "  ✓ $label"
    pass=$((pass + 1))
  elif [ "$expected" = "fail" ] && [ $rc -ne 0 ]; then
    echo "  ✓ $label (expected to fail, fails as expected)"
    pass=$((pass + 1))
  else
    echo "  ✗ $label (rc=$rc, expected=$expected)"
    echo "$out" | head -5 | sed 's/^/      /'
    fail=$((fail + 1))
  fi
}

echo "── oBDS XSD ───────────────────────────────────────────"
validate "Testpatient_Mamma vs. oBDS 3.0.1" \
  "$REPO_ROOT/input/data/obds-testdaten/oBDS_v3.0.1.xsd" \
  "$REPO_ROOT/input/data/obds-testdaten/Testpatient_Mamma.xml" \
  pass
validate "Folgepaket_Testpatient_Mamma vs. oBDS 3.0.1" \
  "$REPO_ROOT/input/data/obds-testdaten/oBDS_v3.0.1.xsd" \
  "$REPO_ROOT/input/data/obds-testdaten/Folgepaket_Testpatient_Mamma.xml" \
  pass

echo
echo "── IRegG XSD V4.1.1 ──────────────────────────────────"
# Testdatensatz_RST hat TODO-Platzhalter; XSD-Pattern schlaegt → erwartet "fail"
validate "Testdatensatz_RST vs. IRegG V4.1.1 (mit TODO-Platzhaltern → fail erwartet)" \
  "$REPO_ROOT/input/data/iregg-schema-v4.1.1/IRD_XML_Spezifikation.xsd" \
  "$REPO_ROOT/input/data/iregg-schema-v4.1.1/Testdatensaetze/Testdatensatz_RST.xml" \
  fail

# Beispiele aus dem Schema-Lieferumfang
for f in "$REPO_ROOT/input/data/iregg-schema-v4.1.1/Beispiele"/*.xml; do
  [ -f "$f" ] || continue
  base=$(basename "$f")
  validate "$base vs. IRegG V4.1.1" \
    "$REPO_ROOT/input/data/iregg-schema-v4.1.1/IRD_XML_Spezifikation.xsd" \
    "$f" \
    pass
done

echo
echo "── IQTIG XSD ──────────────────────────────────────────"
IQTIG_DIR="$REPO_ROOT/input/data/iqtig-schema"
IQTIG_XSD=$(find "$IQTIG_DIR" -name "*.xsd" 2>/dev/null | head -1)
if [ -z "$IQTIG_XSD" ]; then
  echo "  ⊘ no IQTIG XSDs found in $IQTIG_DIR — skipping (download manually from iqtig.org)"
  skip=$((skip + 1))
else
  # Validiere alle XML-Testdatensaetze (falls vorhanden) gegen das Hauptschema
  found_xml=0
  for f in "$IQTIG_DIR"/Testdaten/*.xml "$IQTIG_DIR"/Beispiele/*.xml "$IQTIG_DIR"/examples/*.xml; do
    [ -f "$f" ] || continue
    found_xml=1
    validate "$(basename "$f") vs. $(basename "$IQTIG_XSD")" "$IQTIG_XSD" "$f" pass
  done
  if [ $found_xml -eq 0 ]; then
    echo "  ⊘ XSD found ($IQTIG_XSD) but no test data — schema sanity check skipped"
    skip=$((skip + 1))
  fi
fi

echo
echo "── $pass passed, $fail failed, $skip skipped ──"
exit $fail
