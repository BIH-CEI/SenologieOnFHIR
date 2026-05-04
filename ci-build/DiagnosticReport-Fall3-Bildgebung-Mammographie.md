# Fall 3: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Mammographie bilateral**

## Example DiagnosticReport: Fall 3: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003) |
| When For | 2025-03-10 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall3-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 4 — suspekt
  * **Flags**: Final
  * **Note**: > Herdbefund rechts, 28 mm, unscharf begrenzt, Verdacht auf Malignität

BI-RADS 4 rechts, 28 mm Herdbefund, unscharf begrenzt. BI-RADS 1 links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall3-Bildgebung-Mammographie",
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
      "display" : "MG Breast Screening"
    }],
    "text" : "Mammographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "effectiveDateTime" : "2025-03-10",
  "result" : [{
    "reference" : "Observation/Fall3-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 4 rechts, 28 mm Herdbefund, unscharf begrenzt. BI-RADS 1 links."
}

```
