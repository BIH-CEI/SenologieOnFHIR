# Fall 11: Sonographie links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Sonographie links**

## Example DiagnosticReport: Fall 11: Sonographie links

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Sonographie links (Radiology) 

| | |
| :--- | :--- |
| Subject | Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011) |
| When For | 2025-09-01 |

**Report Details**

Glatt begrenzter, ovaler, echoarmer Knoten links oben außen, 14x9 mm, horizontale Ausrichtung, keine dorsale Schallauslöschung. Typisches Fibroadenom-Erscheinungsbild.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall11-Bildgebung-Sonographie",
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
    "text" : "Sonographie links"
  },
  "subject" : {
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-01",
  "conclusion" : "Glatt begrenzter, ovaler, echoarmer Knoten links oben außen, 14x9 mm, horizontale Ausrichtung, keine dorsale Schallauslöschung. Typisches Fibroadenom-Erscheinungsbild."
}

```
