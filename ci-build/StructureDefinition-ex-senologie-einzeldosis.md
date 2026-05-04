# Einzeldosis pro Fraktion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Einzeldosis pro Fraktion**

## Extension: Einzeldosis pro Fraktion 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Einzeldosis |

Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)
* Examples for this Extension: [Procedure/Example-Strahlentherapie](Procedure-Example-Strahlentherapie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-einzeldosis)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-einzeldosis.csv), [Excel](StructureDefinition-ex-senologie-einzeldosis.xlsx), [Schematron](StructureDefinition-ex-senologie-einzeldosis.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-einzeldosis",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Einzeldosis",
  "title" : "Einzeldosis pro Fraktion",
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
  "description" : "Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis",
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
      "short" : "Einzeldosis pro Fraktion",
      "definition" : "Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis"
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
