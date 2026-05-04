# BIH Senologie Studienteilnahme - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Studienteilnahme**

## Resource Profile: BIH Senologie Studienteilnahme 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-studienteilnahme | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Studienteilnahme |

 
ResearchSubject für klinische Studienteilnahme in der Senologie aus dotbase Questionnaire 'Studien'. Bildet Studienname, Screeningstatus, Studienscreening, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab. 

**Usages:**

* Examples for this Profile: [ResearchSubject/Example-Studienteilnahme](ResearchSubject-Example-Studienteilnahme.md) and [ResearchSubject/Fall2-Studienteilnahme](ResearchSubject-Fall2-Studienteilnahme.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-studienteilnahme)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-studienteilnahme.csv), [Excel](StructureDefinition-senologie-studienteilnahme.xlsx), [Schematron](StructureDefinition-senologie-studienteilnahme.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-studienteilnahme",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-studienteilnahme",
  "version" : "0.1.0",
  "name" : "Senologie_Studienteilnahme",
  "title" : "BIH Senologie Studienteilnahme",
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
  "description" : "ResearchSubject für klinische Studienteilnahme in der Senologie aus dotbase Questionnaire 'Studien'. Bildet Studienname, Screeningstatus, Studienscreening, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "BRIDG5.1",
    "uri" : "https://bridgmodel.nci.nih.gov",
    "name" : "BRIDG 5.1 Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ResearchSubject",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ResearchSubject",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ResearchSubject",
      "path" : "ResearchSubject"
    },
    {
      "id" : "ResearchSubject.extension",
      "path" : "ResearchSubject.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "ResearchSubject.extension:Screeningstatus",
      "path" : "ResearchSubject.extension",
      "sliceName" : "Screeningstatus",
      "short" : "Screeningstatus",
      "comment" : "Aus dotbase: Screeningstatus der Studienteilnahme",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus"]
      }]
    },
    {
      "id" : "ResearchSubject.extension:Studienscreening",
      "path" : "ResearchSubject.extension",
      "sliceName" : "Studienscreening",
      "short" : "Screening zur Studienteilnahme (K03)",
      "comment" : "OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Mapping auf Stud_Screening (0=nein, 1=ja)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening"]
      }]
    },
    {
      "id" : "ResearchSubject.extension:StudiennameCode",
      "path" : "ResearchSubject.extension",
      "sliceName" : "StudiennameCode",
      "short" : "Studienname aus Auswahlliste (K02)",
      "comment" : "OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt study.display um einen strukturierten Code.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code"]
      }]
    },
    {
      "id" : "ResearchSubject.extension:Kontakt",
      "path" : "ResearchSubject.extension",
      "sliceName" : "Kontakt",
      "short" : "Kontaktperson für die Studie",
      "comment" : "Aus dotbase: Kontakt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt"]
      }]
    },
    {
      "id" : "ResearchSubject.extension:Aufklaerungsdatum",
      "path" : "ResearchSubject.extension",
      "sliceName" : "Aufklaerungsdatum",
      "short" : "Aufklärungsdatum",
      "comment" : "Datum der Aufklärung der Patientin über die Studie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum"]
      }]
    },
    {
      "id" : "ResearchSubject.status",
      "path" : "ResearchSubject.status",
      "short" : "Teilnahmestatus",
      "comment" : "Aus dotbase: Teilnahmestatus der Patientin. Mapping auf ResearchSubject.status (candidate | screening | eligible | on-study | on-study-intervention | on-study-observation | withdrawn | follow-up | off-study | not-registered)",
      "mustSupport" : true
    },
    {
      "id" : "ResearchSubject.period",
      "path" : "ResearchSubject.period",
      "short" : "Teilnahmezeitraum",
      "mustSupport" : true
    },
    {
      "id" : "ResearchSubject.study",
      "path" : "ResearchSubject.study",
      "short" : "Referenz auf die klinische Studie",
      "comment" : "Enthält den Studiennamen als display oder Referenz auf eine ResearchStudy-Ressource. Für OncoBox 2.0 K02: Studienname aus Auswahlliste via study.display oder ResearchStudy.title",
      "mustSupport" : true
    },
    {
      "id" : "ResearchSubject.individual",
      "path" : "ResearchSubject.individual",
      "short" : "Patientin",
      "mustSupport" : true
    },
    {
      "id" : "ResearchSubject.assignedArm",
      "path" : "ResearchSubject.assignedArm",
      "short" : "Studienarm",
      "comment" : "Aus dotbase: Studienarm der Patientin",
      "mustSupport" : true
    },
    {
      "id" : "ResearchSubject.consent",
      "path" : "ResearchSubject.consent",
      "short" : "Einwilligung / Aufklärung",
      "mustSupport" : true
    }]
  }
}

```
