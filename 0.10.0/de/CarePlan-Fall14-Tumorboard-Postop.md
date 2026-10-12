# Fall 14: Postoperatives Tumorboard 2025-02-23 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Postoperatives Tumorboard 2025-02-23**

##  CarePlan: Fall 14: Postoperatives Tumorboard 2025-02-23

-------

**German**

-------

Profil: [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

**status**: Active

**intent**: Plan

**category**: postoperative Tumorkonferenz

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**created**: 2025-02-23

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
  "id" : "Fall14-Tumorboard-Postop",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
  },
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
      "code" : "postop",
      "display" : "postoperative Tumorkonferenz"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "created" : "2025-02-23",
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
