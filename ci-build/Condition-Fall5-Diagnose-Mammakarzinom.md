# Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0**

## Example Condition: Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-01-20

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Invasives Mammakarzinom NST rechts, HR+/HER2+

**bodySite**: Right breast structure

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**onset**: 2025-01-20

**recordedDate**: 2025-01-20

> **stage****summary**: UICC IIIA (cT3 cN1 cM0)**type**: Tumor staging

> **stage****summary**: cM0**type**: Clinical stage (observable entity)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall5-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-01-20"
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
    "text" : "Invasives Mammakarzinom NST rechts, HR+/HER2+"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "onsetDateTime" : "2025-01-20",
  "recordedDate" : "2025-01-20",
  "stage" : [{
    "summary" : {
      "text" : "UICC IIIA (cT3 cN1 cM0)"
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
