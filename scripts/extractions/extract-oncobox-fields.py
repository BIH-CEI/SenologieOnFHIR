#!/usr/bin/env python3
"""
Extrahiert die XML-Tag-Liste aus dem OncoBox-Brust-Spec-Excel
(Sheet 'Datenfelder-XML') als Field-Manifest. Das ist die Senologie-Referenz,
was OncoBox semantisch erwartet — kein offizielles Schema, aber daraus
abgeleitet.

Output: validation/extractions/oncobox-fields.json
"""
import json
import re
from pathlib import Path
import openpyxl

REPO = Path(__file__).resolve().parents[2]
SPEC = REPO / "input" / "data" / "oncobox-brust" / "OncoBoxBrust_N1.1.1_Spec.xlsx"
OUT = REPO / "validation" / "extractions" / "oncobox-fields.json"

TAG_RE = re.compile(r"<([A-Za-zäöüÄÖÜß0-9_]+)>")


def main():
    wb = openpyxl.load_workbook(SPEC, read_only=True, data_only=True)
    ws = wb["Datenfelder-XML"]
    fields = []
    for row in ws.iter_rows(values_only=True):
        for cell in row:
            if not isinstance(cell, str):
                continue
            for m in TAG_RE.findall(cell):
                if m not in fields:
                    fields.append(m)

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps({
        "source": "OncoBoxBrust_N1.1.1_Spec.xlsx (sheet Datenfelder-XML)",
        "field_count": len(fields),
        "fields": fields,
    }, indent=2, ensure_ascii=False))
    print(f"Extracted {len(fields)} XML field names → {OUT.relative_to(REPO)}")
    print(f"Sample: {fields[:8]}")


if __name__ == "__main__":
    main()
