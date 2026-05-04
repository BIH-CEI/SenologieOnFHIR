# BIH Senologie Strahlentherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Strahlentherapie**

## Resource Profile: BIH Senologie Strahlentherapie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Strahlentherapie |

 
Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung. 

**Usages:**

* Examples for this Profile: [Procedure/Example-Strahlentherapie](Procedure-Example-Strahlentherapie.md), [Procedure/Fall1-Strahlentherapie](Procedure-Fall1-Strahlentherapie.md), [Procedure/Fall10-Strahlentherapie](Procedure-Fall10-Strahlentherapie.md), [Procedure/Fall2-Strahlentherapie](Procedure-Fall2-Strahlentherapie.md)... Show 7 more, [Procedure/Fall3-Strahlentherapie](Procedure-Fall3-Strahlentherapie.md), [Procedure/Fall4-Strahlentherapie](Procedure-Fall4-Strahlentherapie.md), [Procedure/Fall5-Strahlentherapie](Procedure-Fall5-Strahlentherapie.md), [Procedure/Fall6-Strahlentherapie](Procedure-Fall6-Strahlentherapie.md), [Procedure/Fall7-Strahlentherapie](Procedure-Fall7-Strahlentherapie.md), [Procedure/Fall8-Strahlentherapie](Procedure-Fall8-Strahlentherapie.md) and [Procedure/Fall9-Strahlentherapie](Procedure-Fall9-Strahlentherapie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-strahlentherapie)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-strahlentherapie.csv), [Excel](StructureDefinition-senologie-strahlentherapie.xlsx), [Schematron](StructureDefinition-senologie-strahlentherapie.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-strahlentherapie",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie",
  "version" : "0.1.0",
  "name" : "Senologie_Strahlentherapie",
  "title" : "BIH Senologie Strahlentherapie",
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
  "description" : "Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-strahlentherapie-bestrahlung-strahlentherapie",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.extension:Intention",
      "path" : "Procedure.extension",
      "sliceName" : "Intention",
      "short" : "Behandlungsintention",
      "comment" : "Aus dotbase: 'Zeitpunkt' (adjuvant, neoadjuvant, palliativ)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention"]
      }]
    },
    {
      "id" : "Procedure.extension:sessionCount",
      "path" : "Procedure.extension",
      "sliceName" : "sessionCount",
      "short" : "Anzahl der Bestrahlungssitzungen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count"]
      }]
    },
    {
      "id" : "Procedure.extension:einzeldosis",
      "path" : "Procedure.extension",
      "sliceName" : "einzeldosis",
      "short" : "Einzeldosis pro Fraktion in Gy",
      "comment" : "OncoBox 2.0 H10: Einzeldosis pro Tag in Gy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis"]
      }]
    },
    {
      "id" : "Procedure.extension:simultaneRadiochemotherapie",
      "path" : "Procedure.extension",
      "sliceName" : "simultaneRadiochemotherapie",
      "short" : "Simultane Radiochemotherapie (H03)",
      "comment" : "OncoBox 2.0 H03: Simultane Radiochemotherapie ja/nein",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-simultane-radiochemotherapie"]
      }]
    },
    {
      "id" : "Procedure.partOf",
      "path" : "Procedure.partOf",
      "short" : "Zugehörige Strahlentherapie-Session"
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Durchgeführt",
      "fixedCode" : "completed"
    },
    {
      "id" : "Procedure.code.coding",
      "path" : "Procedure.code.coding",
      "short" : "Strahlentherapie-Typ"
    },
    {
      "id" : "Procedure.code.text",
      "path" : "Procedure.code.text",
      "short" : "Bestrahlung"
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Bezogene Diagnose"
    },
    {
      "id" : "Procedure.bodySite",
      "path" : "Procedure.bodySite",
      "short" : "Bestrahlungsregion"
    },
    {
      "id" : "Procedure.note",
      "path" : "Procedure.note",
      "short" : "Detaillierte Beschreibung"
    }]
  }
}

```
