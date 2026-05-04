# Fall 2: MRT Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: MRT Mamma**

## Example DiagnosticReport: Fall 2: MRT Mamma

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## MRT Mamma (Radiology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| When For | 2025-02-12 |

**Report Details**

Kontrastmittelanreichernde Raumforderung rechts zentral, 58 mm, Hautkontakt über 3 cm. Kein Nachweis multifokaler oder kontralateraler Herde. Multiple pathologische LK axillär rechts Level I-II.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Bildgebung-MRT",
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
      "code" : "30794-2",
      "display" : "MR Breast"
    }],
    "text" : "MRT Mamma"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-12",
  "conclusion" : "Kontrastmittelanreichernde Raumforderung rechts zentral, 58 mm, Hautkontakt über 3 cm. Kein Nachweis multifokaler oder kontralateraler Herde. Multiple pathologische LK axillär rechts Level I-II."
}

```
