#!/usr/bin/env python3
"""Audit SCT/LOINC codes in all Senologie ValueSets against a terminology server.

Reads ValueSet-vs-senologie-*.json from fsh-generated/resources/, extracts
every (system, code, claimed-display) triple, and looks up the official
display via `CodeSystem/$lookup`. Reports:

  - INVALID codes (HTTP 404 — code does not exist)
  - CRITICAL mismatches (display refers to a completely different concept,
    e.g. "Drahtmarkierung" → "Prosthetic arthroplasty of the hip")
  - TRANSLATION mismatches (display is a clean German translation of the
    official English label — these are usually OK, just flagged)

Default backend: local Snowstorm at http://localhost:8090/fhir (no rate limit,
~20× faster than Ontoserver). Fallback: public Ontoserver.

Exit codes:
  0  no invalid codes, no critical mismatches
  1  invalid codes OR critical mismatches present
  2  terminology server unreachable

Usage:
  python3 scripts/audit-valueset-codes.py [--report PATH] [--server URL]

Env:
  TERMINOLOGY_SERVER  default: http://localhost:8090/fhir (Snowstorm)
"""
from __future__ import annotations
import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RESOURCES = ROOT / "fsh-generated" / "resources"


def _load_dotenv(path: Path) -> None:
    """Minimal .env loader — KEY=VALUE per line, ignores comments + blank lines."""
    if not path.exists():
        return
    for raw in path.read_text().splitlines():
        line = raw.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, _, value = line.partition("=")
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        if key and key not in os.environ:
            os.environ[key] = value


_load_dotenv(ROOT / ".env")

DEFAULT_SERVER = os.environ.get("TERMINOLOGY_SERVER", "http://localhost:8090/fhir")
FALLBACK_SERVER = "https://r4.ontoserver.csiro.au/fhir"

# We only verify code-systems Ontoserver knows about
SUPPORTED_SYSTEMS = {
    "http://snomed.info/sct": "SCT",
    "http://loinc.org": "LOINC",
}

# Heuristic for "is this just a translation?" — strip diacritics, punctuation,
# loose contains-match. If the claimed-display loosely matches the actual, OR
# is a known German translation, we treat it as translation-mismatch (warning,
# not critical).
def _norm(s: str) -> str:
    s = (s or "").lower()
    s = (s.replace("ä", "a").replace("ö", "o").replace("ü", "u").replace("ß", "ss"))
    s = re.sub(r"[()/.,\-_:\s]", "", s)
    return s


# Known German↔English clinical synonyms (extend as we find more)
GERMAN_SYNONYMS = {
    "lunge": "lung", "leber": "liver", "knochen": "bone", "hirn": "brain",
    "ja": "yes", "nein": "no", "mamma": "breast", "mammakarzinom": "malignantneoplasmofbreast",
    "links": "left", "rechts": "right", "beidseits": "rightandleft",
    "stanzbiopsie": "coreneedlebiopsy", "vakuumbiopsie": "vacuumassistedbiopsy",
    "feinnadelaspiration": "needleaspiration", "fna": "needleaspiration",
    "zytologie": "cytologicmaterial",
    "kurativ": "curative", "intravenoes": "intravenous", "intravenos": "intravenous",
    "intramuskulaer": "intramuscular", "intramuskular": "intramuscular",
    "subkutan": "subcutaneous", "oral": "oral",
    "gynäkomastie": "gynaecomastia", "gynakomastie": "gynaecomastia",
}

CRITICAL_KEYWORDS_OK_OVERLAP = [
    "lung", "liver", "bone", "brain", "breast", "ductal", "lobular",
    "fibroadenoma", "cyst", "mastitis", "abscess", "carcinoma", "lymphedema",
    "operative", "surgical", "biopsy", "needle", "core", "specimen",
    "intraductal", "yes", "no", "left", "right", "lateral", "outer", "inner",
    "upper", "lower", "central", "intravenous", "intramuscular", "oral",
    "subcutaneous", "inpatient", "preoperative", "postoperative",
]


def lookup(server: str, system: str, code: str) -> tuple[str, str]:
    url = f"{server}/CodeSystem/$lookup?system={urllib.parse.quote(system, safe='')}&code={urllib.parse.quote(code, safe='')}"
    try:
        with urllib.request.urlopen(url, timeout=20) as r:
            data = json.loads(r.read())
        if data.get("resourceType") == "Parameters":
            for p in data.get("parameter", []):
                if p.get("name") == "display":
                    return ("ok", p.get("valueString", ""))
        return ("not_found", "")
    except urllib.error.HTTPError as e:
        if e.code == 404:
            return ("invalid", "")
        return ("http_err", str(e.code))
    except Exception as e:
        return ("err", f"{type(e).__name__}: {str(e)[:60]}")


