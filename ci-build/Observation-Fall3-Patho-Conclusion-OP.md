# Fall 3: Pathologische Diagnose OP-Präparat - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Pathologische Diagnose OP-Präparat**

## Example Observation: Fall 3: Pathologische Diagnose OP-Präparat

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**effective**: 2025-04-11

**value**: Invasives Karzinom NST, pT2, pN1a (2/12 LK positiv), G2, R0



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall3-Patho-Conclusion-OP",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "effectiveDateTime" : "2025-04-11",
  "valueString" : "Invasives Karzinom NST, pT2, pN1a (2/12 LK positiv), G2, R0"
}

```
