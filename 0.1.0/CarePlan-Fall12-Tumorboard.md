# Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen**

## Example CarePlan: Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**title**: Tumorboard-Empfehlung Renate Vogel — ADH B3

**description**: B3-Läsion (ADH) in Vakuumbiopsie. Nachresektion (offene Biopsie) empfohlen zum Ausschluss eines DCIS oder invasiven Karzinoms. Bei reiner ADH nach Nachresektion: keine weitere Therapie, engmaschige Nachsorge.

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**period**: 2025-07-22 --> (ongoing)

**addresses**: [Condition Neoplasm of uncertain behavior of breast](Condition-Fall12-Diagnose-ADH.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Offene Biopsie / Nachresektion links OIQ | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | Appointment | Engmaschige Nachsorge: Mammographie + Sono alle 6 Monate für 2 Jahre | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall12-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "title" : "Tumorboard-Empfehlung Renate Vogel — ADH B3",
  "description" : "B3-Läsion (ADH) in Vakuumbiopsie. Nachresektion (offene Biopsie) empfohlen zum Ausschluss eines DCIS oder invasiven Karzinoms. Bei reiner ADH nach Nachresektion: keine weitere Therapie, engmaschige Nachsorge.",
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "period" : {
    "start" : "2025-07-22"
  },
  "addresses" : [{
    "reference" : "Condition/Fall12-Diagnose-ADH"
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
        "text" : "Offene Biopsie / Nachresektion links OIQ"
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
        "text" : "Engmaschige Nachsorge: Mammographie + Sono alle 6 Monate für 2 Jahre"
      },
      "status" : "scheduled"
    }
  }]
}

```
