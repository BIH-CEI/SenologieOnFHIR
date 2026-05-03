# Fall 4: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 4: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**effective**: 2025-02-25

**value**: Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2+ Score 3+ (FISH amplifiziert), Ki-67 45%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall4-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectiveDateTime" : "2025-02-25",
  "valueString" : "Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2+ Score 3+ (FISH amplifiziert), Ki-67 45%"
}

```
