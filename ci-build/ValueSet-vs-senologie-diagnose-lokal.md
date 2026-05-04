# VS Senologie Diagnose Lokal - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Diagnose Lokal**

## ValueSet: VS Senologie Diagnose Lokal (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-lokal | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:VS_Senologie_Diagnose_Lokal |

 
Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice) 

 **References** 

* [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

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
  "id" : "vs-senologie-diagnose-lokal",
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-lokal",
  "version" : "0.1.0",
  "name" : "VS_Senologie_Diagnose_Lokal",
  "title" : "VS Senologie Diagnose Lokal",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice)",
  "compose" : {
    "include" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-lokal"
    },
    {
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "24028007",
        "display" : "Right"
      },
      {
        "code" : "7771000",
        "display" : "Left"
      },
      {
        "code" : "51440002",
        "display" : "Bilateral"
      }]
    }]
  }
}

```
