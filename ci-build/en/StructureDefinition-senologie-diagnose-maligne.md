# BIH PR Seno Diagnose Maligne - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH PR Seno Diagnose Maligne**

## Resource Profile: BIH PR Seno Diagnose Maligne 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Diagnose_Maligne |

 
Maligne Mamma-Diagnosen (C50, D05) für Krebsregister-Meldung. Basiert auf MII PR Onko Diagnose Primärtumor mit oBDS-konformer Diagnosesicherung und Staging. 

**Usages:**

* Use this Profile: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Refer to this Profile: [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md)
* Examples for this Profile: [Condition/Example-Diagnose-DCIS](Condition-Example-Diagnose-DCIS.md), [Condition/Example-Diagnose-Mammakarzinom](Condition-Example-Diagnose-Mammakarzinom.md), [Condition/Example-Diagnose-Rezidiv](Condition-Example-Diagnose-Rezidiv.md), [Condition/Fall1-Diagnose-Mammakarzinom](Condition-Fall1-Diagnose-Mammakarzinom.md)... Show 15 more, [Condition/Fall10-Diagnose-Mammakarzinom](Condition-Fall10-Diagnose-Mammakarzinom.md), [Condition/Fall12-Diagnose-ADH](Condition-Fall12-Diagnose-ADH.md), [Condition/Fall13-Diagnose-Links](Condition-Fall13-Diagnose-Links.md), [Condition/Fall13-Diagnose-Rechts](Condition-Fall13-Diagnose-Rechts.md), [Condition/Fall14-Diagnose-Mammakarzinom](Condition-Fall14-Diagnose-Mammakarzinom.md), [Condition/Fall15-Diagnose-Mammakarzinom](Condition-Fall15-Diagnose-Mammakarzinom.md), [Condition/Fall2-Diagnose-Mammakarzinom](Condition-Fall2-Diagnose-Mammakarzinom.md), [Condition/Fall2-Diagnose-Progression](Condition-Fall2-Diagnose-Progression.md), [Condition/Fall3-Diagnose-Mammakarzinom](Condition-Fall3-Diagnose-Mammakarzinom.md), [Condition/Fall4-Diagnose-Mammakarzinom](Condition-Fall4-Diagnose-Mammakarzinom.md), [Condition/Fall5-Diagnose-Mammakarzinom](Condition-Fall5-Diagnose-Mammakarzinom.md), [Condition/Fall6-Diagnose-DCIS](Condition-Fall6-Diagnose-DCIS.md), [Condition/Fall7-Diagnose-Mammakarzinom](Condition-Fall7-Diagnose-Mammakarzinom.md), [Condition/Fall8-Diagnose-Mammakarzinom](Condition-Fall8-Diagnose-Mammakarzinom.md) and [Condition/Fall9-Diagnose-Mammakarzinom](Condition-Fall9-Diagnose-Mammakarzinom.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-diagnose-maligne.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-diagnose-maligne.csv), [Excel](../StructureDefinition-senologie-diagnose-maligne.xlsx), [Schematron](../StructureDefinition-senologie-diagnose-maligne.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-diagnose-maligne",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
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
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-09-15"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne",
  "version" : "0.10.0",
  "name" : "Senologie_Diagnose_Maligne",
  "title" : "BIH PR Seno Diagnose Maligne",
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
  "description" : "Maligne Mamma-Diagnosen (C50, D05) für Krebsregister-Meldung. Basiert auf MII PR Onko Diagnose Primärtumor mit oBDS-konformer Diagnosesicherung und Staging.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Diagnose"
  },
  {
    "identity" : "MII-FHIR-to-MVGenomSeq",
    "name" : "Onkologie LogicalModel MII Onkologie Mapping"
  },
  {
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "LogicalModel",
    "name" : "FHIR-Profil zu LogicalModel Mapping"
  },
  {
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
  "type" : "Condition",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    },
    {
      "id" : "Condition.category",
      "path" : "Condition.category",
      "mustSupport" : true
    },
    {
      "id" : "Condition.category:tumormanifestation",
      "path" : "Condition.category",
      "sliceName" : "tumormanifestation",
      "short" : "Tumormanifestation (Primärtumor/Rezidiv/LK/FM)",
      "definition" : "Klassifikation der Tumormanifestation bei Diagnosestellung. Mehrfachauswahl möglich, z.B. Primärtumor + regionäre Lymphknotenmetastasen.",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumormanifestation"
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Diagnose.Tumormanifestation"
      }]
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "short" : "Diagnose",
      "definition" : "Diagnosestellung für Mamma-Erkrankungen",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Diagnose.Diagnosekode"
      }]
    },
    {
      "id" : "Condition.code.coding:sct",
      "path" : "Condition.code.coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Diagnose",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-sct"
      }
    },
    {
      "id" : "Condition.code.coding:icd11",
      "path" : "Condition.code.coding",
      "sliceName" : "icd11",
      "short" : "ICD-11 Code (optional, Dual-Coding)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://id.who.int/icd/release/11/mms"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd11.system",
      "path" : "Condition.code.coding.system",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:icd11.code",
      "path" : "Condition.code.coding.code",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:senologie",
      "path" : "Condition.code.coding",
      "sliceName" : "senologie",
      "short" : "Senologie-spezifischer Code",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-lokal"
      }
    },
    {
      "id" : "Condition.code.coding:senologie.system",
      "path" : "Condition.code.coding.system",
      "patternUri" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose"
    },
    {
      "id" : "Condition.stage",
      "path" : "Condition.stage",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      },
      "short" : "Grad/Stadium der Mammaerkrankung",
      "mustSupport" : true
    },
    {
      "id" : "Condition.stage.summary",
      "path" : "Condition.stage.summary",
      "short" : "Grad",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Diagnose.Grad"
      }]
    },
    {
      "id" : "Condition.stage:metastasis",
      "path" : "Condition.stage",
      "sliceName" : "metastasis",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Condition.stage:metastasis.summary",
      "path" : "Condition.stage.summary",
      "short" : "Metastasierungsstadium",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Diagnose.Metastasierungsstadium"
      }]
    },
    {
      "id" : "Condition.stage:metastasis.type",
      "path" : "Condition.stage.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "385349001",
          "display" : "Clinical stage (observable entity)"
        }]
      }
    }]
  }
}

```
