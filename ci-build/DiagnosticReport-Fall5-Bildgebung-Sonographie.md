# Fall 5: Sonographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Sonographie bilateral**

## Example DiagnosticReport: Fall 5: Sonographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Sonographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005) |
| When For | 2025-01-18 |

**Report Details**

Hypoechogener Herdbefund rechts, 45 mm, unscharf begrenzt, dorsale Schallauslöschung. Suspekter axillärer LK rechts, 15 mm.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall5-Bildgebung-Sonographie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-befund"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "RAD",
      "display" : "Radiology"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "24601-7",
      "display" : "US Breast"
    }],
    "text" : "Sonographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-18",
  "conclusion" : "Hypoechogener Herdbefund rechts, 45 mm, unscharf begrenzt, dorsale Schallauslöschung. Suspekter axillärer LK rechts, 15 mm."
}

```
