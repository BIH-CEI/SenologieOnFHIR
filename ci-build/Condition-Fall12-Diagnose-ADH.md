# Fall 12: ADH (B3-Läsion), D48.6 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: ADH (B3-Läsion), D48.6**

## Example Condition: Fall 12: ADH (B3-Läsion), D48.6

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-07-15

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Atypische duktale Hyperplasie (ADH), B3-Läsion

**bodySite**: Left breast structure

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**onset**: 2025-07-15

**recordedDate**: 2025-07-15



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall12-Diagnose-ADH",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-07-15"
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
      "code" : "269497004",
      "display" : "Neoplasm of uncertain behavior of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "D48.6",
      "display" : "Neubildung unsicheren oder unbekannten Verhaltens: Brustdrüse [Mamma]"
    }],
    "text" : "Atypische duktale Hyperplasie (ADH), B3-Läsion"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "onsetDateTime" : "2025-07-15",
  "recordedDate" : "2025-07-15"
}

```
