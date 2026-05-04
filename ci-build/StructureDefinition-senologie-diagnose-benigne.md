# BIH PR Seno Diagnose Benigne - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH PR Seno Diagnose Benigne**

## Resource Profile: BIH PR Seno Diagnose Benigne 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-benigne | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Diagnose_Benigne |

 
Benigne Mamma-Diagnosen (D24, N60-N64) und entzündliche Erkrankungen. ISiK-kompatibel für Krankenhaus-Interoperabilität ohne Krebsregister-Anforderungen. 

**Usages:**

* Examples for this Profile: [Condition/Fall11-Diagnose-Fibroadenom](Condition-Fall11-Diagnose-Fibroadenom.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-diagnose-benigne)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-diagnose-benigne.csv), [Excel](StructureDefinition-senologie-diagnose-benigne.xlsx), [Schematron](StructureDefinition-senologie-diagnose-benigne.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-diagnose-benigne",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-benigne",
  "version" : "0.1.0",
  "name" : "Senologie_Diagnose_Benigne",
  "title" : "BIH PR Seno Diagnose Benigne",
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
  "description" : "Benigne Mamma-Diagnosen (D24, N60-N64) und entzündliche Erkrankungen. ISiK-kompatibel für Krankenhaus-Interoperabilität ohne Krebsregister-Anforderungen.",
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
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    },
    {
      "id" : "Condition.clinicalStatus",
      "path" : "Condition.clinicalStatus",
      "short" : "Klinischer Status",
      "mustSupport" : true
    },
    {
      "id" : "Condition.verificationStatus",
      "path" : "Condition.verificationStatus",
      "short" : "Diagnosestatus (bestätigt/vorläufig)",
      "mustSupport" : true
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "short" : "Benigne Mamma-Diagnose",
      "definition" : "Diagnosestellung für benigne Mamma-Erkrankungen (nicht krebsregister-pflichtig)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding",
      "path" : "Condition.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Condition.code.coding:icd10gm",
      "path" : "Condition.code.coding",
      "sliceName" : "icd10gm",
      "short" : "ICD-10-GM Code (D24, N60-N64)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd10gm.system",
      "path" : "Condition.code.coding.system",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:icd10gm.code",
      "path" : "Condition.code.coding.code",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:sct",
      "path" : "Condition.code.coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Diagnose (benigne)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:sct.system",
      "path" : "Condition.code.coding.system",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:sct.code",
      "path" : "Condition.code.coding.code",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:icd11",
      "path" : "Condition.code.coding",
      "sliceName" : "icd11",
      "short" : "ICD-11 Code (optional, Dual-Coding)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://id.who.int/icd/release/11/mms"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:icd11.system",
      "path" : "Condition.code.coding.system",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:icd11.code",
      "path" : "Condition.code.coding.code",
      "min" : 1
    },
    {
      "id" : "Condition.code.coding:senologie",
      "path" : "Condition.code.coding",
      "sliceName" : "senologie",
      "short" : "Senologie-spezifischer Code",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-lokal"
      },
      "mustSupport" : true
    },
    {
      "id" : "Condition.code.coding:senologie.system",
      "path" : "Condition.code.coding.system",
      "min" : 1
    },
    {
      "id" : "Condition.bodySite",
      "path" : "Condition.bodySite",
      "short" : "Seite/Lateralität",
      "mustSupport" : true
    },
    {
      "id" : "Condition.bodySite.coding",
      "path" : "Condition.bodySite.coding",
      "mustSupport" : true
    },
    {
      "id" : "Condition.subject",
      "path" : "Condition.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Condition.encounter",
      "path" : "Condition.encounter",
      "short" : "Zugehöriger Fall/Kontakt",
      "mustSupport" : true
    },
    {
      "id" : "Condition.onset[x]",
      "path" : "Condition.onset[x]",
      "short" : "Beginn der Erkrankung",
      "mustSupport" : true
    },
    {
      "id" : "Condition.recordedDate",
      "path" : "Condition.recordedDate",
      "short" : "Dokumentationsdatum",
      "mustSupport" : true
    }]
  }
}

```
