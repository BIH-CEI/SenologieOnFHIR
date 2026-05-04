# Kontaktperson Studie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kontaktperson Studie**

## Extension: Kontaktperson Studie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Studienkontakt |

Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)
* Examples for this Extension: [ResearchSubject/Example-Studienteilnahme](ResearchSubject-Example-Studienteilnahme.md) and [ResearchSubject/Fall2-Studienteilnahme](ResearchSubject-Fall2-Studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-studienkontakt)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-studienkontakt.csv), [Excel](StructureDefinition-ex-senologie-studienkontakt.xlsx), [Schematron](StructureDefinition-ex-senologie-studienkontakt.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-studienkontakt",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Studienkontakt",
  "title" : "Kontaktperson Studie",
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
  "description" : "Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject",
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
      "short" : "Kontaktperson Studie",
      "definition" : "Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
