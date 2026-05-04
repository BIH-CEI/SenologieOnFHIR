# Fall 6: Screening-Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: Screening-Mammographie bilateral**

## Example DiagnosticReport: Fall 6: Screening-Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Screening-Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006) |
| When For | 2025-03-28 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall6-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 4 — suspekt, Mikrokalzifikationen
  * **Flags**: Final
  * **Note**: > Gruppierte polymorphe Mikrokalzifikationen links, Ausdehnung ca. 15 mm, suspekt

BI-RADS 4 links — suspekte Mikrokalzifikationen. BI-RADS 1 rechts.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall6-Bildgebung-Mammographie",
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
    "text" : "Screening-Mammographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "effectiveDateTime" : "2025-03-28",
  "result" : [{
    "reference" : "Observation/Fall6-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 4 links — suspekte Mikrokalzifikationen. BI-RADS 1 rechts."
}

```
