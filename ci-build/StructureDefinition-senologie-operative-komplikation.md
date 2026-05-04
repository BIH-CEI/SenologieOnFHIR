# BIH Senologie Operative Komplikation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Operative Komplikation**

## Resource Profile: BIH Senologie Operative Komplikation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Operative_Komplikation |

 
Observation für postoperative Komplikationen mit Clavien-Dindo-Klassifikation aus dotbase Questionnaire 'Operative Komplikation(en) V2.0'. Folgt dem MII Prostata Clavien-Dindo Muster (Observation statt AdverseEvent). 

**Usages:**

* Examples for this Profile: [Observation/Fall2-Komplikation-Serom](Observation-Fall2-Komplikation-Serom.md) and [Observation/Fall9-Komplikation-Lymphoedem](Observation-Fall9-Komplikation-Lymphoedem.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-operative-komplikation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-operative-komplikation.csv), [Excel](StructureDefinition-senologie-operative-komplikation.xlsx), [Schematron](StructureDefinition-senologie-operative-komplikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-operative-komplikation",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation",
  "version" : "0.1.0",
  "name" : "Senologie_Operative_Komplikation",
  "title" : "BIH Senologie Operative Komplikation",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Observation für postoperative Komplikationen mit Clavien-Dindo-Klassifikation aus dotbase Questionnaire 'Operative Komplikation(en) V2.0'. Folgt dem MII Prostata Clavien-Dindo Muster (Observation statt AdverseEvent).",
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
      "short" : "Abgeschlossene Komplikationsbewertung",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "short" : "Clavien-Dindo-Klassifikation",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "789279006",
        "display" : "Clavien-Dindo classification grade"
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
      "short" : "Verursachende Operation",
      "comment" : "Reference zur Procedure-Ressource der auslösenden OP",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Procedure"]
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
      "short" : "Datum der Komplikation",
      "comment" : "Aus dotbase: 'Datum der Komplikation'",
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
      "id" : "Observation.value[x]:valueCodeableConcept",
      "path" : "Observation.value[x]",
      "sliceName" : "valueCodeableConcept",
      "short" : "Clavien-Dindo Grad",
      "comment" : "Grade I–V (SNOMED 1367519000–1367527009)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Konsequenzen / Kommentar",
      "comment" : "Aus dotbase: 'Konsequenz' + 'Kommentar' Freitext"
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "Zeitpunkt der Komplikation",
      "comment" : "Aus dotbase: 'Zeitpunkt der Komplikation' (intraoperativ, postoperativ, stationär, ambulant) — ersetzt ehemalige ComplicationTiming-Extension",
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
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:komplikationsart",
      "path" : "Observation.component",
      "sliceName" : "komplikationsart",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Observation.component:komplikationsart.code",
      "path" : "Observation.component.code",
      "short" : "Art der Komplikation",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "116224001",
          "display" : "Complication of procedure"
        }]
      }
    },
    {
      "id" : "Observation.component:komplikationsart.value[x]",
      "path" : "Observation.component.value[x]",
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
      "id" : "Observation.component:komplikationsart.value[x]:valueCodeableConcept",
      "path" : "Observation.component.value[x]",
      "sliceName" : "valueCodeableConcept",
      "short" : "Art der Komplikation",
      "comment" : "Aus dotbase: 'Art der Komplikation' (SNOMED-kodiert)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    }]
  }
}

```
