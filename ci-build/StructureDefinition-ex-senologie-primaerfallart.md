# Primaerfallart - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Primaerfallart**

## Extension: Primaerfallart 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-primaerfallart | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Primaerfallart |

OnkoZert-Primaerfallart als expliziter Override (OncoBox 2.0 D01). Ergänzt die ICD-basierte Ableitung im SM für Fälle wie Rezidiv (Code 3), die nicht aus dem ICD-Prefix ableitbar sind.

**Context of Use**

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-primaerfallart)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-primaerfallart.csv), [Excel](StructureDefinition-ex-senologie-primaerfallart.xlsx), [Schematron](StructureDefinition-ex-senologie-primaerfallart.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-primaerfallart",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-primaerfallart",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Primaerfallart",
  "title" : "Primaerfallart",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "OnkoZert-Primaerfallart als expliziter Override (OncoBox 2.0 D01). Ergänzt die ICD-basierte Ableitung im SM für Fälle wie Rezidiv (Code 3), die nicht aus dem ICD-Prefix ableitbar sind.",
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
      "short" : "Primaerfallart",
      "definition" : "OnkoZert-Primaerfallart als expliziter Override (OncoBox 2.0 D01). Ergänzt die ICD-basierte Ableitung im SM für Fälle wie Rezidiv (Code 3), die nicht aus dem ICD-Prefix ableitbar sind."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-primaerfallart"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-oncobox-primaerfallart"
      }
    }]
  }
}

```
