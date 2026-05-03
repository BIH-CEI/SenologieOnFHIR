# Fall 3: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 3: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**effective**: 2025-03-18

**value**: Invasives Karzinom NST, G2, pT2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall3-Patho-Conclusion",
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
  "effectiveDateTime" : "2025-03-18",
  "valueString" : "Invasives Karzinom NST, G2, pT2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%"
}

```
