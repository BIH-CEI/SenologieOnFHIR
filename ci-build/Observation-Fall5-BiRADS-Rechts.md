# Fall 5: BI-RADS 5 rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: BI-RADS 5 rechts**

## Example Observation: Fall 5: BI-RADS 5 rechts

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**effective**: 2025-01-18

**value**: BI-RADS 5 — hochverdächtig auf Malignität

**note**: 

> 

Großer Herdbefund rechts, 48 mm, irregulär begrenzt, suspekte axilläre LK rechts


**bodySite**: Right breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall5-BiRADS-Rechts",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-18",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397145000",
      "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
    }],
    "text" : "BI-RADS 5 — hochverdächtig auf Malignität"
  },
  "note" : [{
    "text" : "Großer Herdbefund rechts, 48 mm, irregulär begrenzt, suspekte axilläre LK rechts"
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
