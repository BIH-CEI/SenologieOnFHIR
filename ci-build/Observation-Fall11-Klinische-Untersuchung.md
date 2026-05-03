# Fall 11: Klinische Brustuntersuchung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Klinische Brustuntersuchung**

## Example Observation: Fall 11: Klinische Brustuntersuchung

Profile: [BIH Senologie Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md)

**status**: Final

**code**: Physical findings of Breast

**subject**: [Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)](Patient-Fall11-Patient-Hannah-Klein.md)

**effective**: 2025-09-01

**bodySite**: Left breast structure

> **component****code**: Finding by palpation**value**: Tastbarer Knoten links oben außen, ca. 15 mm, glatt begrenzt, verschieblich, nicht druckschmerzhaft

> **component****code**: Breast symptom of change in skin**value**: Keine Hautveränderungen

> **component****code**: Nipple finding**value**: Mamille unauffällig, keine Sekretion

> **component****code**: Finding of lymph node of axillary region**value**: Axilläre Lymphknoten beidseits unauffällig



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall11-Klinische-Untersuchung",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "32422-8",
      "display" : "Physical findings of Breast"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-01",
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "118242002",
        "display" : "Finding by palpation"
      }]
    },
    "valueString" : "Tastbarer Knoten links oben außen, ca. 15 mm, glatt begrenzt, verschieblich, nicht druckschmerzhaft"
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "115951000119105",
        "display" : "Breast symptom of change in skin"
      }]
    },
    "valueString" : "Keine Hautveränderungen"
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "248819006",
        "display" : "Nipple finding"
      }]
    },
    "valueString" : "Mamille unauffällig, keine Sekretion"
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "301782006",
        "display" : "Finding of lymph node of axillary region"
      }]
    },
    "valueString" : "Axilläre Lymphknoten beidseits unauffällig"
  }]
}

```
