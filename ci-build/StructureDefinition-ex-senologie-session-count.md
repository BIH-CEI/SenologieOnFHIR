# Anzahl Bestrahlungssitzungen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Anzahl Bestrahlungssitzungen**

## Extension: Anzahl Bestrahlungssitzungen 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_SessionCount |

Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)
* Examples for this Extension: [Procedure/Example-Strahlentherapie](Procedure-Example-Strahlentherapie.md), [Procedure/Fall1-Strahlentherapie](Procedure-Fall1-Strahlentherapie.md), [Procedure/Fall10-Strahlentherapie](Procedure-Fall10-Strahlentherapie.md), [Procedure/Fall2-Strahlentherapie](Procedure-Fall2-Strahlentherapie.md)... Show 7 more, [Procedure/Fall3-Strahlentherapie](Procedure-Fall3-Strahlentherapie.md), [Procedure/Fall4-Strahlentherapie](Procedure-Fall4-Strahlentherapie.md), [Procedure/Fall5-Strahlentherapie](Procedure-Fall5-Strahlentherapie.md), [Procedure/Fall6-Strahlentherapie](Procedure-Fall6-Strahlentherapie.md), [Procedure/Fall7-Strahlentherapie](Procedure-Fall7-Strahlentherapie.md), [Procedure/Fall8-Strahlentherapie](Procedure-Fall8-Strahlentherapie.md) and [Procedure/Fall9-Strahlentherapie](Procedure-Fall9-Strahlentherapie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-session-count)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-session-count.csv), [Excel](StructureDefinition-ex-senologie-session-count.xlsx), [Schematron](StructureDefinition-ex-senologie-session-count.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-session-count",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count",
  "version" : "0.1.0",
  "name" : "EX_Senologie_SessionCount",
  "title" : "Anzahl Bestrahlungssitzungen",
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
  "description" : "Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Anzahl Bestrahlungssitzungen",
      "definition" : "Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    }]
  }
}

```
