# SNOMED CT to oBDS Intention - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Intention**

## ConceptMap: SNOMED CT to oBDS Intention 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-intention",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Intention",
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
  "description" : "Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
    "element" : [{
      "code" : "373808002",
      "display" : "Curative - procedure intent (qualifier value)",
      "target" : [{
        "code" : "K",
        "display" : "kurativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "363676003",
      "display" : "Palliative - procedure intent (qualifier value)",
      "target" : [{
        "code" : "P",
        "display" : "palliativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "261004008",
      "display" : "Diagnostic intent (qualifier value)",
      "target" : [{
        "code" : "D",
        "display" : "diagnostisch",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "255231005",
      "display" : "Revision - value (qualifier value)",
      "target" : [{
        "code" : "R",
        "display" : "Revision/Komplikation",
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
    },
    {
      "code" : "1287211007",
      "display" : "No information available (qualifier value)",
      "target" : [{
        "code" : "X",
        "display" : "fehlende Angabe",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
