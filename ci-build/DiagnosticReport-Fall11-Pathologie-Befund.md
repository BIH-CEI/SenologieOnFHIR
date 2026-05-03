# Fall 11: Pathologie — Fibroadenom, keine Atypie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Pathologie — Fibroadenom, keine Atypie**

## Example DiagnosticReport: Fall 11: Pathologie — Fibroadenom, keine Atypie

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011) |
| When For | 2025-09-05 |
| Reported | 2025-09-08 09:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Leipzig |
| Identifier | Accession ID/PATH-2025-001101 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall11-Patho-Conclusion.md)
  * **Value**: Fibroadenom (perikanalikular), keine Atypie, B2. Verlaufskontrolle in 6 Monaten empfohlen.
  * **Flags**: Final
  * **When For**: 2025-09-08

Fibroadenom (perikanalikular), keine Atypie, B2-Kategorie. Kein Hinweis auf Malignität.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall11-Pathologie-Befund",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "ACSN",
        "display" : "Accession ID"
      }]
    },
    "system" : "http://pathologie.charite.de/fhir/sid/report-id",
    "value" : "PATH-2025-001101"
  }],
  "basedOn" : [{
    "display" : "Anforderung Histologie durch Senologie"
  }],
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "SP",
      "display" : "Surgical Pathology"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "60568-3",
      "display" : "Pathology Synoptic report"
    }],
    "text" : "Pathologischer Befund"
  },
  "subject" : {
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "effectiveDateTime" : "2025-09-05",
  "issued" : "2025-09-08T09:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Leipzig"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall11-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall11-Patho-Conclusion"
  }],
  "conclusion" : "Fibroadenom (perikanalikular), keine Atypie, B2-Kategorie. Kein Hinweis auf Malignität."
}

```
