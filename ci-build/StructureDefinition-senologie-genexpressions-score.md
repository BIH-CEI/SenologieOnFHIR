# BIH PR Seno Genexpressions-Score - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH PR Seno Genexpressions-Score**

## Resource Profile: BIH PR Seno Genexpressions-Score 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressions-score | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Genexpressions_Score |

 
Observation für den numerischen Score-Wert eines Genexpressionstests (Oncotype DX Recurrence Score, MammaPrint Index, Prosigna ROR Score, EndoPredict EPclin Score) 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Genexpressions-Score](Observation-Fall1-Genexpressions-Score.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-genexpressions-score)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-genexpressions-score.csv), [Excel](StructureDefinition-senologie-genexpressions-score.xlsx), [Schematron](StructureDefinition-senologie-genexpressions-score.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-genexpressions-score",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressions-score",
  "version" : "0.1.0",
  "name" : "Senologie_Genexpressions_Score",
  "title" : "BIH PR Seno Genexpressions-Score",
  "status" : "draft",
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Observation für den numerischen Score-Wert eines Genexpressionstests (Oncotype DX Recurrence Score, MammaPrint Index, Prosigna ROR Score, EndoPredict EPclin Score)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
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
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Abgeschlossener Befund",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.category:laboratory",
      "path" : "Observation.category",
      "sliceName" : "laboratory",
      "short" : "Laboruntersuchung",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "laboratory"
        }]
      }
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Art des Genexpressionstests",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Observation.code.coding:genexpressionstest",
      "path" : "Observation.code.coding",
      "sliceName" : "genexpressionstest",
      "short" : "Genexpressionstest-Typ",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-genexpressionstest"
      }
    },
    {
      "id" : "Observation.code.coding:loinc",
      "path" : "Observation.code.coding",
      "sliceName" : "loinc",
      "short" : "LOINC Code",
      "comment" : "Prosigna ROR Score: LOINC 76544-6. Für andere Tests ggf. nicht verfügbar.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding:loinc.system",
      "path" : "Observation.code.coding.system",
      "fixedUri" : "http://loinc.org"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patientin",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
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
      "id" : "Observation.effective[x]:effectiveDateTime",
      "path" : "Observation.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Datum des Testergebnisses",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Durchführendes Labor",
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.value[x]:valueQuantity",
      "path" : "Observation.value[x]",
      "sliceName" : "valueQuantity",
      "short" : "Numerischer Score-Wert",
      "comment" : "Oncotype DX: 0–100 (Recurrence Score). MammaPrint: -1.0 bis +1.0 (70-Gene Index). Prosigna: 0–100 (ROR Score). EndoPredict: kontinuierlich (EPclin Score).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueQuantity.value",
      "path" : "Observation.value[x].value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueQuantity.system",
      "path" : "Observation.value[x].system",
      "fixedUri" : "http://unitsofmeasure.org"
    },
    {
      "id" : "Observation.value[x]:valueQuantity.code",
      "path" : "Observation.value[x].code",
      "short" : "Einheitenloser Score",
      "fixedCode" : "1"
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Anmerkungen zum Testergebnis"
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "Testmethode",
      "comment" : "Genexpressions-Analyse",
      "mustSupport" : true
    },
    {
      "id" : "Observation.method.text",
      "path" : "Observation.method.text",
      "short" : "Freitext zur Methode"
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "short" : "Tumorgewebe-Probe"
    }]
  }
}

```
