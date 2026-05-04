# Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12**

## Example DiagnosticReport: Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12

Profile: [BIH Senologie Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

## Bone scan (Radiology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| When For | 2025-02-14 |

**Report Details**

Fokale Mehranreicherung im BWK 12, hochverdächtig auf ossäre Metastase. Sonstige Skelettanteile unauffällig.

**Coded Conclusions:**

* Secondary malignant neoplasm of bone



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Bildgebung-Skelettszintigraphie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-sonstige"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "RAD",
      "display" : "Radiology"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "44491008",
      "display" : "Bone scan"
    },
    {
      "system" : "http://loinc.org",
      "code" : "39638-7",
      "display" : "Bone scan"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-14",
  "conclusion" : "Fokale Mehranreicherung im BWK 12, hochverdächtig auf ossäre Metastase. Sonstige Skelettanteile unauffällig.",
  "conclusionCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "94222008",
      "display" : "Secondary malignant neoplasm of bone"
    }]
  }]
}

```
