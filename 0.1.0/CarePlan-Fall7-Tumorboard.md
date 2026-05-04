# Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen**

## Example CarePlan: Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Kathrin Mueller

**description**: Empfehlung: Neoadjuvante Chemotherapie Carboplatin/Paclitaxel wöchentlich x12, dann EC q3w x4. Dann BET rechts + SLNB. Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy. Keine endokrine Therapie (triple-negativ).

**subject**: [Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)](Patient-Fall7-Patient-Kathrin-Mueller.md)

**period**: 2025-03-14 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall7-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Neoadjuvant: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4 | Scheduled |


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
| * | ServiceRequest | Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy | Scheduled |


> **activity**

### Details

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** | **DoNotPerform** |
| * | MedicationRequest | Keine endokrine Therapie (triple-negativ) | Not Started | true |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall7-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Kathrin Mueller",
  "description" : "Empfehlung: Neoadjuvante Chemotherapie Carboplatin/Paclitaxel wöchentlich x12, dann EC q3w x4. Dann BET rechts + SLNB. Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy. Keine endokrine Therapie (triple-negativ).",
  "subject" : {
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "period" : {
    "start" : "2025-03-14"
  },
  "addresses" : [{
    "reference" : "Condition/Fall7-Diagnose-Mammakarzinom"
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
        "text" : "Neoadjuvant: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4"
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
      "kind" : "ServiceRequest",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "108290001",
          "display" : "Radiation oncology AND/OR radiotherapy (procedure)"
        }],
        "text" : "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy"
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
        "text" : "Keine endokrine Therapie (triple-negativ)"
      },
      "status" : "not-started",
      "doNotPerform" : true
    }
  }]
}

```
