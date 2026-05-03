# Fall 6: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 6: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)](Patient-Fall6-Patient-Petra-Schneider.md)

**effective**: 2025-04-05

**value**: Duktales Carcinoma in situ (DCIS), G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall6-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "effectiveDateTime" : "2025-04-05",
  "valueString" : "Duktales Carcinoma in situ (DCIS), G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil"
}

```
