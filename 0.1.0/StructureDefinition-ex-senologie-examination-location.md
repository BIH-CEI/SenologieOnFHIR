# Standort der Untersuchung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Standort der Untersuchung**

## Extension: Standort der Untersuchung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-examination-location | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_ExaminationLocation |

Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md) and [BIH Senologie Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-examination-location)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-examination-location.csv), [Excel](StructureDefinition-ex-senologie-examination-location.xlsx), [Schematron](StructureDefinition-ex-senologie-examination-location.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-examination-location",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-examination-location",
  "version" : "0.1.0",
  "name" : "EX_Senologie_ExaminationLocation",
  "title" : "Standort der Untersuchung",
  "status" : "draft",
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element",
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
      "short" : "Standort der Untersuchung",
      "definition" : "Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-examination-location"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      },
      {
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Location"]
      }]
    }]
  }
}

```
