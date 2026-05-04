# OncoBox Endokrine Substanzklasse zu ATC - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OncoBox Endokrine Substanzklasse zu ATC**

## ConceptMap: OncoBox Endokrine Substanzklasse zu ATC (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-oncobox-endokrine-substanz-atc | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-oncobox-endokrine-substanz-atc",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-endokrine-substanz-atc",
  "version" : "0.1.0",
  "title" : "OncoBox Endokrine Substanzklasse zu ATC",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor)",
  "sourceUri" : "http://fhir.de/CodeSystem/bfarm/atc",
  "targetUri" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz",
  "group" : [{
    "source" : "http://fhir.de/CodeSystem/bfarm/atc",
    "target" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz",
    "element" : [{
      "code" : "L02BA01",
      "display" : "Tamoxifen",
      "target" : [{
        "code" : "1",
        "display" : "Tamoxifen",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "L02BG03",
      "display" : "Anastrozol",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BG04",
      "display" : "Letrozol",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BG06",
      "display" : "Exemestan",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02AE02",
      "display" : "Leuprorelin",
      "target" : [{
        "code" : "3",
        "display" : "GnRH-Analogon",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02AE03",
      "display" : "Goserelin",
      "target" : [{
        "code" : "3",
        "display" : "GnRH-Analogon",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BA03",
      "display" : "Fulvestrant",
      "target" : [{
        "code" : "4",
        "display" : "Fulvestrant",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "L01EF01",
      "display" : "Palbociclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L01EF02",
      "display" : "Ribociclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L01EF03",
      "display" : "Abemaciclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    }]
  }]
}

```
