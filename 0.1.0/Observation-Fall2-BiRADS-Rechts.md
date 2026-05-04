# Fall 2: BI-RADS 5 rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: BI-RADS 5 rechts**

## Example Observation: Fall 2: BI-RADS 5 rechts

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-02-10

**value**: BI-RADS 5 — hochverdächtig auf Malignität

**note**: 

> 

Große Raumforderung zentral rechts, 55 mm, unscharf begrenzt, Hautinfiltration, vergrößerte axilläre LK rechts


**bodySite**: Right breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-BiRADS-Rechts",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397145000",
      "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
    }],
    "text" : "BI-RADS 5 — hochverdächtig auf Malignität"
  },
  "note" : [{
    "text" : "Große Raumforderung zentral rechts, 55 mm, unscharf begrenzt, Hautinfiltration, vergrößerte axilläre LK rechts"
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
