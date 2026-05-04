# Fall 6: DCIS links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: DCIS links**

## Example Condition: Fall 6: DCIS links

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-04-05

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Duktales Carcinoma in situ (DCIS) links, G2, ER+

**bodySite**: Left breast structure

**subject**: [Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)](Patient-Fall6-Patient-Petra-Schneider.md)

**onset**: 2025-04-05

**recordedDate**: 2025-04-05

### Stages

| | | |
| :--- | :--- | :--- |
| - | **Summary** | **Type** |
| * | Stadium 0 (DCIS, Tis) | Tumor staging |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall6-Diagnose-DCIS",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-04-05"
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
      "code" : "109889007",
      "display" : "Ductal carcinoma in situ of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "D05.1",
      "display" : "Carcinoma in situ der Milchgänge"
    }],
    "text" : "Duktales Carcinoma in situ (DCIS) links, G2, ER+"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "onsetDateTime" : "2025-04-05",
  "recordedDate" : "2025-04-05",
  "stage" : [{
    "summary" : {
      "text" : "Stadium 0 (DCIS, Tis)"
    },
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254292007",
        "display" : "Tumor staging"
      }]
    }
  }]
}

```
