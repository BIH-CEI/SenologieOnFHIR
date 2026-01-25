#!/bin/bash
# Setup Aidbox Subscription for auto-extraction

AIDBOX_URL="${AIDBOX_URL:-http://localhost:8888}"
AUTH="root:secret"

echo "Setting up AidboxSubscriptionTopic..."
curl -s -X PUT "$AIDBOX_URL/fhir/AidboxSubscriptionTopic/questionnaireresponse-completed" \
  -u "$AUTH" \
  -H "Content-Type: application/fhir+json" \
  -d @input/resources/AidboxSubscriptionTopic-qr-completed.json | jq '{resourceType, id, status}'

echo ""
echo "Setting up AidboxTopicDestination (webhook)..."
curl -s -X PUT "$AIDBOX_URL/fhir/AidboxTopicDestination/extract-webhook" \
  -u "$AUTH" \
  -H "Content-Type: application/fhir+json" \
  -d @input/resources/AidboxTopicDestination-extract-webhook.json | jq '{resourceType, id, kind}'

echo ""
echo "Subscription setup complete!"
echo ""
echo "Flow:"
echo "  1. QuestionnaireResponse saved with status=completed"
echo "  2. AidboxSubscriptionTopic triggers"
echo "  3. Webhook calls extraction-webhook:8080/webhook/extract"
echo "  4. Extraction creates/updates Condition resource"
