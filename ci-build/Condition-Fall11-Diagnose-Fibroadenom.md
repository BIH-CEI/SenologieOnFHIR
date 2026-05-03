# Fall 11: Fibroadenom links oben außen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Fibroadenom links oben außen**

## Example Condition: Fall 11: Fibroadenom links oben außen

Profile: [BIH PR Seno Diagnose Benigne](StructureDefinition-senologie-diagnose-benigne.md)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Fibroadenom links oben außen, 15 mm

**bodySite**: Left breast structure

**subject**: [Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)](Patient-Fall11-Patient-Hannah-Klein.md)

**onset**: 2025-09-01

**recordedDate**: 2025-09-10



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall11-Diagnose-Fibroadenom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-benigne"]
  },
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
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254845004",
      "display" : "Fibroadenoma of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "D24",
      "display" : "Gutartige Neubildung der Brustdrüse [Mamma]"
    }],
    "text" : "Fibroadenom links oben außen, 15 mm"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "onsetDateTime" : "2025-09-01",
  "recordedDate" : "2025-09-10"
}

```
