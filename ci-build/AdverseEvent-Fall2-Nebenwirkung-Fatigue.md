# Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie**

## Example AdverseEvent: Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie

Profile: [BIH Senologie Nebenwirkung](StructureDefinition-senologie-nebenwirkung.md)

**actuality**: Adverse Event

**event**: Fatigue Grad 2 unter EC-Chemotherapie

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**date**: 2025-02-10

**seriousness**: CTCAE Grad 2 — Moderat

### SuspectEntities

| | |
| :--- | :--- |
| - | **Instance** |
| * | [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall2-Systemtherapie-Neoadjuvant.md) |



## Resource Content

```json
{
  "resourceType" : "AdverseEvent",
  "id" : "Fall2-Nebenwirkung-Fatigue",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-nebenwirkung"]
  },
  "actuality" : "actual",
  "event" : {
    "coding" : [{
      "system" : "https://www.meddra.org",
      "version" : "Version 4",
      "code" : "10016256",
      "display" : "Fatigue"
    }],
    "text" : "Fatigue Grad 2 unter EC-Chemotherapie"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "date" : "2025-02-10",
  "seriousness" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-nebenwirkung-ctcae-grad",
      "code" : "2",
      "display" : "Moderat"
    }],
    "text" : "CTCAE Grad 2 — Moderat"
  },
  "suspectEntity" : [{
    "instance" : {
      "reference" : "Procedure/Fall2-Systemtherapie-Neoadjuvant"
    }
  }]
}

```
