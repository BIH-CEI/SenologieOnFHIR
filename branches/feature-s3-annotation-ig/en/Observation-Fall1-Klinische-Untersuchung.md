# Fall 1: Klinische Brustuntersuchung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Klinische Brustuntersuchung**

## Example Observation: Fall 1: Klinische Brustuntersuchung

-------

**English**

-------

Profile: [BIH Senologie Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md)

**status**: Final

**code**: Physical findings of Breast

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-15

**bodySite**: Left breast structure

> **component****code**: Finding by palpation**value**: Tastbarer Knoten OAQ links, ca. 2 cm, derb, verschieblich

> **component****code**: Breast symptom of change in skin**value**: Keine Hautveränderungen

> **component****code**: Nipple finding**value**: Mamille unauffällig, keine Sekretion

> **component****code**: Examination of axillary lymph nodes**value**: Axilläre Lymphknoten beidseits klinisch unauffällig



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Klinische-Untersuchung",
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-15",
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
    "valueString" : "Tastbarer Knoten OAQ links, ca. 2 cm, derb, verschieblich"
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
        "code" : "284429001",
        "display" : "Examination of axillary lymph nodes"
      }]
    },
    "valueString" : "Axilläre Lymphknoten beidseits klinisch unauffällig"
  }]
}

```
