# Fall 2: Sonographie bilateral - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Sonographie bilateral**

##  DiagnosticReport: Fall 2: Sonographie bilateral

-------

**German**

-------

Profil: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

### Sonographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| Relevant Time | 2025-02-10 |

**Report Details**

Hypoechogener Herdbefund rechts zentral, 52 mm, unscharf begrenzt, dorsale Schallauslöschung. Multiple suspekte axilläre Lymphknoten rechts (Level I+II), größter 22 mm.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Bildgebung-Sonographie",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-10",
  "conclusion" : "Hypoechogener Herdbefund rechts zentral, 52 mm, unscharf begrenzt, dorsale Schallauslöschung. Multiple suspekte axilläre Lymphknoten rechts (Level I+II), größter 22 mm."
}

```
