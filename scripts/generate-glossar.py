#!/usr/bin/env python3
"""Generate the SNOMED/S3 glossary from the Leitlinien-Annotation pages.

Reads the YAML blocks in input/pagecontent/s3-kap-*.md (one block per
S3 recommendation, schema documented in leitlinien-annotation-schema.md)
and emits:
  - exports/glossar-s3-snomed.csv          (one row per annotated term, all terms)
  - input/pagecontent/glossar-s3-snomed.md             (Markdown, coded terms only)
  - input/translations/en/pagecontent/glossar-s3-snomed.md (same, English)

Terms without a terminology code land in the CSV only; the page reports
them as per-chapter counts, since they are gaps rather than glossary entries.
"""

from __future__ import annotations

import csv
import re
from collections import defaultdict
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
PAGES_DIR = ROOT / "input" / "pagecontent"
OUT_CSV = ROOT / "exports" / "glossar-s3-snomed.csv"
OUT_MD = PAGES_DIR / "glossar-s3-snomed.md"
OUT_MD_EN = ROOT / "input" / "translations" / "en" / "pagecontent" / "glossar-s3-snomed.md"

YAML_BLOCK = re.compile(r"```yaml\n(.*?)\n```", re.DOTALL)

# Chapter page stem -> (chapter label, menu title). Order drives the page.
CHAPTERS = [
    ("s3-kap-3-allgemeines", "3", "Allgemeines, Früherkennung, familiäres Risiko"),
    ("s3-kap-4-1-diagnostik", "4.1", "Diagnostik, Bildgebung, Biopsie, Staging"),
    ("s3-kap-4-2-4-3-dcis-risikolaesionen", "4.2–4.3", "DCIS und Risikoläsionen (B3)"),
    ("s3-kap-4-4-operative-therapie", "4.4", "Operative Therapie"),
    ("s3-kap-4-5-pathologie", "4.5", "Pathologie, Biomarker, Prognose"),
    ("s3-kap-4-6-strahlentherapie", "4.6", "Adjuvante Strahlentherapie"),
    ("s3-kap-4-8-systemische-therapie", "4.8", "Systemische Therapie, frühes Mammakarzinom"),
    ("s3-kap-5-rezidiv-metastasiert", "5", "Rezidiv und metastasierte Erkrankung"),
    ("s3-kap-6-betreuung", "6", "Betreuung, Nachsorge, Palliativversorgung"),
    ("s3-kap-7-spezielle-situationen", "7", "Spezielle Situationen"),
    ("s3-kap-8-qualitaetsindikatoren", "8", "Qualitätsindikatoren"),
]

# Values of terminologie.system that mean "no code system", not a real one.
NO_SYSTEM = {"", "-", "–", "n/a", "none", "keine"}

CSV_FIELDS = [
    "begriff",
    "beschreibung",
    "datentyp",
    "rolle",
    "system",
    "version",
    "code",
    "display",
    "wertebereich",
    "mapping_quelle",
    "validiert",
    "verpflichtung",
    "kapitel",
    "empfehlung_nr",
    "empfehlungsgrad",
    "fhir_profil",
    "fhir_element",
    "fhir_status",
    "quelle_seite",
]


def as_text(value) -> str:
    """Flatten a YAML scalar (or accidental list) into one cell of text."""
    if value is None:
        return ""
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (list, tuple)):
        return "; ".join(as_text(v) for v in value if v is not None)
    return " ".join(str(value).split())


def collect_datenobjekte(block: dict) -> list[tuple[str, dict]]:
    """Yield (rolle, datenobjekt) pairs.

    Recommendation blocks carry a flat `datenobjekte` list. The Kap.-8 quality
    indicators instead nest one list under `zaehler` and one under `nenner`;
    the role matters there, because a term can be a denominator restriction
    rather than something to document.
    """
    found: list[tuple[str, dict]] = []
    for role, container in (("", block), ("Zähler", block.get("zaehler")),
                            ("Nenner", block.get("nenner"))):
        if not isinstance(container, dict):
            continue
        for obj in container.get("datenobjekte") or []:
            if isinstance(obj, dict):
                found.append((role, obj))
    return found


