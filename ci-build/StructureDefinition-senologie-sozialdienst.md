# BIH Senologie Sozialdienst-Kontakt - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Sozialdienst-Kontakt**

## Resource Profile: BIH Senologie Sozialdienst-Kontakt 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-sozialdienst | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Sozialdienst |

 
Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann. 

**Usages:**

* Examples for this Profile: [Procedure/Fall1-Sozialdienst](Procedure-Fall1-Sozialdienst.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-sozialdienst)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-sozialdienst.csv), [Excel](StructureDefinition-senologie-sozialdienst.xlsx), [Schematron](StructureDefinition-senologie-sozialdienst.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-sozialdienst",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-sozialdienst",
  "version" : "0.1.0",
  "name" : "Senologie_Sozialdienst",
  "title" : "BIH Senologie Sozialdienst-Kontakt",
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
  "description" : "Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Durchgeführt oder nicht durchgeführt",
      "comment" : "completed = Kontakt stattgefunden (L02=ja), not-done = nicht stattgefunden (L02=nein)",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.code",
      "path" : "Procedure.code",
      "short" : "Sozialdienst-Beratung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "310134006",
          "display" : "Social services"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Procedure.subject",
      "path" : "Procedure.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.performed[x]",
      "path" : "Procedure.performed[x]",
      "short" : "Datum des Sozialdienst-Kontakts",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    }]
  }
}

```
