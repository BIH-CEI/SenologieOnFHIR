# SNOMED CT to oBDS Grading - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Grading**

## ConceptMap: SNOMED CT to oBDS Grading 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-grading | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Gradingcodes zu oBDS Grading (1, 2, 3, 4, X, L, M, H, B) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-grading",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-grading",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Grading",
  "status" : "draft",
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Mapping von SNOMED CT Gradingcodes zu oBDS Grading (1, 2, 3, 4, X, L, M, H, B)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading",
    "element" : [{
      "code" : "415175000",
      "display" : "Primary acquired melanosis of conjunctiva without atypia (disorder)",
      "target" : [{
        "code" : "0",
        "display" : "primaer erworbene Melanose ohne zellulaere Atypien (nur beim malignen Melanom der Konjunktiva)",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "373375007",
      "display" : "Well differentiated histological grade finding (finding)",
      "target" : [{
        "code" : "1",
        "display" : "gut differenziert",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "373377004",
      "display" : "Moderately differentiated histological grade finding (finding)",
      "target" : [{
        "code" : "2",
        "display" : "maessig differenziert",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "373373000",
      "display" : "Poorly differentiated histological grade finding (finding)",
      "target" : [{
        "code" : "3",
        "display" : "schlecht differenziert",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "373374006",
      "display" : "Undifferentiated histological grade finding (finding)",
      "target" : [{
        "code" : "4",
        "display" : "undifferenziert",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
