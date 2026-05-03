# VS Senologie Studienname - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Studienname**

## ValueSet: VS Senologie Studienname 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-studienname | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:VS_Senologie_Studienname |

 
Auswahlliste klinischer Studien am Brustzentrum (OncoBox 2.0 K02). Enthält häufige Mammakarzinom-Studien. Die Liste ist erweiterbar (extensible Binding). 

 **References** 

* [Studienname (kodiert)](StructureDefinition-ex-senologie-studienname-code.md)

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
  "id" : "vs-senologie-studienname",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-studienname",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Studienname",
  "title" : "VS Senologie Studienname",
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
  "description" : "Auswahlliste klinischer Studien am Brustzentrum (OncoBox 2.0 K02). Enthält häufige Mammakarzinom-Studien. Die Liste ist erweiterbar (extensible Binding).",
  "compose" : {
    "include" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-studienname"
    }]
  }
}

```
