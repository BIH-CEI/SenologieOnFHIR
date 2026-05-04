# BIH Senologie Ki-67 Proliferationsindex - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Ki-67 Proliferationsindex**

## Resource Profile: BIH Senologie Ki-67 Proliferationsindex 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Ki67_Proliferationsindex |

 
Ki-67-Proliferationsindex (%) aus immunhistochemischer Untersuchung. Kein MII-Onko-Profil vorhanden — senologiespezifisch, orientiert am MII ER/PR-Muster (LOINC-Code + valueQuantity %). 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-ki67-proliferationsindex)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-ki67-proliferationsindex.csv), [Excel](StructureDefinition-senologie-ki67-proliferationsindex.xlsx), [Schematron](StructureDefinition-senologie-ki67-proliferationsindex.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-ki67-proliferationsindex",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex",
  "version" : "0.1.0",
  "name" : "Senologie_Ki67_Proliferationsindex",
  "title" : "BIH Senologie Ki-67 Proliferationsindex",
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
  "description" : "Ki-67-Proliferationsindex (%) aus immunhistochemischer Untersuchung. Kein MII-Onko-Profil vorhanden — senologiespezifisch, orientiert am MII ER/PR-Muster (LOINC-Code + valueQuantity %).",
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
      "short" : "Abgeschlossene Messung",
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
      "short" : "Ki-67-Proliferationsindex",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "29593-1",
        "display" : "Cells.Ki-67 nuclear Ag/cells in Tissue by Immune stain"
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
      "short" : "Datum der immunhistochemischen Untersuchung",
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
      "short" : "Ki-67 Index (%)",
      "comment" : "Anteil Ki-67-positiver Tumorzellen in Prozent",
      "type" : [{
        "code" : "Quantity"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x].unit",
      "path" : "Observation.value[x].unit",
      "patternString" : "%"
    },
    {
      "id" : "Observation.value[x].system",
      "path" : "Observation.value[x].system",
      "patternUri" : "http://unitsofmeasure.org"
    },
    {
      "id" : "Observation.value[x].code",
      "path" : "Observation.value[x].code",
      "patternCode" : "%"
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "short" : "Untersuchtes Praeparat"
    }]
  }
}

```
