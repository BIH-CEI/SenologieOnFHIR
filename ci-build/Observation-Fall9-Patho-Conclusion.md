# Fall 9: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 9: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**effective**: 2025-04-11

**value**: Invasives lobuläres Karzinom, G2, pT2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%, E-Cadherin negativ



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall9-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectiveDateTime" : "2025-04-11",
  "valueString" : "Invasives lobuläres Karzinom, G2, pT2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%, E-Cadherin negativ"
}

```
