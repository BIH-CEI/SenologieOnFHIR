# CS Senologie Metastasierung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Metastasierung**

## CodeSystem: CS Senologie Metastasierung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CS_Senologie_Metastasierung |

 
Metastasierungsstatus für Senologie 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Metastasierung](ValueSet-vs-senologie-metastasierung.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-metastasierung",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung",
  "version" : "0.1.0",
  "name" : "CS_Senologie_Metastasierung",
  "title" : "CS Senologie Metastasierung",
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
  "description" : "Metastasierungsstatus für Senologie",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "nicht-metastasiert",
    "display" : "Nicht metastasiert",
    "definition" : "M0 - keine Fernmetastasen nachweisbar"
  },
  {
    "code" : "primaer-metastasiert",
    "display" : "Primär metastasiert",
    "definition" : "M1 - Fernmetastasen bei Erstdiagnose"
  },
  {
    "code" : "sekundaer-metastasiert",
    "display" : "Sekundär metastasiert",
    "definition" : "M1 - Fernmetastasen im Verlauf entwickelt"
  }]
}

```
