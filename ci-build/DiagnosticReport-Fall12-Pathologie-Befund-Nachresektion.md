# Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0**

## Example DiagnosticReport: Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012) |
| When For | 2025-08-05 |
| Reported | 2025-08-08 14:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Bonn |
| Identifier | Accession ID/PATH-2025-001202 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall12-Patho-Conclusion-Nachresektion.md)
  * **Value**: ADH bestätigt, R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade. Keine weitere Therapie erforderlich.
  * **Flags**: Final
  * **When For**: 2025-08-08

Exzisionspräparat: Atypische duktale Hyperplasie (ADH), R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall12-Pathologie-Befund-Nachresektion",
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
    "value" : "PATH-2025-001202"
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
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "effectiveDateTime" : "2025-08-05",
  "issued" : "2025-08-08T14:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Bonn"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall12-Pathologie-Praeparat-Nachresektion"
  }],
  "result" : [{
    "reference" : "Observation/Fall12-Patho-Conclusion-Nachresektion"
  }],
  "conclusion" : "Exzisionspräparat: Atypische duktale Hyperplasie (ADH), R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade."
}

```
