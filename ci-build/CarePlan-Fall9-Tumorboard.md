# Fall 9: Tumorboard-Empfehlung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Tumorboard-Empfehlung**

## Example CarePlan: Fall 9: Tumorboard-Empfehlung

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Andrea Wolf

**description**: Empfehlung: Adjuvante Chemotherapie (EC x4 → Paclitaxel wöchentlich x12) aufgrund N3a-Befall, BET links + Axilladissektion Level I-III, adjuvante Strahlentherapie inkl. Lymphabfluss, endokrine Therapie Tamoxifen (prämenopausal).

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**period**: 2025-04-15 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Adjuvant: EC q3w x4 → Paclitaxel wöchentlich x12 | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | BET links + Axilladissektion Level I-III | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Bestrahlung Restbrust 50 Gy + Boost 10 Gy + Lymphabflusswege | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Tamoxifen (prämenopausal), nach 2 J. Umstellung auf AI + GnRH | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall9-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Andrea Wolf",
  "description" : "Empfehlung: Adjuvante Chemotherapie (EC x4 → Paclitaxel wöchentlich x12) aufgrund N3a-Befall, BET links + Axilladissektion Level I-III, adjuvante Strahlentherapie inkl. Lymphabfluss, endokrine Therapie Tamoxifen (prämenopausal).",
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "period" : {
    "start" : "2025-04-15"
  },
  "addresses" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
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
        "text" : "Adjuvant: EC q3w x4 → Paclitaxel wöchentlich x12"
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
        "text" : "BET links + Axilladissektion Level I-III"
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
        "text" : "Adjuvante Bestrahlung Restbrust 50 Gy + Boost 10 Gy + Lymphabflusswege"
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
        "text" : "Tamoxifen (prämenopausal), nach 2 J. Umstellung auf AI + GnRH"
      },
      "status" : "scheduled"
    }
  }]
}

```
