# Therapielinie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Therapielinie**

## Extension: Therapielinie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_TherapyLine |

Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.md) and [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-therapy-line)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-therapy-line.csv), [Excel](StructureDefinition-ex-senologie-therapy-line.xlsx), [Schematron](StructureDefinition-ex-senologie-therapy-line.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-therapy-line",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line",
  "version" : "0.1.0",
  "name" : "EX_Senologie_TherapyLine",
  "title" : "Therapielinie",
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
  "description" : "Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent",
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
      "short" : "Therapielinie",
      "definition" : "Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
