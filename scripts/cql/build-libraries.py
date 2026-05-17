#!/usr/bin/env python3
"""Erzeugt FHIR Library-Ressourcen aus den CQL-Dateien in input/cql/.

Output: input/fsh/measures/lib-*.fsh (eine FSH-Instance pro CQL-Datei)

Die Library-Resource enthält:
- name + version + url
- content[0].contentType = "text/cql"     ← base64-encoded CQL
- content[1].contentType = "application/elm+json"  ← base64-encoded pre-compiled ELM
- relatedArtifact[*] mit type=depends-on für jedes `include X version 'Y'`

Pre-compilation ELM ist NÖTIG, damit HAPI's MeasureEvaluator cross-library
includes auflösen kann — Library/$evaluate funktioniert auch ohne ELM, aber
Measure/$evaluate-measure scheitert mit NullPointerException, wenn nur CQL
geliefert wird und ein include vorhanden ist.

ELM-Pre-Compilation läuft via cqframework/cql-translation-service:
  docker run -d --name cql-trans -p 18180:8080 cqframework/cql-translation-service

Wenn der Service nicht erreichbar ist, wird die Library ohne ELM gebaut
(Fallback) und eine Warnung ausgegeben.
"""
from __future__ import annotations
import base64
import email
import email.parser
import email.policy
import json
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CQL_DIR = REPO / "input/cql"
OUT_DIR = REPO / "input/fsh/measures"
BASE_URL = "https://www.senologie.org/fhir"

TRANSLATOR_URL = "http://localhost:18180/cql/translator?signatures=Overloads"

BUILTIN_LIBS = {"FHIRHelpers"}

CQL_FILES = [
    ("MinimalMeasureLib.cql", "MinimalMeasureLib",
     "Minimale Debug-Library mit drei konstanten true-Defines"),
    ("QualitaetsindikatorenLeitlinie.cql", "QualitaetsindikatorenLeitlinie",
     "S3-Leitlinien-Qualitätsindikatoren (17 QIs aus S3 Mammakarzinom v5.0, Kapitel 8)"),
    ("OncoBoxBrustKennzahlen.cql", "OncoBoxBrustKennzahlen",
     "OncoBox Brust 2.0 Kennzahlen (KB-1 bis KB-20, DKG-Zertifizierung)"),
]

INCLUDE_RE = re.compile(
    r"^\s*include\s+(\S+)\s+version\s+'([^']+)'(?:\s+called\s+\S+)?\s*$",
    re.MULTILINE,
)


def parse_includes(cql_text: str) -> list[tuple[str, str]]:
    """Return [(library_name, version), …] for non-builtin includes."""
    deps = []
    for m in INCLUDE_RE.finditer(cql_text):
        name, version = m.group(1), m.group(2)
        if name in BUILTIN_LIBS:
            continue
        deps.append((name, version))
    return deps


def build_multipart(parts: dict[str, bytes]) -> tuple[bytes, str]:
    """Hand-roll multipart/form-data — stdlib's MIMEMultipart doesn't quite fit."""
    boundary = "----senoBoundary7f5a93a1"
    body = b""
    for name, content in parts.items():
        body += f"--{boundary}\r\n".encode()
        body += f'Content-Disposition: form-data; name="{name}"\r\n'.encode()
        body += b"Content-Type: application/cql\r\n\r\n"
        body += content
        body += b"\r\n"
    body += f"--{boundary}--\r\n".encode()
    return body, f"multipart/form-data; boundary={boundary}"


