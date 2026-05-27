#!/usr/bin/env python3
"""Generate a transaction Bundle per Questionnaire mit allen Dependencies.

Aequivalent zu SDC's CapabilityStatement/$package — packt einen Questionnaire
mit allen verwendeten ValueSets, CodeSystems und Profilen in EIN Transaction-
Bundle, das per POST gegen einen FHIR-Server in einem Rutsch geladen werden kann.

Workflow:
  1) sushi . (fsh-generated/ aktuell)
  2) python3 scripts/package-questionnaire.py [<questionnaire-id> ...]
     → schreibt dist/packages/<questionnaire-id>.bundle.json
  3) curl -X POST <FHIR-Base>/ -d @dist/packages/<id>.bundle.json
     (Transaction Bundle → Server fuehrt PUT pro entry idempotent aus)

Dependency-Aufloesung:
  Q.item.answerValueSet  → ValueSet
  Q.item.code.system     → CodeSystem (FHIR/Senologie-Custom only)
  VS.compose.include.system    → CodeSystem
  VS.compose.include.valueSet  → ValueSet (rekursiv)
  Q.meta.profile         → StructureDefinition (optional)
  Q.contained            → schon eingebettet

Nicht ueber Drittsysteme aufgeloest (z.B. SCT/LOINC werden NICHT als
CodeSystem mitgepackt — die liegen auf dem Zielserver).
"""
from __future__ import annotations
import json
import sys
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RES_DIR = ROOT / "fsh-generated" / "resources"
OUT_DIR = ROOT / "dist" / "packages"

# Drittsysteme, die wir NICHT mitpacken (liegen auf dem Server)
EXTERNAL_SYSTEMS = {
    "http://snomed.info/sct",
    "http://loinc.org",
    "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
    "http://fhir.de/CodeSystem/bfarm/ops",
    "http://hl7.org/fhir/sid/icd-10",
    "http://hl7.org/fhir/sid/icd-o-3",
    "http://terminology.hl7.org/CodeSystem/icd-o-3",
    "http://unitsofmeasure.org",
    "http://hl7.org",
    "http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext",
    "http://terminology.hl7.org/CodeSystem/condition-clinical",
    "http://terminology.hl7.org/CodeSystem/condition-ver-status",
    "http://terminology.hl7.org/CodeSystem/observation-category",
    "http://terminology.hl7.org/CodeSystem/v2-0074",
    "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
    "http://terminology.hl7.org/CodeSystem/library-type",
    "http://terminology.hl7.org/CodeSystem/usage-context-type",
    "http://terminology.hl7.org/CodeSystem/measure-population",
    "http://terminology.hl7.org/CodeSystem/measure-scoring",
    "http://terminology.hl7.org/CodeSystem/measure-type",
    "https://www.uicc.org/resources/tnm",
}


def index_resources() -> dict[tuple[str, str], dict]:
    """Index all generated resources by (resourceType, id) and by url."""
    by_id: dict[tuple[str, str], dict] = {}
    by_url: dict[str, dict] = {}
    for f in RES_DIR.glob("*.json"):
        try:
            r = json.loads(f.read_text())
        except Exception:
            continue
        rt = r.get("resourceType")
        rid = r.get("id")
        url = r.get("url")
        if rt and rid:
            by_id[(rt, rid)] = r
        if url:
            by_url[url] = r
    return by_id, by_url


def walk_strings(o, accumulator):
    if isinstance(o, dict):
        for k, v in o.items():
            if isinstance(v, str):
                accumulator.append((k, v))
            walk_strings(v, accumulator)
    elif isinstance(o, list):
        for x in o:
            walk_strings(x, accumulator)


