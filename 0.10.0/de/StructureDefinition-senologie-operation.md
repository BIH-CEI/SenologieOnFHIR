# BIH LM Senologie Brustwand-Operation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH LM Senologie Brustwand-Operation**

## : BIH LM Senologie Brustwand-Operation 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-operation | **:0.10.0 |
| Draft | **:Senologie_Operation |

 
Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation. 

**Usages:**

* Use this Profil: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profil: [Procedure/Example-Operation-BET](Procedure-Example-Operation-BET.md), [Procedure/Example-Operation-SLNB](Procedure-Example-Operation-SLNB.md), [Procedure/Fall1-Operation-BET](Procedure-Fall1-Operation-BET.md), [Procedure/Fall1-Operation-SLNB](Procedure-Fall1-Operation-SLNB.md)... Show 24 more, [Procedure/Fall10-Operation-Mastektomie-Links](Procedure-Fall10-Operation-Mastektomie-Links.md), [Procedure/Fall10-Operation-Mastektomie-Rechts](Procedure-Fall10-Operation-Mastektomie-Rechts.md), [Procedure/Fall10-Operation-SLNB](Procedure-Fall10-Operation-SLNB.md), [Procedure/Fall10-Rekonstruktion-Links](Procedure-Fall10-Rekonstruktion-Links.md), [Procedure/Fall10-Rekonstruktion-Rechts](Procedure-Fall10-Rekonstruktion-Rechts.md), [Procedure/Fall12-Operation-Nachresektion](Procedure-Fall12-Operation-Nachresektion.md), [Procedure/Fall13-Operation-BET-Links](Procedure-Fall13-Operation-BET-Links.md), [Procedure/Fall13-Operation-Mastektomie-Rechts](Procedure-Fall13-Operation-Mastektomie-Rechts.md), [Procedure/Fall14-Operation-BET](Procedure-Fall14-Operation-BET.md), [Procedure/Fall2-Operation-Axilladissektion](Procedure-Fall2-Operation-Axilladissektion.md), [Procedure/Fall2-Operation-Mastektomie](Procedure-Fall2-Operation-Mastektomie.md), [Procedure/Fall3-Operation-Axilladissektion](Procedure-Fall3-Operation-Axilladissektion.md), [Procedure/Fall3-Operation-Mastektomie](Procedure-Fall3-Operation-Mastektomie.md), [Procedure/Fall4-Operation-BET](Procedure-Fall4-Operation-BET.md), [Procedure/Fall4-Operation-SLNB](Procedure-Fall4-Operation-SLNB.md), [Procedure/Fall5-Operation-BET](Procedure-Fall5-Operation-BET.md), [Procedure/Fall5-Operation-SLNB](Procedure-Fall5-Operation-SLNB.md), [Procedure/Fall6-Operation-BET](Procedure-Fall6-Operation-BET.md), [Procedure/Fall7-Operation-BET](Procedure-Fall7-Operation-BET.md), [Procedure/Fall7-Operation-SLNB](Procedure-Fall7-Operation-SLNB.md), [Procedure/Fall8-Operation-Mastektomie](Procedure-Fall8-Operation-Mastektomie.md), [Procedure/Fall8-Operation-SLNB](Procedure-Fall8-Operation-SLNB.md), [Procedure/Fall9-Operation-Axilladissektion](Procedure-Fall9-Operation-Axilladissektion.md) and [Procedure/Fall9-Operation-BET](Procedure-Fall9-Operation-BET.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-operation.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-operation",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation",
  "version" : "0.10.0",
  "name" : "Senologie_Operation",
  "title" : "BIH LM Senologie Brustwand-Operation",
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
  "description" : "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Operation"
  },
  {
    "identity" : "oBDS-Organ",
    "name" : "Mapping FHIR zu oBDS (organspezifisches Zusatzmodul)"
  },
  {
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-mamma-operation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure.category",
      "path" : "Procedure.category",
      "short" : "Art der Operation",
      "definition" : "Art der Operation Brust, Axillär, Lateralität",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art"
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Art"
      }]
    },
    {
      "id" : "Procedure.code",
      "path" : "Procedure.code",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Art (OPS/SCT-codiert)"
      }]
    },
    {
      "id" : "Procedure.performed[x]:performedDateTime",
      "path" : "Procedure.performed[x]",
      "sliceName" : "performedDateTime",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Datum",
        "comment" : "OP Datum"
      }]
    },
    {
      "id" : "Procedure.performer",
      "path" : "Procedure.performer",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "function"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.performer:erstoperateur",
      "path" : "Procedure.performer",
      "sliceName" : "erstoperateur",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Erstoperateur"
      }]
    },
    {
      "id" : "Procedure.performer:erstoperateur.function",
      "path" : "Procedure.performer.function",
      "short" : "Erstoperateur (G08)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "304292004",
          "display" : "Surgeon (occupation)"
        }]
      }
    },
    {
      "id" : "Procedure.performer:erstoperateur.actor",
      "path" : "Procedure.performer.actor",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.performer:zweitoperateur",
      "path" : "Procedure.performer",
      "sliceName" : "zweitoperateur",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Zweitoperateur"
      }]
    },
    {
      "id" : "Procedure.performer:zweitoperateur.function",
      "path" : "Procedure.performer.function",
      "short" : "Zweitoperateur (G09)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "309388001",
          "display" : "Surgical assistant (occupation)"
        }]
      }
    },
    {
      "id" : "Procedure.performer:zweitoperateur.actor",
      "path" : "Procedure.performer.actor",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Bezogene Diagnose"
    },
    {
      "id" : "Procedure.bodySite",
      "path" : "Procedure.bodySite",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Seite"
      }]
    },
    {
      "id" : "Procedure.outcome",
      "path" : "Procedure.outcome",
      "short" : "Outcome der Operation, v.a. bei Revision",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Outcome",
        "comment" : "Beurteilung des lokalen Residualstatus nach Abschluss der Operation"
      }]
    },
    {
      "id" : "Procedure.complication",
      "path" : "Procedure.complication",
      "short" : "Komplikation (oBDS / ICD-10)",
      "comment" : "Verwendet geerbte Slices compl_obds und compl_icd10 vom MII Onko Operation Parent",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.Komplikation",
        "comment" : "OP Komplikationen "
      }]
    },
    {
      "id" : "Procedure.followUp",
      "path" : "Procedure.followUp",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen"
      }]
    },
    {
      "id" : "Procedure.followUp:drainage",
      "path" : "Procedure.followUp",
      "sliceName" : "drainage",
      "min" : 0,
      "max" : "*",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "122462000",
          "display" : "Drainage procedure"
        }]
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen.Drainage"
      }]
    },
    {
      "id" : "Procedure.followUp:drainage.coding",
      "path" : "Procedure.followUp.coding",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.followUp:verband",
      "path" : "Procedure.followUp",
      "sliceName" : "verband",
      "min" : 0,
      "max" : "*",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "182531007",
          "display" : "Dressing of wound"
        }]
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen.Verband"
      }]
    },
    {
      "id" : "Procedure.followUp:verband.coding",
      "path" : "Procedure.followUp.coding",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.followUp:antibiotika",
      "path" : "Procedure.followUp",
      "sliceName" : "antibiotika",
      "min" : 0,
      "max" : "*",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "281789004",
          "display" : "Antibiotic therapy (procedure)"
        }]
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen.Antibiotika"
      }]
    },
    {
      "id" : "Procedure.followUp:antibiotika.coding",
      "path" : "Procedure.followUp.coding",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.followUp:mobilisation",
      "path" : "Procedure.followUp",
      "sliceName" : "mobilisation",
      "min" : 0,
      "max" : "*",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "74923002",
          "display" : "Mobilization (procedure)"
        }]
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen.Mobilisation"
      }]
    },
    {
      "id" : "Procedure.followUp:mobilisation.coding",
      "path" : "Procedure.followUp.coding",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.followUp:laborkontrolle",
      "path" : "Procedure.followUp",
      "sliceName" : "laborkontrolle",
      "min" : 0,
      "max" : "*",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "15220000",
          "display" : "Laboratory test (procedure)"
        }]
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Operation.PostoperativeAnordnungen.Laborkontrolle"
      }]
    },
    {
      "id" : "Procedure.followUp:laborkontrolle.coding",
      "path" : "Procedure.followUp.coding",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.usedCode",
      "path" : "Procedure.usedCode",
      "short" : "Verwendete Codes",
      "definition" : "Verwendete Codes für die Operation — erbt IntraoperativesImaging und PraeoperativeMarkierung von MII Mamma"
    }]
  }
}

```
