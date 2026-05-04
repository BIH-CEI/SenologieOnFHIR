# Fall 4: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Mammographie bilateral**

## Example DiagnosticReport: Fall 4: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004) |
| When For | 2025-02-18 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall4-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Herdbefund links, 32 mm, irregulär, suspekte axilläre LK links

BI-RADS 5 links, 32 mm Herdbefund, irregulär. BI-RADS 1 rechts.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall4-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectiveDateTime" : "2025-02-18",
  "result" : [{
    "reference" : "Observation/Fall4-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 5 links, 32 mm Herdbefund, irregulär. BI-RADS 1 rechts."
}

```