def collect_dependencies(q: dict, by_url: dict[str, dict]) -> dict[str, dict]:
    """Walk Q + transitively-referenced VS/CS. Return dict url → resource."""
    deps: dict[str, dict] = {}
    pending = []

    # Direct refs from Questionnaire
    pairs = []
    walk_strings(q, pairs)
    for k, v in pairs:
        if k == "answerValueSet":
            pending.append(v)
        elif k == "system" and v.startswith("https://www.senologie.org/fhir/CodeSystem/"):
            pending.append(v)
        elif k == "valueCanonical" and ("ValueSet" in v or "CodeSystem" in v):
            pending.append(v.split("|")[0])

    seen = set()
    while pending:
        ref = pending.pop()
        ref_base = ref.split("|")[0]
        if ref_base in seen:
            continue
        seen.add(ref_base)
        if ref_base in EXTERNAL_SYSTEMS:
            continue
        if ref_base not in by_url:
            continue
        resource = by_url[ref_base]
        deps[ref_base] = resource
        # Recurse into VS compose.include
        if resource.get("resourceType") == "ValueSet":
            for inc in resource.get("compose", {}).get("include", []) or []:
                sys_url = inc.get("system")
                if sys_url and sys_url not in EXTERNAL_SYSTEMS:
                    pending.append(sys_url)
                for vs_ref in inc.get("valueSet", []) or []:
                    pending.append(vs_ref)
    return deps


def build_bundle(q: dict, deps: dict[str, dict]) -> dict:
    """Build a transaction Bundle: deps first (PUT), then Q (PUT)."""
    entries = []
    # Order: CodeSystems → ValueSets → Q (so terminology resolves)
    order = {"CodeSystem": 0, "ValueSet": 1, "StructureDefinition": 2}
    sorted_deps = sorted(
        deps.values(),
        key=lambda r: (order.get(r.get("resourceType", ""), 9), r.get("id", "")),
    )
    for r in sorted_deps:
        rt = r["resourceType"]
        rid = r["id"]
        entries.append({
            "fullUrl": f"urn:uuid:{rt}-{rid}",
            "resource": r,
            "request": {"method": "PUT", "url": f"{rt}/{rid}"},
        })
    # Questionnaire last (deps must exist for terminology validation)
    entries.append({
        "fullUrl": f"urn:uuid:Questionnaire-{q['id']}",
        "resource": q,
        "request": {"method": "PUT", "url": f"Questionnaire/{q['id']}"},
    })
    return {
        "resourceType": "Bundle",
        "type": "transaction",
        "entry": entries,
    }


def main():
    by_id, by_url = index_resources()
    questionnaires = [r for (rt, _), r in by_id.items() if rt == "Questionnaire"]

    if len(sys.argv) > 1:
        wanted = set(sys.argv[1:])
        questionnaires = [q for q in questionnaires if q["id"] in wanted]
        if not questionnaires:
            print(f"Keine passenden Questionnaires gefunden. Verfuegbar:", file=sys.stderr)
            for (rt, rid), r in by_id.items():
                if rt == "Questionnaire":
                    print(f"  {rid}", file=sys.stderr)
            return 1

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for q in sorted(questionnaires, key=lambda x: x["id"]):
        deps = collect_dependencies(q, by_url)
        bundle = build_bundle(q, deps)
        out = OUT_DIR / f"{q['id']}.bundle.json"
        out.write_text(json.dumps(bundle, indent=2, ensure_ascii=False))
        n_cs = sum(1 for r in deps.values() if r.get("resourceType") == "CodeSystem")
        n_vs = sum(1 for r in deps.values() if r.get("resourceType") == "ValueSet")
        n_sd = sum(1 for r in deps.values() if r.get("resourceType") == "StructureDefinition")
        print(
            f"  {q['id']:40s}  CS={n_cs:2d}  VS={n_vs:2d}  SD={n_sd:2d}  "
            f"total={len(deps)+1} entries  → {out.relative_to(ROOT)}"
        )

    print(f"\nUpload via Transaction (eine Bundle = ein POST):")
    print(f"  curl -X POST <FHIR-BASE>/ -H 'Cookie: $DOTBASE_COOKIE' \\")
    print(f"    -H 'Content-Type: application/fhir+json' \\")
    print(f"    --data-binary @dist/packages/<id>.bundle.json")
    return 0


if __name__ == "__main__":
    sys.exit(main())
