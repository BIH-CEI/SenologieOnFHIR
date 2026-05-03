# Checkliste erbliche Belastung — nicht durchgeführt - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Checkliste erbliche Belastung — nicht durchgeführt**

## Example Observation: Checkliste erbliche Belastung — nicht durchgeführt

Profile: [BIH Senologie Checkliste Erbliche Belastung](StructureDefinition-senologie-checkliste-erbliche-belastung.md)

**status**: Final

**code**: Assessment using risk assessment tool

**subject**: [Fall1-Patient-Erika-Gabler](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.onkologie@2026.0.3&canonical=http://fhir.org/packages/de.medizininformatikinitiative.kerndatensatz.onkologie/Fall1-Patient-Erika-Gabler)

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
      "code" : "445039002",
      "display" : "Assessment using risk assessment tool"
    }]
  },
  "subject" : {
    "reference" : "Fall1-Patient-Erika-Gabler"
  },
  "effectiveDateTime" : "2024-03-10",
  "valueBoolean" : false
}

```