def parse_chapter(stem: str, kapitel: str) -> tuple[list[dict], int]:
    """Return (rows, recommendation count) for one chapter page."""
    path = PAGES_DIR / f"{stem}.md"
    text = path.read_text(encoding="utf-8")
    rows: list[dict] = []
    recommendations = 0

    for raw in YAML_BLOCK.findall(text):
        try:
            block = yaml.safe_load(raw)
        except yaml.YAMLError as exc:
            print(f"  ! {stem}: YAML-Block uebersprungen ({exc.__class__.__name__})")
            continue
        if not isinstance(block, dict):
            continue

        # Blocks without an id are per-section summaries ("zusammenfassung"),
        # not recommendations — their datenobjekte still count.
        if block.get("id"):
            recommendations += 1

        fhir = block.get("fhir_mapping") or {}
        if not isinstance(fhir, dict):
            fhir = {}

        for role, obj in collect_datenobjekte(block):
            term = obj.get("terminologie") or {}
            if not isinstance(term, dict):
                term = {}
            rows.append(
                {
                    "begriff": as_text(obj.get("name")),
                    "beschreibung": as_text(obj.get("beschreibung")),
                    "datentyp": as_text(obj.get("datentyp")),
                    "rolle": role,
                    "system": as_text(term.get("system")),
                    "version": as_text(term.get("version")),
                    "code": as_text(term.get("code")),
                    "display": as_text(term.get("display")),
                    "wertebereich": as_text(obj.get("wertebereich")),
                    "mapping_quelle": as_text(term.get("mapping_quelle")),
                    "validiert": as_text(term.get("validiert")),
                    "verpflichtung": as_text(obj.get("verpflichtung")),
                    "kapitel": as_text(block.get("kapitel")) or kapitel,
                    # QI blocks have no empfehlung_nr — fall back to their id (QI-1).
                    "empfehlung_nr": as_text(block.get("empfehlung_nr"))
                    or as_text(block.get("id")),
                    "empfehlungsgrad": as_text(block.get("empfehlungsgrad")),
                    "fhir_profil": as_text(fhir.get("profil")),
                    "fhir_element": as_text(fhir.get("element")),
                    "fhir_status": as_text(fhir.get("status")),
                    "quelle_seite": f"{stem}.html",
                }
            )

    return rows, recommendations


def has_code(row: dict) -> bool:
    return bool(row["code"]) and row["system"].strip().lower() not in NO_SYSTEM


def merge_duplicates(rows: list[dict]) -> list[dict]:
    """Collapse rows that describe the same term+code, collecting their references.

    A term can be required by several recommendations across different chapters,
    so references are kept as (empfehlung, seite) pairs — one link each, rather
    than a list of numbers pointing at a single page.
    """
    merged: dict[tuple[str, str, str], dict] = {}
    for row in rows:
        key = (row["begriff"].lower(), row["system"], row["code"])
        ref = (row["empfehlung_nr"], row["quelle_seite"])
        if key in merged:
            target = merged[key]
            if ref not in target["refs"]:
                target["refs"].append(ref)
            profile = row["fhir_profil"]
            if profile and profile not in target["profile"]:
                target["profile"].append(profile)
            continue
        entry = dict(row)
        entry["refs"] = [ref]
        entry["profile"] = [row["fhir_profil"]] if row["fhir_profil"] else []
        merged[key] = entry
    return list(merged.values())


def md_escape(text: str) -> str:
    return text.replace("|", "\\|")


def truncate(text: str, limit: int) -> str:
    return text if len(text) <= limit else text[: limit - 1] + "…"


def placeholder(text: str) -> str:
    """Normalise the various 'nothing here' spellings used in the annotation."""
    return "" if text.strip() in {"-", "–", "—", "n/a"} else text.strip()


