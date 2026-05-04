# Fall 5: Tumorboard — Postoperativ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Tumorboard — Postoperativ**

## Example CarePlan: Fall 5: Tumorboard — Postoperativ

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Monika Braun — Postoperativ

**description**: Postoperativ ypT1a ypN0(sn)(0/3) R0, gutes Ansprechen. Bestätigung: Trastuzumab Erhaltung fortsetzen, adjuvante RT, Letrozol starten.

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**period**: 2025-07-20 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Trastuzumab Erhaltung fortsetzen bis 1 Jahr Gesamtdauer | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Letrozol 2,5 mg/d starten | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall5-Tumorboard-Postoperativ",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Monika Braun — Postoperativ",
  "description" : "Postoperativ ypT1a ypN0(sn)(0/3) R0, gutes Ansprechen. Bestätigung: Trastuzumab Erhaltung fortsetzen, adjuvante RT, Letrozol starten.",
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "period" : {
    "start" : "2025-07-20"
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
          "code" : "416608005",
          "display" : "Drug therapy"
        }],
        "text" : "Trastuzumab Erhaltung fortsetzen bis 1 Jahr Gesamtdauer"
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
        "text" : "Letrozol 2,5 mg/d starten"
      },
      "status" : "scheduled"
    }
  }]
}

```
