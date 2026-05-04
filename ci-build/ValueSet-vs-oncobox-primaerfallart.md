# VS OncoBox Primaerfallart - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS OncoBox Primaerfallart**

## ValueSet: VS OncoBox Primaerfallart (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-oncobox-primaerfallart | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VS_OncoBox_Primaerfallart |

 
Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) 

 **References** 

* [Primaerfallart](StructureDefinition-ex-senologie-primaerfallart.md)

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
  "id" : "vs-oncobox-primaerfallart",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-oncobox-primaerfallart",
  "version" : "0.1.0",
  "name" : "VS_OncoBox_Primaerfallart",
  "title" : "VS OncoBox Primaerfallart",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01)",
  "compose" : {
    "include" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-primaerfallart"
    }]
  }
}

```
