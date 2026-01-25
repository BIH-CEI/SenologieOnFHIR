#!/usr/bin/env python3
"""
Webhook handler for automatic SDC extraction.

Receives notifications from Aidbox when QuestionnaireResponse is completed,
then triggers $extract operation.

Usage:
    python extraction-webhook.py

Runs on port 8080 by default.
"""

from flask import Flask, request, jsonify
import requests
from requests.auth import HTTPBasicAuth
import os

app = Flask(__name__)

AIDBOX_URL = os.getenv("AIDBOX_URL", "http://localhost:8888")
AIDBOX_USER = os.getenv("AIDBOX_USER", "root")
AIDBOX_PASSWORD = os.getenv("AIDBOX_PASSWORD", "secret")

AUTH = HTTPBasicAuth(AIDBOX_USER, AIDBOX_PASSWORD)

@app.route("/webhook/extract", methods=["POST"])
def handle_extraction():
    """Handle incoming webhook from Aidbox subscription."""

    payload = request.json
    print(f"Received webhook: {payload}")

    # Handle batched events
    events = payload if isinstance(payload, list) else [payload]

    results = []
    for event in events:
        # Extract QuestionnaireResponse ID from event
        qr_id = None

        # Aidbox sends the resource in the event
        if "resource" in event:
            qr_id = event["resource"].get("id")
        elif "focus" in event:
            # Or as a reference
            ref = event["focus"].get("reference", "")
            if ref.startswith("QuestionnaireResponse/"):
                qr_id = ref.split("/")[1]

        if not qr_id:
            results.append({"error": "No QuestionnaireResponse ID found"})
            continue

        # Call $extract operation
        extract_result = call_extract(qr_id)
        results.append(extract_result)

    return jsonify({"processed": len(results), "results": results})


def call_extract(qr_id: str) -> dict:
    """Call Aidbox $extract operation for a QuestionnaireResponse."""

    try:
        # Try Aidbox's native $extract
        response = requests.post(
            f"{AIDBOX_URL}/fhir/QuestionnaireResponse/{qr_id}/$extract",
            auth=AUTH,
            headers={"Content-Type": "application/fhir+json"}
        )

        if response.status_code == 200:
            result = response.json()
            return {
                "qr_id": qr_id,
                "status": "extracted",
                "result": result
            }
        else:
            # Fallback: manual extraction
            return manual_extract(qr_id)

    except Exception as e:
        return {"qr_id": qr_id, "status": "error", "error": str(e)}


def manual_extract(qr_id: str) -> dict:
    """Manual extraction fallback if $extract not available."""

    # Get QuestionnaireResponse
    response = requests.get(
        f"{AIDBOX_URL}/fhir/QuestionnaireResponse/{qr_id}",
        auth=AUTH
    )

    if response.status_code != 200:
        return {"qr_id": qr_id, "status": "error", "error": "QR not found"}

    qr = response.json()

    # Get the Questionnaire to find the template
    questionnaire_ref = qr.get("questionnaire")
    if not questionnaire_ref:
        return {"qr_id": qr_id, "status": "error", "error": "No questionnaire reference"}

    # Simple extraction based on our Python script logic
    from extract_questionnaire import extract_condition, save_condition, mark_processed

    condition = extract_condition(qr)
    if condition:
        result = save_condition(condition)
        mark_processed(qr_id)
        return {
            "qr_id": qr_id,
            "status": "extracted",
            "condition_id": result.get("id")
        }

    return {"qr_id": qr_id, "status": "no_data"}


@app.route("/health", methods=["GET"])
def health():
    """Health check endpoint."""
    return jsonify({"status": "ok"})


if __name__ == "__main__":
    port = int(os.getenv("PORT", 8080))
    print(f"Starting extraction webhook handler on port {port}")
    app.run(host="0.0.0.0", port=port)
