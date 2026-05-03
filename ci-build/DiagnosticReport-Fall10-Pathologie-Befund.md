# Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55% - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55%**

## Example DiagnosticReport: Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55%

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010) |
| When For | 2025-05-25 |
| Reported | 2025-05-28 11:00:00+0200 |
| Performer | Institut für Pathologie, Charité - Universitätsmedizin Berlin |
| Identifier | Accession ID/PATH-2025-001001 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall10-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G3, pT1c, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 55%, triple-negativ
  * **Flags**: Final
  * **When For**: 2025-05-28

Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 55%. BRCA1-Mutation bekannt.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall10-Pathologie-Befund",
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
    "value" : "PATH-2025-001001"
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-25",
  "issued" : "2025-05-28T11:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Charité - Universitätsmedizin Berlin"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall10-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall10-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 55%. BRCA1-Mutation bekannt."
}

```
