# SNOMED CT to oBDS Fernmetastasen-Lokalisation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Fernmetastasen-Lokalisation**

## ConceptMap: SNOMED CT to oBDS Fernmetastasen-Lokalisation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*: |

 
Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-fm-lokalisation",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Fernmetastasen-Lokalisation",
  "status" : "draft",
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-fernmetastasen",
    "element" : [{
      "code" : "258332000",
      "display" : "PUL (body structure)",
      "target" : [{
        "code" : "PUL",
        "display" : "Lunge",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258333005",
      "display" : "OSS (body structure)",
      "target" : [{
        "code" : "OSS",
        "display" : "Knochen",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258334004",
      "display" : "HEP (body structure)",
      "target" : [{
        "code" : "HEP",
        "display" : "Leber",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "313367003",
      "display" : "BRA (body structure)",
      "target" : [{
        "code" : "BRA",
        "display" : "Hirn",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258336002",
      "display" : "LYM (body structure)",
      "target" : [{
        "code" : "LYM",
        "display" : "Lymphknoten",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "14016003",
      "display" : "Bone marrow structure (body structure)",
      "target" : [{
        "code" : "MAR",
        "display" : "Knochenmark",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258337006",
      "display" : "PLE (body structure)",
      "target" : [{
        "code" : "PLE",
        "display" : "Pleura",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258338001",
      "display" : "PER (body structure)",
      "target" : [{
        "code" : "PER",
        "display" : "Peritoneum",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258339009",
      "display" : "ADR (body structure)",
      "target" : [{
        "code" : "ADR",
        "display" : "Nebennieren",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258340006",
      "display" : "SKI (body structure)",
      "target" : [{
        "code" : "SKI",
        "display" : "Haut",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258348004",
      "display" : "OTH (body structure)",
      "target" : [{
        "code" : "OTH",
        "display" : "andere Organe",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "405843009",
      "display" : "Widespread metastatic malignant neoplastic disease (disorder)",
      "target" : [{
        "code" : "GEN",
        "display" : "generalisierte Metastasierung",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
