# VS Senologie Risikoklasse - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Risikoklasse**

## ValueSet: VS Senologie Risikoklasse (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-risikoklasse | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:VS_Senologie_Risikoklasse |

 
Risikokategorien für Genexpressionstests (low, intermediate, high) 

 **References** 

* [BIH PR Seno Genexpressionstest](StructureDefinition-senologie-genexpressionstest.md)

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
  "id" : "vs-senologie-risikoklasse",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-risikoklasse",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Risikoklasse",
  "title" : "VS Senologie Risikoklasse",
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
  "description" : "Risikokategorien für Genexpressionstests (low, intermediate, high)",
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/risk-probability",
      "version" : "1.0.1",
      "concept" : [{
        "code" : "low",
        "display" : "Low likelihood"
      },
      {
        "code" : "moderate",
        "display" : "Moderate likelihood"
      },
      {
        "code" : "high",
        "display" : "High likelihood"
      }]
    }]
  }
}

```
