# Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen**

## Example CarePlan: Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Julia Fischer

**description**: Empfehlung: Neoadjuvante Chemotherapie TCHP (Docetaxel, Carboplatin, Trastuzumab, Pertuzumab) x6 Zyklen. Dann BET + SLNB. Adjuvant: Trastuzumab/Pertuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung.

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**period**: 2025-02-28 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall4-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Neoadjuvant: TCHP (Docetaxel/Carboplatin/Trastuzumab/Pertuzumab) x6 | Scheduled |


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
| * | MedicationRequest | Trastuzumab + Pertuzumab Erhaltung 1 Jahr | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Adjuvante Ganzbrustbestrahlung | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall4-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Julia Fischer",
  "description" : "Empfehlung: Neoadjuvante Chemotherapie TCHP (Docetaxel, Carboplatin, Trastuzumab, Pertuzumab) x6 Zyklen. Dann BET + SLNB. Adjuvant: Trastuzumab/Pertuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung.",
  "subject" : {
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "period" : {
    "start" : "2025-02-28"
  },
  "addresses" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
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
        "text" : "Neoadjuvant: TCHP (Docetaxel/Carboplatin/Trastuzumab/Pertuzumab) x6"
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
        "text" : "BET links + Sentinel-LK-Biopsie"
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
        "text" : "Trastuzumab + Pertuzumab Erhaltung 1 Jahr"
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
  }]
}

```
