# Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2- - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-**

## Example DiagnosticReport: Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003) |
| When For | 2025-03-15 |
| Reported | 2025-03-18 14:00:00+0100 |
| Performer | Institut für Pathologie, Charité - Universitätsmedizin Berlin |
| Identifier | Accession ID/PATH-2025-000789 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall3-Patho-Conclusion.md)
  * **Value**: Invasives Karzinom NST, G2, pT2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%
  * **Flags**: Final
  * **When For**: 2025-03-18

Invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall3-Pathologie-Befund",
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
    "value" : "PATH-2025-000789"
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
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "effectiveDateTime" : "2025-03-15",
  "issued" : "2025-03-18T14:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Charité - Universitätsmedizin Berlin"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall3-Pathologie-Praeparat-Stanze"
  }],
  "result" : [{
    "reference" : "Observation/Fall3-Patho-Conclusion"
  }],
  "conclusion" : "Invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%"
}

```
