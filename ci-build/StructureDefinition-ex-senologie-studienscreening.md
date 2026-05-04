# Screening zur Studienteilnahme - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Screening zur Studienteilnahme**

## Extension: Screening zur Studienteilnahme 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Studienscreening |

OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-studienscreening)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-studienscreening.csv), [Excel](StructureDefinition-ex-senologie-studienscreening.xlsx), [Schematron](StructureDefinition-ex-senologie-studienscreening.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-studienscreening",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Studienscreening",
  "title" : "Screening zur Studienteilnahme",
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
  "description" : "OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus).",
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
      "short" : "Screening zur Studienteilnahme",
      "definition" : "OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
