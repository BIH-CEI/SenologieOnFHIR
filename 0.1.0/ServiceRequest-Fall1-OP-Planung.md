# Fall 1: OP-Planung BET + SLNB - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: OP-Planung BET + SLNB**

## Example ServiceRequest: Fall 1: OP-Planung BET + SLNB

Profile: [BIH Senologie OP Planung](StructureDefinition-senologie-op-planung.md)

**Geplante OP-Dauer**: No display for Duration (value: 90; unit: min; system: http://unitsofmeasure.org; code: min)

**CA-Behandlung/Tumorkonferenz-Zustimmung**: Ja

**Präoperative Markierung**: Drahtmarkierung

**status**: Draft

**intent**: Plan

**code**: BET links + Sentinel-LK-Biopsie

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**reasonCode**: Kurative Intention

**bodySite**: Left breast structure

**note**: 

> 

BET links OAQ, SLNB links. Präoperative Drahtmarkierung geplant.




## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "Fall1-OP-Planung",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung"]
  },
  "extension" : [{
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration",
    "valueDuration" : {
      "value" : 90,
      "unit" : "min",
      "system" : "http://unitsofmeasure.org",
      "code" : "min"
    }
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-tumor-conference-consent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373066001",
        "display" : "Yes"
      }],
      "text" : "Ja"
    }
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1269000008",
        "display" : "Insertion of guide wire into breast using mammography guidance"
      }],
      "text" : "Drahtmarkierung"
    }
  }],
  "status" : "draft",
  "intent" : "plan",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "392021009",
      "display" : "Lumpectomy of breast"
    }],
    "text" : "BET links + Sentinel-LK-Biopsie"
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "373808002",
      "display" : "Curative - procedure intent"
    }],
    "text" : "Kurative Intention"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "note" : [{
    "text" : "BET links OAQ, SLNB links. Präoperative Drahtmarkierung geplant."
  }]
}

```
