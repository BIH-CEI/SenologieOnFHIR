# Beispiel Skelettszintigraphie (Staging) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel Skelettszintigraphie (Staging)**

## Example DiagnosticReport: Beispiel Skelettszintigraphie (Staging)

Profile: [BIH Senologie Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

## Bone scan (Radiology) 

| | |
| :--- | :--- |
| Subject | Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001) |
| When For | 2024-03-10 |

**Report Details**

Kein Hinweis auf ossäre Metastasen. Regelrechte Skelettszintigraphie.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Example-Bildgebung-Skelettszintigraphie",
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
    "reference" : "Patient/example-patient"
  },
  "effectiveDateTime" : "2024-03-10",
  "conclusion" : "Kein Hinweis auf ossäre Metastasen. Regelrechte Skelettszintigraphie."
}

```
