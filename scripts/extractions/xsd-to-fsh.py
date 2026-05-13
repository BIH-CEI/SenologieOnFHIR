#!/usr/bin/env python3
"""
Generiert ein FSH Logical Model aus dem OncoBox Brust 2.0 XSD.

Output: input/fsh/oncobox/oncobox-lm-brust-2.0.fsh
"""
import xml.etree.ElementTree as ET
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
XSD = REPO / "input/data/oncobox-brust-2.0/oncobox-brust-2.0.xsd"
OUT = REPO / "input/fsh/oncobox/oncobox-lm-brust-2.0.fsh"
NS = "{http://www.w3.org/2001/XMLSchema}"


def localname(el):
    return el.tag.split("}", 1)[1] if "}" in el.tag else el.tag


def xsd_type_to_fsh(xsd_type, has_complex):
    """Map XSD type name → FSH FHIR datatype."""
    if has_complex:
        return "BackboneElement"
    # Custom types (e.g. 'datum_typ', 'fallid_typ') → strings by default
    if not xsd_type:
        return "string"
    t = xsd_type.lower()
    if "datum" in t:
        return "date"
    if "alter" in t or "geburtsjahr" in t or "score" in t or "anzahl" in t or "lk" in t:
        return "integer"
    return "string"


def emit(el, depth=0, lines=None, max_depth=12):
    if lines is None:
        lines = []
    if depth > max_depth:
        return lines
    name = el.get("name", "")
    typ = el.get("type", "")
    mn = el.get("minOccurs", "1")
    mx = el.get("maxOccurs", "1")

    if localname(el) != "element" or not name:
        return lines

    # Cardinality
    card = f"{mn}..{mx if mx != 'unbounded' else '*'}"

    # Does it have a complex inline type?
    inline_ct = el.find(NS + "complexType")
    has_complex = inline_ct is not None

    fshtype = xsd_type_to_fsh(typ, has_complex)

    indent = "  " * depth
    # FSH: name card type "shortDescription"
    short = name.replace("_", " ")
    lines.append(f"{indent}* {name} {card} {fshtype} \"{short}\"")

    # Recurse into inline complex types
    if inline_ct is not None:
        for seq in inline_ct.findall(NS + "sequence"):
            for child in seq.findall(NS + "element"):
                emit(child, depth + 1, lines, max_depth)

    return lines


def main():
    tree = ET.parse(XSD)
    root = tree.getroot()

    obj_root = None
    for el in root.findall(NS + "element"):
        if el.get("name") == "OncoBoxBrust":
            obj_root = el
            break
    if obj_root is None:
        raise SystemExit("OncoBoxBrust root element not found in XSD")

    header = """// =============================================================================
// OncoBox Brust 2.0 (Auditjahr 2026 v2.1.1) — Logical Model
//
// Generiert aus oncobox-brust-2.0.xsd via scripts/extractions/xsd-to-fsh.py.
// XSD-Quelle: https://xml-oncobox.de/de/Home/FuerHersteller
//
// Bildet die XML-Struktur der OncoBox-Brust-Meldung 2.0 (Auditjahr 2026) ab,
// wie sie an OnkoZert/DKG uebermittelt wird. Ersetzt das aeltere 1.0 (N1.1.1).
//
// Hauptunterschiede 1.0 → 2.0:
//   - Wurzel: <OncoBoxBrust> (statt <oncobox-brust-meldung>)
//   - <ImportInfo> statt <InfoXML>
//   - Patienten/Faelle sind jetzt 1..n explizit (Mengen)
//   - <Anamnese>, <Tumorkonferenz>, <Histologie>, <Operation>,
//     <Strahlentherapie>, <Systemtherapie>, <Fernmetastase>, <Studie>,
//     <Psychosozial>, <Follow_Up> als eigene Backbone-Elemente
//   - ER/PR getrennt: HormonrezeptorStatus_X, Anteil_positiv_X, IRS_X
//   - BRCA1/2/PALB2: Keimbahn (Anamnese) vs. somatisch (Histologie) getrennt
// =============================================================================

Logical: OncoBoxBrust2Meldung
Id: oncobox-brust-2-meldung
Title: "OncoBox Brust 2.0 Meldung (Logical Model)"
Description: "OncoBox Brust 2.0 (Auditjahr 2026 v2.1.1) Meldungsstruktur — generiert aus dem offiziellen XSD."

* ^status = #draft
* ^version = "2.1.1"
"""

    lines = []
    # Skip root element name itself, emit its children
    inline_ct = obj_root.find(NS + "complexType")
    if inline_ct is not None:
        for seq in inline_ct.findall(NS + "sequence"):
            for child in seq.findall(NS + "element"):
                emit(child, depth=0, lines=lines, max_depth=12)

    fsh = header + "\n" + "\n".join(lines) + "\n"
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(fsh)
    print(f"Generated {len(lines)} top-level lines → {OUT.relative_to(REPO)}")


if __name__ == "__main__":
    main()
