# BIH Senologie Familienanamnese - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Familienanamnese**

## Resource Profile: BIH Senologie Familienanamnese 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Familienanamnese |

 
FamilyMemberHistory für familiäre Belastung mit Mamma- und Ovarialkarzinom aus dotbase Questionnaire 'Familienanamnese' 

**Usages:**

* Examples for this Profile: [FamilyMemberHistory/Fall1-Familienanamnese](FamilyMemberHistory-Fall1-Familienanamnese.md), [FamilyMemberHistory/Fall10-Familienanamnese-Mutter](FamilyMemberHistory-Fall10-Familienanamnese-Mutter.md) and [FamilyMemberHistory/Fall10-Familienanamnese-Schwester](FamilyMemberHistory-Fall10-Familienanamnese-Schwester.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-familienanamnese)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-familienanamnese.csv), [Excel](StructureDefinition-senologie-familienanamnese.xlsx), [Schematron](StructureDefinition-senologie-familienanamnese.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-familienanamnese",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese",
  "version" : "0.1.0",
  "name" : "Senologie_Familienanamnese",
  "title" : "BIH Senologie Familienanamnese",
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
  "description" : "FamilyMemberHistory für familiäre Belastung mit Mamma- und Ovarialkarzinom aus dotbase Questionnaire 'Familienanamnese'",
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
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "FamilyMemberHistory",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "FamilyMemberHistory",
      "path" : "FamilyMemberHistory"
    },
    {
      "id" : "FamilyMemberHistory.status",
      "path" : "FamilyMemberHistory.status",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.patient",
      "path" : "FamilyMemberHistory.patient",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.relationship",
      "path" : "FamilyMemberHistory.relationship",
      "short" : "Verwandtschaftsgrad",
      "comment" : "Aus dotbase: Mutter, Schwester, Tante, Großmutter etc.",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.age[x]",
      "path" : "FamilyMemberHistory.age[x]",
      "short" : "Alter des Familienmitglieds",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.note",
      "path" : "FamilyMemberHistory.note",
      "short" : "Weitere familiäre Belastung (Freitext)"
    },
    {
      "id" : "FamilyMemberHistory.condition",
      "path" : "FamilyMemberHistory.condition",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      },
      "short" : "Erkrankung des Familienmitglieds",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition:mammakarzinom",
      "path" : "FamilyMemberHistory.condition",
      "sliceName" : "mammakarzinom",
      "short" : "Mammakarzinom in der Familie",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition:mammakarzinom.code",
      "path" : "FamilyMemberHistory.condition.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "254837009",
          "display" : "Malignant neoplasm of breast"
        }]
      }
    },
    {
      "id" : "FamilyMemberHistory.condition:mammakarzinom.onset[x]",
      "path" : "FamilyMemberHistory.condition.onset[x]",
      "short" : "Erkrankungsalter",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition:ovarialkarzinom",
      "path" : "FamilyMemberHistory.condition",
      "sliceName" : "ovarialkarzinom",
      "short" : "Ovarialkarzinom in der Familie",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "FamilyMemberHistory.condition:ovarialkarzinom.code",
      "path" : "FamilyMemberHistory.condition.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "363443007",
          "display" : "Malignant tumor of ovary"
        }]
      }
    },
    {
      "id" : "FamilyMemberHistory.condition:ovarialkarzinom.onset[x]",
      "path" : "FamilyMemberHistory.condition.onset[x]",
      "short" : "Erkrankungsalter",
      "mustSupport" : true
    }]
  }
}

```
