# BIH Senologie Nebenwirkung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Nebenwirkung**

## Resource Profile: BIH Senologie Nebenwirkung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-nebenwirkung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Nebenwirkung |

 
AdverseEvent für CTCAE-Nebenwirkungsgrading unter Systemtherapie. Erbt MedDRA-Kodierung und CTCAE-Grad von MII Onko Nebenwirkung. 

**Usages:**

* Examples for this Profile: [AdverseEvent/Fall2-Nebenwirkung-Fatigue](AdverseEvent-Fall2-Nebenwirkung-Fatigue.md) and [AdverseEvent/Fall5-Nebenwirkung-Nausea](AdverseEvent-Fall5-Nebenwirkung-Nausea.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-nebenwirkung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-nebenwirkung.csv), [Excel](StructureDefinition-senologie-nebenwirkung.xlsx), [Schematron](StructureDefinition-senologie-nebenwirkung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-nebenwirkung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-nebenwirkung",
  "version" : "0.1.0",
  "name" : "Senologie_Nebenwirkung",
  "title" : "BIH Senologie Nebenwirkung",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "AdverseEvent für CTCAE-Nebenwirkungsgrading unter Systemtherapie. Erbt MedDRA-Kodierung und CTCAE-Grad von MII Onko Nebenwirkung.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AdverseEvent",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-nebenwirkung-adverse-event",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "AdverseEvent",
      "path" : "AdverseEvent"
    },
    {
      "id" : "AdverseEvent.actuality",
      "path" : "AdverseEvent.actuality",
      "fixedCode" : "actual",
      "mustSupport" : true
    },
    {
      "id" : "AdverseEvent.event",
      "path" : "AdverseEvent.event",
      "short" : "Nebenwirkungsart (MedDRA)"
    },
    {
      "id" : "AdverseEvent.subject",
      "path" : "AdverseEvent.subject",
      "short" : "Betroffene/r Patient/in"
    },
    {
      "id" : "AdverseEvent.date",
      "path" : "AdverseEvent.date",
      "short" : "Zeitpunkt der Bewertung",
      "mustSupport" : true
    },
    {
      "id" : "AdverseEvent.seriousness",
      "path" : "AdverseEvent.seriousness",
      "short" : "CTCAE-Grad (1-5, U, K)"
    },
    {
      "id" : "AdverseEvent.suspectEntity",
      "path" : "AdverseEvent.suspectEntity",
      "short" : "Auslösende Therapie"
    },
    {
      "id" : "AdverseEvent.suspectEntity.instance",
      "path" : "AdverseEvent.suspectEntity.instance",
      "short" : "Referenz auf auslösende Systemtherapie-Procedure"
    }]
  }
}

```
