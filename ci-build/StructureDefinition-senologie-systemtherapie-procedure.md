# BIH Senologie Systemtherapie (übergeordnet) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Systemtherapie (übergeordnet)**

## Resource Profile: BIH Senologie Systemtherapie (übergeordnet) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Systemtherapie_Procedure |

 
Procedure für übergeordnete Systemtherapie-Dokumentation. Erbt Intention, outcome und usedCode von MII Onko Systemtherapie. 

**Usages:**

* Examples for this Profile: [Procedure/Example-Systemtherapie-ECT](Procedure-Example-Systemtherapie-ECT.md), [Procedure/Fall10-Systemtherapie-Adjuvant](Procedure-Fall10-Systemtherapie-Adjuvant.md), [Procedure/Fall13-Systemtherapie-EC-Pac-H](Procedure-Fall13-Systemtherapie-EC-Pac-H.md), [Procedure/Fall2-Systemtherapie-Adjuvant](Procedure-Fall2-Systemtherapie-Adjuvant.md)... Show 5 more, [Procedure/Fall2-Systemtherapie-Neoadjuvant](Procedure-Fall2-Systemtherapie-Neoadjuvant.md), [Procedure/Fall4-Systemtherapie-Neoadjuvant](Procedure-Fall4-Systemtherapie-Neoadjuvant.md), [Procedure/Fall5-Systemtherapie-Neoadjuvant](Procedure-Fall5-Systemtherapie-Neoadjuvant.md), [Procedure/Fall7-Systemtherapie-Neoadjuvant](Procedure-Fall7-Systemtherapie-Neoadjuvant.md) and [Procedure/Fall9-Systemtherapie-Adjuvant](Procedure-Fall9-Systemtherapie-Adjuvant.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-systemtherapie-procedure)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-systemtherapie-procedure.csv), [Excel](StructureDefinition-senologie-systemtherapie-procedure.xlsx), [Schematron](StructureDefinition-senologie-systemtherapie-procedure.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-systemtherapie-procedure",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure",
  "version" : "0.1.0",
  "name" : "Senologie_Systemtherapie_Procedure",
  "title" : "BIH Senologie Systemtherapie (übergeordnet)",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Procedure für übergeordnete Systemtherapie-Dokumentation. Erbt Intention, outcome und usedCode von MII Onko Systemtherapie.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.extension:therapyLine",
      "path" : "Procedure.extension",
      "sliceName" : "therapyLine",
      "short" : "Therapielinie (1, 2, 3, ...)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line"]
      }]
    },
    {
      "id" : "Procedure.extension:firstLine",
      "path" : "Procedure.extension",
      "sliceName" : "firstLine",
      "short" : "First-Line bei Metastasierung (KB-8)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-first-line-therapy"]
      }]
    },
    {
      "id" : "Procedure.partOf",
      "path" : "Procedure.partOf",
      "short" : "Teil einer übergeordneten Maßnahme"
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Durchgeführt",
      "fixedCode" : "completed"
    },
    {
      "id" : "Procedure.category",
      "path" : "Procedure.category",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "18629005",
          "display" : "Administration of medication"
        }]
      }
    },
    {
      "id" : "Procedure.code.coding",
      "path" : "Procedure.code.coding",
      "short" : "Systemtherapie-Typ"
    },
    {
      "id" : "Procedure.code.text",
      "path" : "Procedure.code.text",
      "short" : "Systemtherapie"
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Bezogene Diagnose"
    },
    {
      "id" : "Procedure.outcome",
      "path" : "Procedure.outcome",
      "short" : "Therapie-Status am Ende",
      "comment" : "Aus dotbase: Status (abgeschlossen, abgebrochen, etc.) — ersetzt ehemalige TherapyStatus-Extension"
    },
    {
      "id" : "Procedure.note",
      "path" : "Procedure.note",
      "short" : "Besonderheiten/Details zur Therapie"
    }]
  }
}

```