TEXT = {
    "de": {
        "title": "### Glossar (SNOMED CT + S3-Leitlinie)",
        "intro": "Dieses Glossar listet die klinischen Begriffe, die in der "
                 "[Leitlinien-Annotation](leitlinien-abdeckung.html) mit einem "
                 "Terminologie-Code versehen sind — pro Begriff der Code, die "
                 "S3-Empfehlung, aus der er stammt, und das FHIR-Element, in dem er "
                 "abgebildet ist.",
        "delim": "Abgrenzung zu den Nachbarseiten:",
        "delim_profile": "- [Semantische Annotation](semantische-annotation.html) geht "
                         "vom **Profil** aus: welche Elemente der Senologie-Profile sind "
                         "kodiert?",
        "delim_guideline": "- Dieses Glossar geht von der **Leitlinie** aus: welche "
                           "Begriffe fordert die S3-Leitlinie, und wie sind sie kodiert?",
        "delim_note": "Die beiden Tabellen lassen sich nicht zeilenweise aufeinander "
                      "abbilden: Die Annotation benennt Datenobjekte in klinischer "
                      "Sprache, die Profiltabelle nutzt Slice-Namen.",
        "stu_note": "Mappings mit `mapping_quelle: vorschlag` sind **von uns zugewiesen "
                    "und noch nicht fachlich validiert**. Sie sind Review-Gegenstand, "
                    "keine Festlegung. Die Bedeutung der Herkunftsangaben ist im "
                    "[Annotations-Schema](leitlinien-annotation-schema.html) definiert.",
        "scope": "#### Umfang",
        "scope_head": "| Kennzahl | Wert |",
        "scope_rec": "Annotierte Empfehlungen und Qualitätsindikatoren",
        "scope_coded": "Begriffe mit Terminologie-Code",
        "scope_uncoded": "Begriffe ohne Code (Mapping-Lücke)",
        "scope_systems": "Verwendete Kodiersysteme",
        "systems": "#### Kodiersysteme im Glossar",
        "systems_head": "| Kodiersystem | Begriffe |",
        "provenance": "#### Herkunft der Mappings",
        "provenance_head": "| mapping_quelle | Begriffe | Review nötig |",
        "review": {
            "leitlinie": "nein — in der Leitlinie benannt",
            "mii-kds": "nein — aus MII KDS übernommen",
            "standard": "empfohlen",
            "vorschlag": "**ja**",
        },
        "unspecified": "(nicht angegeben)",
        "terms": "#### Begriffe",
        "terms_head": "| Begriff | Kodiersystem | Code | Display | S3-Empf. | "
                      "FHIR-Profil | Element | Herkunft |",
        "uncoded": "#### Begriffe ohne Terminologie-Code",
        "uncoded_intro": "Diese Datenobjekte sind aus der Leitlinie abgeleitet, aber noch "
                         "keinem Code zugeordnet — entweder weil kein passendes Konzept "
                         "existiert oder weil das Mapping noch offen ist. Sie stehen "
                         "vollständig im CSV-Export; hier die Verteilung pro Kapitel:",
        "uncoded_head": "| Kapitel | Thema | Empf./QI | Begriffe ohne Code |",
        "lang_note": "",
        "page_prefix": "",
        "footer": "_Auto-generiert mit `scripts/generate-glossar.py` aus den YAML-Blöcken "
                  "der Annotations-Kapitel. Nicht von Hand editieren — Quelle sind die "
                  "Seiten `input/pagecontent/s3-kap-*.md`. Maschinenlesbar: "
                  "`exports/glossar-s3-snomed.csv` (enthält auch die Begriffe ohne Code)._",
    },
    "en": {
        "title": "### Glossary (SNOMED CT + S3 Guideline)",
        "intro": "This glossary lists the clinical terms that carry a terminology code in "
                 "the [guideline annotation](leitlinien-abdeckung.html) — for each term "
                 "the code, the S3 recommendation it comes from, and the FHIR element it "
                 "is mapped to.",
        "delim": "How this differs from the neighbouring pages:",
        "delim_profile": "- [Semantic Annotation](semantische-annotation.html) starts from "
                         "the **profile**: which elements of the Senologie profiles are "
                         "coded?",
        "delim_guideline": "- This glossary starts from the **guideline**: which terms does "
                           "the S3 guideline require, and how are they coded?",
        "delim_note": "The two tables cannot be joined row by row: the annotation names "
                      "data objects in clinical language, the profile table uses slice "
                      "names.",
        "stu_note": "Mappings with `mapping_quelle: vorschlag` were **assigned by us and "
                    "have not been clinically validated**. They are subject to review, not "
                    "a decision. The provenance values are defined in the "
                    "[annotation schema](leitlinien-annotation-schema.html).",
        "scope": "#### Scope",
        "scope_head": "| Metric | Value |",
        "scope_rec": "Annotated recommendations and quality indicators",
        "scope_coded": "Terms with a terminology code",
        "scope_uncoded": "Terms without a code (mapping gap)",
        "scope_systems": "Code systems used",
        "systems": "#### Code systems in the glossary",
        "systems_head": "| Code system | Terms |",
        "provenance": "#### Mapping provenance",
        "provenance_head": "| mapping_quelle | Terms | Review needed |",
        "review": {
            "leitlinie": "no — named in the guideline",
            "mii-kds": "no — taken from MII core dataset",
            "standard": "recommended",
            "vorschlag": "**yes**",
        },
        "unspecified": "(not stated)",
        "terms": "#### Terms",
        "terms_head": "| Term | Code system | Code | Display | S3 rec. | "
                      "FHIR profile | Element | Provenance |",
        "uncoded": "#### Terms without a terminology code",
        "uncoded_intro": "These data objects are derived from the guideline but not yet "
                         "mapped to a code — either because no suitable concept exists or "
                         "because the mapping is still open. They are all in the CSV "
                         "export; the distribution per chapter:",
        "uncoded_head": "| Chapter | Topic | Rec./QI | Terms without a code |",
        "lang_note": "The annotation chapters themselves are available in German only, so the "
                     "links in the tables below point to the German site. The glossary itself "
                     "is generated in both languages.",
        "page_prefix": "../de/",
        "footer": "_Auto-generated by `scripts/generate-glossar.py` from the YAML blocks of "
                  "the annotation chapters. Do not edit by hand — the sources are "
                  "`input/pagecontent/s3-kap-*.md`. Machine-readable: "
                  "`exports/glossar-s3-snomed.csv` (includes the terms without a code)._",
    },
}

