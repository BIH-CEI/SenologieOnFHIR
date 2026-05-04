# CS Senologie Follow-Up - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Follow-Up**

## CodeSystem: CS Senologie Follow-Up 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CS_Senologie_FollowUp |

 
Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Codes für Observation.method (Nachsorge-Art), Zweittumor-Komponentencode und Wertcodes. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Nachsorge_Art](ValueSet-vs-senologie-nachsorge-art.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-follow-up",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
  "version" : "0.1.0",
  "name" : "CS_Senologie_FollowUp",
  "title" : "CS Senologie Follow-Up",
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
  "description" : "Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Codes für Observation.method (Nachsorge-Art), Zweittumor-Komponentencode und Wertcodes.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "zweittumor",
    "display" : "Zweittumor",
    "definition" : "Komponente: Zweittumor ja/nein/unbekannt (M08)"
  },
  {
    "code" : "aktiv",
    "display" : "Aktive Nachsorge",
    "definition" : "Patientin wurde persoenlich untersucht oder befragt"
  },
  {
    "code" : "passiv",
    "display" : "Passive Nachsorge",
    "definition" : "Information aus Akten, Registern oder Drittquellen"
  }]
}

```
