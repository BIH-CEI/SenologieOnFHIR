#!/usr/bin/env python3
"""
Laedt den Senologie-IG und die Beispielpatienten aus fsh-generated/resources/
in einen HAPI-Server (fuer $evaluate-measure-Tests).

Usage:  python3 scripts/cql/load-hapi.py [HAPI_URL]
        (Default: $HAPI_URL bzw. http://localhost:8095/fhir)

Klinische Instanzen werden in MEHREREN Durchlaeufen geladen: HAPI lehnt eine
Ressource ab, solange ein referenziertes Ziel fehlt (HAPI-1094), und die
Dateien liegen alphabetisch vor (Condition-* vor Patient-*). Jeder Durchlauf
versucht die bisher abgelehnten erneut, bis nichts mehr dazukommt. Die
Referenzpruefung bleibt bewusst AN — schaltet man sie ab, legt HAPI fuer noch
fehlende Ziele keine Referenz-Indizes an und die CQL-Retrieves im
Patient-Kontext finden nichts.

Exit 1, wenn am Ende Ressourcen nicht geladen werden konnten.
"""
import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
RESOURCES = REPO / "fsh-generated" / "resources"
HAPI_URL = (sys.argv[1] if len(sys.argv) > 1
            else os.environ.get("HAPI_URL", "http://localhost:8095/fhir")).rstrip("/")

# Reihenfolge der Abhaengigkeiten: Terminologie → Profile → Library → Measure
CONFORMANCE = ["CodeSystem", "ValueSet", "ConceptMap", "StructureDefinition", "Library", "Measure"]
CLINICAL = {
    "Patient", "Condition", "Observation", "Procedure", "MedicationStatement",
    "MedicationAdministration", "MedicationRequest", "DiagnosticReport", "Specimen",
    "BodyStructure", "FamilyMemberHistory", "CarePlan", "ServiceRequest", "AdverseEvent",
    "Encounter", "Organization", "Practitioner", "PractitionerRole", "RiskAssessment",
}


def put(path):
    """PUT einer Ressourcendatei. Rueckgabe: (ok, Fehlermeldung)."""
    body = path.read_bytes()
    res = json.loads(body)
    req = urllib.request.Request(
        f"{HAPI_URL}/{res['resourceType']}/{res['id']}", data=body, method="PUT",
        headers={"Content-Type": "application/fhir+json"})
    try:
        with urllib.request.urlopen(req, timeout=180):
            return True, ""
    except urllib.error.HTTPError as e:
        text = e.read().decode(errors="replace")
        try:
            text = json.loads(text)["issue"][0]["diagnostics"]
        except Exception:
            pass
        return False, f"HTTP {e.code}: {text[:300]}"
    except Exception as e:  # Netzwerk, Timeout
        return False, str(e)


def main():
    failed = []

    for rtype in CONFORMANCE:
        files = sorted(RESOURCES.glob(f"{rtype}-*.json"))
        ok = 0
        for f in files:
            success, msg = put(f)
            if success:
                ok += 1
            else:
                failed.append((f.name, msg))
        print(f"  {rtype}: {ok}/{len(files)} geladen")

    pending = [f for f in sorted(RESOURCES.glob("*.json"))
               if json.loads(f.read_bytes()).get("resourceType") in CLINICAL]
    total = len(pending)
    errors = {}
    run = 0
    while pending:
        run += 1
        still = []
        for f in pending:
            success, msg = put(f)
            if not success:
                still.append(f)
                errors[f.name] = msg
        print(f"  Beispiele, Durchlauf {run}: {len(pending) - len(still)} geladen, {len(still)} offen")
        if len(still) == len(pending):
            break
        pending = still
    else:
        still = []
    failed.extend((f.name, errors[f.name]) for f in still)
    print(f"  Beispiele: {total - len(still)}/{total} geladen")

    if failed:
        print(f"\nFEHLER: {len(failed)} Ressourcen nicht geladen:")
        for name, msg in failed:
            print(f"  {name}: {msg}")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
