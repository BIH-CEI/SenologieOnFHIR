# Fall 5: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 5: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**effective**: 2025-01-27

**value**: Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall5-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-27",
  "valueString" : "Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%"
}

```
