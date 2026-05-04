# Fall 3: BI-RADS 4 rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: BI-RADS 4 rechts**

## Example Observation: Fall 3: BI-RADS 4 rechts

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**effective**: 2025-03-10

**value**: BI-RADS 4 — suspekt

**note**: 

> 

Herdbefund rechts, 28 mm, unscharf begrenzt, Verdacht auf Malignität


**bodySite**: Right breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall3-BiRADS-Rechts",
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
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "effectiveDateTime" : "2025-03-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397144001",
      "display" : "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
    }],
    "text" : "BI-RADS 4 — suspekt"
  },
  "note" : [{
    "text" : "Herdbefund rechts, 28 mm, unscharf begrenzt, Verdacht auf Malignität"
  }],
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }
}

```
