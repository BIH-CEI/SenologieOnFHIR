# Fall 8: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 8: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008)](Patient-Fall8-Patient-Klaus-Hartmann.md)

**effective**: 2025-06-18

**value**: Invasives Karzinom NST, G2, pT2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall8-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "effectiveDateTime" : "2025-06-18",
  "valueString" : "Invasives Karzinom NST, G2, pT2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%"
}

```
