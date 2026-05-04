# Beispiel: BI-RADS 5 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: BI-RADS 5 links**

## Example Observation: Beispiel: BI-RADS 5 links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**effective**: 2024-02-20

**value**: BI-RADS 5 — hochverdächtig auf Malignität

**note**: 

> 

Suspekter Herdbefund OAQ, 15 mm, unscharf begrenzt, Mikrokalk


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Example-Bildgebung-BiRADS-Links",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "72018-2",
      "display" : "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "effectiveDateTime" : "2024-02-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397145000",
      "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
    }],
    "text" : "BI-RADS 5 — hochverdächtig auf Malignität"
  },
  "note" : [{
    "text" : "Suspekter Herdbefund OAQ, 15 mm, unscharf begrenzt, Mikrokalk"
  }],
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }
}

```
