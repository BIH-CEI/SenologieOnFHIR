# Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0**

## Example Condition: Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-01-15

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Invasives Mammakarzinom NST links, oberer äußerer Quadrant

**bodySite**: Left breast structure

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**onset**: 2025-01-15

**recordedDate**: 2025-01-15

> **stage****summary**: UICC IA (cT1c cN0 cM0)**type**: Tumor staging

> **stage****summary**: cM0**type**: Clinical stage (observable entity)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall1-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-01-15"
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
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }],
    "text" : "Invasives Mammakarzinom NST links, oberer äußerer Quadrant"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "onsetDateTime" : "2025-01-15",
  "recordedDate" : "2025-01-15",
  "stage" : [{
    "summary" : {
      "text" : "UICC IA (cT1c cN0 cM0)"
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
