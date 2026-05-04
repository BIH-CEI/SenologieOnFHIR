# ValueSet Diagnosesicherung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ValueSet Diagnosesicherung**

## ValueSet: ValueSet Diagnosesicherung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnosesicherung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VSSenologieDiagnosesicherung |

 
Art der Diagnosesicherung gemäß oBDS für onkologische Diagnosen 

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
  "id" : "vs-senologie-diagnosesicherung",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnosesicherung",
  "version" : "0.1.0",
  "name" : "VSSenologieDiagnosesicherung",
  "title" : "ValueSet Diagnosesicherung",
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
  "description" : "Art der Diagnosesicherung gemäß oBDS für onkologische Diagnosen",
  "compose" : {
    "include" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
    }]
  }
}

```
