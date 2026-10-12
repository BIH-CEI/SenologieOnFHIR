# Fall 14: Prätherapeutisches Tumorboard 2025-02-12 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Prätherapeutisches Tumorboard 2025-02-12**

## Example CarePlan: Fall 14: Prätherapeutisches Tumorboard 2025-02-12

-------

**English**

-------

Profile: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**category**: prätherapeutische Tumorkonferenz

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**created**: 2025-02-12

> **activity**

### Details

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Status** |
| * | Synthetische Empfehlung (Quelle: OncoBox-Beispiel) | Scheduled |




## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "Fall14-Tumorboard-Praetherapeutisch",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
      "code" : "praeth",
      "display" : "prätherapeutische Tumorkonferenz"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "created" : "2025-02-12",
  "activity" : [{
    "detail" : {
      "code" : {
        "text" : "Synthetische Empfehlung (Quelle: OncoBox-Beispiel)"
      },
      "status" : "scheduled"
    }
  }]
}

```
