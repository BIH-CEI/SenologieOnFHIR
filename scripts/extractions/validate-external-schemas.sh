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
# Testpatient ist mit Schema_Version="3.0.1" deklariert → primär gegen 3.0.1.
validate "Testpatient_Mamma vs. oBDS 3.0.1 (deklarierte Version)" \
  "$REPO_ROOT/input/data/obds-testdaten/oBDS_v3.0.1.xsd" \
  "$REPO_ROOT/input/data/obds-testdaten/Testpatient_Mamma.xml" \
  pass
validate "Folgepaket_Testpatient_Mamma vs. oBDS 3.0.1" \
  "$REPO_ROOT/input/data/obds-testdaten/oBDS_v3.0.1.xsd" \
  "$REPO_ROOT/input/data/obds-testdaten/Folgepaket_Testpatient_Mamma.xml" \
  pass
# Cross-Check: laeuft der gleiche XML auch gegen die neueste Spec 3.0.5?
# (Indikator fuer Abwaertskompatibilitaet — falls 3.0.5 abwaertskompatibel ist,
# muesste das 3.0.1-XML auch hier durchlaufen.)
validate "Testpatient_Mamma vs. oBDS 3.0.5 (Cross-Check Abwaertskompat.)" \
  "$REPO_ROOT/input/data/obds-testdaten/oBDS_v3.0.5.xsd" \
  "$REPO_ROOT/input/data/obds-testdaten/Testpatient_Mamma.xml" \
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
echo "── OncoBox Brust 2.0 XSD ──────────────────────────────"
ONCOBOX_XSD="$REPO_ROOT/input/data/oncobox-brust-2.0/oncobox-brust-2.0.xsd"
if [ ! -f "$ONCOBOX_XSD" ]; then
  echo "  ⊘ OncoBox 2.0 XSD nicht gefunden"
  skip=$((skip + 1))
else
  for f in "$REPO_ROOT/input/data/oncobox-brust-2.0/examples"/*.xml; do
    [ -f "$f" ] || continue
    validate "$(basename "$f") vs. oncobox-brust-2.0.xsd" "$ONCOBOX_XSD" "$f" pass
  done
fi

echo
echo "── IQTIG XSD (QS-Basisspezifikation 2026 V06) ─────────"
IQTIG_DIR="$REPO_ROOT/input/data/iqtig-schema"
# LE-Schema (interface_LE/2026_lqs_iv_1.0_Export.xsd) ist das Wurzel-Schema
# fuer Leistungserbringer-Exports und importiert alle indirekt-/abstract-XSDs.
IQTIG_LE_XSD="$IQTIG_DIR/interface_LE/2026_lqs_iv_1.0_Export.xsd"
if [ ! -f "$IQTIG_LE_XSD" ]; then
  echo "  ⊘ IQTIG XSD nicht gefunden ($IQTIG_LE_XSD) — Schema-Paket nicht entpackt?"
  skip=$((skip + 1))
else
  # Validiere alle 18.1-Beispiele aus Beispiele/ und XML-Beispiele/interface_LE/
  for f in "$IQTIG_DIR"/Beispiele/*18n1*.xml "$IQTIG_DIR"/XML-Beispiele/interface_LE/indirekt/*18n1*.xml; do
    [ -f "$f" ] || continue
    validate "$(basename "$f") vs. interface_LE/2026_lqs_iv_1.0_Export.xsd" "$IQTIG_LE_XSD" "$f" pass
  done
fi

echo
echo "── $pass passed, $fail failed, $skip skipped ──"
exit $fail
