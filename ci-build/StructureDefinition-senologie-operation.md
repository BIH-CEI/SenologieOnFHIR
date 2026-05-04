# BIH LM Senologie Brustwand-Operation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH LM Senologie Brustwand-Operation**

## Resource Profile: BIH LM Senologie Brustwand-Operation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-operation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Operation |

 
Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation. 

**Usages:**

* Examples for this Profile: [Procedure/Example-Operation-BET](Procedure-Example-Operation-BET.md), [Procedure/Example-Operation-SLNB](Procedure-Example-Operation-SLNB.md), [Procedure/Fall1-Operation-BET](Procedure-Fall1-Operation-BET.md), [Procedure/Fall1-Operation-SLNB](Procedure-Fall1-Operation-SLNB.md)... Show 23 more, [Procedure/Fall10-Operation-Mastektomie-Links](Procedure-Fall10-Operation-Mastektomie-Links.md), [Procedure/Fall10-Operation-Mastektomie-Rechts](Procedure-Fall10-Operation-Mastektomie-Rechts.md), [Procedure/Fall10-Operation-SLNB](Procedure-Fall10-Operation-SLNB.md), [Procedure/Fall10-Rekonstruktion-Links](Procedure-Fall10-Rekonstruktion-Links.md), [Procedure/Fall10-Rekonstruktion-Rechts](Procedure-Fall10-Rekonstruktion-Rechts.md), [Procedure/Fall12-Operation-Nachresektion](Procedure-Fall12-Operation-Nachresektion.md), [Procedure/Fall13-Operation-BET-Links](Procedure-Fall13-Operation-BET-Links.md), [Procedure/Fall13-Operation-Mastektomie-Rechts](Procedure-Fall13-Operation-Mastektomie-Rechts.md), [Procedure/Fall2-Operation-Axilladissektion](Procedure-Fall2-Operation-Axilladissektion.md), [Procedure/Fall2-Operation-Mastektomie](Procedure-Fall2-Operation-Mastektomie.md), [Procedure/Fall3-Operation-Axilladissektion](Procedure-Fall3-Operation-Axilladissektion.md), [Procedure/Fall3-Operation-Mastektomie](Procedure-Fall3-Operation-Mastektomie.md), [Procedure/Fall4-Operation-BET](Procedure-Fall4-Operation-BET.md), [Procedure/Fall4-Operation-SLNB](Procedure-Fall4-Operation-SLNB.md), [Procedure/Fall5-Operation-BET](Procedure-Fall5-Operation-BET.md), [Procedure/Fall5-Operation-SLNB](Procedure-Fall5-Operation-SLNB.md), [Procedure/Fall6-Operation-BET](Procedure-Fall6-Operation-BET.md), [Procedure/Fall7-Operation-BET](Procedure-Fall7-Operation-BET.md), [Procedure/Fall7-Operation-SLNB](Procedure-Fall7-Operation-SLNB.md), [Procedure/Fall8-Operation-Mastektomie](Procedure-Fall8-Operation-Mastektomie.md), [Procedure/Fall8-Operation-SLNB](Procedure-Fall8-Operation-SLNB.md), [Procedure/Fall9-Operation-Axilladissektion](Procedure-Fall9-Operation-Axilladissektion.md) and [Procedure/Fall9-Operation-BET](Procedure-Fall9-Operation-BET.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-operation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-operation.csv), [Excel](StructureDefinition-senologie-operation.xlsx), [Schematron](StructureDefinition-senologie-operation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-operation",
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation",
  "version" : "0.1.0",
  "name" : "Senologie_Operation",
  "title" : "BIH LM Senologie Brustwand-Operation",
  "status" : "draft",
  "date" : "2026-05-04T06:44:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-mamma-operation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.category",
      "path" : "Procedure.category",
      "short" : "Art der Operation",
      "definition" : "Art der Operation Brust, Axillär, Lateralität",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art"
      }
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
      "mustSupport" : true
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
      "mustSupport" : true
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
      "id" : "Procedure.outcome",
      "path" : "Procedure.outcome",
      "short" : "Outcome der Operation, v.a. bei Revision"
    },
    {
      "id" : "Procedure.complication",
      "path" : "Procedure.complication",
      "short" : "Komplikation (oBDS / ICD-10)",
      "comment" : "Verwendet geerbte Slices compl_obds und compl_icd10 vom MII Onko Operation Parent"
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
      "mustSupport" : true
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
      }
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
      }
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
      }
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
          "code" : "183040004",
          "display" : "Mobilization (procedure)"
        }]
      }
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
      }
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
