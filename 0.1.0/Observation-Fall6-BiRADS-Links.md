# Fall 6: BI-RADS 4 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: BI-RADS 4 links**

## Example Observation: Fall 6: BI-RADS 4 links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)](Patient-Fall6-Patient-Petra-Schneider.md)

**effective**: 2025-03-28

**value**: BI-RADS 4 — suspekt, Mikrokalzifikationen

**note**: 

> 

Gruppierte polymorphe Mikrokalzifikationen links, Ausdehnung ca. 15 mm, suspekt


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall6-BiRADS-Links",
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
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "effectiveDateTime" : "2025-03-28",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397144001",
      "display" : "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
    }],
    "text" : "BI-RADS 4 — suspekt, Mikrokalzifikationen"
  },
  "note" : [{
    "text" : "Gruppierte polymorphe Mikrokalzifikationen links, Ausdehnung ca. 15 mm, suspekt"
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
