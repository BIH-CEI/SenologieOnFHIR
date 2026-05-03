# BIH PR Seno Genexpressionstest - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH PR Seno Genexpressionstest**

## Resource Profile: BIH PR Seno Genexpressionstest 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Genexpressionstest |

 
RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation. 

**Usages:**

* Examples for this Profile: [RiskAssessment/Fall1-Genexpressionstest](RiskAssessment-Fall1-Genexpressionstest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-genexpressionstest)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-genexpressionstest.csv), [Excel](StructureDefinition-senologie-genexpressionstest.xlsx), [Schematron](StructureDefinition-senologie-genexpressionstest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-genexpressionstest",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest",
  "version" : "0.1.0",
  "name" : "Senologie_Genexpressionstest",
  "title" : "BIH PR Seno Genexpressionstest",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "openehr",
    "uri" : "http://openehr.org",
    "name" : "Open EHR Archetype Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "RiskAssessment",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/RiskAssessment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "RiskAssessment",
      "path" : "RiskAssessment"
    },
    {
      "id" : "RiskAssessment.status",
      "path" : "RiskAssessment.status",
      "short" : "Abgeschlossene Risikobewertung",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.method",
      "path" : "RiskAssessment.method",
      "short" : "Art des Genexpressionstests",
      "comment" : "Oncotype DX, MammaPrint, Prosigna oder EndoPredict",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-genexpressionstest"
      }
    },
    {
      "id" : "RiskAssessment.subject",
      "path" : "RiskAssessment.subject",
      "short" : "Patientin",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.occurrence[x]",
      "path" : "RiskAssessment.occurrence[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RiskAssessment.occurrence[x]:occurrenceDateTime",
      "path" : "RiskAssessment.occurrence[x]",
      "sliceName" : "occurrenceDateTime",
      "short" : "Datum der Risikobewertung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.condition",
      "path" : "RiskAssessment.condition",
      "short" : "Zugehörige Mammakarzinom-Diagnose",
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.performer",
      "path" : "RiskAssessment.performer",
      "short" : "Durchführendes Labor / Arzt",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.basis",
      "path" : "RiskAssessment.basis",
      "short" : "Referenz zur Score-Observation",
      "comment" : "Referenz auf Senologie_Genexpressions_Score mit dem numerischen Testergebnis",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Observation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.prediction",
      "path" : "RiskAssessment.prediction",
      "short" : "Risikoprädiktion",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.prediction.outcome",
      "path" : "RiskAssessment.prediction.outcome",
      "short" : "Vorhergesagtes Ergebnis",
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.prediction.outcome.text",
      "path" : "RiskAssessment.prediction.outcome.text",
      "short" : "Risiko eines Fernrezidivs",
      "fixedString" : "Fernrezidiv"
    },
    {
      "id" : "RiskAssessment.prediction.probability[x]",
      "path" : "RiskAssessment.prediction.probability[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RiskAssessment.prediction.probability[x]:probabilityDecimal",
      "path" : "RiskAssessment.prediction.probability[x]",
      "sliceName" : "probabilityDecimal",
      "short" : "Fernrezidivrisiko in Prozent",
      "comment" : "10-Jahres-Fernrezidivrisiko als Dezimalwert (z.B. 0.12 für 12%)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.prediction.qualitativeRisk",
      "path" : "RiskAssessment.prediction.qualitativeRisk",
      "short" : "Risikoklasse",
      "comment" : "Oncotype DX: low (0–10), intermediate (11–25), high (≥26). MammaPrint: low (>0.0), high (≤0.0). Prosigna: low (≤40), intermediate (41–60), high (>60). EndoPredict: low (<3.3), high (≥3.3).",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-risikoklasse"
      }
    },
    {
      "id" : "RiskAssessment.prediction.when[x]",
      "path" : "RiskAssessment.prediction.when[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RiskAssessment.prediction.when[x]:whenRange",
      "path" : "RiskAssessment.prediction.when[x]",
      "sliceName" : "whenRange",
      "short" : "Prognosezeitraum",
      "comment" : "Typisch 10 Jahre (z.B. low=0, high=10, unit=a)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Range"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RiskAssessment.note",
      "path" : "RiskAssessment.note",
      "short" : "Anmerkungen zur Risikobewertung"
    }]
  }
}

```
