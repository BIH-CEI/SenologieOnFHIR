# SNOMED CT to oBDS Verlauf Gesamtbeurteilung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Verlauf Gesamtbeurteilung**

## ConceptMap: SNOMED CT to oBDS Verlauf Gesamtbeurteilung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-verlauf-gesamtbeurteilung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von SNOMED CT Tumorstatusbewertungen zu oBDS Gesamtbeurteilung Tumorstatus (V, T, K, P, U, X) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-verlauf-gesamtbeurteilung",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-verlauf-gesamtbeurteilung",
  "version" : "0.1.0",
  "title" : "SNOMED CT to oBDS Verlauf Gesamtbeurteilung",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Mapping von SNOMED CT Tumorstatusbewertungen zu oBDS Gesamtbeurteilung Tumorstatus (V, T, K, P, U, X)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
    "element" : [{
      "code" : "550991000124107",
      "display" : "Malignant neoplasm in full remission (disorder)",
      "target" : [{
        "code" : "V",
        "display" : "Vollremission (complete remission, CR)",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "551001000124108",
      "display" : "Malignant neoplasm in partial remission (disorder)",
      "target" : [{
        "code" : "T",
        "display" : "Teilremission (partial remission, PR)",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "260388006",
      "display" : "No status change (qualifier value)",
      "target" : [{
        "code" : "K",
        "display" : "keine Aenderung (no change, NC) = stable disease",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "419835002",
      "display" : "Tumor progression (finding)",
      "target" : [{
        "code" : "P",
        "display" : "Progression",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
