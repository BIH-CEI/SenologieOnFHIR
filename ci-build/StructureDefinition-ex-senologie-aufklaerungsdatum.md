# Aufklärungsdatum - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Aufklärungsdatum**

## Extension: Aufklärungsdatum 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Aufklaerungsdatum |

Datum der Aufklärung der Patientin über die Studie

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)
* Examples for this Extension: [ResearchSubject/Example-Studienteilnahme](ResearchSubject-Example-Studienteilnahme.md) and [ResearchSubject/Fall2-Studienteilnahme](ResearchSubject-Fall2-Studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-aufklaerungsdatum)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-aufklaerungsdatum.csv), [Excel](StructureDefinition-ex-senologie-aufklaerungsdatum.xlsx), [Schematron](StructureDefinition-ex-senologie-aufklaerungsdatum.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-aufklaerungsdatum",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Aufklaerungsdatum",
  "title" : "Aufklärungsdatum",
  "status" : "draft",
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Datum der Aufklärung der Patientin über die Studie",
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
      "short" : "Aufklärungsdatum",
      "definition" : "Datum der Aufklärung der Patientin über die Studie"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    }]
  }
}

```
