# Tag im Zyklus - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Tag im Zyklus**

## Extension: Tag im Zyklus 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:EX_Senologie_DayInCycle |

Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)
* Examples for this Extension: [MedicationStatement/Example-Medikation-Epirubicin](MedicationStatement-Example-Medikation-Epirubicin.md), [MedicationStatement/Fall10-Medikation-Carboplatin](MedicationStatement-Fall10-Medikation-Carboplatin.md), [MedicationStatement/Fall10-Medikation-Paclitaxel](MedicationStatement-Fall10-Medikation-Paclitaxel.md), [MedicationStatement/Fall2-Medikation-Carboplatin](MedicationStatement-Fall2-Medikation-Carboplatin.md)... Show 11 more, [MedicationStatement/Fall2-Medikation-Paclitaxel](MedicationStatement-Fall2-Medikation-Paclitaxel.md), [MedicationStatement/Fall2-Medikation-Pembrolizumab](MedicationStatement-Fall2-Medikation-Pembrolizumab.md), [MedicationStatement/Fall4-Medikation-Carboplatin](MedicationStatement-Fall4-Medikation-Carboplatin.md), [MedicationStatement/Fall4-Medikation-Docetaxel](MedicationStatement-Fall4-Medikation-Docetaxel.md), [MedicationStatement/Fall4-Medikation-Pertuzumab](MedicationStatement-Fall4-Medikation-Pertuzumab.md), [MedicationStatement/Fall4-Medikation-Trastuzumab](MedicationStatement-Fall4-Medikation-Trastuzumab.md), [MedicationStatement/Fall7-Medikation-Carboplatin](MedicationStatement-Fall7-Medikation-Carboplatin.md), [MedicationStatement/Fall7-Medikation-Epirubicin](MedicationStatement-Fall7-Medikation-Epirubicin.md), [MedicationStatement/Fall7-Medikation-Paclitaxel](MedicationStatement-Fall7-Medikation-Paclitaxel.md), [MedicationStatement/Fall9-Medikation-Epirubicin](MedicationStatement-Fall9-Medikation-Epirubicin.md) and [MedicationStatement/Fall9-Medikation-Paclitaxel](MedicationStatement-Fall9-Medikation-Paclitaxel.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ex-senologie-day-in-cycle)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ex-senologie-day-in-cycle.csv), [Excel](StructureDefinition-ex-senologie-day-in-cycle.xlsx), [Schematron](StructureDefinition-ex-senologie-day-in-cycle.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ex-senologie-day-in-cycle",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle",
  "version" : "0.1.0",
  "name" : "EX_Senologie_DayInCycle",
  "title" : "Tag im Zyklus",
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
  "description" : "Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle",
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
      "short" : "Tag im Zyklus",
      "definition" : "Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle"
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
