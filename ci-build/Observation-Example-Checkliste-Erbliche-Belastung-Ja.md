# Checkliste erbliche Belastung — durchgeführt (Score 3) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Checkliste erbliche Belastung — durchgeführt (Score 3)**

## Example Observation: Checkliste erbliche Belastung — durchgeführt (Score 3)

Profile: [BIH Senologie Checkliste Erbliche Belastung](StructureDefinition-senologie-checkliste-erbliche-belastung.md)

**status**: Final

**code**: Assessment using risk assessment tool

**subject**: [Fall1-Patient-Erika-Gabler](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.onkologie@2026.0.3&canonical=http://fhir.org/packages/de.medizininformatikinitiative.kerndatensatz.onkologie/Fall1-Patient-Erika-Gabler)

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
      "code" : "445039002",
      "display" : "Assessment using risk assessment tool"
    }]
  },
  "subject" : {
    "reference" : "Fall1-Patient-Erika-Gabler"
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
