# Fall 1 — Raucherstatus: Nie geraucht - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1 — Raucherstatus: Nie geraucht**

## Example Observation: Fall 1 — Raucherstatus: Nie geraucht

Profile: [ISiK Raucherstatus](https://simplifier.net/resolve?scope=de.gematik.isik@5.1.1&canonical=https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus)

**status**: Final

**code**: Smoker

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2024-01-15

**value**: Never smoker



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Raucherstatus",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "77176002",
      "display" : "Smoker"
    },
    {
      "system" : "http://loinc.org",
      "code" : "72166-2",
      "display" : "Tobacco smoking status"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2024-01-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA18978-9",
      "display" : "Never smoker"
    }]
  }
}

```
