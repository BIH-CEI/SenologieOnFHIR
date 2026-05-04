# BIH LM Senologie Brustimplantat - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH LM Senologie Brustimplantat**

## Resource Profile: BIH LM Senologie Brustimplantat 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-implantat | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Implantat |

 
Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie 

**Usages:**

* Examples for this Profile: [Device/Fall10-Implantat-Links](Device-Fall10-Implantat-Links.md) and [Device/Fall10-Implantat-Rechts](Device-Fall10-Implantat-Rechts.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-implantat)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-implantat.csv), [Excel](StructureDefinition-senologie-implantat.xlsx), [Schematron](StructureDefinition-senologie-implantat.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-implantat",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-implantat",
  "version" : "0.1.0",
  "name" : "Senologie_Implantat",
  "title" : "BIH LM Senologie Brustimplantat",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device",
      "path" : "Device"
    },
    {
      "id" : "Device.status",
      "path" : "Device.status",
      "mustSupport" : true
    },
    {
      "id" : "Device.manufacturer",
      "path" : "Device.manufacturer",
      "short" : "Hersteller des Implantats",
      "definition" : "Hersteller des Implantats, hier als String und somit abweichend vom Auswahlfeld",
      "mustSupport" : true
    },
    {
      "id" : "Device.lotNumber",
      "path" : "Device.lotNumber",
      "short" : "REF-Nummer des Implantats",
      "mustSupport" : true
    },
    {
      "id" : "Device.serialNumber",
      "path" : "Device.serialNumber",
      "short" : "Seriennummer des Implantats",
      "mustSupport" : true
    },
    {
      "id" : "Device.type",
      "path" : "Device.type",
      "short" : "Art des Implantats",
      "mustSupport" : true
    }]
  }
}

```
