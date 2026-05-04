# Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC**

## Example DiagnosticReport: Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007) |
| When For | 2025-03-07 |
| Reported | 2025-03-10 14:00:00+0100 |
| Performer | Institut für Pathologie, Uniklinik Köln |
| Identifier | Accession ID/PATH-2025-003456 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall7-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2- Score 1+, Ki-67 65%, triple-negativ
  * **Flags**: Final
  * **When For**: 2025-03-10

Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 1+), Ki-67 65%. Triple-negativ.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall7-Pathologie-Befund",
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
    "value" : "PATH-2025-003456"
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
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "effectiveDateTime" : "2025-03-07",
  "issued" : "2025-03-10T14:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Uniklinik Köln"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall7-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall7-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 1+), Ki-67 65%. Triple-negativ."
}

```
