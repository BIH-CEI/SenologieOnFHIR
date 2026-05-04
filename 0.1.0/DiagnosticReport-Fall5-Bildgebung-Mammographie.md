# Fall 5: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Mammographie bilateral**

## Example DiagnosticReport: Fall 5: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005) |
| When For | 2025-01-18 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall5-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Großer Herdbefund rechts, 48 mm, irregulär begrenzt, suspekte axilläre LK rechts

BI-RADS 5 rechts, großer Herdbefund 48 mm, irregulär. BI-RADS 1 links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall5-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-18",
  "result" : [{
    "reference" : "Observation/Fall5-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 5 rechts, großer Herdbefund 48 mm, irregulär. BI-RADS 1 links."
}

```
