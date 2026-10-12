#!/usr/bin/env bash
# ============================================================
# Sync alle IG-Ressourcen + ViewDefinitions auf die dotbase-Aidbox.
#
# Reihenfolge:
#   CodeSystem → ValueSet → ConceptMap → StructureDefinition →
#   Library → Measure → Questionnaire → ViewDefinition
#
# Setup:
#   1) .env mit DOTBASE_COOKIE + DOTBASE_BASE_URL pflegen (siehe .env.example)
#   2) sushi . (damit fsh-generated/ aktuell ist)
#   3) ./scripts/sync-to-dotbase.sh
#
# Idempotent — wiederholtes Ausfuehren ueberschreibt Resources via PUT.
# Filter: --filter "<prefix>" um nur eine Teilmenge zu pushen.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Load .env (key=value lines, no quotes evaluation)
if [ -f "$REPO_ROOT/.env" ]; then
  set -a
  # shellcheck disable=SC1090
  source "$REPO_ROOT/.env"
  set +a
fi

: "${DOTBASE_BASE_URL:=https://senologie.instances.dotbase.org/api/aidbox/u/rest}"

if [ -z "${DOTBASE_COOKIE:-}" ]; then
  echo "ERROR: DOTBASE_COOKIE nicht gesetzt (in .env oder als env-Var)" >&2
  echo "Beispiel: DOTBASE_COOKIE='aidbox-auth-session=...; session=...'" >&2
  exit 64
fi

FILTER="${1:-}"

put_file() {
  local f="$1"
  local rt
  local id
  rt=$(python3 -c "import json; print(json.load(open('$f'))['resourceType'])" 2>/dev/null) || return
  id=$(python3 -c "import json; print(json.load(open('$f'))['id'])" 2>/dev/null) || return
  local code
  code=$(curl -sf -o /tmp/sync-err.json -w "%{http_code}" \
    -X PUT "$DOTBASE_BASE_URL/$rt/$id" \
    -H "Cookie: $DOTBASE_COOKIE" \
    -H "Content-Type: application/fhir+json" \
    --data-binary "@$f" 2>/dev/null || echo "ERR")
  if [ "$code" = "200" ] || [ "$code" = "201" ]; then
    printf "  %s  %s/%s\n" "$code" "$rt" "$id"
    return 0
  fi
  printf "  ✗ %s  %s/%s\n" "$code" "$rt" "$id"
  python3 -c "
import json
try:
    d = json.load(open('/tmp/sync-err.json'))
    for i in d.get('issue',[])[:2]:
        msg = (i.get('diagnostics') or i.get('details',{}).get('text','?'))[:200]
        print(f'      → {msg}')
except: pass
" || true
  return 1
}

sync_glob() {
  local label="$1"
  local pattern="$2"
  echo
  echo "=== $label ==="
  local ok=0
  local fail=0
  for f in $pattern; do
    [ -f "$f" ] || continue
    if [ -n "$FILTER" ] && [[ "$f" != *"$FILTER"* ]]; then continue; fi
    if put_file "$f"; then ok=$((ok+1)); else fail=$((fail+1)); fi
  done
  printf "  → %d ok, %d fail\n" "$ok" "$fail"
}

echo "Sync target: $DOTBASE_BASE_URL"
[ -n "$FILTER" ] && echo "Filter: *$FILTER*"

sync_glob "CodeSystems"           "$REPO_ROOT/fsh-generated/resources/CodeSystem-*.json"
sync_glob "ValueSets"             "$REPO_ROOT/fsh-generated/resources/ValueSet-*.json"
sync_glob "ConceptMaps"           "$REPO_ROOT/fsh-generated/resources/ConceptMap-*.json"
sync_glob "StructureDefinitions"  "$REPO_ROOT/fsh-generated/resources/StructureDefinition-*.json"
sync_glob "Libraries"             "$REPO_ROOT/fsh-generated/resources/Library-*.json"
sync_glob "Measures"              "$REPO_ROOT/fsh-generated/resources/Measure-*.json"
sync_glob "Questionnaires"        "$REPO_ROOT/fsh-generated/resources/Questionnaire-*.json"
sync_glob "ViewDefinitions"       "$REPO_ROOT/validation/views/*.json"
