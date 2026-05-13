#!/usr/bin/env bash
# ============================================================
# $evaluate-measure auf HAPI ausfuehren
#
# 1. Library + Measure + Beispiel-Bundle in HAPI laden
# 2. /Measure/<id>/$evaluate-measure aufrufen
# 3. MeasureReport anzeigen / speichern
#
# Voraussetzung:
#   docker compose -f docker-compose.hapi.yaml up -d
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
HAPI_URL="${HAPI_URL:-http://localhost:8095/fhir}"
OUT_DIR="$REPO_ROOT/validation/extractions/actual/measures"
mkdir -p "$OUT_DIR"

# --- HAPI erreichbar? ---
if ! curl -sf "$HAPI_URL/metadata" > /dev/null 2>&1; then
  echo "ERROR: HAPI nicht erreichbar unter $HAPI_URL"
  echo "       docker compose -f docker-compose.hapi.yaml up -d"
  exit 3
fi

echo "── HAPI ready @ $HAPI_URL ──"

# --- Libraries laden ---
echo "Loading Libraries..."
for f in "$REPO_ROOT/fsh-generated/resources/Library-QualitaetsindikatorenLeitlinie.json" \
         "$REPO_ROOT/fsh-generated/resources/Library-OncoBoxBrustKennzahlen.json"; do
  [ -f "$f" ] || { echo "  ⚠️  $f nicht gefunden"; continue; }
  name=$(basename "$f" .json)
  code=$(curl -sf -o /dev/null -w "%{http_code}" \
    -X PUT "$HAPI_URL/Library/$(jq -r .id "$f")" \
    -H "Content-Type: application/fhir+json" \
    --data-binary "@$f")
  echo "  $name: $code"
done

# --- Measures laden ---
echo "Loading Measures..."
for f in "$REPO_ROOT/fsh-generated/resources/Measure-senologie-measure-s3-qi-02.json" \
         "$REPO_ROOT/fsh-generated/resources/Measure-senologie-measure-oncobox-kb-12.json"; do
  [ -f "$f" ] || { echo "  ⚠️  $f nicht gefunden"; continue; }
  name=$(basename "$f" .json)
  code=$(curl -sf -o /dev/null -w "%{http_code}" \
    -X PUT "$HAPI_URL/Measure/$(jq -r .id "$f")" \
    -H "Content-Type: application/fhir+json" \
    --data-binary "@$f")
  echo "  $name: $code"
done

# --- Test-Bundle laden (Fall 1 als minimaler Test) ---
echo "Loading Fall 1 bundle..."
curl -sf -o /dev/null -w "  HTTP %{http_code}\n" \
  -X POST "$HAPI_URL" \
  -H "Content-Type: application/fhir+json" \
  --data-binary "@$REPO_ROOT/validation/extractions/input/fall1.json"

# --- $evaluate-measure pro Measure ---
PERIOD_START="${PERIOD_START:-2025-01-01}"
PERIOD_END="${PERIOD_END:-2025-12-31}"

for measure in senologie-measure-s3-qi-02 senologie-measure-oncobox-kb-12; do
  echo
  echo "── \$evaluate-measure: $measure (period $PERIOD_START..$PERIOD_END) ──"
  out="$OUT_DIR/${measure}.MeasureReport.json"
  code=$(curl -sf -o "$out" -w "%{http_code}" \
    -X GET "$HAPI_URL/Measure/$measure/\$evaluate-measure?periodStart=$PERIOD_START&periodEnd=$PERIOD_END&reportType=population" \
    -H "Accept: application/fhir+json" 2>/dev/null || echo "ERR")
  if [ "$code" = "200" ]; then
    score=$(jq -r '.group[0].measureScore.value // "-"' "$out")
    num=$(jq -r '.group[0].population[] | select(.code.coding[0].code=="numerator") | .count' "$out")
    den=$(jq -r '.group[0].population[] | select(.code.coding[0].code=="denominator") | .count' "$out")
    echo "  ✓ Zaehler=$num, Nenner=$den, Score=$score"
    echo "  → $out"
  else
    echo "  ✗ HTTP $code"
    head -c 500 "$out" 2>/dev/null; echo
  fi
done
