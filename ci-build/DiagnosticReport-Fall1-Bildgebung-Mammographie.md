# Fall 1: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Mammographie bilateral**

## Example DiagnosticReport: Fall 1: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001) |
| When For | 2025-01-15 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall1-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Suspekter Herdbefund OAQ links, 18 mm, unscharf begrenzt

BI-RADS 5 links oben außen, BI-RADS 1 rechts



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall1-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-15",
  "result" : [{
    "reference" : "Observation/Fall1-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 5 links oben außen, BI-RADS 1 rechts"
}

```