# Chapter topics in English, keyed by page stem.
THEMA_EN = {
    "s3-kap-3-allgemeines": "General aspects, early detection, familial risk",
    "s3-kap-4-1-diagnostik": "Diagnostics, imaging, biopsy, staging",
    "s3-kap-4-2-4-3-dcis-risikolaesionen": "DCIS and risk lesions (B3)",
    "s3-kap-4-4-operative-therapie": "Surgical therapy",
    "s3-kap-4-5-pathologie": "Pathology, biomarkers, prognosis",
    "s3-kap-4-6-strahlentherapie": "Adjuvant radiotherapy",
    "s3-kap-4-8-systemische-therapie": "Systemic therapy, early breast cancer",
    "s3-kap-5-rezidiv-metastasiert": "Recurrent and metastatic disease",
    "s3-kap-6-betreuung": "Supportive care, follow-up, palliative care",
    "s3-kap-7-spezielle-situationen": "Special situations",
    "s3-kap-8-qualitaetsindikatoren": "Quality indicators",
}


def render_page(lang: str, coded: list[dict], uncoded_by_chapter: dict[str, int],
                rec_counts: dict[str, int]) -> str:
    t = TEXT[lang]
    by_system: dict[str, int] = defaultdict(int)
    by_quelle: dict[str, int] = defaultdict(int)
    for row in coded:
        by_system[row["system"]] += 1
        by_quelle[row["mapping_quelle"] or t["unspecified"]] += 1

    lines: list[str] = []
    add = lines.append

    add(t["title"])
    add("")
    add(t["intro"])
    add("")
    add(t["delim"])
    add("")
    add(t["delim_profile"])
    add(t["delim_guideline"])
    add("")
    add(t["delim_note"])
    add("")
    add("{:.stu-note}")
    add(t["stu_note"])
    add("")
    if t["lang_note"]:
        add(t["lang_note"])
        add("")

    add(t["scope"])
    add("")
    add(t["scope_head"])
    add("|---|---|")
    add(f"| {t['scope_rec']} | {sum(rec_counts.values())} |")
    add(f"| {t['scope_coded']} | {len(coded)} |")
    add(f"| {t['scope_uncoded']} | {sum(uncoded_by_chapter.values())} |")
    add(f"| {t['scope_systems']} | {len(by_system)} |")
    add("")

    add(t["systems"])
    add("")
    add(t["systems_head"])
    add("|---|---|")
    for system, count in sorted(by_system.items(), key=lambda kv: (-kv[1], kv[0])):
        add(f"| {md_escape(system)} | {count} |")
    add("")

    add(t["provenance"])
    add("")
    add(t["provenance_head"])
    add("|---|---|---|")
    for quelle, count in sorted(by_quelle.items(), key=lambda kv: (-kv[1], kv[0])):
        add(f"| `{quelle}` | {count} | {t['review'].get(quelle, '—')} |")
    add("")

    add(t["terms"])
    add("")
    add(t["terms_head"])
    add("|---|---|---|---|---|---|---|---|")
    for row in sorted(coded, key=lambda r: r["begriff"].lower()):
        refs = ", ".join(
            f"[{md_escape(nr)}]({t['page_prefix']}{page})" for nr, page in row["refs"] if nr
        ) or "—"
        profiles = [placeholder(p) for p in row["profile"]]
        profil = md_escape(truncate(" / ".join(p for p in profiles if p), 44)) or "—"
        element = placeholder(row["fhir_element"])
        display = placeholder(row["display"])
        add("| {begriff} | {system} | `{code}` | {display} | {refs} | "
            "{profil} | {element} | {quelle} |".format(
                begriff=md_escape(row["begriff"]),
                system=md_escape(row["system"]),
                code=md_escape(row["code"]),
                display=md_escape(truncate(display, 60)) or "—",
                refs=refs,
                profil=profil,
                element=f"`{md_escape(truncate(element, 50))}`" if element else "—",
                quelle=f"`{row['mapping_quelle']}`" if row["mapping_quelle"] else "—",
            ))
    add("")

    add(t["uncoded"])
    add("")
    add(t["uncoded_intro"])
    add("")
    add(t["uncoded_head"])
    add("|---|---|---|---|")
    for stem, kapitel, thema in CHAPTERS:
        label = thema if lang == "de" else THEMA_EN[stem]
        add(f"| [{kapitel}]({t['page_prefix']}{stem}.html) | {label} | "
            f"{rec_counts.get(stem, 0)} | "
            f"{uncoded_by_chapter.get(stem, 0)} |")
    add("")

    add("---")
    add("")
    add(t["footer"])
    add("")
    return "\n".join(lines)


