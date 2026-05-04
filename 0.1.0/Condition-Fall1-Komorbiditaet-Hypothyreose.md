# Fall 1: Komorbidität — Hypothyreose - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Komorbidität — Hypothyreose**

## Example Condition: Fall 1: Komorbidität — Hypothyreose

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Co-morbid conditions

**code**: Hypothyreose

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**onset**: 2018-06-01

**recordedDate**: 2025-01-15



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall1-Komorbiditaet-Hypothyreose",
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
      "code" : "E03.9",
      "display" : "Hypothyreose, nicht näher bezeichnet"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "40930008",
      "display" : "Hypothyroidism"
    }],
    "text" : "Hypothyreose"
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "onsetDateTime" : "2018-06-01",
  "recordedDate" : "2025-01-15"
}

```
