# Fall 7: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 7: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)](Patient-Fall7-Patient-Kathrin-Mueller.md)

**effective**: 2025-03-10

**value**: Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2- Score 1+, Ki-67 65%, triple-negativ



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall7-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "effectiveDateTime" : "2025-03-10",
  "valueString" : "Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2- Score 1+, Ki-67 65%, triple-negativ"
}

```
