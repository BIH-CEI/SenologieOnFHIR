# BIH Senologie Pathologisches Präparat - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Pathologisches Präparat**

## Resource Profile: BIH Senologie Pathologisches Präparat 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Pathologie_Praeparat |

 
Specimen für pathologische Präparate aus dotbase (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details 

**Usages:**

* Examples for this Profile: [Specimen/Example-Pathologie-Praeparat](Specimen-Example-Pathologie-Praeparat.md), [Specimen/Fall1-Pathologie-Praeparat](Specimen-Fall1-Pathologie-Praeparat.md), [Specimen/Fall10-Pathologie-Praeparat](Specimen-Fall10-Pathologie-Praeparat.md), [Specimen/Fall11-Pathologie-Praeparat](Specimen-Fall11-Pathologie-Praeparat.md)... Show 11 more, [Specimen/Fall12-Pathologie-Praeparat-Nachresektion](Specimen-Fall12-Pathologie-Praeparat-Nachresektion.md), [Specimen/Fall12-Pathologie-Praeparat-Vakuumbiopsie](Specimen-Fall12-Pathologie-Praeparat-Vakuumbiopsie.md), [Specimen/Fall2-Pathologie-Praeparat](Specimen-Fall2-Pathologie-Praeparat.md), [Specimen/Fall3-Pathologie-Praeparat-OP](Specimen-Fall3-Pathologie-Praeparat-OP.md), [Specimen/Fall3-Pathologie-Praeparat-Stanze](Specimen-Fall3-Pathologie-Praeparat-Stanze.md), [Specimen/Fall4-Pathologie-Praeparat](Specimen-Fall4-Pathologie-Praeparat.md), [Specimen/Fall5-Pathologie-Praeparat](Specimen-Fall5-Pathologie-Praeparat.md), [Specimen/Fall6-Pathologie-Praeparat](Specimen-Fall6-Pathologie-Praeparat.md), [Specimen/Fall7-Pathologie-Praeparat](Specimen-Fall7-Pathologie-Praeparat.md), [Specimen/Fall8-Pathologie-Praeparat](Specimen-Fall8-Pathologie-Praeparat.md) and [Specimen/Fall9-Pathologie-Praeparat](Specimen-Fall9-Pathologie-Praeparat.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-pathologie-praeparat)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-pathologie-praeparat.csv), [Excel](StructureDefinition-senologie-pathologie-praeparat.xlsx), [Schematron](StructureDefinition-senologie-pathologie-praeparat.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-pathologie-praeparat",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat",
  "version" : "0.1.0",
  "name" : "Senologie_Pathologie_Praeparat",
  "title" : "BIH Senologie Pathologisches Präparat",
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
  "description" : "Specimen für pathologische Präparate aus dotbase (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/StructureDefinition/mii-pr-patho-specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen"
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "short" : "Art des Präparats",
      "comment" : "Aus dotbase: 'Art des Präparats' (z.B. Biopsie, Resektat)"
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "short" : "Datum der Präparateentnahme",
      "comment" : "Aus dotbase: 'Datum Präparateentnahme'"
    },
    {
      "id" : "Specimen.collection.method",
      "path" : "Specimen.collection.method",
      "short" : "Entnahme-Methode / Timing",
      "comment" : "Aus dotbase: 'Zeitpunkt Präparatentnahme' (intraop, präop, etc.) als Methoden-Kontext"
    },
    {
      "id" : "Specimen.collection.bodySite",
      "path" : "Specimen.collection.bodySite",
      "short" : "Lokalisation der Entnahme",
      "comment" : "Lokalisation inkl. Seite und Lagequalifikatoren via MII Patho extensions"
    }]
  }
}

```
