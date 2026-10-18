# Fall 2: Vitalstatus — verstorben - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Vitalstatus — verstorben**

## Example Observation: Fall 2: Vitalstatus — verstorben

-------

**English**

-------

Profile: [MII PR Person Vitalstatus](https://medizininformatik-initiative.github.io/kerndatensatz-basis/2027.0.0-ballot.rc1/StructureDefinition-mii-pr-person-vitalstatus.html)

**status**: Final

**category**: Survey

**code**: Patient Disposition

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md)

**effective**: 2026-09-20

**value**: Patient verstorben



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-Vitalstatus-Verstorben",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann-Verstorben"
  },
  "effectiveDateTime" : "2026-09-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/core/modul-person/CodeSystem/Vitalstatus",
      "code" : "T",
      "display" : "Patient verstorben"
    }]
  }
}

```
