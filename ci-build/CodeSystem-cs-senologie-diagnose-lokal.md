# CS Senologie Diagnose Lokal - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Diagnose Lokal**

## CodeSystem: CS Senologie Diagnose Lokal 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-lokal | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:CS_Senologie_Diagnose_Lokal |

 
Lokale Codes für Mamma-Diagnosen ohne SNOMED CT Mapping (basierend auf Dotbase) 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Diagnose](ValueSet-vs-senologie-diagnose.md)
* [VS_Senologie_Diagnose_Lokal](ValueSet-vs-senologie-diagnose-lokal.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-diagnose-lokal",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-lokal",
  "version" : "0.1.0",
  "name" : "CS_Senologie_Diagnose_Lokal",
  "title" : "CS Senologie Diagnose Lokal",
  "status" : "draft",
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Lokale Codes für Mamma-Diagnosen ohne SNOMED CT Mapping (basierend auf Dotbase)",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "bz-diagnose-sonstiges",
    "display" : "Sonstiges",
    "definition" : "Sonstige Diagnose, nicht anderweitig klassifiziert"
  },
  {
    "code" : "bz-mamillensekretion-nicht-blutig",
    "display" : "Nicht blutige Mamillensekretion",
    "definition" : "Sekretion aus der Brustwarze, nicht blutig (SNOMED 54302000 deckt nur 'Discharge from nipple' ohne Spezifizierung)"
  },
  {
    "code" : "bz-anisomastie",
    "display" : "Anisomastie",
    "definition" : "Asymmetrie der Brüste (kein exaktes SNOMED-Äquivalent als Diagnose)"
  }]
}

```
