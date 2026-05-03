# Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2- - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2-**

## Example DiagnosticReport: Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2-

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001) |
| When For | 2024-03-01 |
| Reported | 2024-03-05 14:30:00+0100 |
| Performer | Institut für Pathologie, Charité - Universitätsmedizin Berlin |
| Identifier | Accession ID/PATH-2024-001234 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Example-Patho-Conclusion.md)
  * **Value**: Invasiv-duktales Mammakarzinom, G2, pT1c, ER+/PR+/HER2-, Ki-67 20%
  * **Flags**: Final
  * **When For**: 2024-03-05

Invasiv-duktales Mammakarzinom links, OAQ. Grading: G2. ER positiv (IRS 12), PR positiv (IRS 8). HER2-Status: negativ (Score 1+). Ki-67: 20%.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Example-Pathologie-Befund",
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
    "value" : "PATH-2024-001234"
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
    "reference" : "Patient/example-patient"
  },
  "effectiveDateTime" : "2024-03-01",
  "issued" : "2024-03-05T14:30:00+01:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Charité - Universitätsmedizin Berlin"
  }],
  "specimen" : [{
    "reference" : "Specimen/Example-Pathologie-Praeparat"
  }],
  "result" : [{
    "reference" : "Observation/Example-Patho-Conclusion"
  }],
  "conclusion" : "Invasiv-duktales Mammakarzinom links, OAQ. Grading: G2. ER positiv (IRS 12), PR positiv (IRS 8). HER2-Status: negativ (Score 1+). Ki-67: 20%."
}

```
