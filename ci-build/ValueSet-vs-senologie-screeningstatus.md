# VS Senologie Screeningstatus - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Screeningstatus**

## ValueSet: VS Senologie Screeningstatus 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-screeningstatus | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VS_Senologie_Screeningstatus |

 
Screeningstatus einer klinischen Studienteilnahme 

 **References** 

* [Screeningstatus](StructureDefinition-ex-senologie-screeningstatus.md)

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
  "id" : "vs-senologie-screeningstatus",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-screeningstatus",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Screeningstatus",
  "title" : "VS Senologie Screeningstatus",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Screeningstatus einer klinischen Studienteilnahme",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "385432009",
        "display" : "Not applicable (qualifier value)"
      },
      {
        "code" : "709491003",
        "display" : "Assessed (qualifier value)"
      },
      {
        "code" : "1304144001",
        "display" : "Eligible for clinical trial"
      },
      {
        "code" : "385646003",
        "display" : "Not eligible (qualifier value)"
      },
      {
        "code" : "260385009",
        "display" : "Negative (qualifier value)"
      }]
    }]
  }
}

```
