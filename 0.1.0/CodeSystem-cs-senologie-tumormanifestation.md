# CS Senologie Tumormanifestation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Tumormanifestation**

## CodeSystem: CS Senologie Tumormanifestation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CS_Senologie_Tumormanifestation |

 
Klassifikation der Tumormanifestation bei Diagnosestellung 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Tumormanifestation](ValueSet-vs-senologie-tumormanifestation.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-tumormanifestation",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation",
  "version" : "0.1.0",
  "name" : "CS_Senologie_Tumormanifestation",
  "title" : "CS Senologie Tumormanifestation",
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
  "description" : "Klassifikation der Tumormanifestation bei Diagnosestellung",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "primaertumor",
    "display" : "Primärtumor",
    "definition" : "Erstmanifestation des Tumors"
  },
  {
    "code" : "lokalrezidiv",
    "display" : "Lokalrezidiv",
    "definition" : "Wiederauftreten des Tumors am Ursprungsort"
  },
  {
    "code" : "regionaere-lk",
    "display" : "Regionäre Lymphknotenmetastasen",
    "definition" : "Metastasen in regionären Lymphknoten"
  },
  {
    "code" : "fernmetastasen",
    "display" : "Fernmetastasen",
    "definition" : "Metastasen in entfernten Organen"
  }]
}

```
