# VS Senologie Systemtherapie Medikation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Systemtherapie Medikation**

## ValueSet: VS Senologie Systemtherapie Medikation (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VS_Senologie_Systemtherapie_Medikation |

 
Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01) 

 **References** 

* [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)
* [Fragebogen: Systemische Therapie](Questionnaire-senologie-systemtherapie.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-systemtherapie-medikation",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Systemtherapie_Medikation",
  "title" : "VS Senologie Systemtherapie Medikation",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01)",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "715958001",
        "display" : "Palbociclib"
      },
      {
        "code" : "732257004",
        "display" : "Ribociclib"
      },
      {
        "code" : "761851004",
        "display" : "Abemaciclib"
      },
      {
        "code" : "387381009",
        "display" : "Methotrexate"
      },
      {
        "code" : "387172005",
        "display" : "Fluorouracil"
      },
      {
        "code" : "386920008",
        "display" : "Gemcitabine"
      },
      {
        "code" : "386906001",
        "display" : "Capecitabine"
      },
      {
        "code" : "372817009",
        "display" : "Doxorubicin"
      },
      {
        "code" : "772118008",
        "display" : "Doxorubicin hydrochloride pegylated liposome"
      },
      {
        "code" : "372715008",
        "display" : "Daunorubicin"
      },
      {
        "code" : "417916005",
        "display" : "Epirubicin"
      },
      {
        "code" : "372539000",
        "display" : "Idarubicin"
      },
      {
        "code" : "386913001",
        "display" : "Mitoxantrone"
      },
      {
        "code" : "386918005",
        "display" : "Docetaxel"
      },
      {
        "code" : "387318005",
        "display" : "Cisplatin"
      },
      {
        "code" : "386905002",
        "display" : "Carboplatin"
      },
      {
        "code" : "387420009",
        "display" : "Cyclophosphamide"
      },
      {
        "code" : "387331000",
        "display" : "Mitomycin"
      },
      {
        "code" : "708166000",
        "display" : "Eribulin"
      }]
    }]
  }
}

```
