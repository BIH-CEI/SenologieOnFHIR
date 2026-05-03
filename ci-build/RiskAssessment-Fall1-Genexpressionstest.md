# Fall 1: Oncotype DX Risikobewertung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Oncotype DX Risikobewertung**

## Example RiskAssessment: Fall 1: Oncotype DX Risikobewertung

Profile: [BIH PR Seno Genexpressionstest](StructureDefinition-senologie-genexpressionstest.md)

**status**: Final

**method**: Oncotype DX

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**occurrence**: 2025-01-25

**condition**: [Condition Malignant neoplasm of breast](Condition-Fall1-Diagnose-Mammakarzinom.md)

**basis**: [Observation Oncotype DX](Observation-Fall1-Genexpressions-Score.md)

### Predictions

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Outcome** | **Probability[x]** | **QualitativeRisk** | **When[x]** |
| * | Fernrezidiv | 0.12 | Low likelihood | 0-10 Jahre |



## Resource Content

```json
{
  "resourceType" : "RiskAssessment",
  "id" : "Fall1-Genexpressionstest",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest"]
  },
  "status" : "final",
  "method" : {
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest",
      "code" : "oncotype-dx",
      "display" : "Oncotype DX"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "occurrenceDateTime" : "2025-01-25",
  "condition" : {
    "reference" : "Condition/Fall1-Diagnose-Mammakarzinom"
  },
  "basis" : [{
    "reference" : "Observation/Fall1-Genexpressions-Score"
  }],
  "prediction" : [{
    "outcome" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399409002",
        "display" : "Distant metastasis present (finding)"
      }],
      "text" : "Fernrezidiv"
    },
    "probabilityDecimal" : 0.12,
    "qualitativeRisk" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/risk-probability",
        "code" : "low",
        "display" : "Low likelihood"
      }]
    },
    "whenRange" : {
      "low" : {
        "value" : 0,
        "unit" : "Jahre",
        "system" : "http://unitsofmeasure.org",
        "code" : "a"
      },
      "high" : {
        "value" : 10,
        "unit" : "Jahre",
        "system" : "http://unitsofmeasure.org",
        "code" : "a"
      }
    }
  }]
}

```
