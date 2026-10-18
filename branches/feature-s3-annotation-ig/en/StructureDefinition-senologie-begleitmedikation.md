# BIH Senologie Begleitmedikation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Begleitmedikation**

## Resource Profile: BIH Senologie Begleitmedikation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Begleitmedikation |

 
Begleitmedikation der Patientin – aktuelle Dauermedikation und sonstige Medikamente, die nicht Teil der onkologischen Systemtherapie sind (z. B. Antihypertensiva, Schilddrüsenhormone, Antikoagulantien). 

**Usages:**

* Examples for this Profile: [MedicationStatement/Example-Begleitmedikation-Metoprolol](MedicationStatement-Example-Begleitmedikation-Metoprolol.md), [MedicationStatement/Fall1-Begleitmedikation-LThyroxin](MedicationStatement-Fall1-Begleitmedikation-LThyroxin.md), [MedicationStatement/Fall1-Begleitmedikation-Metoprolol](MedicationStatement-Fall1-Begleitmedikation-Metoprolol.md), [MedicationStatement/Fall2-Begleitmedikation-Ondansetron](MedicationStatement-Fall2-Begleitmedikation-Ondansetron.md)... Show 5 more, [MedicationStatement/Fall2-Begleitmedikation-Zoledronat](MedicationStatement-Fall2-Begleitmedikation-Zoledronat.md), [MedicationStatement/Fall3-Begleitmedikation-Anastrozol](MedicationStatement-Fall3-Begleitmedikation-Anastrozol.md), [MedicationStatement/Fall5-Begleitmedikation-Letrozol](MedicationStatement-Fall5-Begleitmedikation-Letrozol.md), [MedicationStatement/Fall8-Begleitmedikation-Tamoxifen](MedicationStatement-Fall8-Begleitmedikation-Tamoxifen.md) and [MedicationStatement/Fall9-Begleitmedikation-Tamoxifen](MedicationStatement-Fall9-Begleitmedikation-Tamoxifen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-begleitmedikation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-begleitmedikation.csv), [Excel](../StructureDefinition-senologie-begleitmedikation.xlsx), [Schematron](../StructureDefinition-senologie-begleitmedikation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-begleitmedikation",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation",
  "version" : "0.10.0",
  "name" : "Senologie_Begleitmedikation",
  "title" : "BIH Senologie Begleitmedikation",
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
  "description" : "Begleitmedikation der Patientin – aktuelle Dauermedikation und sonstige Medikamente, die nicht Teil der onkologischen Systemtherapie sind (z. B. Antihypertensiva, Schilddrüsenhormone, Antikoagulantien).",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Begleitmedikation"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationStatement",
      "path" : "MedicationStatement"
    },
    {
      "id" : "MedicationStatement.status",
      "path" : "MedicationStatement.status",
      "short" : "Status der Medikationsaussage",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.medication[x]",
      "path" : "MedicationStatement.medication[x]",
      "short" : "Medikament",
      "comment" : "Codierung bevorzugt über SNOMED CT (Pharmaceutical / biologic product). Freitext über .text möglich.",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://snomed.info/sct?fhir_vs=isa/373873005"
      }
    },
    {
      "id" : "MedicationStatement.medication[x].text",
      "path" : "MedicationStatement.medication[x].text",
      "short" : "Medikationsname (Freitext)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.subject",
      "path" : "MedicationStatement.subject",
      "short" : "Patientin",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.effective[x]",
      "path" : "MedicationStatement.effective[x]",
      "short" : "Einnahmezeitraum",
      "type" : [{
        "code" : "Period"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dateAsserted",
      "path" : "MedicationStatement.dateAsserted",
      "short" : "Datum der Angabe",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.reasonReference",
      "path" : "MedicationStatement.reasonReference",
      "short" : "Grund / zugehörige Diagnose"
    },
    {
      "id" : "MedicationStatement.dosage",
      "path" : "MedicationStatement.dosage",
      "short" : "Dosierung",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dosage.text",
      "path" : "MedicationStatement.dosage.text",
      "short" : "Dosierschema (Freitext)"
    },
    {
      "id" : "MedicationStatement.dosage.doseAndRate",
      "path" : "MedicationStatement.dosage.doseAndRate",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dosage.doseAndRate.dose[x]",
      "path" : "MedicationStatement.dosage.doseAndRate.dose[x]",
      "short" : "Dosis"
    }]
  }
}

```
