# Fall 2: Tumorboard bei Progression - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Tumorboard bei Progression**

## Example CarePlan: Fall 2: Tumorboard bei Progression

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Lena Hoffmann — Progression

**description**: Hepatische Metastasen nach 18 Monaten. Empfehlung: Umstellung auf palliatives Therapiekonzept. Sacituzumab govitecan als Zweitlinientherapie. Best Supportive Care.

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**period**: 2026-08-15 --> (ongoing)

**addresses**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Sacituzumab govitecan (Trodelvy) 10 mg/kg d1,8 q3w | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | Appointment | Anbindung Palliativmedizin, psychoonkologische Betreuung | Scheduled |


**note**: 

> 

Palliativkonzept empfohlen. PD-L1-Retest empfohlen.




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall2-Tumorboard-Progression",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Lena Hoffmann — Progression",
  "description" : "Hepatische Metastasen nach 18 Monaten. Empfehlung: Umstellung auf palliatives Therapiekonzept. Sacituzumab govitecan als Zweitlinientherapie. Best Supportive Care.",
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "period" : {
    "start" : "2026-08-15"
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
        "text" : "Sacituzumab govitecan (Trodelvy) 10 mg/kg d1,8 q3w"
      },
      "status" : "scheduled"
    }
  },
  {
    "detail" : {
      "kind" : "Appointment",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "390906007",
          "display" : "Follow-up encounter (procedure)"
        }],
        "text" : "Anbindung Palliativmedizin, psychoonkologische Betreuung"
      },
      "status" : "scheduled"
    }
  }],
  "note" : [{
    "text" : "Palliativkonzept empfohlen. PD-L1-Retest empfohlen."
  }]
}

```
