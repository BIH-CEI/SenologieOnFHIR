# VS Senologie B3 Läsionen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie B3 Läsionen**

## ValueSet: VS Senologie B3 Läsionen 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-b3 | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VS_Senologie_Diagnose_B3 |

 
B3 Läsionen der Mamma nach S3-Leitlinie 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

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
  "id" : "vs-senologie-diagnose-b3",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-b3",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Diagnose_B3",
  "title" : "VS Senologie B3 Läsionen",
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
  "description" : "B3 Läsionen der Mamma nach S3-Leitlinie",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "427785007",
        "display" : "Atypical ductal hyperplasia of breast"
      },
      {
        "code" : "860895001",
        "display" : "Flat epithelial atypia of breast"
      },
      {
        "code" : "99571000119102",
        "display" : "Intraductal papilloma of breast without atypia"
      },
      {
        "code" : "1144917006",
        "display" : "Atypical intraductal papilloma of breast"
      },
      {
        "code" : "390787006",
        "display" : "Radial scar of breast"
      },
      {
        "code" : "450697004",
        "display" : "Atypical lobular hyperplasia of breast"
      },
      {
        "code" : "444739008",
        "display" : "Classic lobular carcinoma in situ of breast"
      },
      {
        "code" : "444591006",
        "display" : "Pleomorphic lobular carcinoma in situ of breast"
      }]
    }]
  }
}

```
