# Fall 2: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 2: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-02-18

**value**: Invasiv-duktales Mammakarzinom, G3, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 70%, triple-negativ



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-18",
  "valueString" : "Invasiv-duktales Mammakarzinom, G3, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 70%, triple-negativ"
}

```
