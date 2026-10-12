# BIH Senologie Systemtherapie Medikation (einzelne Gabe) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Systemtherapie Medikation (einzelne Gabe)**

## Resource Profile: BIH Senologie Systemtherapie Medikation (einzelne Gabe) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-medikation | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Systemtherapie_Medikation |

 
MedicationStatement für einzelne Medikamentengaben. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko. 

**Usages:**

* Examples for this Profile: [MedicationStatement/Example-Medikation-Epirubicin](MedicationStatement-Example-Medikation-Epirubicin.md), [MedicationStatement/Fall10-Medikation-Carboplatin](MedicationStatement-Fall10-Medikation-Carboplatin.md), [MedicationStatement/Fall10-Medikation-Paclitaxel](MedicationStatement-Fall10-Medikation-Paclitaxel.md), [MedicationStatement/Fall2-Medikation-Carboplatin](MedicationStatement-Fall2-Medikation-Carboplatin.md)... Show 11 more, [MedicationStatement/Fall2-Medikation-Paclitaxel](MedicationStatement-Fall2-Medikation-Paclitaxel.md), [MedicationStatement/Fall2-Medikation-Pembrolizumab](MedicationStatement-Fall2-Medikation-Pembrolizumab.md), [MedicationStatement/Fall4-Medikation-Carboplatin](MedicationStatement-Fall4-Medikation-Carboplatin.md), [MedicationStatement/Fall4-Medikation-Docetaxel](MedicationStatement-Fall4-Medikation-Docetaxel.md), [MedicationStatement/Fall4-Medikation-Pertuzumab](MedicationStatement-Fall4-Medikation-Pertuzumab.md), [MedicationStatement/Fall4-Medikation-Trastuzumab](MedicationStatement-Fall4-Medikation-Trastuzumab.md), [MedicationStatement/Fall7-Medikation-Carboplatin](MedicationStatement-Fall7-Medikation-Carboplatin.md), [MedicationStatement/Fall7-Medikation-Epirubicin](MedicationStatement-Fall7-Medikation-Epirubicin.md), [MedicationStatement/Fall7-Medikation-Paclitaxel](MedicationStatement-Fall7-Medikation-Paclitaxel.md), [MedicationStatement/Fall9-Medikation-Epirubicin](MedicationStatement-Fall9-Medikation-Epirubicin.md) and [MedicationStatement/Fall9-Medikation-Paclitaxel](MedicationStatement-Fall9-Medikation-Paclitaxel.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-systemtherapie-medikation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-systemtherapie-medikation.csv), [Excel](../StructureDefinition-senologie-systemtherapie-medikation.xlsx), [Schematron](../StructureDefinition-senologie-systemtherapie-medikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-systemtherapie-medikation",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "kds-senologie"
      },
      {
        "url" : "version",
        "valueString" : "0.10.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.senologie.org/fhir"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C4872",
        "display" : "Breast Carcinoma"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-09-15"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-medikation",
  "version" : "0.10.0",
  "name" : "Senologie_Systemtherapie_Medikation",
  "title" : "BIH Senologie Systemtherapie Medikation (einzelne Gabe)",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-12",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "MedicationStatement für einzelne Medikamentengaben. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: SystemischeTherapie.Medikation"
  },
  {
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationStatement",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-systemische-therapie-medikation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationStatement",
      "path" : "MedicationStatement"
    },
    {
      "id" : "MedicationStatement.extension",
      "path" : "MedicationStatement.extension",
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
      "id" : "MedicationStatement.extension:therapyCycle",
      "path" : "MedicationStatement.extension",
      "sliceName" : "therapyCycle",
      "short" : "Therapie-Zyklus",
      "comment" : "Zyklus: (1, 2, 3, etc.)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-cycle"]
      }]
    },
    {
      "id" : "MedicationStatement.extension:dayInCycle",
      "path" : "MedicationStatement.extension",
      "sliceName" : "dayInCycle",
      "short" : "Tag im Zyklus",
      "comment" : "Tag: (Tag 1-N innerhalb eines Zyklus)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle"]
      }]
    },
    {
      "id" : "MedicationStatement.partOf",
      "path" : "MedicationStatement.partOf",
      "short" : "Zugehörig zu Systemtherapie-Procedure"
    },
    {
      "id" : "MedicationStatement.status",
      "path" : "MedicationStatement.status",
      "short" : "Durchgeführt",
      "fixedCode" : "completed"
    },
    {
      "id" : "MedicationStatement.medication[x]",
      "path" : "MedicationStatement.medication[x]",
      "short" : "Substanz/Medikament",
      "comment" : "Substanz: — SNOMED CT Binding auf Senologie-Medikationsliste, ATC/UNII geerbt von MII Onko"
    },
    {
      "id" : "MedicationStatement.medication[x]:medicationCodeableConcept",
      "path" : "MedicationStatement.medication[x]",
      "sliceName" : "medicationCodeableConcept",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "MedicationStatement.medication[x]:medicationCodeableConcept.coding:sct",
      "path" : "MedicationStatement.medication[x].coding",
      "sliceName" : "sct",
      "short" : "SNOMED CT Wirkstoff",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct"
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"
      }
    },
    {
      "id" : "MedicationStatement.effective[x]",
      "path" : "MedicationStatement.effective[x]",
      "short" : "Zeitraum der Gabe"
    },
    {
      "id" : "MedicationStatement.dateAsserted",
      "path" : "MedicationStatement.dateAsserted",
      "short" : "Datum der Medikamentengabe"
    },
    {
      "id" : "MedicationStatement.reasonReference",
      "path" : "MedicationStatement.reasonReference",
      "short" : "Bezogene Diagnose"
    },
    {
      "id" : "MedicationStatement.note",
      "path" : "MedicationStatement.note",
      "short" : "Besonderheiten/Kommentar zur Gabe"
    },
    {
      "id" : "MedicationStatement.dosage.doseAndRate.dose[x]",
      "path" : "MedicationStatement.dosage.doseAndRate.dose[x]",
      "short" : "Verabreichte Dosis"
    }]
  }
}

```
