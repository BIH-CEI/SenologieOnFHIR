# SNOMED CT to oBDS Therapie-Stellung zur OP - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Therapie-Stellung zur OP**

## ConceptMap: SNOMED CT to oBDS Therapie-Stellung zur OP 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapiestellung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Codes zu oBDS Stellung zur OP (O, A, N, I, Z, S) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-therapiestellung",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapiestellung",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Therapie-Stellung zur OP",
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
  "description" : "Mapping von SNOMED CT Codes zu oBDS Stellung zur OP (O, A, N, I, Z, S)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-stellungzurop",
    "element" : [{
      "code" : "373846009",
      "display" : "Adjuvant - intent (qualifier value)",
      "target" : [{
        "code" : "A",
        "display" : "adjuvant",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "373847000",
      "display" : "Neo-adjuvant - intent (qualifier value)",
      "target" : [{
        "code" : "N",
        "display" : "neoadjuvant",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "277671009",
      "display" : "Intraoperative (qualifier value)",
      "target" : [{
        "code" : "I",
        "display" : "intraoperativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "260364009",
      "display" : "Additive (qualifier value)",
      "target" : [{
        "code" : "Z",
        "display" : "additiv",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "74964007",
      "display" : "Other (qualifier value)",
      "target" : [{
        "code" : "S",
        "display" : "Sonstiges",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
