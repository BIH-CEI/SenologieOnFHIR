# Fall 9: BI-RADS 5 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: BI-RADS 5 links**

## Example Observation: Fall 9: BI-RADS 5 links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**effective**: 2025-04-02

**value**: BI-RADS 5 — hochverdächtig auf Malignität

**note**: 

> 

Architekturgestörter Herdbefund links OAQ, 30 mm, lobulär imponierend, suspekte axilläre LK links


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall9-BiRADS-Links",
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectiveDateTime" : "2025-04-02",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397145000",
      "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
    }],
    "text" : "BI-RADS 5 — hochverdächtig auf Malignität"
  },
  "note" : [{
    "text" : "Architekturgestörter Herdbefund links OAQ, 30 mm, lobulär imponierend, suspekte axilläre LK links"
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
