# Fall 1 — Sozialdienst-Kontakt durchgeführt - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1 — Sozialdienst-Kontakt durchgeführt**

## Example Procedure: Fall 1 — Sozialdienst-Kontakt durchgeführt

Profile: [BIH Senologie Sozialdienst-Kontakt](StructureDefinition-senologie-sozialdienst.md)

**status**: Completed

**code**: Social services

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**performed**: 2024-02-20



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall1-Sozialdienst",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-sozialdienst"]
  },
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "310134006",
      "display" : "Social services"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "performedDateTime" : "2024-02-20"
}

```