def classify(claimed: str, actual: str) -> str:
    """Decide if a mismatch is critical, translation, or OK."""
    cn, an = _norm(claimed), _norm(actual)
    if not cn or not an:
        return "ok"
    if cn == an or cn in an or an in cn:
        return "ok"
    # German synonym substitution
    for de, en in GERMAN_SYNONYMS.items():
        if de in cn and en in an:
            return "translation"
    # Heuristic: shared anatomy/procedure keywords → likely translation
    for kw in CRITICAL_KEYWORDS_OK_OVERLAP:
        if kw in cn and kw in an:
            return "translation"
    # Loose prefix overlap (e.g. "Stanzbiopsie" vs "Stanzbiopsy")
    if cn[:5] == an[:5] and len(cn) >= 5:
        return "translation"
    # Otherwise: critical — claimed and actual seem unrelated
    return "critical"


def collect_records() -> list[tuple[str, str, str, str]]:
    records = []
    for f in sorted(RESOURCES.glob("ValueSet-vs-senologie-*.json")):
        vs = json.loads(f.read_text())
        vs_id = vs.get("id", "?")
        for inc in (vs.get("compose", {}) or {}).get("include", []):
            sys = inc.get("system", "")
            if sys not in SUPPORTED_SYSTEMS:
                continue
            for c in inc.get("concept", []) or []:
                records.append((vs_id, sys, c.get("code", ""), c.get("display", "")))
    return records


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--report", default=None, help="Write full report markdown to this path")
    ap.add_argument("--server", default=DEFAULT_SERVER, help=f"FHIR terminology server (default: {DEFAULT_SERVER})")
    ap.add_argument("--rate-limit", type=float, default=0.0, help="Seconds between requests (default 0; 0.3 for public servers)")
    ap.add_argument("--no-fallback", action="store_true", help="Don't fall back to Ontoserver if default server unreachable")
    args = ap.parse_args()

    # Try preferred server, fall back to Ontoserver
    server = args.server
    try:
        with urllib.request.urlopen(f"{server}/metadata", timeout=10) as r:
            r.read(50)
    except Exception as e:
        if args.no_fallback:
            print(f"ERROR: terminology server not reachable at {server}: {e}", file=sys.stderr)
            return 2
        print(f"WARN: {server} unreachable ({type(e).__name__}), falling back to {FALLBACK_SERVER}", file=sys.stderr)
        server = FALLBACK_SERVER
        try:
            with urllib.request.urlopen(f"{server}/metadata", timeout=10) as r:
                r.read(50)
        except Exception as e2:
            print(f"ERROR: fallback {server} also unreachable: {e2}", file=sys.stderr)
            return 2
        # Apply rate limit when using public fallback
        if args.rate_limit == 0.0:
            args.rate_limit = 0.3

    records = collect_records()
    print(f"Checking {len(records)} SCT/LOINC codes against {server}...", file=sys.stderr)

    invalid, critical, translation = [], [], []
    for i, (vs_id, sys_url, code, claimed) in enumerate(records):
        status, actual = lookup(server, sys_url, code)
        if args.rate_limit > 0:
            time.sleep(args.rate_limit)
        if status in ("invalid", "not_found"):
            invalid.append((vs_id, sys_url, code, claimed))
        elif status == "ok":
            cls = classify(claimed, actual)
            if cls == "critical":
                critical.append((vs_id, sys_url, code, claimed, actual))
            elif cls == "translation":
                translation.append((vs_id, sys_url, code, claimed, actual))

    lines = []
    lines.append(f"# ValueSet Code Audit Report")
    lines.append("")
    lines.append(f"Codes checked: **{len(records)}** | Invalid: **{len(invalid)}** | Critical mismatches: **{len(critical)}** | Translations: **{len(translation)}**")
    lines.append("")

    if invalid:
        lines.append("## ❌ INVALID — code does not exist in CodeSystem")
        lines.append("| VS | System | Code | Claimed display |")
        lines.append("|---|---|---|---|")
        for vs_id, sys_url, code, claimed in invalid:
            short = SUPPORTED_SYSTEMS[sys_url]
            lines.append(f"| `{vs_id}` | {short} | `{code}` | {claimed} |")
        lines.append("")

    if critical:
        lines.append("## ⚠️ CRITICAL — code resolves to a completely different concept")
        lines.append("| VS | System | Code | Claimed | Actual SCT/LOINC display |")
        lines.append("|---|---|---|---|---|")
        for vs_id, sys_url, code, claimed, actual in critical:
            short = SUPPORTED_SYSTEMS[sys_url]
            lines.append(f"| `{vs_id}` | {short} | `{code}` | {claimed} | **{actual}** |")
        lines.append("")

    if translation:
        lines.append("## 💬 Translation/label difference (likely OK — manual verification)")
        lines.append("| VS | System | Code | Claimed (DE/label) | Official (EN) |")
        lines.append("|---|---|---|---|---|")
        for vs_id, sys_url, code, claimed, actual in translation:
            short = SUPPORTED_SYSTEMS[sys_url]
            lines.append(f"| `{vs_id}` | {short} | `{code}` | {claimed} | {actual} |")
        lines.append("")

    report = "\n".join(lines)
    if args.report:
        Path(args.report).write_text(report)
        print(f"Wrote report → {args.report}", file=sys.stderr)
    else:
        print(report)

    print("", file=sys.stderr)
    print(f"Summary: {len(invalid)} invalid, {len(critical)} critical, {len(translation)} translation", file=sys.stderr)

    if invalid or critical:
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
