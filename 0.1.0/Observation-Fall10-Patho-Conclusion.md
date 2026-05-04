# Fall 10: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 10: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-05-28

**value**: Invasives Karzinom NST, G3, pT1c, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 55%, triple-negativ



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-28",
  "valueString" : "Invasives Karzinom NST, G3, pT1c, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 55%, triple-negativ"
}

```
