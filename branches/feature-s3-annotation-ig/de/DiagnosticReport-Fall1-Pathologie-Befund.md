# Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2- - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-**

##  DiagnosticReport: Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-

-------

**German**

-------

Profil: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

### Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001) |
| Relevant Time | 2025-01-20 |
| Reported | 2025-01-23 10:00:00+0100 |
| Performer | Institut für Pathologie, Charité - Universitätsmedizin Berlin |
| Identifier | Accession ID/PATH-2025-000123 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall1-Patho-Conclusion.md)
  * **Wert**: Invasives Karzinom NST, G2, pT1c, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%
  * **Flags**: Final
  * **Relevant Time**: 2025-01-23
* **Code**: [Estrogen receptor Ag [Presence] in Tissue by Immune stain](Observation-Fall1-ER-Status.md)
  * **Wert**: Positive
  * **Flags**: Final
  * **Relevant Time**: 2025-01-23
* **Code**: [Progesterone receptor [Interpretation] in Tissue by Immune stain](Observation-Fall1-PR-Status.md)
  * **Wert**: Positive
  * **Flags**: Final
  * **Relevant Time**: 2025-01-23
* **Code**: [HER2 Ag [Interpretation] in Tissue](Observation-Fall1-HER2-Status.md)
  * **Wert**: HER2-low
  * **Flags**: Final
  * **Relevant Time**: 2025-01-23

Invasives Karzinom NST, G2, ER+ IRS 12 (Leitlinie: positiv), PR+ IRS 8 (Leitlinie: positiv), HER2 IHC 1+ → Leitlinie: HER2-low (oBDS: negativ), Ki-67 15%



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall1-Pathologie-Befund",
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
    "value" : "PATH-2025-000123"
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-20",
  "issued" : "2025-01-23T10:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Charité - Universitätsmedizin Berlin"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall1-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall1-Patho-Conclusion"
  },
  {
    "reference" : "Observation/Fall1-ER-Status"
  },
  {
    "reference" : "Observation/Fall1-PR-Status"
  },
  {
    "reference" : "Observation/Fall1-HER2-Status"
  }],
  "conclusion" : "Invasives Karzinom NST, G2, ER+ IRS 12 (Leitlinie: positiv), PR+ IRS 8 (Leitlinie: positiv), HER2 IHC 1+ → Leitlinie: HER2-low (oBDS: negativ), Ki-67 15%"
}

```
