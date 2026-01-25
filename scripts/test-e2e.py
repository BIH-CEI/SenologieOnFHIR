#!/usr/bin/env python3
"""
E2E Test: Senologie Diagnose Pipeline

Tests the complete flow:
1. Profile exists in Aidbox
2. Conditions can be created/queried
3. SQL queries work
4. Questionnaire exists
"""

import requests
from requests.auth import HTTPBasicAuth
import sys

AIDBOX_URL = "http://localhost:8888"
AUTH = HTTPBasicAuth("root", "secret")

def test_health():
    """Test Aidbox is running"""
    r = requests.get(f"{AIDBOX_URL}/health")
    assert r.status_code == 200
    assert r.json()["status"] == "pass"
    print("✓ Aidbox health check passed")

def test_conditions_exist():
    """Test Conditions are loaded"""
    r = requests.get(
        f"{AIDBOX_URL}/fhir/Condition",
        auth=AUTH
    )
    assert r.status_code == 200
    bundle = r.json()
    count = len(bundle.get("entry", []))
    assert count >= 3, f"Expected at least 3 conditions, got {count}"
    print(f"✓ Found {count} Conditions")

def test_questionnaire_exists():
    """Test Questionnaire is loaded"""
    r = requests.get(
        f"{AIDBOX_URL}/fhir/Questionnaire/Questionnaire-Senologie-Diagnose",
        auth=AUTH
    )
    assert r.status_code == 200
    q = r.json()
    assert q["status"] == "draft"
    item_count = len(q.get("item", [{}])[0].get("item", []))
    print(f"✓ Questionnaire exists with {item_count} items")

def test_sql_query():
    """Test SQL query works"""
    sql = """
    SELECT id, resource#>>'{code,coding,0,display}' as diagnosis
    FROM condition
    """
    r = requests.post(
        f"{AIDBOX_URL}/$sql",
        auth=AUTH,
        json=[sql]
    )
    assert r.status_code == 200
    results = r.json()
    assert len(results) >= 3
    print(f"✓ SQL query returned {len(results)} rows")
    for row in results:
        print(f"    - {row['id']}: {row['diagnosis']}")

def test_create_condition():
    """Test creating a new Condition"""
    condition = {
        "resourceType": "Condition",
        "id": "test-condition",
        "clinicalStatus": {
            "coding": [{"system": "http://terminology.hl7.org/CodeSystem/condition-clinical", "code": "active"}]
        },
        "code": {
            "coding": [{"system": "http://snomed.info/sct", "code": "254837009", "display": "Malignant neoplasm of breast"}]
        },
        "subject": {"reference": "Patient/example-patient"},
        "recordedDate": "2024-01-01"
    }

    r = requests.put(
        f"{AIDBOX_URL}/fhir/Condition/test-condition",
        auth=AUTH,
        json=condition,
        headers={"Content-Type": "application/fhir+json"}
    )
    assert r.status_code in [200, 201], f"Failed to create: {r.text}"
    print("✓ Created test Condition")

    # Clean up
    requests.delete(f"{AIDBOX_URL}/fhir/Condition/test-condition", auth=AUTH)
    print("✓ Deleted test Condition")

def main():
    print("=" * 50)
    print("Senologie E2E Test Suite")
    print("=" * 50)

    tests = [
        test_health,
        test_conditions_exist,
        test_questionnaire_exists,
        test_sql_query,
        test_create_condition,
    ]

    passed = 0
    failed = 0

    for test in tests:
        try:
            test()
            passed += 1
        except Exception as e:
            print(f"✗ {test.__name__}: {e}")
            failed += 1

    print("=" * 50)
    print(f"Results: {passed} passed, {failed} failed")
    print("=" * 50)

    return 0 if failed == 0 else 1

if __name__ == "__main__":
    sys.exit(main())
