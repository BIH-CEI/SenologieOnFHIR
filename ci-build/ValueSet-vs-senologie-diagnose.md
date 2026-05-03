# VS Senologie Diagnose - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Diagnose**

## ValueSet: VS Senologie Diagnose (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:VS_Senologie_Diagnose |

 
Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes 

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
  "id" : "vs-senologie-diagnose",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Diagnose",
  "title" : "VS Senologie Diagnose",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "254837009",
        "display" : "Malignant neoplasm of breast"
      },
      {
        "code" : "109889007",
        "display" : "Ductal carcinoma in situ of breast"
      },
      {
        "code" : "254845004",
        "display" : "Fibroadenoma of breast"
      },
      {
        "code" : "27431007",
        "display" : "Fibrocystic disease of breast"
      },
      {
        "code" : "399123008",
        "display" : "Benign retention cyst of breast"
      },
      {
        "code" : "449837001",
        "display" : "Complex cyst of breast"
      },
      {
        "code" : "83620003",
        "display" : "Non-puerperal mastitis"
      },
      {
        "code" : "1287638006",
        "display" : "Puerperal mastitis"
      },
      {
        "code" : "16698000",
        "display" : "Non-puerperal breast abscess"
      },
      {
        "code" : "10745131000119107",
        "display" : "Abscess of breast associated with lactation"
      },
      {
        "code" : "237444008",
        "display" : "Granulomatous mastitis"
      },
      {
        "code" : "269497004",
        "display" : "Neoplasm of uncertain behavior of breast"
      },
      {
        "code" : "53430007",
        "display" : "Mastalgia"
      },
      {
        "code" : "237473006",
        "display" : "Ruptured breast implant"
      },
      {
        "code" : "4754008",
        "display" : "Gynecomastia"
      },
      {
        "code" : "718220008",
        "display" : "At high risk for hereditary breast and ovarian cancer syndrome"
      },
      {
        "code" : "1306515008",
        "display" : "Recurrent primary malignant neoplasm of breast"
      },
      {
        "code" : "43336006",
        "display" : "Gigantomastia"
      },
      {
        "code" : "290113009",
        "display" : "Bloody nipple discharge"
      },
      {
        "code" : "237474000",
        "display" : "Contracture of breast following insertion of breast implant"
      }]
    },
    {
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-lokal",
      "concept" : [{
        "code" : "bz-diagnose-sonstiges",
        "display" : "Sonstiges"
      },
      {
        "code" : "bz-mamillensekretion-nicht-blutig",
        "display" : "Nicht blutige Mamillensekretion"
      },
      {
        "code" : "bz-anisomastie",
        "display" : "Anisomastie"
      }]
    }]
  }
}

```
