# Fall 11: Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Mammographie bilateral**

## Example DiagnosticReport: Fall 11: Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011) |
| When For | 2025-09-01 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall11-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 3 — wahrscheinlich gutartig
  * **Flags**: Final
  * **Note**: > Ovaler, glatt begrenzter Herdbefund links oben außen, 15 mm, wahrscheinlich gutartig. Verlaufskontrolle empfohlen.

BI-RADS 3 links oben außen: ovaler, glatt begrenzter Herdbefund 15 mm, wahrscheinlich gutartig. BI-RADS 1 rechts.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall11-Bildgebung-Mammographie",
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
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-01",
  "result" : [{
    "reference" : "Observation/Fall11-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 3 links oben außen: ovaler, glatt begrenzter Herdbefund 15 mm, wahrscheinlich gutartig. BI-RADS 1 rechts."
}

```
