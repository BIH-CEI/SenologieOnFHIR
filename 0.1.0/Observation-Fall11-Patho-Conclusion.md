# Fall 11: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Pathologische Diagnose/Conclusion**

## Example Observation: Fall 11: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)](Patient-Fall11-Patient-Hannah-Klein.md)

**effective**: 2025-09-08

**value**: Fibroadenom (perikanalikular), keine Atypie, B2. Verlaufskontrolle in 6 Monaten empfohlen.



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall11-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-08",
  "valueString" : "Fibroadenom (perikanalikular), keine Atypie, B2. Verlaufskontrolle in 6 Monaten empfohlen."
}

```
