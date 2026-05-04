# Studienname (kodiert) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Studienname (kodiert)**

## Extension: Studienname (kodiert) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_StudiennameCode |

OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt die study-Referenz um einen strukturierten Code für die OncoBox-Meldung.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-studienname-code)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-studienname-code.csv), [Excel](StructureDefinition-ex-senologie-studienname-code.xlsx), [Schematron](StructureDefinition-ex-senologie-studienname-code.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-studienname-code",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code",
  "version" : "0.1.0",
  "name" : "EX_Senologie_StudiennameCode",
  "title" : "Studienname (kodiert)",
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
  "description" : "OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt die study-Referenz um einen strukturierten Code für die OncoBox-Meldung.",
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
      "short" : "Studienname (kodiert)",
      "definition" : "OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt die study-Referenz um einen strukturierten Code für die OncoBox-Meldung."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-studienname"
      }
    }]
  }
}

```
