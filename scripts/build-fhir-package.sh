#!/usr/bin/env bash
# Builds a FHIR NPM-style package (.tgz) from fsh-generated/resources/
# Output: dist/kds-senologie-<version>.tgz
#
# Standard layout:
#   package/
#     package.json      <- NPM manifest with FHIR fields
#     <Resource>-<id>.json ...
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

NAME="kds-senologie"
CANONICAL="https://www.senologie.org/fhir"
VERSION="$(grep '^version:' sushi-config.yaml | awk '{print $2}')"
FHIR_VERSION="4.0.1"

if [ -z "${VERSION:-}" ]; then
    echo "ERROR: cannot read version from sushi-config.yaml" >&2
    exit 1
fi

SRC="fsh-generated/resources"

# Abhaengigkeiten aus sushi-config.yaml uebernehmen (frueher hier fest eingetragen und veraltet)
DEPS="$(awk '/^dependencies:/{p=1;next} p&&/^[A-Za-z#]/{p=0} p' sushi-config.yaml \
  | grep -E '^[[:space:]]+[a-z0-9.-]+:[[:space:]]*[^[:space:]#]+' \
  | sed -E 's/^[[:space:]]+([a-z0-9.-]+):[[:space:]]*([^[:space:]#]+).*/,\n    "\1": "\2"/')"
DEPS="$(printf '%b' "$DEPS")"

# Run SUSHI with snapshots so downstream consumers don't have to regenerate
echo "→ Running sushi build -s (with snapshots)..."
sushi build -s . > /tmp/sushi-package.log 2>&1 || {
    tail -20 /tmp/sushi-package.log >&2
    echo "ERROR: sushi build failed (see /tmp/sushi-package.log)" >&2
    exit 1
}
tail -3 /tmp/sushi-package.log | grep -E "Errors|Warnings" || true

if [ ! -d "$SRC" ]; then
    echo "ERROR: $SRC missing after sushi build" >&2
    exit 1
fi

OUT_DIR="dist"
STAGE="$OUT_DIR/.stage-package"
TGZ="$OUT_DIR/${NAME}-${VERSION}.tgz"

rm -rf "$STAGE"
mkdir -p "$STAGE/package"

# Copy all generated FHIR resources (flat, no subdirs)
cp "$SRC"/*.json "$STAGE/package/"

# Build NPM-style package.json
cat > "$STAGE/package/package.json" <<EOF
{
  "name": "${NAME}",
  "version": "${VERSION}",
  "canonical": "${CANONICAL}",
  "url": "${CANONICAL}/ImplementationGuide/${NAME}",
  "title": "Senologie KDS Implementation Guide",
  "description": "FHIR R4 Implementation Guide fuer Senologie / Mammakarzinom basierend auf MII Onkologie KDS.",
  "fhirVersions": ["${FHIR_VERSION}"],
  "type": "IG",
  "dependencies": {
    "hl7.fhir.r4.core": "${FHIR_VERSION}"${DEPS}
  }
}
EOF

# Create tarball
tar -czf "$TGZ" -C "$STAGE" package
rm -rf "$STAGE"

# Summary
N_RES=$(find "$SRC" -name "*.json" | wc -l | tr -d ' ')
SIZE=$(du -h "$TGZ" | awk '{print $1}')
echo "✓ $TGZ ($SIZE, $N_RES resources)"
echo ""
echo "Install in another IG project via:"
echo "  npm install $(realpath "$TGZ")"
echo ""
echo "Or extract to ~/.fhir/packages/:"
echo "  mkdir -p ~/.fhir/packages/${NAME}#${VERSION}"
echo "  tar -xzf $TGZ -C ~/.fhir/packages/${NAME}#${VERSION}"
