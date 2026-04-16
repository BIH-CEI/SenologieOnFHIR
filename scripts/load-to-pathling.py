#!/usr/bin/env python3
"""Load Senologie FHIR resources into a running Pathling FHIR server.

This script walks `fsh-generated/resources/` and POSTs the Senologie
case resources (Fall*) plus example resources to the Pathling FHIR
REST endpoint. Pathling normally ingests NDJSON via its `$import`
operation for bulk loads; for the 12-patient synthetic cohort
(~180 resources) posting individual resources via the standard
FHIR `create` interaction is simpler and sufficient.

Usage:
    docker compose -f docker-compose.pathling.yaml up -d
    python3 scripts/load-to-pathling.py

Environment:
    PATHLING_URL   Base URL of the Pathling FHIR endpoint
                   (default: http://localhost:8090/fhir).
    RESOURCES_DIR  Directory with FSH-generated resources
                   (default: fsh-generated/resources relative to repo root).
"""

from __future__ import annotations

import json
import os
import sys
import time
from pathlib import Path
from typing import Iterable

import urllib.error
import urllib.request


# Resource types that the 6 ViewDefinitions operate on. The Fall* examples
# in fsh-generated/resources/ are the primary cohort; the small number of
# shared example resources (e.g. Example-Diagnose-*) is also loaded for
# completeness.
TARGET_RESOURCE_TYPES = (
    "Patient",
    "Condition",
    "Procedure",
    "Observation",
    "DiagnosticReport",
    "MedicationStatement",
    "CarePlan",
    "Device",
    "Specimen",
)


def repo_root() -> Path:
    return Path(__file__).resolve().parent.parent


def iter_resource_files(resources_dir: Path) -> Iterable[Path]:
    """Yield FHIR JSON files for target resource types."""
    for path in sorted(resources_dir.glob("*.json")):
        name = path.name
        for rt in TARGET_RESOURCE_TYPES:
            if name.startswith(f"{rt}-"):
                yield path
                break


def wait_for_server(base_url: str, timeout_s: int = 120) -> None:
    """Poll the /metadata endpoint until the server is ready."""
    url = f"{base_url}/metadata"
    deadline = time.monotonic() + timeout_s
    last_err: Exception | None = None
    while time.monotonic() < deadline:
        try:
            req = urllib.request.Request(
                url, headers={"Accept": "application/fhir+json"}
            )
            with urllib.request.urlopen(req, timeout=5) as resp:
                if 200 <= resp.status < 300:
                    return
        except Exception as err:  # noqa: BLE001
            last_err = err
        time.sleep(2)
    raise RuntimeError(
        f"Pathling server at {base_url} not ready after {timeout_s}s: {last_err}"
    )


def put_resource(base_url: str, resource: dict) -> tuple[int, str]:
    """Upsert a single FHIR resource via PUT {base}/{Type}/{id}."""
    rt = resource["resourceType"]
    rid = resource.get("id")
    if not rid:
        raise ValueError(f"Resource of type {rt} has no 'id' field")
    url = f"{base_url}/{rt}/{rid}"
    payload = json.dumps(resource).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=payload,
        method="PUT",
        headers={
            "Content-Type": "application/fhir+json",
            "Accept": "application/fhir+json",
        },
    )
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            return resp.status, resp.reason
    except urllib.error.HTTPError as err:
        body = err.read().decode("utf-8", errors="replace")[:400]
        return err.code, f"{err.reason}: {body}"


def main() -> int:
    base_url = os.environ.get("PATHLING_URL", "http://localhost:8090/fhir")
    resources_dir = Path(
        os.environ.get("RESOURCES_DIR", repo_root() / "fsh-generated" / "resources")
    )
    if not resources_dir.is_dir():
        print(f"[error] resources dir does not exist: {resources_dir}", file=sys.stderr)
        return 2

    print(f"[info] Pathling base URL: {base_url}")
    print(f"[info] Resources dir:     {resources_dir}")
    print("[info] Waiting for Pathling server readiness ...")
    wait_for_server(base_url)
    print("[info] Pathling is up; starting upload.")

    files = list(iter_resource_files(resources_dir))
    print(f"[info] Found {len(files)} candidate resource files.")

    counts: dict[str, int] = {}
    errors: list[tuple[str, int, str]] = []

    for path in files:
        try:
            resource = json.loads(path.read_text(encoding="utf-8"))
        except Exception as err:  # noqa: BLE001
            errors.append((path.name, 0, f"json load failed: {err}"))
            continue

        rt = resource.get("resourceType")
        if rt not in TARGET_RESOURCE_TYPES:
            # Skip anything that slipped in despite filename prefix match.
            continue

        status, reason = put_resource(base_url, resource)
        if 200 <= status < 300:
            counts[rt] = counts.get(rt, 0) + 1
        else:
            errors.append((path.name, status, reason))

    print()
    print("[summary] Resources loaded per type:")
    for rt in TARGET_RESOURCE_TYPES:
        print(f"  {rt:20s} {counts.get(rt, 0):4d}")
    total = sum(counts.values())
    print(f"  {'TOTAL':20s} {total:4d}")

    if errors:
        print()
        print(f"[warn] {len(errors)} resources failed to load:")
        for name, status, reason in errors[:20]:
            print(f"  - {name}: HTTP {status} {reason}")
        if len(errors) > 20:
            print(f"  ... and {len(errors) - 20} more.")
        return 1

    print()
    print("[ok] All resources loaded. Pathling is ready for $view / ViewDefinition $run.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
