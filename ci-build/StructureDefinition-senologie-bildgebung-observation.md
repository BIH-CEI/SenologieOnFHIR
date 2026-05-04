# BIH Senologie Bildgebung Observation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Bildgebung Observation**

## Resource Profile: BIH Senologie Bildgebung Observation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Bildgebung_Observation |

 
Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) aus dotbase Questionnaire 'Bildgebung Mamma V1.0' 

**Usages:**

* Examples for this Profile: [Observation/Example-Bildgebung-BiRADS-Links](Observation-Example-Bildgebung-BiRADS-Links.md), [Observation/Example-Bildgebung-BiRADS-Rechts](Observation-Example-Bildgebung-BiRADS-Rechts.md), [Observation/Fall1-BiRADS-Links](Observation-Fall1-BiRADS-Links.md), [Observation/Fall10-BiRADS-Rechts](Observation-Fall10-BiRADS-Rechts.md)... Show 10 more, [Observation/Fall11-BiRADS-Links](Observation-Fall11-BiRADS-Links.md), [Observation/Fall12-BiRADS-Links](Observation-Fall12-BiRADS-Links.md), [Observation/Fall2-BiRADS-Rechts](Observation-Fall2-BiRADS-Rechts.md), [Observation/Fall3-BiRADS-Rechts](Observation-Fall3-BiRADS-Rechts.md), [Observation/Fall4-BiRADS-Links](Observation-Fall4-BiRADS-Links.md), [Observation/Fall5-BiRADS-Rechts](Observation-Fall5-BiRADS-Rechts.md), [Observation/Fall6-BiRADS-Links](Observation-Fall6-BiRADS-Links.md), [Observation/Fall7-BiRADS-Rechts](Observation-Fall7-BiRADS-Rechts.md), [Observation/Fall8-BiRADS-Rechts](Observation-Fall8-BiRADS-Rechts.md) and [Observation/Fall9-BiRADS-Links](Observation-Fall9-BiRADS-Links.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-bildgebung-observation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-bildgebung-observation.csv), [Excel](StructureDefinition-senologie-bildgebung-observation.xlsx), [Schematron](StructureDefinition-senologie-bildgebung-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-bildgebung-observation",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation",
  "version" : "0.1.0",
  "name" : "Senologie_Bildgebung_Observation",
  "title" : "BIH Senologie Bildgebung Observation",
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
  "description" : "Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) aus dotbase Questionnaire 'Bildgebung Mamma V1.0'",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
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
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation",
      "constraint" : [{
        "key" : "biRads-value",
        "severity" : "warning",
        "human" : "BI-RADS value muss aus BI-RADS ValueSet sein (0-6)",
        "expression" : "value.ofType(CodeableConcept).exists() implies value.ofType(CodeableConcept).coding.exists()",
        "source" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation"
      }]
    },
    {
      "id" : "Observation.partOf",
      "path" : "Observation.partOf",
      "short" : "Übergeordnete Untersuchung (falls relevant)",
      "comment" : "Die Verknüpfung zum DiagnosticReport erfolgt über DiagnosticReport.result, nicht über partOf."
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Abgeschlossene Beobachtung",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "description" : "Slicing nach Art des Bildgebungs-Befunds",
        "rules" : "open"
      },
      "short" : "Art des Befund-Elements",
      "comment" : "SNOMED CT codes für BI-RADS, ACR-Density, Herdbefund, Mikrokalk, Lymphknoten-Status, etc."
    },
    {
      "id" : "Observation.code.coding:biRadsLoinc",
      "path" : "Observation.code.coding",
      "sliceName" : "biRadsLoinc",
      "short" : "BI-RADS Kategorie (LOINC)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "72018-2"
      }
    },
    {
      "id" : "Observation.code.coding:biRadsSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "biRadsSnomed",
      "short" : "BI-RADS Kategorie (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "241736003"
      }
    },
    {
      "id" : "Observation.code.coding:acrDensityLoinc",
      "path" : "Observation.code.coding",
      "sliceName" : "acrDensityLoinc",
      "short" : "ACR Brustdichte (LOINC)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "18794-8"
      }
    },
    {
      "id" : "Observation.code.coding:acrDensityRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "acrDensityRadlex",
      "short" : "ACR Brustdichte (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID28536"
      }
    },
    {
      "id" : "Observation.code.coding:herdbefundSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "herdbefundSnomed",
      "short" : "Herdbefund/Läsion (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "300886002"
      }
    },
    {
      "id" : "Observation.code.coding:herdbefundRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "herdbefundRadlex",
      "short" : "Herdbefund/Läsion (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID3933"
      }
    },
    {
      "id" : "Observation.code.coding:mikrokalkSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "mikrokalkSnomed",
      "short" : "Mikrokalkifikation (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "373945005"
      }
    },
    {
      "id" : "Observation.code.coding:mikrokalkRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "mikrokalkRadlex",
      "short" : "Mikrokalkifikation (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID4002"
      }
    },
    {
      "id" : "Observation.code.coding:lymphknotenSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "lymphknotenSnomed",
      "short" : "Lymphknoten-Status (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "301782006"
      }
    },
    {
      "id" : "Observation.code.coding:lymphknotenRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "lymphknotenRadlex",
      "short" : "Lymphknoten-Status (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID58844"
      }
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Observation.effective[x]:effectiveDateTime",
      "path" : "Observation.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Zeitpunkt der Beobachtung",
      "comment" : "Aus dotbase: 'Datum' der Bildgebung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Befundender Arzt"
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Befund-Wert",
      "comment" : "z.B. BI-RADS 3-5, ACR A-D, Herdbefund-Code, etc.",
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Freitext-Kommentare zum Befund",
      "comment" : "Aus dotbase: 'Details' Freitext pro Seite"
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "short" : "Seite/Region",
      "comment" : "Aus dotbase: Lateralität des Befunds (Links, Rechts, Beidseits)",
      "mustSupport" : true
    }]
  }
}

```
