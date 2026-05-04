# SNOMED CT to oBDS Seitenlokalisation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Seitenlokalisation**

## ConceptMap: SNOMED CT to oBDS Seitenlokalisation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-seitenlokalisation",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Seitenlokalisation",
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
  "description" : "Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation",
    "element" : [{
      "code" : "24028007",
      "display" : "Right (qualifier value)",
      "target" : [{
        "code" : "R",
        "display" : "rechts",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "7771000",
      "display" : "Left (qualifier value)",
      "target" : [{
        "code" : "L",
        "display" : "links",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "51440002",
      "display" : "Right and left (qualifier value)",
      "target" : [{
        "code" : "B",
        "display" : "beidseitig",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "260528009",
      "display" : "Median (qualifier value)",
      "target" : [{
        "code" : "M",
        "display" : "Mittellinie/mittig",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "261665006",
      "display" : "Unknown (qualifier value)",
      "target" : [{
        "code" : "U",
        "display" : "unbekannt",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "385432009",
      "display" : "Not applicable (qualifier value)",
      "target" : [{
        "code" : "T",
        "display" : "trifft nicht zu",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
