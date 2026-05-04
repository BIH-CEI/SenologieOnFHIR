# SNOMED CT to oBDS Residualstatus - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Residualstatus**

## ConceptMap: SNOMED CT to oBDS Residualstatus 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT UICC R-Klassifikation zu oBDS Residualstatus (R0, R1, R2, RX) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-residualstatus",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Residualstatus",
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
  "description" : "Mapping von SNOMED CT UICC R-Klassifikation zu oBDS Residualstatus (R0, R1, R2, RX)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.uicc.org/resources/r-classification",
    "element" : [{
      "code" : "1352526005",
      "display" : "Union for International Cancer Control R0 (qualifier value)",
      "target" : [{
        "code" : "R0",
        "display" : "Kein Residualtumor",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "1352529003",
      "display" : "Union for International Cancer Control R1 (qualifier value)",
      "target" : [{
        "code" : "R1",
        "display" : "Mikroskopischer Residualtumor",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
