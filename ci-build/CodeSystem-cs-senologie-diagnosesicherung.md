# CodeSystem Diagnosesicherung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CodeSystem Diagnosesicherung**

## CodeSystem: CodeSystem Diagnosesicherung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CSSenologieDiagnosesicherung |

 
Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz) 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VSSenologieDiagnosesicherung](ValueSet-vs-senologie-diagnosesicherung.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-diagnosesicherung",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung",
  "version" : "0.1.0",
  "name" : "CSSenologieDiagnosesicherung",
  "title" : "CodeSystem Diagnosesicherung",
  "status" : "draft",
  "date" : "2026-05-04T06:44:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz)",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 12,
  "concept" : [{
    "code" : "1",
    "display" : "Klinisch ohne weitere Spezifizierung",
    "definition" : "Klinische Angaben (ohne die nachfolgenden Kategorien)"
  },
  {
    "code" : "2",
    "display" : "Klinische Diagnostik",
    "definition" : "Spezifische Diagnostik wie Endoskopie, bildgebende Verfahren, Ultraschall, explorative Eingriffe"
  },
  {
    "code" : "3",
    "display" : "Chirurgisch/Autopsie ohne Histologie",
    "definition" : "Chirurgische Eingriffe (wie Laparotomie) und Autopsie, aber ohne Gewebsuntersuchung"
  },
  {
    "code" : "4",
    "display" : "Spezifische Tumormarker",
    "definition" : "Biochemische und/oder immunologische Marker, die für einen bestimmten Tumorsitz spezifisch sind"
  },
  {
    "code" : "5",
    "display" : "Zytologie",
    "definition" : "Untersuchung von Zellen aus primärem oder sekundärem Sitz, einschließlich Aspiraten"
  },
  {
    "code" : "6",
    "display" : "Histologie einer Metastase",
    "definition" : "Histologische Untersuchung von Metastasengewebe"
  },
  {
    "code" : "7",
    "display" : "Histologie Primärtumor",
    "definition" : "Histologische Untersuchung eines Primärtumors"
  },
  {
    "code" : "7.1",
    "display" : "Histologie nach Operation",
    "definition" : "Histologische Untersuchung nach operativer Entfernung"
  },
  {
    "code" : "7.2",
    "display" : "Histologie nach Biopsie",
    "definition" : "Histologische Untersuchung nach Biopsie"
  },
  {
    "code" : "7.3",
    "display" : "Histologie nach Autopsie",
    "definition" : "Histologische Untersuchung nach Autopsie"
  },
  {
    "code" : "8",
    "display" : "Genetisch/Molekularbiologisch",
    "definition" : "Zytogenetische und/oder molekularbiologische Untersuchung"
  },
  {
    "code" : "9",
    "display" : "Unbekannt",
    "definition" : "Diagnosesicherung unbekannt"
  }]
}

```