def translate_all_elm(cql_sources: dict[str, str]) -> dict[str, dict] | None:
    """Translate all CQL libraries together; return dict name → ELM-JSON dict.

    Multipart upload enables cross-library include resolution within a single
    translation request. Returns None if translator is unavailable.
    """
    body_parts = {name: src.encode("utf-8") for name, src in cql_sources.items()}
    body, content_type = build_multipart(body_parts)

    req = urllib.request.Request(
        TRANSLATOR_URL,
        data=body,
        headers={
            "Content-Type": content_type,
            "Accept": "multipart/form-data",
        },
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            response_body = resp.read()
            response_ct = resp.headers.get("Content-Type", "")
    except (urllib.error.URLError, ConnectionError) as e:
        print(f"  ⚠️  cql-translation-service nicht erreichbar ({e}). Baue ohne ELM.")
        print(f"     Start: docker run -d --name cql-trans -p 18180:8080 cqframework/cql-translation-service")
        return None

    # Parse multipart response manually
    full = f"Content-Type: {response_ct}\r\n\r\n".encode() + response_body
    msg = email.parser.BytesParser(policy=email.policy.default).parsebytes(full)
    if not msg.is_multipart():
        print(f"  ⚠️  Unexpected response (not multipart): {response_ct}")
        return None

    result: dict[str, dict] = {}
    for part in msg.iter_parts():
        cd = part.get("Content-Disposition", "")
        m = re.search(r'name="([^"]+)"', cd)
        if not m:
            continue
        name = m.group(1)
        payload = part.get_payload(decode=True).decode("utf-8")
        try:
            result[name] = json.loads(payload)
        except json.JSONDecodeError as e:
            print(f"  ⚠️  ELM für {name} nicht parsebar: {e}")
            continue
    return result


def check_elm_errors(elm: dict, lib_name: str) -> bool:
    """Return True if ELM has no errors (warnings allowed)."""
    annotations = elm.get("library", {}).get("annotation", [])
    errors = [a for a in annotations if a.get("errorSeverity") == "error"]
    warnings = [a for a in annotations if a.get("errorSeverity") == "warning"]
    if errors:
        print(f"  ✗ {lib_name}: {len(errors)} errors / {len(warnings)} warnings")
        for e in errors[:5]:
            print(f"     ERR: {(e.get('message') or '?')[:160]}")
        return False
    if warnings:
        print(f"  ⚠ {lib_name}: 0 errors / {len(warnings)} warnings (OK)")
    return True


def build_library(
    cql_filename: str,
    library_name: str,
    description: str,
    elm_json: dict | None,
) -> str:
    cql_path = CQL_DIR / cql_filename
    cql_text = cql_path.read_text()
    m = re.search(r"library\s+\S+\s+version\s+'([^']+)'", cql_text)
    version = m.group(1) if m else "0.1.0"
    cql_b64 = base64.b64encode(cql_text.encode("utf-8")).decode("ascii")

    deps = parse_includes(cql_text)

    instance_id = library_name
    fsh_lines = [
        f"// Auto-generated FHIR Library wrapper for {cql_filename}",
        "// Generated by scripts/cql/build-libraries.py — do not edit by hand.",
        "",
        f"Instance: {instance_id}",
        "InstanceOf: Library",
        f'Title: "Library: {library_name}"',
        f'Description: "{description}"',
        "Usage: #definition",
        "",
        f'* url = "{BASE_URL}/Library/{instance_id}"',
        f'* name = "{library_name}"',
        f'* version = "{version}"',
        "* status = #active",
        "* experimental = false",
        "* type = http://terminology.hl7.org/CodeSystem/library-type#logic-library",
    ]

    for dep_name, dep_version in deps:
        canonical = f"{BASE_URL}/Library/{dep_name}|{dep_version}"
        fsh_lines.append("* relatedArtifact[+].type = #depends-on")
        fsh_lines.append(f'* relatedArtifact[=].display = "Library {dep_name}"')
        fsh_lines.append(f'* relatedArtifact[=].resource = "{canonical}"')

    # CQL source
    fsh_lines.extend([
        "* content[+].contentType = #text/cql",
        f'* content[=].title = "{cql_filename}"',
        f'* content[=].data = "{cql_b64}"',
    ])

    # Pre-compiled ELM JSON (if available)
    if elm_json is not None:
        elm_b64 = base64.b64encode(
            json.dumps(elm_json, separators=(",", ":")).encode("utf-8")
        ).decode("ascii")
        fsh_lines.extend([
            "* content[+].contentType = #application/elm+json",
            f'* content[=].title = "{library_name}.elm.json"',
            f'* content[=].data = "{elm_b64}"',
        ])

    fsh_lines.append("")
    return "\n".join(fsh_lines)


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    # Load all CQL into memory
    cql_sources: dict[str, str] = {}
    for cql_filename, library_name, _ in CQL_FILES:
        cql_sources[library_name] = (CQL_DIR / cql_filename).read_text()

    # Translate via multipart (cross-library includes resolve here)
    print("Translating CQL → ELM via cql-translation-service…")
    elm_results = translate_all_elm(cql_sources)

    any_elm_error = False
    if elm_results is not None:
        for lib_name, elm in elm_results.items():
            if not check_elm_errors(elm, lib_name):
                any_elm_error = True

    if any_elm_error:
        print("  ⚠️  Mindestens eine Library hat ELM-Fehler — Library wird ohne ELM gebaut.")
        elm_results = None  # fall back: no ELM for any

    # Emit FSH
    for cql_filename, library_name, description in CQL_FILES:
        elm_for_lib = (elm_results or {}).get(library_name) if elm_results else None
        fsh = build_library(cql_filename, library_name, description, elm_for_lib)
        out_file = OUT_DIR / f"lib-{library_name.lower().replace('_','-')}.fsh"
        out_file.write_text(fsh)
        deps = parse_includes(cql_sources[library_name])
        dep_str = ", ".join(f"{n}|{v}" for n, v in deps) or "(none)"
        has_elm = "with ELM" if elm_for_lib else "CQL-only"
        print(f"  → {out_file.relative_to(REPO)}   deps: {dep_str}   [{has_elm}]")


if __name__ == "__main__":
    main()
