# Fall 9: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Mammographie bilateral**

## Example DiagnosticReport: Fall 9: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009) |
| When For | 2025-04-02 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall9-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Architekturgestörter Herdbefund links OAQ, 30 mm, lobulär imponierend, suspekte axilläre LK links

BI-RADS 5 links OAQ, architekturgestörter Herdbefund 30 mm, BI-RADS 1 rechts



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall9-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectiveDateTime" : "2025-04-02",
  "result" : [{
    "reference" : "Observation/Fall9-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 5 links OAQ, architekturgestörter Herdbefund 30 mm, BI-RADS 1 rechts"
}

```
