# Fall 5: MRT Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: MRT Mamma**

## Example DiagnosticReport: Fall 5: MRT Mamma

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## MRT Mamma (Radiology) 

| | |
| :--- | :--- |
| Subject | Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005) |
| When For | 2025-01-22 |

**Report Details**

KM-anreichernde Raumforderung rechts, 52 mm, unifokal. Kein Nachweis kontralateraler Herde. Suspekte axilläre LK rechts Level I.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall5-Bildgebung-MRT",
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
      "display" : "MRI of breast"
    }],
    "text" : "MRT Mamma"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-22",
  "conclusion" : "KM-anreichernde Raumforderung rechts, 52 mm, unifokal. Kein Nachweis kontralateraler Herde. Suspekte axilläre LK rechts Level I."
}

```
