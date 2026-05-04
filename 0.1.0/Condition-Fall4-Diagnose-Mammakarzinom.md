# Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0**

## Example Condition: Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-02-20

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Invasives Mammakarzinom NST links, HER2-positiv (FISH amplifiziert)

**bodySite**: Left breast structure

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**onset**: 2025-02-20

**recordedDate**: 2025-02-20

> **stage****summary**: UICC IIB (cT2 cN1 cM0)**type**: Tumor staging

> **stage****summary**: cM0**type**: Clinical stage (observable entity)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall4-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-02-20"
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
      "code" : "C50.9",
      "display" : "Bösartige Neubildung: Brustdrüse, nicht näher bezeichnet"
    }],
    "text" : "Invasives Mammakarzinom NST links, HER2-positiv (FISH amplifiziert)"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "onsetDateTime" : "2025-02-20",
  "recordedDate" : "2025-02-20",
  "stage" : [{
    "summary" : {
      "text" : "UICC IIB (cT2 cN1 cM0)"
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
