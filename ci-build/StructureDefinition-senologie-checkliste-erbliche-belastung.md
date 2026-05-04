# BIH Senologie Checkliste Erbliche Belastung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Checkliste Erbliche Belastung**

## Resource Profile: BIH Senologie Checkliste Erbliche Belastung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-checkliste-erbliche-belastung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Checkliste_Erbliche_Belastung |

 
Observation für die DKG-Checkliste zur Identifikation erblicher Tumorbelastung (D24/D25). Erfasst ob die Checkliste durchgeführt wurde und ggf. den Score. 

**Usages:**

* Examples for this Profile: [Observation/Example-Checkliste-Erbliche-Belastung-Ja](Observation-Example-Checkliste-Erbliche-Belastung-Ja.md) and [Observation/Example-Checkliste-Erbliche-Belastung-Nein](Observation-Example-Checkliste-Erbliche-Belastung-Nein.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-checkliste-erbliche-belastung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-checkliste-erbliche-belastung.csv), [Excel](StructureDefinition-senologie-checkliste-erbliche-belastung.xlsx), [Schematron](StructureDefinition-senologie-checkliste-erbliche-belastung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-checkliste-erbliche-belastung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-checkliste-erbliche-belastung",
  "version" : "0.1.0",
  "name" : "Senologie_Checkliste_Erbliche_Belastung",
  "title" : "BIH Senologie Checkliste Erbliche Belastung",
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
  "description" : "Observation für die DKG-Checkliste zur Identifikation erblicher Tumorbelastung (D24/D25). Erfasst ob die Checkliste durchgeführt wurde und ggf. den Score.",
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
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Checkliste erbliche Belastung",
      "comment" : "DKG D24/D25: Checkliste zur Identifikation erblicher Tumorbelastung (z.B. nach S3-Leitlinie/AGO)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "445039002",
          "display" : "Assessment using risk assessment tool"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.focus",
      "path" : "Observation.focus",
      "short" : "Verweis auf Familienanamnese",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory"]
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
      "short" : "Datum der Durchführung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Checkliste durchgeführt (D24)",
      "comment" : "true = Checkliste durchgeführt, false = nicht durchgeführt",
      "type" : [{
        "code" : "boolean"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Observation.component:score",
      "path" : "Observation.component",
      "sliceName" : "score",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:score.code",
      "path" : "Observation.component.code",
      "short" : "Score der Checkliste (D25)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "246514001",
          "display" : "Score"
        }]
      }
    },
    {
      "id" : "Observation.component:score.value[x]",
      "path" : "Observation.component.value[x]",
      "short" : "Score-Wert",
      "type" : [{
        "code" : "integer"
      }],
      "mustSupport" : true
    }]
  }
}

```
