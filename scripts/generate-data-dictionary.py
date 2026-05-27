#!/usr/bin/env python3
"""Generate Data Dictionary from ViewDefinitions + StructureDefinitions.

Reads all validation/views/*.json (ViewDefinitions) and the matching
StructureDefinition profiles in fsh-generated/resources/, then emits:
  - output/data-dictionary.csv   (one row per column, all views)
  - input/pagecontent/data-dictionary.md  (Markdown tables, one per view)
"""

from __future__ import annotations

import csv
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VIEWS_DIR = ROOT / "validation" / "views"
SD_DIR = ROOT / "fsh-generated" / "resources"
OUT_CSV = ROOT / "output" / "data-dictionary.csv"
OUT_MD = ROOT / "input" / "pagecontent" / "data-dictionary.md"

# FHIR primitive types we can infer from path leaves
LEAF_TYPE_HINTS = {
    "id": "string",
    "code": "code",
    "system": "uri",
    "display": "string",
    "reference": "Reference",
    "value": "string",
    "valueString": "string",
    "valueCode": "code",
    "valueQuantity": "Quantity",
    "valueCodeableConcept": "CodeableConcept",
    "valueDateTime": "dateTime",
    "valueBoolean": "boolean",
    "valueInteger": "integer",
    "valueDecimal": "decimal",
    "effectiveDateTime": "dateTime",
    "onsetDateTime": "dateTime",
    "recordedDate": "dateTime",
    "performedDateTime": "dateTime",
    "performedPeriod": "Period",
    "issued": "instant",
    "authored": "dateTime",
}

SYSTEM_SHORT = {
    "http://snomed.info/sct": "SNOMED CT",
    "http://loinc.org": "LOINC",
    "http://fhir.de/CodeSystem/bfarm/icd-10-gm": "ICD-10-GM",
    "http://hl7.org/fhir/sid/icd-10": "ICD-10",
    "http://terminology.hl7.org/CodeSystem/icd-o-3": "ICD-O-3",
    "http://terminology.hl7.org/CodeSystem/condition-clinical": "condition-clinical",
    "http://terminology.hl7.org/CodeSystem/condition-ver-status": "condition-ver-status",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung": "MII Onko Diagnosesicherung",
    "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation": "MII Onko Seitenlokalisation",
    "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom": "Senologie Diagnose-Mamma-Custom",
}


def load_views() -> list[dict]:
    views = []
    for p in sorted(VIEWS_DIR.glob("*.json")):
        try:
            v = json.loads(p.read_text())
            v["_file"] = p.name
            views.append(v)
        except Exception as e:
            print(f"  WARN: could not parse {p.name}: {e}")
    return views


def load_profile(resource_type: str, hint: str | None = None) -> dict | None:
    """Find the senologie-* SD for the given resource type (or by hint substring)."""
    if hint:
        for p in SD_DIR.glob(f"StructureDefinition-*{hint}*.json"):
            sd = json.loads(p.read_text())
            return sd
    return None


def build_profile_index(sd: dict) -> dict[str, dict]:
    """Index differential elements by their path (last occurrence wins for slices)."""
    idx: dict[str, dict] = {}
    for el in sd.get("differential", {}).get("element", []) or sd.get("snapshot", {}).get("element", []):
        path = el.get("path")
        if not path:
            continue
        idx.setdefault(path, []).append(el)
    return idx


SYSTEM_RE = re.compile(r"system\s*=\s*'([^']+)'")
LEAF_RE = re.compile(r"\.([A-Za-z_][A-Za-z0-9_]*)(?:\(\))?(?:\.first\(\)|\.exists\(\))?$")


def infer_from_path(path: str) -> dict:
    """Pull what we can from the FHIRPath: code system, leaf name → type."""
    info = {"system": None, "system_short": None, "leaf": None, "type_hint": None}

    m = SYSTEM_RE.search(path)
    if m:
        info["system"] = m.group(1)
        info["system_short"] = SYSTEM_SHORT.get(m.group(1), m.group(1).rsplit("/", 1)[-1])

    # Leaf token (drop .first()/.exists() suffixes and indexers)
    cleaned = re.sub(r"\.first\(\)|\.exists\(\)|\.where\([^)]*\)|\.replaceMatches\([^)]*\)", "", path)
    parts = [p for p in cleaned.split(".") if p and not p.startswith("(")]
    if parts:
        info["leaf"] = parts[-1]
        info["type_hint"] = LEAF_TYPE_HINTS.get(parts[-1], "string")

    return info


def lookup_profile_meta(profile_idx: dict, resource_type: str, path: str) -> dict:
    """Best-effort match: try to find an element in profile that matches the column path semantically."""
    meta = {"short": "", "binding": "", "min": "", "max": ""}
    if not profile_idx:
        return meta

    # Strip FHIRPath functions to recover a Profile-ish dotted path
    cleaned = re.sub(r"\.where\([^)]*\)|\.first\(\)|\.exists\(\)|\.replaceMatches\([^)]*\)", "", path)
    cleaned = re.sub(r"\.coding\b", ".coding", cleaned)  # noop, keep readable
    candidate_paths = [
        f"{resource_type}.{cleaned}",
        f"{resource_type}.{cleaned.split('.')[0]}",
    ]
    for cp in candidate_paths:
        if cp in profile_idx:
            el = profile_idx[cp][-1]
            meta["short"] = el.get("short", "")
            meta["min"] = el.get("min", "")
            meta["max"] = el.get("max", "")
            b = el.get("binding") or {}
            if b.get("valueSet"):
                meta["binding"] = b["valueSet"]
            break
    return meta


