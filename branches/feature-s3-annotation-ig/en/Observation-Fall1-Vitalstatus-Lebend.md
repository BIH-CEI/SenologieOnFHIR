# Fall 1: Vitalstatus — lebend - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Vitalstatus — lebend**

## Example Observation: Fall 1: Vitalstatus — lebend

-------

**English**

-------

Profile: [MII PR Person Vitalstatus](https://medizininformatik-initiative.github.io/kerndatensatz-basis/2027.0.0-ballot.rc1/StructureDefinition-mii-pr-person-vitalstatus.html)

**status**: Final

**category**: Survey

**code**: Patient Disposition

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-08-15

**value**: Patient lebt



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Vitalstatus-Lebend",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Vitalstatus"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "survey"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "67162-8",
      "display" : "Patient Disposition"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-08-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus",
      "code" : "L",
      "display" : "Patient lebt"
    }]
  }
}

```
