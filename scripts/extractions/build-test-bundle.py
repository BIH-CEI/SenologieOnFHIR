#!/usr/bin/env python3
"""
Build a transaction Bundle from a Fall<N>-Example's generated resources.

Reads all `fsh-generated/resources/*-Fall<N>-*.json` files (Conditions,
Observations, Procedures, Patient etc.) and bundles them into a single
Bundle that can be POSTed to Matchbox/$transform for the extraction tests.

Usage:
    python3 scripts/extractions/build-test-bundle.py 1
    python3 scripts/extractions/build-test-bundle.py 13 --out validation/extractions/input/fall13.json
"""

import argparse
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
GENERATED = REPO / "fsh-generated" / "resources"


def collect(fall: int):
    pattern = re.compile(rf"-Fall{fall}-")
    resources = []
    for p in sorted(GENERATED.glob("*.json")):
        if not pattern.search(p.name):
            continue
        try:
            d = json.loads(p.read_text())
        except json.JSONDecodeError:
            continue
        rtype = d.get("resourceType")
        rid = d.get("id")
        if not rtype or not rid:
            continue
        resources.append((p.name, d))
    return resources


def build_bundle(resources):
    entries = []
    for fname, r in resources:
        entries.append({
            "fullUrl": f"urn:uuid:{r['id']}" if not r.get("id", "").startswith("http") else r["id"],
            "resource": r,
            "request": {
                "method": "PUT",
                "url": f"{r['resourceType']}/{r['id']}"
            }
        })
    return {
        "resourceType": "Bundle",
        "type": "transaction",
        "entry": entries,
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("fall", type=int, help="Fall-Nummer, z.B. 1 oder 13")
    ap.add_argument("--out", type=Path, help="Output path; defaults to validation/extractions/input/fall<N>.json")
    args = ap.parse_args()

    resources = collect(args.fall)
    if not resources:
        print(f"No resources matched -Fall{args.fall}- in {GENERATED}", file=sys.stderr)
        sys.exit(2)

    bundle = build_bundle(resources)

    out = args.out or REPO / "validation" / "extractions" / "input" / f"fall{args.fall}.json"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(bundle, indent=2, ensure_ascii=False))
    print(f"Wrote {len(resources)} resources → {out.relative_to(REPO)}")


if __name__ == "__main__":
    main()
