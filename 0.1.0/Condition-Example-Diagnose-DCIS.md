# Beispiel: DCIS rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: DCIS rechts**

## Example Condition: Beispiel: DCIS rechts

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2024-06-20

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: DCIS rechts

**bodySite**: Right breast structure

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**recordedDate**: 2024-06-20

### Stages

| | | |
| :--- | :--- | :--- |
| - | **Summary** | **Type** |
| * | Stage 0 | Tumor staging |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Example-Diagnose-DCIS",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2024-06-20"
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
      "version" : "2024",
      "code" : "D05.1",
      "display" : "Carcinoma in situ der Milchgänge"
    }],
    "text" : "DCIS rechts"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "recordedDate" : "2024-06-20",
  "stage" : [{
    "summary" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "261613009",
        "display" : "Stage 0"
      }]
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
