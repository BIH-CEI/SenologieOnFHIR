# Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ**

## Example DiagnosticReport: Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002) |
| When For | 2025-02-15 |
| Reported | 2025-02-18 16:00:00+0100 |
| Performer | Institut für Pathologie, Charité - Universitätsmedizin Berlin |
| Identifier | Accession ID/PATH-2025-000456 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall2-Patho-Conclusion.md)
  * **Value**: Invasiv-duktales Mammakarzinom, G3, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 70%, triple-negativ
  * **Flags**: Final
  * **When For**: 2025-02-18

Invasiv-duktales Mammakarzinom, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 70%. Triple-negativ.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall2-Pathologie-Befund",
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
    "value" : "PATH-2025-000456"
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-15",
  "issued" : "2025-02-18T16:00:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Charité - Universitätsmedizin Berlin"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall2-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall2-Patho-Conclusion"
  }],
  "conclusion" : "Invasiv-duktales Mammakarzinom, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 70%. Triple-negativ."
}

```
