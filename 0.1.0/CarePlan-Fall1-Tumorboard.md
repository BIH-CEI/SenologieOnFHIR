# Fall 1: Tumorboard-Empfehlung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Tumorboard-Empfehlung**

## Example CarePlan: Fall 1: Tumorboard-Empfehlung

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Erika Neumann

**description**: Empfehlung: Brusterhaltende Therapie mit Sentinel-LK-Biopsie, adjuvante Strahlentherapie, endokrine Therapie (Aromatasehemmer). Keine Chemotherapie aufgrund Oncotype DX RS 18.

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**period**: 2025-01-28 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall1-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | BET links + Sentinel-LK-Biopsie | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 10 Gy | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Aromatasehemmer (Letrozol) für 5-10 Jahre | Scheduled |


> **activity**

### Details

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** | **DoNotPerform** |
| * | MedicationRequest | Keine Chemotherapie empfohlen | Not Started | true |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall1-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Erika Neumann",
  "description" : "Empfehlung: Brusterhaltende Therapie mit Sentinel-LK-Biopsie, adjuvante Strahlentherapie, endokrine Therapie (Aromatasehemmer). Keine Chemotherapie aufgrund Oncotype DX RS 18.",
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "period" : {
    "start" : "2025-01-28"
  },
  "addresses" : [{
    "reference" : "Condition/Fall1-Diagnose-Mammakarzinom"
  }],
  "activity" : [{
    "detail" : {
      "kind" : "ServiceRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "387713003",
          "display" : "Surgical procedure (procedure)"
        }],
        "text" : "BET links + Sentinel-LK-Biopsie"
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
        "text" : "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 10 Gy"
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
          "code" : "169413002",
          "display" : "Hormone therapy (procedure)"
        }],
        "text" : "Aromatasehemmer (Letrozol) für 5-10 Jahre"
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
          "code" : "385786002",
          "display" : "Chemotherapy care (regime/therapy)"
        }],
        "text" : "Keine Chemotherapie empfohlen"
      },
      "status" : "not-started",
      "doNotPerform" : true
    }
  }]
}

```