def generate(views: list[dict]) -> list[dict]:
    rows = []
    for v in views:
        rtype = v.get("resource", "")
        # Guess profile by view id (e.g. "senologie-diagnose-flat" → diagnose-maligne)
        # Heuristic: pull "senologie-<topic>" stem from id
        hint = None
        vid = v.get("id", "")
        if "diagnose" in vid:
            hint = "diagnose-maligne"
        elif "klinische-untersuchung" in vid:
            hint = "klinische-untersuchung"
        # (extend as more views land)

        sd = load_profile(rtype, hint=hint) if hint else None
        profile_idx = build_profile_index(sd) if sd else {}
        profile_url = sd.get("url", "") if sd else ""

        for select in v.get("select", []):
            for col in select.get("column", []):
                p = col["path"]
                inf = infer_from_path(p)
                meta = lookup_profile_meta(profile_idx, rtype, p)
                rows.append({
                    "view": v.get("id"),
                    "view_title": v.get("title", ""),
                    "resource": rtype,
                    "profile": profile_url,
                    "column": col["name"],
                    "path": p,
                    "type": inf["type_hint"] or "string",
                    "min": meta["min"],
                    "max": meta["max"],
                    "short": meta["short"],
                    "code_system": inf["system_short"] or "",
                    "binding": meta["binding"],
                    "description": col.get("description", ""),
                })
    return rows


def write_csv(rows: list[dict]) -> None:
    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = ["view", "view_title", "resource", "profile", "column", "path", "type",
                  "min", "max", "short", "code_system", "binding", "description"]
    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(rows)
    print(f"  → {OUT_CSV.relative_to(ROOT)} ({len(rows)} rows)")


def write_markdown(views: list[dict], rows: list[dict]) -> None:
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    by_view: dict[str, list[dict]] = {}
    for r in rows:
        by_view.setdefault(r["view"], []).append(r)

    lines = [
        "# Data Dictionary",
        "",
        "Diese Seite dokumentiert die flachen Tabellen, die aus den Senologie-Profilen via SQL-on-FHIR ViewDefinitions extrahiert werden.",
        "Jede Tabelle entspricht einer ViewDefinition unter `validation/views/`. Spalten werden über FHIRPath aus den profilierten Resourcen gewonnen.",
        "",
        "## Ausleitungswege",
        "",
        "Drei Wege, die hier dokumentierten Tabellen zu erzeugen:",
        "",
        "1. **SQL-on-FHIR runner** (z.B. Pathling, Aidbox `$run` auf ViewDefinition):",
        "   - `./scripts/export-views-csv.sh exports/` exportiert alle Views als CSV gegen die laufende Aidbox.",
        "2. **Aidbox direkt-SQL** über `/$sql` (Postgres JSONB) — pragmatisch für Ad-hoc-Queries, ohne ViewDefinition-Runner:",
        "   ```sql",
        "   SELECT id AS condition_id,",
        "          resource->'subject'->>'reference' AS patient_ref,",
        "          jsonb_path_query_first(resource, '$.code.coding[*] ? (@.system == \"http://snomed.info/sct\").code')->>0 AS diagnose_sct",
        "     FROM condition",
        "    WHERE resource->'code'->'coding' @> '[{\"system\":\"http://snomed.info/sct\"}]';",
        "   ```",
        "3. **Pathling / DuckDB** gegen den NDJSON-Export — für offline-Auswertungen.",
        "",
        "Spalten-Semantik (Bedeutung, Code-System, Binding) ist in allen drei Wegen identisch.",
        "",
        "_Auto-generiert mit `scripts/generate-data-dictionary.py` aus ViewDefinitions + StructureDefinitions. Nicht von Hand editieren — Quellen sind `validation/views/*.json` und die Profile in `fsh-generated/resources/StructureDefinition-*.json`._",
        "",
    ]

    for v in views:
        vid = v.get("id")
        title = v.get("title", vid)
        desc = v.get("description", "")
        rtype = v.get("resource", "")
        cols = by_view.get(vid, [])

        lines.append(f"## {title}")
        lines.append("")
        lines.append(f"- **View-ID:** `{vid}`")
        lines.append(f"- **Resource:** `{rtype}`")
        if cols and cols[0].get("profile"):
            lines.append(f"- **Profil:** [{cols[0]['profile'].rsplit('/', 1)[-1]}]({cols[0]['profile']})")
        if desc:
            lines.append(f"- **Beschreibung:** {desc}")
        lines.append("")
        lines.append("| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |")
        lines.append("|---|---|---|---|---|---|")
        for c in cols:
            card = f"{c['min']}..{c['max']}" if c["min"] != "" or c["max"] != "" else ""
            binding_short = ""
            if c["binding"]:
                binding_short = "VS: " + c["binding"].rsplit("/", 1)[-1]
            elif c["code_system"]:
                binding_short = "CS: " + c["code_system"]
            short = c["short"] or c["description"] or ""
            path_short = c["path"]
            if len(path_short) > 80:
                path_short = path_short[:77] + "…"
            lines.append(
                f"| `{c['column']}` | {c['type']} | {card} | {short} | {binding_short} | `{path_short}` |"
            )
        lines.append("")

    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"  → {OUT_MD.relative_to(ROOT)} ({len(views)} views)")


def main() -> None:
    print(f"Loading ViewDefinitions from {VIEWS_DIR.relative_to(ROOT)}/")
    views = load_views()
    print(f"  found {len(views)} ViewDefinition(s)")
    if not views:
        print("  (nothing to do)")
        return
    rows = generate(views)
    write_csv(rows)
    write_markdown(views, rows)
    print("Done.")


if __name__ == "__main__":
    main()
