# Fall 1: Oncotype DX Recurrence Score 18 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Oncotype DX Recurrence Score 18**

## Example Observation: Fall 1: Oncotype DX Recurrence Score 18

Profile: [BIH PR Seno Genexpressions-Score](StructureDefinition-senologie-genexpressions-score.md)

**status**: Final

**category**: Laboratory

**code**: Oncotype DX

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-25

**value**: 18 Score (Details: UCUM code1 = '1')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Genexpressions-Score",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressions-score"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest",
      "code" : "oncotype-dx",
      "display" : "Oncotype DX"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-25",
  "valueQuantity" : {
    "value" : 18,
    "unit" : "Score",
    "system" : "http://unitsofmeasure.org",
    "code" : "1"
  }
}

```
