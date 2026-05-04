# Fall 7: Sonographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Sonographie bilateral**

## Example DiagnosticReport: Fall 7: Sonographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Sonographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007) |
| When For | 2025-03-03 |

**Report Details**

Hypoechogener Herdbefund rechts, 26 mm, unscharf begrenzt. Axilläre Lymphknoten beidseits unauffällig.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall7-Bildgebung-Sonographie",
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
      "display" : "Ultrasound of bilateral breasts"
    }],
    "text" : "Sonographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "effectiveDateTime" : "2025-03-03",
  "conclusion" : "Hypoechogener Herdbefund rechts, 26 mm, unscharf begrenzt. Axilläre Lymphknoten beidseits unauffällig."
}

```
