# Fall 12: Screening-Mammographie bilateral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Screening-Mammographie bilateral**

## Example DiagnosticReport: Fall 12: Screening-Mammographie bilateral

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Screening-Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012) |
| When For | 2025-07-10 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall12-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 4a — geringe Malignitätswahrscheinlichkeit
  * **Flags**: Final
  * **Note**: > Gruppierte Mikrokalzifikationen links OIQ, ca. 12 mm Ausdehnung, abklärungsbedürftig

BI-RADS 4a links: gruppierte Mikrokalzifikationen im oberen inneren Quadranten, abklärungsbedürftig. BI-RADS 1 rechts.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall12-Bildgebung-Mammographie",
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
    "text" : "Screening-Mammographie bilateral"
  },
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "effectiveDateTime" : "2025-07-10",
  "result" : [{
    "reference" : "Observation/Fall12-BiRADS-Links"
  }],
  "conclusion" : "BI-RADS 4a links: gruppierte Mikrokalzifikationen im oberen inneren Quadranten, abklärungsbedürftig. BI-RADS 1 rechts."
}

```
