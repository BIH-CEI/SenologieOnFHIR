# Fall 12: Pathologische Diagnose Vakuumbiopsie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Pathologische Diagnose Vakuumbiopsie**

## Example Observation: Fall 12: Pathologische Diagnose Vakuumbiopsie

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**effective**: 2025-07-18

**value**: Atypische duktale Hyperplasie (ADH), B3. Offene Biopsie / Nachresektion zum Ausschluss eines Upgrades empfohlen.



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall12-Patho-Conclusion-Vakuumbiopsie",
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
  "effectiveDateTime" : "2025-07-18",
  "valueString" : "Atypische duktale Hyperplasie (ADH), B3. Offene Biopsie / Nachresektion zum Ausschluss eines Upgrades empfohlen."
}

```
