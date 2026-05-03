# Fall 9: Komorbidität — Adipositas - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Komorbidität — Adipositas**

## Example Condition: Fall 9: Komorbidität — Adipositas

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Co-morbid conditions

**code**: Adipositas Grad I (BMI 32)

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**recordedDate**: 2025-03-01



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall9-Komorbiditaet-Adipositas",
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
      "code" : "E66.00",
      "display" : "Adipositas durch übermäßige Kalorienzufuhr: Body-Mass-Index [BMI] von 30 bis unter 35"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "414916001",
      "display" : "Obesity"
    }],
    "text" : "Adipositas Grad I (BMI 32)"
  },
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "recordedDate" : "2025-03-01"
}

```
