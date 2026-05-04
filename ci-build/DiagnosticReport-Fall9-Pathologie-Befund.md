# Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2- - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2-**

## Example DiagnosticReport: Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2-

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009) |
| When For | 2025-04-08 |
| Reported | 2025-04-11 10:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Stuttgart |
| Identifier | Accession ID/PATH-2025-000901 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall9-Patho-Conclusion.md)
  * **Value**: Invasives lobuläres Karzinom, G2, pT2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%, E-Cadherin negativ
  * **Flags**: Final
  * **When For**: 2025-04-11

Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall9-Pathologie-Befund",
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
    "value" : "PATH-2025-000901"
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectiveDateTime" : "2025-04-08",
  "issued" : "2025-04-11T10:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Stuttgart"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall9-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall9-Patho-Conclusion"
  }],
  "conclusion" : "Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%"
}

```
