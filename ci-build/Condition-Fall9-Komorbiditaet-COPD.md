# Fall 9: Komorbidität — COPD - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Komorbidität — COPD**

## Example Condition: Fall 9: Komorbidität — COPD

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Co-morbid conditions

**code**: COPD GOLD II

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**onset**: 2017-01-01

**recordedDate**: 2025-03-01



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall9-Komorbiditaet-COPD",
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
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "398192003",
      "display" : "Co-morbid conditions"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "J44.1",
      "display" : "Chronische obstruktive Lungenkrankheit mit akuter Exazerbation, nicht näher bezeichnet"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "13645005",
      "display" : "Chronic obstructive lung disease"
    }],
    "text" : "COPD GOLD II"
  },
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "onsetDateTime" : "2017-01-01",
  "recordedDate" : "2025-03-01"
}

```
