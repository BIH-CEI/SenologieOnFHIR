# Fall 4: Sonographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Sonographie bilateral**

## Example DiagnosticReport: Fall 4: Sonographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Sonographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004) |
| When For | 2025-02-18 |

**Report Details**

Hypoechogener Herdbefund links, 30 mm, unscharf begrenzt. Suspekter axillärer LK links, 18 mm.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall4-Bildgebung-Sonographie",
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectiveDateTime" : "2025-02-18",
  "conclusion" : "Hypoechogener Herdbefund links, 30 mm, unscharf begrenzt. Suspekter axillärer LK links, 18 mm."
}

```
