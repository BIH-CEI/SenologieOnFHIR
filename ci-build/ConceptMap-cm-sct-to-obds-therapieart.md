# SNOMED CT to oBDS Therapieart - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Therapieart**

## ConceptMap: SNOMED CT to oBDS Therapieart 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-therapieart",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Therapieart",
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
  "description" : "Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ",
    "element" : [{
      "code" : "367336001",
      "display" : "Chemotherapy (procedure)",
      "target" : [{
        "code" : "CH",
        "display" : "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "169413002",
      "display" : "Hormone therapy (procedure)",
      "target" : [{
        "code" : "HO",
        "display" : "Hormontherapie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "897713009",
      "display" : "Immunotherapy (procedure)",
      "target" : [{
        "code" : "IM",
        "display" : "Immun-/Antikoerpertherapie",
        "equivalence" : "narrower",
        "comment" : "SNOMED 897713009 wird sowohl fuer IM als auch fuer CI und CIZ verwendet; hier wird IM als Standardziel gewaehlt"
      }]
    },
    {
      "code" : "1255831008",
      "display" : "Chemotherapy for malignant neoplastic disease using targeted agent (procedure)",
      "target" : [{
        "code" : "ZS",
        "display" : "zielgerichtete Substanzen",
        "equivalence" : "narrower",
        "comment" : "SNOMED 1255831008 wird sowohl fuer ZS als auch CZ verwendet; hier wird ZS als Standardziel gewaehlt"
      }]
    },
    {
      "code" : "1269349006",
      "display" : "Transplantation of stem cell (procedure)",
      "target" : [{
        "code" : "SZ",
        "display" : "Stammzelltransplantation (inkl. Knochenmarktransplantation)",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
