# Fall 5: Tumorboard — Neoadjuvante Therapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Tumorboard — Neoadjuvante Therapie**

## Example CarePlan: Fall 5: Tumorboard — Neoadjuvante Therapie

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Monika Braun — Erstvorstellung

**description**: Empfehlung: Neoadjuvante Chemotherapie EC x4, dann Docetaxel + Trastuzumab x4. Anschließend BET rechts + SLNB. Adjuvant: Trastuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung, Letrozol.

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**period**: 2025-01-30 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Neoadjuvant: EC x4, dann Docetaxel + Trastuzumab x4 | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | BET rechts + Sentinel-LK-Biopsie | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Trastuzumab Erhaltung 1 Jahr | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Ganzbrustbestrahlung | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Letrozol für 5 Jahre | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall5-Tumorboard-Neoadjuvant",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Monika Braun — Erstvorstellung",
  "description" : "Empfehlung: Neoadjuvante Chemotherapie EC x4, dann Docetaxel + Trastuzumab x4. Anschließend BET rechts + SLNB. Adjuvant: Trastuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung, Letrozol.",
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "period" : {
    "start" : "2025-01-30"
  },
  "addresses" : [{
    "reference" : "Condition/Fall5-Diagnose-Mammakarzinom"
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
        "text" : "Neoadjuvant: EC x4, dann Docetaxel + Trastuzumab x4"
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
        "text" : "BET rechts + Sentinel-LK-Biopsie"
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
          "code" : "416608005",
          "display" : "Drug therapy"
        }],
        "text" : "Trastuzumab Erhaltung 1 Jahr"
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
        "text" : "Adjuvante Ganzbrustbestrahlung"
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
        "text" : "Letrozol für 5 Jahre"
      },
      "status" : "scheduled"
    }
  }]
}

```
