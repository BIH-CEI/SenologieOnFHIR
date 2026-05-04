# BIH Senologie Tumorlokalisation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Tumorlokalisation**

## Resource Profile: BIH Senologie Tumorlokalisation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Tumorlokalisation |

 
BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand) 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-tumorlokalisation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-tumorlokalisation.csv), [Excel](StructureDefinition-senologie-tumorlokalisation.xlsx), [Schematron](StructureDefinition-senologie-tumorlokalisation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-tumorlokalisation",
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation",
  "version" : "0.1.0",
  "name" : "Senologie_Tumorlokalisation",
  "title" : "BIH Senologie Tumorlokalisation",
  "status" : "draft",
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand)",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "BodyStructure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-pr-bildgebung-koerperstruktur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "BodyStructure",
      "path" : "BodyStructure"
    },
    {
      "id" : "BodyStructure.location",
      "path" : "BodyStructure.location",
      "short" : "Brust (SNOMED)",
      "comment" : "SNOMED-Code für Brust als Lokalisation"
    },
    {
      "id" : "BodyStructure.locationQualifier",
      "path" : "BodyStructure.locationQualifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "BodyStructure.locationQualifier:seitenlokalisation",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "seitenlokalisation",
      "short" : "Seite (Links/Rechts/Beidseits)",
      "comment" : "Aus dotbase: 'Seite' (Links/Rechts/Beidseits)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "BodyStructure.locationQualifier:quadrant",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "quadrant",
      "short" : "Quadrant der Brust",
      "comment" : "Quadrant (z.B. oben-aussen, oben-innen, etc.)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "BodyStructure.locationQualifier:uhrzeitposition",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "uhrzeitposition",
      "short" : "Uhrzeitposition (12-Uhr-Einteilung)",
      "comment" : "Uhrzeitposition im Drüsenquadranten (12-Uhr-Position)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "BodyStructure.description",
      "path" : "BodyStructure.description",
      "short" : "Freitext-Beschreibung inkl. Mamillenabstand",
      "comment" : "Kann Mamillenabstand in mm oder andere beschreibende Details enthalten",
      "mustSupport" : true
    }]
  }
}

```
