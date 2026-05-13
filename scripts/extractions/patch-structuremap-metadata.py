#!/usr/bin/env python3
"""
Patcht in den generierten StructureMap-JSON-Resources die Metadaten-Felder
useContext und relatedArtifact mit der Target-Spec-Info aus dem FML-Header.

FML-Header-Format (im .map-File):
   // title: ...
   // targetSpec: <Spec-Name> <Version>
   //   XSD-Quelle: <URL>
   // senologieVersion: <Senologie-IG-Version>

Output: fsh-generated/resources/StructureMap-<Name>.json mit ergaenzten
useContext + relatedArtifact + purpose.

Wird im Build-Prozess nach `sushi .` aufgerufen.
"""
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MAPS_DIR = REPO / "input/maps"
GENERATED = REPO / "fsh-generated/resources"
OUTPUT = REPO / "output"


def parse_fml_header(map_file: Path) -> dict:
    """Liest die Header-Kommentare aus dem .map-File."""
    meta = {}
    text = map_file.read_text()
    # Nur die ersten ~20 Zeilen sind Header
    for line in text.splitlines()[:25]:
        line = line.strip()
        if not line.startswith("//"):
            continue
        m = re.match(r"//\s*targetSpec:\s*(.+)", line)
        if m:
            meta["targetSpec"] = m.group(1).strip()
            continue
        m = re.match(r"//\s*senologieVersion:\s*(.+)", line)
        if m:
            meta["senologieVersion"] = m.group(1).strip()
            continue
        m = re.match(r"//\s*XSD-Quelle:\s*(.+)", line)
        if m:
            meta["xsdSource"] = m.group(1).strip()
    return meta


def map_name_from_file(map_file: Path) -> str:
    text = map_file.read_text()
    m = re.search(r'map\s+"[^"]+"\s*=\s*"([^"]+)"', text)
    return m.group(1) if m else map_file.stem


def patch_sm(sm_file: Path, meta: dict):
    sm = json.loads(sm_file.read_text())
    changed = False

    if "targetSpec" in meta:
        sm["useContext"] = [{
            "code": {
                "system": "http://terminology.hl7.org/CodeSystem/usage-context-type",
                "code": "program",
                "display": "Program"
            },
            "valueCodeableConcept": {"text": meta["targetSpec"]}
        }]
        changed = True

    if "xsdSource" in meta:
        sm["relatedArtifact"] = [{
            "type": "depends-on",
            "label": "Target Schema (XSD)",
            "display": meta["targetSpec"] if "targetSpec" in meta else "External Schema",
            "url": meta["xsdSource"]
        }]
        changed = True

    if changed:
        sm_file.write_text(json.dumps(sm, indent=2, ensure_ascii=False))
    return changed


def main():
    patched = 0
    skipped = 0
    for map_file in sorted(MAPS_DIR.glob("*.map")):
        name = map_name_from_file(map_file)
        meta = parse_fml_header(map_file)
        if "targetSpec" not in meta:
            skipped += 1
            continue
        # StructureMaps aus FML werden vom IG-Publisher in output/ erzeugt,
        # nicht von SUSHI in fsh-generated/. Beide Pfade probieren.
        candidates = [
            GENERATED / f"StructureMap-{name}.json",
            OUTPUT / f"StructureMap-{name}.json",
        ]
        touched_any = False
        for sm_file in candidates:
            if not sm_file.exists():
                continue
            if patch_sm(sm_file, meta):
                touched_any = True
        if touched_any:
            print(f"  ✓  {name} ← {meta['targetSpec']}")
            patched += 1
        else:
            print(f"  ?  {name}: StructureMap-Resource nicht gefunden — IG-Publisher noch nicht gelaufen?")
    print(f"\nPatched: {patched}, skipped (no targetSpec): {skipped}")


if __name__ == "__main__":
    main()
