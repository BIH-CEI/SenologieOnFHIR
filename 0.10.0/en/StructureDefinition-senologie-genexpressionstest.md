# BIH PR Seno Genexpressionstest - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH PR Seno Genexpressionstest**

## Resource Profile: BIH PR Seno Genexpressionstest 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Genexpressionstest |

 
RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation. 

**Usages:**

* Use this Profile: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profile: [RiskAssessment/Fall1-Genexpressionstest](RiskAssessment-Fall1-Genexpressionstest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-genexpressionstest.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-genexpressionstest.csv), [Excel](../StructureDefinition-senologie-genexpressionstest.xlsx), [Schematron](../StructureDefinition-senologie-genexpressionstest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-genexpressionstest",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "kds-senologie"
      },
      {
        "url" : "version",
        "valueString" : "0.10.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.senologie.org/fhir"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C4872",
        "display" : "Breast Carcinoma"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest",
  "version" : "0.10.0",
  "name" : "Senologie_Genexpressionstest",
  "title" : "BIH PR Seno Genexpressionstest",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-12",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
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
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Genetik.Genexpressionstest"
  },
  {
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
