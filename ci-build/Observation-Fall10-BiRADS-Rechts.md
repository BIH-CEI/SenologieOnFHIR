# Fall 10: BI-RADS 4c rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: BI-RADS 4c rechts**

## Example Observation: Fall 10: BI-RADS 4c rechts

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-05-20

**value**: BI-RADS 4c — hohe Malignitätswahrscheinlichkeit

**note**: 

> 

Unscharf begrenzter Herdbefund rechts OAQ, 18 mm, suspekt


**bodySite**: Right breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-BiRADS-Rechts",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397144001",
      "display" : "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
    }],
    "text" : "BI-RADS 4c — hohe Malignitätswahrscheinlichkeit"
  },
  "note" : [{
    "text" : "Unscharf begrenzter Herdbefund rechts OAQ, 18 mm, suspekt"
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
