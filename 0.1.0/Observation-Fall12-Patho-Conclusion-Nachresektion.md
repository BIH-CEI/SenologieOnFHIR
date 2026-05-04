# Fall 12: Pathologische Diagnose Nachresektion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Pathologische Diagnose Nachresektion**

## Example Observation: Fall 12: Pathologische Diagnose Nachresektion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**effective**: 2025-08-08

**value**: ADH bestätigt, R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade. Keine weitere Therapie erforderlich.



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall12-Patho-Conclusion-Nachresektion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "effectiveDateTime" : "2025-08-08",
  "valueString" : "ADH bestätigt, R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade. Keine weitere Therapie erforderlich."
}

```
