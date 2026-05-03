# BIH LM Senologie Operation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH LM Senologie Operation**

## ValueSet: BIH LM Senologie Operation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Operation_Art |

 
Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie 

 **References** 

* [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)
* [Fragebogen: Postoperative Dokumentation](Questionnaire-senologie-postop.md)

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
  "id" : "vs-senologie-operation-art",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art",
  "version" : "0.1.0",
  "name" : "Senologie_Operation_Art",
  "title" : "BIH LM Senologie Operation",
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
  "description" : "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "392022002"
      },
      {
        "code" : "50843001"
      },
      {
        "code" : "59214008"
      },
      {
        "code" : "172043006"
      },
      {
        "code" : "384723003"
      },
      {
        "code" : "406505007"
      },
      {
        "code" : "70183006"
      },
      {
        "code" : "428564008"
      },
      {
        "code" : "33496007"
      },
      {
        "code" : "395165008"
      },
      {
        "code" : "234262008"
      }]
    }]
  }
}

```
