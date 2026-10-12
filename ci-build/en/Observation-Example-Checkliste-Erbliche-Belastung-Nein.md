# Checkliste erbliche Belastung — nicht durchgeführt - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Checkliste erbliche Belastung — nicht durchgeführt**

## Example Observation: Checkliste erbliche Belastung — nicht durchgeführt

-------

**English**

-------

Profile: [BIH Senologie Checkliste Erbliche Belastung](StructureDefinition-senologie-checkliste-erbliche-belastung.md)

**status**: Final

**code**: Risk assessment

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2024-03-10

**value**: false



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Example-Checkliste-Erbliche-Belastung-Nein",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-checkliste-erbliche-belastung"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "225338004",
      "display" : "Risk assessment"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2024-03-10",
  "valueBoolean" : false
}

```
