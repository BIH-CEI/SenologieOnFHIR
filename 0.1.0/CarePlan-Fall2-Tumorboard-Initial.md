# Fall 2: Initiales Tumorboard - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Initiales Tumorboard**

## Example CarePlan: Fall 2: Initiales Tumorboard

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Lena Hoffmann — Erstvorstellung

**description**: Empfehlung: Neoadjuvante Chemotherapie (Carboplatin/Paclitaxel) + Pembrolizumab (KEYNOTE-522), dann modifiziert radikale Mastektomie rechts + Axilladissektion, adjuvante Thoraxwandbestrahlung + supraklavikulär, Pembrolizumab Maintenance, MTB-Überweisung für Genompanel.

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**period**: 2025-02-20 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Neoadjuvant: Carboplatin/Paclitaxel wöchentlich x12, dann AC q3w x4 | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Pembrolizumab 200 mg q3w (KEYNOTE-522 Schema) | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Modifiziert radikale Mastektomie rechts + Axilladissektion Level I-III | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Einschluss KEYNOTE-522 | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall2-Tumorboard-Initial",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Lena Hoffmann — Erstvorstellung",
  "description" : "Empfehlung: Neoadjuvante Chemotherapie (Carboplatin/Paclitaxel) + Pembrolizumab (KEYNOTE-522), dann modifiziert radikale Mastektomie rechts + Axilladissektion, adjuvante Thoraxwandbestrahlung + supraklavikulär, Pembrolizumab Maintenance, MTB-Überweisung für Genompanel.",
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "period" : {
    "start" : "2025-02-20"
  },
  "addresses" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "activity" : [{
    "detail" : {
      "kind" : "MedicationRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "385786002",
          "display" : "Chemotherapy care (regime/therapy)"
        }],
        "text" : "Neoadjuvant: Carboplatin/Paclitaxel wöchentlich x12, dann AC q3w x4"
      },
      "status" : "scheduled"
    }
  },
  {
    "detail" : {
      "kind" : "MedicationRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "76334006",
          "display" : "Immunotherapy (procedure)"
        }],
        "text" : "Pembrolizumab 200 mg q3w (KEYNOTE-522 Schema)"
      },
      "status" : "scheduled"
    }
  },
  {
    "detail" : {
      "kind" : "ServiceRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "387713003",
          "display" : "Surgical procedure (procedure)"
        }],
        "text" : "Modifiziert radikale Mastektomie rechts + Axilladissektion Level I-III"
      },
      "status" : "scheduled"
    }
  },
  {
    "detail" : {
      "kind" : "ServiceRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "108290001",
          "display" : "Radiation oncology AND/OR radiotherapy (procedure)"
        }],
        "text" : "Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy"
      },
      "status" : "scheduled"
    }
  },
  {
    "detail" : {
      "kind" : "ServiceRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "110465008",
          "display" : "Clinical trial (procedure)"
        }],
        "text" : "Einschluss KEYNOTE-522"
      },
      "status" : "scheduled"
    }
  }]
}

```
