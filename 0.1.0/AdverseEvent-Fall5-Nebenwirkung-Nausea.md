# Fall 5: Nausea CTCAE Grad 1 unter Docetaxel - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Nausea CTCAE Grad 1 unter Docetaxel**

## Example AdverseEvent: Fall 5: Nausea CTCAE Grad 1 unter Docetaxel

Profile: [BIH Senologie Nebenwirkung](StructureDefinition-senologie-nebenwirkung.md)

**actuality**: Adverse Event

**event**: Nausea Grad 1 unter Docetaxel + Trastuzumab

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**date**: 2025-03-15

**seriousness**: CTCAE Grad 1 — Mild

### SuspectEntities

| | |
| :--- | :--- |
| - | **Instance** |
| * | [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall5-Systemtherapie-Neoadjuvant.md) |



## Resource Content

```json
{
  "resourceType" : "AdverseEvent",
  "id" : "Fall5-Nebenwirkung-Nausea",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-nebenwirkung"]
  },
  "actuality" : "actual",
  "event" : {
    "coding" : [{
      "system" : "https://www.meddra.org",
      "version" : "Version 4",
      "code" : "10028813",
      "display" : "Nausea"
    }],
    "text" : "Nausea Grad 1 unter Docetaxel + Trastuzumab"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "date" : "2025-03-15",
  "seriousness" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-nebenwirkung-ctcae-grad",
      "code" : "1",
      "display" : "Mild"
    }],
    "text" : "CTCAE Grad 1 — Mild"
  },
  "suspectEntity" : [{
    "instance" : {
      "reference" : "Procedure/Fall5-Systemtherapie-Neoadjuvant"
    }
  }]
}

```
