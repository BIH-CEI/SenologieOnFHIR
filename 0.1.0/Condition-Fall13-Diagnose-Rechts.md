# Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3**

## Example Condition: Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-03-10

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Invasives Mammakarzinom NST rechts, oberer innerer Quadrant

**bodySite**: Right breast structure

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**onset**: 2025-03-10

**recordedDate**: 2025-03-10

> **stage****summary**: pT2 pN1a cM0 — UICC IIB**type**: Tumor staging

> **stage****summary**: cM0**type**: Clinical stage (observable entity)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall13-Diagnose-Rechts",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-03-10"
  }],
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung",
      "code" : "7",
      "display" : "histologische Untersuchung eines Primärtumors"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "C50.2",
      "display" : "Bösartige Neubildung: Oberer innerer Quadrant der Brustdrüse"
    }],
    "text" : "Invasives Mammakarzinom NST rechts, oberer innerer Quadrant"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "onsetDateTime" : "2025-03-10",
  "recordedDate" : "2025-03-10",
  "stage" : [{
    "summary" : {
      "text" : "pT2 pN1a cM0 — UICC IIB"
    },
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254292007",
        "display" : "Tumor staging"
      }]
    }
  },
  {
    "summary" : {
      "text" : "cM0"
    },
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "385349001",
        "display" : "Clinical stage (observable entity)"
      }]
    }
  }]
}

```
