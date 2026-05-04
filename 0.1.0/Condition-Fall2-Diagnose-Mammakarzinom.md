# Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS)**

## Example Condition: Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS)

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-02-10

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, triple-negativ

**bodySite**: Right breast structure

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**onset**: 2025-02-10

**recordedDate**: 2025-02-10

> **stage****summary**: UICC IV (cT3 cN2a cM1)**type**: Tumor staging

> **stage****summary**: cM1 (OSS) — ossäre Metastase BWK 12**type**: Clinical stage (observable entity)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall2-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-02-10"
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
      "code" : "C50.1",
      "display" : "Bösartige Neubildung: Zentraler Drüsenkörper der Brustdrüse"
    }],
    "text" : "Invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, triple-negativ"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "onsetDateTime" : "2025-02-10",
  "recordedDate" : "2025-02-10",
  "stage" : [{
    "summary" : {
      "text" : "UICC IV (cT3 cN2a cM1)"
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
      "text" : "cM1 (OSS) — ossäre Metastase BWK 12"
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
