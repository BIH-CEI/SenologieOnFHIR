# Geplante OP-Dauer - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Geplante OP-Dauer**

## Extension: Geplante OP-Dauer 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_OperationsDuration |

Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie OP Planung](StructureDefinition-senologie-op-planung.md)
* Examples for this Extension: [ServiceRequest/Fall1-OP-Planung](ServiceRequest-Fall1-OP-Planung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-operations-duration)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-operations-duration.csv), [Excel](StructureDefinition-ex-senologie-operations-duration.xlsx), [Schematron](StructureDefinition-ex-senologie-operations-duration.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-operations-duration",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration",
  "version" : "0.1.0",
  "name" : "EX_Senologie_OperationsDuration",
  "title" : "Geplante OP-Dauer",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element",
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
      "short" : "Geplante OP-Dauer",
      "definition" : "Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Duration"
      }]
    }]
  }
}

```
