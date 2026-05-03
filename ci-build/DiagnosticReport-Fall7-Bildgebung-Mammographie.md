# Fall 7: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Mammographie bilateral**

## Example DiagnosticReport: Fall 7: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007) |
| When For | 2025-03-03 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall7-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Herdbefund rechts, 28 mm, irregulär, kein Nachweis suspekter axillärer LK

BI-RADS 5 rechts, 28 mm Herdbefund, irregulär. BI-RADS 1 links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall7-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "effectiveDateTime" : "2025-03-03",
  "result" : [{
    "reference" : "Observation/Fall7-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 5 rechts, 28 mm Herdbefund, irregulär. BI-RADS 1 links."
}

```
