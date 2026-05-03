# Fall 2: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Mammographie bilateral**

## Example DiagnosticReport: Fall 2: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| When For | 2025-02-10 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall2-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Große Raumforderung zentral rechts, 55 mm, unscharf begrenzt, Hautinfiltration, vergrößerte axilläre LK rechts

BI-RADS 5 rechts zentral, große Raumforderung 5,5 cm mit Hautinfiltration. BI-RADS 1 links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Bildgebung-Mammographie",
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
      "code" : "24606-6",
      "display" : "Mammography of bilateral breasts"
    }],
    "text" : "Mammographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-10",
  "result" : [{
    "reference" : "Observation/Fall2-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 5 rechts zentral, große Raumforderung 5,5 cm mit Hautinfiltration. BI-RADS 1 links."
}

```
