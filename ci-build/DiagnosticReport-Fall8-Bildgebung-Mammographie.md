# Fall 8: Mammographie rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Mammographie rechts**

## Example DiagnosticReport: Fall 8: Mammographie rechts

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie (Radiology) 

| | |
| :--- | :--- |
| Subject | Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008) |
| When For | 2025-06-10 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Fall8-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Retromamillärer Herdbefund rechts, 28 mm, unscharf begrenzt, bei männlichem Patienten

BI-RADS 5 rechts retromamillär, unscharf begrenzter Herdbefund 28 mm



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall8-Bildgebung-Mammographie",
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
    "text" : "Mammographie"
  },
  "subject" : {
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "effectiveDateTime" : "2025-06-10",
  "result" : [{
    "reference" : "Observation/Fall8-BiRADS-Rechts"
  }],
  "conclusion" : "BI-RADS 5 rechts retromamillär, unscharf begrenzter Herdbefund 28 mm"
}

```
