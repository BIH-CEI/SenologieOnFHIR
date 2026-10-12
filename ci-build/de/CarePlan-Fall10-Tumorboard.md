# Fall 10: Tumorboard-Empfehlung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Tumorboard-Empfehlung**

##  CarePlan: Fall 10: Tumorboard-Empfehlung

-------

**German**

-------

Profil: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**category**: prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)

**title**: Tumorboard-Empfehlung Christina Becker

**description**: Triple-negatives Mammakarzinom rechts, cT1c cN0 cM0, G3, PALB2-Keimbahnmutation. Empfehlung: Mastektomie rechts mit Sentinel-LK-Biopsie, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten; adjuvante Chemotherapie Carboplatin + Paclitaxel. Keine endokrine Therapie (hormonrezeptor-negativ).

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**period**: 2025-06-03 --> (ongoing)

**addresses**: [Condition Invasives Mammakarzinom NST rechts, triple-negativ, PALB2-Keimbahnmutation](Condition-Fall10-Diagnose-Mammakarzinom.md)

> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | ServiceRequest | Mastektomie rechts + SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten | Scheduled |


> **activity**

### Details

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** |
| * | MedicationRequest | Adjuvant Carboplatin + Paclitaxel, 6 Zyklen | Scheduled |


> **activity**

### Details

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** | **StatusReason** |
| * | ServiceRequest | Keine Strahlentherapie (Mastektomie geplant, cT1c cN0: keine Indikation) | Not Started | Nicht empfohlen |


> **activity**

### Details

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| - | **Kind** | **Code** | **Status** | **StatusReason** | **DoNotPerform** |
| * | MedicationRequest | Keine endokrine Therapie (hormonrezeptor-negativ) | Not Started | Nicht empfohlen | true |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall10-Tumorboard",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
      "code" : "praeth",
      "display" : "prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)"
    }]
  }],
  "title" : "Tumorboard-Empfehlung Christina Becker",
  "description" : "Triple-negatives Mammakarzinom rechts, cT1c cN0 cM0, G3, PALB2-Keimbahnmutation. Empfehlung: Mastektomie rechts mit Sentinel-LK-Biopsie, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten; adjuvante Chemotherapie Carboplatin + Paclitaxel. Keine endokrine Therapie (hormonrezeptor-negativ).",
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "period" : {
    "start" : "2025-06-03"
  },
  "addresses" : [{
    "reference" : "Condition/Fall10-Diagnose-Mammakarzinom"
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
        "text" : "Mastektomie rechts + SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten"
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
        "text" : "Adjuvant Carboplatin + Paclitaxel, 6 Zyklen"
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
          "code" : "1287742003",
          "display" : "Radiotherapy (procedure)"
        }],
        "text" : "Keine Strahlentherapie (Mastektomie geplant, cT1c cN0: keine Indikation)"
      },
      "status" : "not-started",
      "statusReason" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "nicht-empfohlen",
          "display" : "Nicht empfohlen"
        }]
      }
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
        "text" : "Keine endokrine Therapie (hormonrezeptor-negativ)"
      },
      "status" : "not-started",
      "statusReason" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "nicht-empfohlen",
          "display" : "Nicht empfohlen"
        }]
      },
      "doNotPerform" : true
    }
  }]
}

```
