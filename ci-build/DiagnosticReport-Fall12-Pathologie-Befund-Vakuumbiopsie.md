# Fall 12: Pathologie Vakuumbiopsie — ADH, B3 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Pathologie Vakuumbiopsie — ADH, B3**

## Example DiagnosticReport: Fall 12: Pathologie Vakuumbiopsie — ADH, B3

Profile: [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md)

## Pathologischer Befund (Surgical Pathology) 

| | |
| :--- | :--- |
| Subject | Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012) |
| When For | 2025-07-15 |
| Reported | 2025-07-18 10:00:00+0200 |
| Performer | Institut für Pathologie, Universitätsklinikum Bonn |
| Identifier | Accession ID/PATH-2025-001201 |

**Report Details**

* **Code**: [Pathology report final diagnosis Narrative](Observation-Fall12-Patho-Conclusion-Vakuumbiopsie.md)
  * **Value**: Atypische duktale Hyperplasie (ADH), B3. Offene Biopsie / Nachresektion zum Ausschluss eines Upgrades empfohlen.
  * **Flags**: Final
  * **When For**: 2025-07-18

Atypische duktale Hyperplasie (ADH), B3-Kategorie. Nachresektion empfohlen zum Ausschluss eines DCIS/invasiven Karzinoms.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "Fall12-Pathologie-Befund-Vakuumbiopsie",
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
    "value" : "PATH-2025-001201"
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
  "effectiveDateTime" : "2025-07-15",
  "issued" : "2025-07-18T10:00:00+02:00",
  "performer" : [{
    "display" : "Institut für Pathologie, Universitätsklinikum Bonn"
  }],
  "specimen" : [{
    "reference" : "Specimen/Fall12-Pathologie-Praeparat-Vakuumbiopsie"
  }],
  "result" : [{
    "reference" : "Observation/Fall12-Patho-Conclusion-Vakuumbiopsie"
  }],
  "conclusion" : "Atypische duktale Hyperplasie (ADH), B3-Kategorie. Nachresektion empfohlen zum Ausschluss eines DCIS/invasiven Karzinoms."
}

```
