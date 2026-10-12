# Checkliste erbliche Belastung — durchgeführt (Score 3) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Checkliste erbliche Belastung — durchgeführt (Score 3)**

##  Observation: Checkliste erbliche Belastung — durchgeführt (Score 3)

-------

**German**

-------

Profil: [BIH Senologie Checkliste Erbliche Belastung](StructureDefinition-senologie-checkliste-erbliche-belastung.md)

**status**: Final

**code**: Risk assessment

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2024-03-10

**value**: true

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Score | 3 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Example-Checkliste-Erbliche-Belastung-Ja",
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
  "valueBoolean" : true,
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "246514001",
        "display" : "Score"
      }]
    },
    "valueInteger" : 3
  }]
}

```
