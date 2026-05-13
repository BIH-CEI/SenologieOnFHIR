#!/usr/bin/env bash
# ============================================================
# Senologie FHIR Stack starten (Aidbox + Matchbox + HAPI + Pathling)
# auf einem gemeinsamen Docker-Network "senologie-net".
#
# Architektur:
#   - aidbox    (8888)  Questionnaire-Erfassung + SDC-Extraktion + Storage
#   - matchbox  (8080)  StructureMap $transform → oBDS/IQTIG/OncoBox/IRegG
#   - hapi      (8095)  CQL + $evaluate-measure → MeasureReport
#   - pathling  (8090)  SQL-on-FHIR Analytics
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

# 1) Gemeinsames Netzwerk anlegen (idempotent)
if ! docker network inspect senologie-net >/dev/null 2>&1; then
  echo "Creating docker network 'senologie-net'..."
  docker network create senologie-net
fi

# 2) Aidbox starten (falls .env mit Lizenz vorhanden)
if [ -f .env ] && grep -q "AIDBOX_LICENSE" .env; then
  echo "→ Aidbox …"
  docker compose -f docker-compose.yaml up -d
fi

# 3) Matchbox + HAPI + Pathling (parallel)
echo "→ Matchbox …"
docker compose -f docker-compose.matchbox.yaml up -d

echo "→ HAPI …"
docker compose -f docker-compose.hapi.yaml up -d

if [ -f docker-compose.pathling.yaml ]; then
  echo "→ Pathling …"
  docker compose -f docker-compose.pathling.yaml up -d
fi

echo
echo "── Wait for healthchecks ──"
for port_url in "8080|http://localhost:8080/matchboxv3/fhir/metadata" \
                "8095|http://localhost:8095/fhir/metadata"; do
  port=$(echo $port_url | cut -d'|' -f1)
  url=$(echo $port_url | cut -d'|' -f2)
  for i in $(seq 1 60); do
    if curl -sf "$url" >/dev/null 2>&1; then
      echo "  ✓ :$port ready"
      break
    fi
    sleep 2
  done
done

echo
echo "── Stack up. URLs ──"
echo "  Matchbox : http://localhost:8080/matchboxv3/fhir/metadata"
echo "  HAPI     : http://localhost:8095/fhir/metadata"
echo "  Aidbox   : http://localhost:8888/  (Admin / Admin)"
echo "  Pathling : http://localhost:8090/fhir/metadata"
echo
echo "── Container in senologie-net ──"
docker network inspect senologie-net --format '{{range .Containers}}  {{.Name}}{{println}}{{end}}'
