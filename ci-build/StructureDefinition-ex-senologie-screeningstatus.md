# Screeningstatus - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Screeningstatus**

## Extension: Screeningstatus 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_Screeningstatus |

Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)
* Examples for this Extension: [ResearchSubject/Example-Studienteilnahme](ResearchSubject-Example-Studienteilnahme.md) and [ResearchSubject/Fall2-Studienteilnahme](ResearchSubject-Fall2-Studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-screeningstatus)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-screeningstatus.csv), [Excel](StructureDefinition-ex-senologie-screeningstatus.xlsx), [Schematron](StructureDefinition-ex-senologie-screeningstatus.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-screeningstatus",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus",
  "version" : "0.1.0",
  "name" : "EX_Senologie_Screeningstatus",
  "title" : "Screeningstatus",
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
  "description" : "Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject",
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
      "short" : "Screeningstatus",
      "definition" : "Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-screeningstatus"
      }
    }]
  }
}

```
