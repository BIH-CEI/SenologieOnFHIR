#!/bin/sh
# Render all PlantUML files from input/images-source/ to input/images/
# Used as pre-commit hook and can be run standalone.
#
# Install as hook:  ln -sf ../../scripts/pre-commit .git/hooks/pre-commit

PUML_SRC="input/images-source"
IMG_DST="input/images"

if ! command -v plantuml >/dev/null 2>&1; then
    echo "Warning: plantuml not found — skipping PlantUML rendering"
    echo "Install with: brew install plantuml"
    exit 0
fi

mkdir -p "$IMG_DST"

rendered=0
for puml in "$PUML_SRC"/*.puml; do
    [ -f "$puml" ] || continue
    base=$(basename "$puml" .puml)
    echo "Rendering: $puml → $IMG_DST/${base}.png"
    plantuml -tpng "$puml" -o "$(pwd)/$IMG_DST" 2>&1

    # PlantUML may use @startuml title as filename — normalize
    for f in "$IMG_DST"/*.png; do
        target="$IMG_DST/${base}.png"
        if [ "$f" != "$target" ] && [ -f "$f" ]; then
            mv "$f" "$target"
        fi
    done
    rendered=$((rendered + 1))
done

echo "Rendered $rendered PlantUML diagram(s)."
