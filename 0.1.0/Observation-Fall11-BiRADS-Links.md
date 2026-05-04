# Fall 11: BI-RADS 3 links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: BI-RADS 3 links**

## Example Observation: Fall 11: BI-RADS 3 links

Profile: [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md)

**status**: Final

**code**: Breast Imaging-Reporting and Data System (BI-RADS) assessment category

**subject**: [Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)](Patient-Fall11-Patient-Hannah-Klein.md)

**effective**: 2025-09-01

**value**: BI-RADS 3 — wahrscheinlich gutartig

**note**: 

> 

Ovaler, glatt begrenzter Herdbefund links oben außen, 15 mm, wahrscheinlich gutartig. Verlaufskontrolle empfohlen.


**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall11-BiRADS-Links",
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
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-01",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "397143007",
      "display" : "Mammography assessment (Category 3) - Probably benign finding, short interval follow-up"
    }],
    "text" : "BI-RADS 3 — wahrscheinlich gutartig"
  },
  "note" : [{
    "text" : "Ovaler, glatt begrenzter Herdbefund links oben außen, 15 mm, wahrscheinlich gutartig. Verlaufskontrolle empfohlen."
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
