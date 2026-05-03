# Fall 12: BI-RADS 4a links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: BI-RADS 4a links**

## Example Observation: Fall 12: BI-RADS 4a links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**effective**: 2025-07-10

**value**: BI-RADS 4a — geringe Malignitätswahrscheinlichkeit

**note**: 

> 

Gruppierte Mikrokalzifikationen links OIQ, ca. 12 mm Ausdehnung, abklärungsbedürftig


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall12-BiRADS-Links",
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
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "effectiveDateTime" : "2025-07-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397144001",
      "display" : "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
    }],
    "text" : "BI-RADS 4a — geringe Malignitätswahrscheinlichkeit"
  },
  "note" : [{
    "text" : "Gruppierte Mikrokalzifikationen links OIQ, ca. 12 mm Ausdehnung, abklärungsbedürftig"
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
