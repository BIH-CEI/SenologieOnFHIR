# Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2- - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2-**

## Example DiagnosticReport: Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2-

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008) |
| When For | 2025-06-15 |
| Reported | 2025-06-18 14:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Dresden |
| Identifier | Accession ID/PATH-2025-000801 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall8-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G2, pT2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%
  * **Flags**: Final
  * **When For**: 2025-06-18

Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall8-Pathologie-Befund",
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
    "value" : "PATH-2025-000801"
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
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "effectiveDateTime" : "2025-06-15",
  "issued" : "2025-06-18T14:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Dresden"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall8-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall8-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%"
}

```
