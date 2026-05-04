# CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie**

## ConceptMap: CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-icdo3-mamma-topographie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CM_SCT_To_ICDO3_Mamma_Topographie |

 
Übersetzung der SNOMED-CT-kodierten Brustquadranten in ICD-O-3 Topographie-Codes (C50.0–C50.9) für die oBDS-Krebsregistermeldung. Quelle: BodyStructure.locationQualifier[quadrant]. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-icdo3-mamma-topographie",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-icdo3-mamma-topographie",
  "version" : "0.1.0",
  "name" : "CM_SCT_To_ICDO3_Mamma_Topographie",
  "title" : "CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie",
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
  "description" : "Übersetzung der SNOMED-CT-kodierten Brustquadranten in ICD-O-3 Topographie-Codes (C50.0–C50.9) für die oBDS-Krebsregistermeldung. Quelle: BodyStructure.locationQualifier[quadrant].",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "http://terminology.hl7.org/CodeSystem/icd-o-3",
    "element" : [{
      "code" : "279007000",
      "display" : "Nipple structure",
      "target" : [{
        "code" : "C50.0",
        "display" : "Brustwarze und Warzenhof",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "49058007",
      "display" : "Central portion of breast",
      "target" : [{
        "code" : "C50.1",
        "display" : "Zentraler Drüsenkörper der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "77831004",
      "display" : "Upper inner quadrant of breast",
      "target" : [{
        "code" : "C50.2",
        "display" : "Oberer innerer Quadrant der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "19100000",
      "display" : "Lower inner quadrant of breast",
      "target" : [{
        "code" : "C50.3",
        "display" : "Unterer innerer Quadrant der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "76365002",
      "display" : "Upper outer quadrant of breast",
      "target" : [{
        "code" : "C50.4",
        "display" : "Oberer äußerer Quadrant der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "33564002",
      "display" : "Lower outer quadrant of breast",
      "target" : [{
        "code" : "C50.5",
        "display" : "Unterer äußerer Quadrant der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "38412008",
      "display" : "Axillary tail of breast",
      "target" : [{
        "code" : "C50.6",
        "display" : "Recessus axillaris der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    }],
    "unmapped" : {
      "mode" : "fixed",
      "code" : "C50.9",
      "display" : "Brustdrüse, nicht näher bezeichnet"
    }
  }]
}

```
