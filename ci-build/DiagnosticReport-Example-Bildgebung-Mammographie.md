# Beispiel: Mammographie bilateral, BI-RADS 5 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Mammographie bilateral, BI-RADS 5 links**

## Example DiagnosticReport: Beispiel: Mammographie bilateral, BI-RADS 5 links

Profile: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md)

## Mammographie bilateral (Radiology) 

| | |
| :--- | :--- |
| Subject | Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001) |
| When For | 2024-02-20 |

**Report Details**

* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Example-Bildgebung-BiRADS-Links.md)(Left breast structure)
  * **Value**: BI-RADS 5 — hochverdächtig auf Malignität
  * **Flags**: Final
  * **Note**: > Suspekter Herdbefund OAQ, 15 mm, unscharf begrenzt, Mikrokalk
* **Code**: [Breast Imaging-Reporting and Data System (BI-RADS) assessment category](Observation-Example-Bildgebung-BiRADS-Rechts.md)(Right breast structure)
  * **Value**: BI-RADS 1 — unauffällig
  * **Flags**: Final
  * **Note**: 

Links: suspekter Herdbefund im oberen äußeren Quadranten, BI-RADS 5. Rechts: unauffällig, BI-RADS 1. Empfehlung: Stanzbiopsie links.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Example-Bildgebung-Mammographie",
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
    "reference" : "Patient/example-patient"
  },
  "effectiveDateTime" : "2024-02-20",
  "result" : [{
    "reference" : "Observation/Example-Bildgebung-BiRADS-Links"
  },
  {
    "reference" : "Observation/Example-Bildgebung-BiRADS-Rechts"
  }],
  "conclusion" : "Links: suspekter Herdbefund im oberen äußeren Quadranten, BI-RADS 5. Rechts: unauffällig, BI-RADS 1. Empfehlung: Stanzbiopsie links."
}

```
