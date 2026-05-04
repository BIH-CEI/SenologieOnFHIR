# Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I**

## Example Observation: Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I

Profile: [BIH Senologie Operative Komplikation](StructureDefinition-senologie-operative-komplikation.md)

**status**: Final

**code**: Clavien-Dindo classification grade

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**focus**: [Procedure (Modifizierte radikale) Mastektomie](Procedure-Fall2-Operation-Mastektomie.md)

**effective**: 2025-08-10

**value**: Clavien-Dindo Grad I

**note**: 

> 

Serom axillär rechts, konservative Behandlung mit Punktion, kein operativer Eingriff erforderlich


**method**: postoperativ, stationär

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Complication of procedure | Serom |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-Komplikation-Serom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "789279006",
      "display" : "Clavien-Dindo classification grade"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "focus" : [{
    "reference" : "Procedure/Fall2-Operation-Mastektomie"
  }],
  "effectiveDateTime" : "2025-08-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1367519000",
      "display" : "Clavien-Dindo classification grade I"
    }],
    "text" : "Clavien-Dindo Grad I"
  },
  "note" : [{
    "text" : "Serom axillär rechts, konservative Behandlung mit Punktion, kein operativer Eingriff erforderlich"
  }],
  "method" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "416800000",
      "display" : "Inpatient"
    }],
    "text" : "postoperativ, stationär"
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "116224001",
        "display" : "Complication of procedure"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "285345009",
        "display" : "Seroma"
      }],
      "text" : "Serom"
    }
  }]
}

```
