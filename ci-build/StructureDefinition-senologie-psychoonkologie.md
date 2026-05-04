# BIH Senologie Psychoonkologische Mitbetreuung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Psychoonkologische Mitbetreuung**

## Resource Profile: BIH Senologie Psychoonkologische Mitbetreuung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-psychoonkologie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Psychoonkologie |

 
Procedure fuer psychoonkologische Mitbetreuung (OncoBox KB-9). status=completed + performedDateTime zeigt 'erfolgt=ja' an, status=not-done zeigt 'erfolgt=nein' an. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-psychoonkologie)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-psychoonkologie.csv), [Excel](StructureDefinition-senologie-psychoonkologie.xlsx), [Schematron](StructureDefinition-senologie-psychoonkologie.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-psychoonkologie",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-psychoonkologie",
  "version" : "0.1.0",
  "name" : "Senologie_Psychoonkologie",
  "title" : "BIH Senologie Psychoonkologische Mitbetreuung",
  "status" : "draft",
  "date" : "2026-05-04T06:23:23+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Procedure fuer psychoonkologische Mitbetreuung (OncoBox KB-9). status=completed + performedDateTime zeigt 'erfolgt=ja' an, status=not-done zeigt 'erfolgt=nein' an.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Durchfuehrungsstatus",
      "comment" : "completed = psychoonkologische Anbindung erfolgt (KB-9: 1=ja), not-done = nicht erfolgt (KB-9: 0=nein)",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.code",
      "path" : "Procedure.code",
      "short" : "Psychoonkologische Mitbetreuung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "160967006",
          "display" : "Psychotherapy (procedure)"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.subject",
      "path" : "Procedure.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.performed[x]",
      "path" : "Procedure.performed[x]",
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
      "id" : "Procedure.performed[x]:performedDateTime",
      "path" : "Procedure.performed[x]",
      "sliceName" : "performedDateTime",
      "short" : "Datum des ersten psychoonkologischen Kontakts",
      "comment" : "OncoBox: Psych_Datum. Nur bei status=completed relevant.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Bezogene Diagnose",
      "mustSupport" : true
    }]
  }
}

```
