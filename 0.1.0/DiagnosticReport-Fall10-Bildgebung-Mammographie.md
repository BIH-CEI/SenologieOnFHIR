# Fall 10: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Mammographie bilateral**

## Example DiagnosticReport: Fall 10: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010) |
| When For | 2025-05-20 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall10-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 4c — hohe Malignitätswahrscheinlichkeit
  * **Flags**: Final
  * **Note**: > Unscharf begrenzter Herdbefund rechts OAQ, 18 mm, suspekt

BI-RADS 4c rechts OAQ, unscharf begrenzter Herdbefund 18 mm. BI-RADS 1 links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall10-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-20",
  "result" : [{
    "reference" : "Observation/Fall10-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 4c rechts OAQ, unscharf begrenzter Herdbefund 18 mm. BI-RADS 1 links."
}

```
