# Präoperative Markierung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Präoperative Markierung**

## Extension: Präoperative Markierung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_PreOpMarkierung |

Präoperative Markierung geplant — ServiceRequest hat kein usedCode

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie OP Planung](StructureDefinition-senologie-op-planung.md)
* Examples for this Extension: [ServiceRequest/Fall1-OP-Planung](ServiceRequest-Fall1-OP-Planung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-pre-op-markierung)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-pre-op-markierung.csv), [Excel](StructureDefinition-ex-senologie-pre-op-markierung.xlsx), [Schematron](StructureDefinition-ex-senologie-pre-op-markierung.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-pre-op-markierung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung",
  "version" : "0.1.0",
  "name" : "EX_Senologie_PreOpMarkierung",
  "title" : "Präoperative Markierung",
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
  "description" : "Präoperative Markierung geplant — ServiceRequest hat kein usedCode",
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
      "short" : "Präoperative Markierung",
      "definition" : "Präoperative Markierung geplant — ServiceRequest hat kein usedCode"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
