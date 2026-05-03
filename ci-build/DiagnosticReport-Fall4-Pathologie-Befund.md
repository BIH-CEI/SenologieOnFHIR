# Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+**

## Example DiagnosticReport: Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004) |
| When For | 2025-02-22 |
| Reported | 2025-02-25 11:00:00+0100 |
| Performer | Institut für Pathologie, LMU Klinikum München |
| Identifier | Accession ID/PATH-2025-001234 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall4-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2+ Score 3+ (FISH amplifiziert), Ki-67 45%
  * **Flags**: Final
  * **When For**: 2025-02-25

Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 positiv (Score 3+, FISH amplifiziert), Ki-67 45%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall4-Pathologie-Befund",
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
    "value" : "PATH-2025-001234"
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectiveDateTime" : "2025-02-22",
  "issued" : "2025-02-25T11:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, LMU Klinikum München"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall4-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall4-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 positiv (Score 3+, FISH amplifiziert), Ki-67 45%"
}

```
