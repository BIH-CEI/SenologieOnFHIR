# ValueSet Senologie ICD-10-GM - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ValueSet Senologie ICD-10-GM**

## ValueSet: ValueSet Senologie ICD-10-GM 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10 | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:VSSenologieICD10 |

 
ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook 

 **References** 

* [Fragebogen: Senologie Diagnose](Questionnaire-senologie-diagnose-maligne.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-icd10",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10",
  "version" : "0.1.0",
  "name" : "VSSenologieICD10",
  "title" : "ValueSet Senologie ICD-10-GM",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "concept" : [{
        "code" : "C50.0",
        "display" : "Brustwarze und Warzenhof"
      },
      {
        "code" : "C50.1",
        "display" : "Zentraler Drüsenkörper der Brustdrüse"
      },
      {
        "code" : "C50.2",
        "display" : "Oberer innerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.3",
        "display" : "Unterer innerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.4",
        "display" : "Oberer äußerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.5",
        "display" : "Unterer äußerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.6",
        "display" : "Recessus axillaris der Brustdrüse"
      },
      {
        "code" : "C50.8",
        "display" : "Brustdrüse, mehrere Teilbereiche überlappend"
      },
      {
        "code" : "C50.9",
        "display" : "Brustdrüse, nicht näher bezeichnet"
      },
      {
        "code" : "D05.0",
        "display" : "Lobuläres Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.1",
        "display" : "Intraduktales Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.7",
        "display" : "Sonstiges Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.9",
        "display" : "Carcinoma in situ der Brustdrüse, nicht näher bezeichnet"
      },
      {
        "code" : "D24",
        "display" : "Gutartige Neubildung der Brustdrüse"
      },
      {
        "code" : "D48.6",
        "display" : "Neubildung unsicheren oder unbekannten Verhaltens der Brustdrüse"
      },
      {
        "code" : "N60.0",
        "display" : "Solitäre Zyste der Mamma"
      },
      {
        "code" : "N60.1",
        "display" : "Diffuse zystische Mastopathie"
      },
      {
        "code" : "N60.2",
        "display" : "Fibroadenose der Mamma"
      },
      {
        "code" : "N60.3",
        "display" : "Fibrosklerose der Mamma"
      },
      {
        "code" : "N60.4",
        "display" : "Mammäre Duktektasie"
      },
      {
        "code" : "N60.8",
        "display" : "Sonstige gutartige Mammadysplasien"
      },
      {
        "code" : "N60.9",
        "display" : "Gutartige Mammadysplasie, nicht näher bezeichnet"
      },
      {
        "code" : "N61",
        "display" : "Entzündliche Krankheiten der Mamma"
      },
      {
        "code" : "N62",
        "display" : "Hypertrophie der Mamma"
      },
      {
        "code" : "N63",
        "display" : "Nicht näher bezeichnete Knoten in der Mamma"
      },
      {
        "code" : "N64.0",
        "display" : "Fissur und Fistel der Brustwarze"
      },
      {
        "code" : "N64.1",
        "display" : "Fettgewebsnekrose der Mamma"
      },
      {
        "code" : "N64.2",
        "display" : "Atrophie der Mamma"
      },
      {
        "code" : "N64.3",
        "display" : "Galaktorrhoe, nicht im Zusammenhang mit der Geburt"
      },
      {
        "code" : "N64.4",
        "display" : "Mastodynie"
      },
      {
        "code" : "N64.5",
        "display" : "Sonstige Symptome, die die Mamma betreffen"
      },
      {
        "code" : "N64.8",
        "display" : "Sonstige näher bezeichnete Krankheiten der Mamma"
      },
      {
        "code" : "N64.9",
        "display" : "Krankheit der Mamma, nicht näher bezeichnet"
      },
      {
        "code" : "T85.4",
        "display" : "Mechanische Komplikation durch Mammaprothese oder -implantat"
      }]
    }]
  }
}

```
