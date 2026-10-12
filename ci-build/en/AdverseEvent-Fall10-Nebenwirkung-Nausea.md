# Fall 10: Nausea CTCAE Grad 2 unter Carboplatin + Paclitaxel - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Nausea CTCAE Grad 2 unter Carboplatin + Paclitaxel**

## Example AdverseEvent: Fall 10: Nausea CTCAE Grad 2 unter Carboplatin + Paclitaxel

-------

**English**

-------

Profile: [BIH Senologie Nebenwirkung](StructureDefinition-senologie-nebenwirkung.md)

**actuality**: Adverse Event

**event**: Nausea Grad 2 unter Carboplatin + Paclitaxel

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**date**: 2025-08-14

**seriousness**: CTCAE Grad 2 — Moderat

### SuspectEntities

| | |
| :--- | :--- |
| - | **Instance** |
| * | [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall10-Systemtherapie-Adjuvant.md) |



## Resource Content

```json
{
  "resourceType" : "AdverseEvent",
  "id" : "Fall10-Nebenwirkung-Nausea",
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
    "text" : "Nausea Grad 2 unter Carboplatin + Paclitaxel"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "date" : "2025-08-14",
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
      "reference" : "Procedure/Fall10-Systemtherapie-Adjuvant"
    }
  }]
}

```
