# Fall 1: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 1: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-23

**value**: Invasives Karzinom NST, G2, pT1c, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-23",
  "valueString" : "Invasives Karzinom NST, G2, pT1c, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%"
}

```
