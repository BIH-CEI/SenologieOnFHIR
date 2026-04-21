#!/usr/bin/env python3
"""
SDC Extraction: QuestionnaireResponse → Condition

Extracts Condition resources from Senologie Diagnose QuestionnaireResponses.
Can be run manually or triggered via webhook/workflow.

Usage:
    python extract-questionnaire.py                    # Extract all unprocessed
    python extract-questionnaire.py <qr-id>           # Extract specific QR
"""

import requests
from requests.auth import HTTPBasicAuth
import sys
import json

AIDBOX_URL = "http://localhost:8888"
AUTH = HTTPBasicAuth("root", "secret")

def get_answer(item, link_id):
    """Get answer value from QuestionnaireResponse item."""
    for i in item.get('item', []):
        if i.get('linkId') == link_id:
            answers = i.get('answer', [])
            if answers:
                ans = answers[0]
                return ans.get('valueCoding') or ans.get('valueDate') or ans.get('valueBoolean') or ans.get('valueString')
    return None

def extract_condition(qr):
    """Extract Condition from QuestionnaireResponse."""

    # Find diagnose group
    diagnose_group = None
    for item in qr.get('item', []):
        if item.get('linkId') == 'diagnose':
            diagnose_group = item
            break

    if not diagnose_group:
        return None

    # Extract values
    snomed_code = get_answer(diagnose_group, 'diagnose.code')
    icd10_code = get_answer(diagnose_group, 'diagnose.icd10')
    laterality = get_answer(diagnose_group, 'diagnose.seite')
    date = get_answer(diagnose_group, 'diagnose.datum')
    verification = get_answer(diagnose_group, 'diagnose.sicherung')
    is_recurrence = get_answer(diagnose_group, 'diagnose.rezidiv')

    # Build Condition
    condition = {
        "resourceType": "Condition",
        "meta": {
            "profile": ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose"]
        },
        "clinicalStatus": {
            "coding": [{
                "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                "code": "recurrence" if is_recurrence else "active"
            }]
        },
        "code": {
            "coding": []
        },
        "subject": qr.get('subject'),
        "recordedDate": date
    }

    # Add SNOMED code
    if snomed_code:
        condition["code"]["coding"].append(snomed_code)

    # Add ICD-10 code
    if icd10_code:
        condition["code"]["coding"].append(icd10_code)

    # Add laterality
    if laterality:
        condition["bodySite"] = [{"coding": [laterality]}]

    # Add verification status
    if verification:
        condition["verificationStatus"] = {"coding": [verification]}

    return condition

def save_condition(condition):
    """Save Condition to Aidbox."""
    response = requests.post(
        f"{AIDBOX_URL}/fhir/Condition",
        auth=AUTH,
        json=condition,
        headers={"Content-Type": "application/fhir+json"}
    )
    return response.json()

def mark_processed(qr_id):
    """Mark QuestionnaireResponse as processed via tag."""
    requests.patch(
        f"{AIDBOX_URL}/fhir/QuestionnaireResponse/{qr_id}",
        auth=AUTH,
        json={
            "meta": {
                "tag": [{"system": "https://www.senologie.org/fhir", "code": "extracted"}]
            }
        },
        headers={"Content-Type": "application/fhir+json"}
    )

def extract_single(qr_id):
    """Extract single QuestionnaireResponse by ID."""
    response = requests.get(f"{AIDBOX_URL}/fhir/QuestionnaireResponse/{qr_id}", auth=AUTH)
    if response.status_code != 200:
        print(f"QuestionnaireResponse {qr_id} not found")
        return

    qr = response.json()
    condition = extract_condition(qr)

    if condition:
        result = save_condition(condition)
        print(f"Created Condition: {result.get('id')}")
        mark_processed(qr_id)
    else:
        print("No diagnose data found in QuestionnaireResponse")

def extract_all_unprocessed():
    """Extract all unprocessed QuestionnaireResponses."""
    # Find QRs for our questionnaire that haven't been extracted
    response = requests.get(
        f"{AIDBOX_URL}/fhir/QuestionnaireResponse",
        auth=AUTH,
        params={
            "questionnaire": "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose",
            "_tag:not": "extracted",
            "_count": 100
        }
    )

    bundle = response.json()
    entries = bundle.get('entry', [])

    if not entries:
        print("No unprocessed QuestionnaireResponses found")
        return

    print(f"Found {len(entries)} QuestionnaireResponses to extract")

    for entry in entries:
        qr = entry['resource']
        qr_id = qr['id']

        condition = extract_condition(qr)
        if condition:
            result = save_condition(condition)
            print(f"  QR {qr_id} → Condition {result.get('id')}")
            mark_processed(qr_id)
        else:
            print(f"  QR {qr_id} → No diagnose data")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        extract_single(sys.argv[1])
    else:
        extract_all_unprocessed()
