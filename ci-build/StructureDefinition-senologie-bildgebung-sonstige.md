# BIH Senologie Bildgebung Sonstige - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Bildgebung Sonstige**

## Resource Profile: BIH Senologie Bildgebung Sonstige 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-sonstige | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Bildgebung_Sonstige |

 
DiagnosticReport für nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (z.B. Skelettszintigraphie, CT, PET-CT, Röntgen Thorax, Lebersonographie). 

**Usages:**

* Examples for this Profile: [DiagnosticReport/Example-Bildgebung-Skelettszintigraphie](DiagnosticReport-Example-Bildgebung-Skelettszintigraphie.md), [DiagnosticReport/Fall1-Bildgebung-Skelettszintigraphie](DiagnosticReport-Fall1-Bildgebung-Skelettszintigraphie.md), [DiagnosticReport/Fall2-Bildgebung-CT](DiagnosticReport-Fall2-Bildgebung-CT.md) and [DiagnosticReport/Fall2-Bildgebung-Skelettszintigraphie](DiagnosticReport-Fall2-Bildgebung-Skelettszintigraphie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-bildgebung-sonstige)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-bildgebung-sonstige.csv), [Excel](StructureDefinition-senologie-bildgebung-sonstige.xlsx), [Schematron](StructureDefinition-senologie-bildgebung-sonstige.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-bildgebung-sonstige",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-sonstige",
  "version" : "0.1.0",
  "name" : "Senologie_Bildgebung_Sonstige",
  "title" : "BIH Senologie Bildgebung Sonstige",
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
  "description" : "DiagnosticReport für nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (z.B. Skelettszintigraphie, CT, PET-CT, Röntgen Thorax, Lebersonographie).",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport"
    },
    {
      "id" : "DiagnosticReport.extension",
      "path" : "DiagnosticReport.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "DiagnosticReport.extension:examinationLocation",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "examinationLocation",
      "short" : "Standort der bildgebenden Untersuchung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-examination-location"]
      }]
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Abgeschlossener Befundbericht",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "short" : "Diagnostik / Bildgebung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
          "code" : "RAD",
          "display" : "Radiology"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "short" : "Art der Bildgebung (Modalität)",
      "comment" : "Kodierung der Bildgebungsmodalität über LOINC oder SNOMED CT. Im Gegensatz zum Mamma-Bildgebungsprofil sind hier keine festen Slices definiert — die konkreten Modalitäten werden durch das Formular gesteuert.",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code.coding",
      "path" : "DiagnosticReport.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code.coding:loinc",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "loinc",
      "short" : "LOINC-Code der Bildgebungsmodalität",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org"
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code.coding:snomed",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "snomed",
      "short" : "SNOMED-CT-Code der Bildgebungsmodalität",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.effective[x]",
      "path" : "DiagnosticReport.effective[x]",
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
      "id" : "DiagnosticReport.effective[x]:effectiveDateTime",
      "path" : "DiagnosticReport.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Datum der Untersuchung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.resultsInterpreter",
      "path" : "DiagnosticReport.resultsInterpreter",
      "short" : "Befundender Arzt",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Detailbefunde als Observations",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Befundtext / Zusammenfassung",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.conclusionCode",
      "path" : "DiagnosticReport.conclusionCode",
      "short" : "Kodierte Befundaussage",
      "comment" : "z.B. Metastasenverdacht ja/nein, Befundkategorie",
      "mustSupport" : true
    }]
  }
}

```
