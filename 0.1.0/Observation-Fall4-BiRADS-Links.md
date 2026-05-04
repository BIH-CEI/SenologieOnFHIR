# Fall 4: BI-RADS 5 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: BI-RADS 5 links**

## Example Observation: Fall 4: BI-RADS 5 links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**effective**: 2025-02-18

**value**: BI-RADS 5 — hochverdächtig auf Malignität

**note**: 

> 

Herdbefund links, 32 mm, irregulär, suspekte axilläre LK links


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall4-BiRADS-Links",
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectiveDateTime" : "2025-02-18",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397145000",
      "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
    }],
    "text" : "BI-RADS 5 — hochverdächtig auf Malignität"
  },
  "note" : [{
    "text" : "Herdbefund links, 32 mm, irregulär, suspekte axilläre LK links"
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