def main() -> None:
    all_rows: list[dict] = []
    rec_counts: dict[str, int] = {}
    uncoded_by_chapter: dict[str, int] = defaultdict(int)

    for stem, kapitel, _thema in CHAPTERS:
        rows, recommendations = parse_chapter(stem, kapitel)
        rec_counts[stem] = recommendations
        for row in rows:
            if not has_code(row):
                uncoded_by_chapter[stem] += 1
        all_rows.extend(rows)
        print(f"  {stem}: {recommendations} Empfehlungen, {len(rows)} Datenobjekte")

    coded = merge_duplicates([r for r in all_rows if has_code(r)])

    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUT_CSV.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=CSV_FIELDS)
        writer.writeheader()
        writer.writerows(all_rows)

    for lang, path in ((("de"), OUT_MD), ("en", OUT_MD_EN)):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(render_page(lang, coded, uncoded_by_chapter, rec_counts),
                        encoding="utf-8")

    print()
    print(f"CSV  : {OUT_CSV.relative_to(ROOT)} ({len(all_rows)} Zeilen)")
    print(f"Seite: {OUT_MD.relative_to(ROOT)} ({len(coded)} kodierte Begriffe)")
    print(f"Seite: {OUT_MD_EN.relative_to(ROOT)}")
    print(f"Ohne Code: {sum(uncoded_by_chapter.values())}")


if __name__ == "__main__":
    main()
