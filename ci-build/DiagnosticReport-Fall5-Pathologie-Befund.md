# Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+**

## Example DiagnosticReport: Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005) |
| When For | 2025-01-24 |
| Reported | 2025-01-27 09:00:00+0100 |
| Performer | Institut für Pathologie, UKE Hamburg |
| Identifier | Accession ID/PATH-2025-001567 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall5-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%
  * **Flags**: Final
  * **When For**: 2025-01-27

Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall5-Pathologie-Befund",
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
    "value" : "PATH-2025-001567"
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
      "display" : "Pathology synoptic report"
    }],
    "text" : "Pathologischer Befund"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-01-24",
  "issued" : "2025-01-27T09:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, UKE Hamburg"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall5-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall5-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%"
}

```
