# Fall 5: Komorbidität — Diabetes mellitus Typ 2 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Komorbidität — Diabetes mellitus Typ 2**

## Example Condition: Fall 5: Komorbidität — Diabetes mellitus Typ 2

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Co-morbid conditions

**code**: Diabetes mellitus Typ 2

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**onset**: 2019-05-01

**recordedDate**: 2025-01-20



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall5-Komorbiditaet-Diabetes",
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
      "code" : "E11.90",
      "display" : "Diabetes mellitus, Typ 2: Ohne Komplikationen: Nicht als entgleist bezeichnet"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "44054006",
      "display" : "Diabetes mellitus type 2"
    }],
    "text" : "Diabetes mellitus Typ 2"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "onsetDateTime" : "2019-05-01",
  "recordedDate" : "2025-01-20"
}

```
