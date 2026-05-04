# Fall 8: Sonographie rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Sonographie rechts**

## Example DiagnosticReport: Fall 8: Sonographie rechts

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Sonographie rechts (Radiology) 

| | |
| :--- | :--- |
| Subject | Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008) |
| When For | 2025-06-10 |

**Report Details**

Hypoechogener Herdbefund rechts retromamillär, 26 mm, unscharf begrenzt. Axilläre Lymphknoten rechts unauffällig.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall8-Bildgebung-Sonographie",
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
    "text" : "Sonographie rechts"
  },
  "subject" : {
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "effectiveDateTime" : "2025-06-10",
  "conclusion" : "Hypoechogener Herdbefund rechts retromamillär, 26 mm, unscharf begrenzt. Axilläre Lymphknoten rechts unauffällig."
}

```
