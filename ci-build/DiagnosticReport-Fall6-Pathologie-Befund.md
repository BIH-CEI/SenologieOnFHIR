# Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+**

## Example DiagnosticReport: Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006) |
| When For | 2025-04-02 |
| Reported | 2025-04-05 10:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Frankfurt |
| Identifier | Accession ID/PATH-2025-002345 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall6-Patho-Conclusion.md)
  * **Value**: Duktales Carcinoma in situ (DCIS), G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil
  * **Flags**: Final
  * **When For**: 2025-04-05

DCIS, G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil nachweisbar



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall6-Pathologie-Befund",
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
    "value" : "PATH-2025-002345"
  }],
  "basedOn" : [{
    "display" : "Anforderung Histologie — Vakuumbiopsie"
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
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "effectiveDateTime" : "2025-04-02",
  "issued" : "2025-04-05T10:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Frankfurt"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall6-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Fall6-Patho-Conclusion"
  }],
  "conclusion" : "DCIS, G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil nachweisbar"
}

```
