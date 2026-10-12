# BIH Senologie Tumorboard Empfehlung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Tumorboard Empfehlung**

## Resource Profile: BIH Senologie Tumorboard Empfehlung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Tumorboard_Empfehlung |

 
CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard) 

**Usages:**

* Use this Profile: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profile: [CarePlan/Fall1-Tumorboard](CarePlan-Fall1-Tumorboard.md), [CarePlan/Fall10-Tumorboard](CarePlan-Fall10-Tumorboard.md), [CarePlan/Fall12-Tumorboard](CarePlan-Fall12-Tumorboard.md), [CarePlan/Fall14-Tumorboard-Postop](CarePlan-Fall14-Tumorboard-Postop.md)... Show 8 more, [CarePlan/Fall14-Tumorboard-Praetherapeutisch](CarePlan-Fall14-Tumorboard-Praetherapeutisch.md), [CarePlan/Fall2-Tumorboard-Initial](CarePlan-Fall2-Tumorboard-Initial.md), [CarePlan/Fall2-Tumorboard-Progression](CarePlan-Fall2-Tumorboard-Progression.md), [CarePlan/Fall4-Tumorboard](CarePlan-Fall4-Tumorboard.md), [CarePlan/Fall5-Tumorboard-Neoadjuvant](CarePlan-Fall5-Tumorboard-Neoadjuvant.md), [CarePlan/Fall5-Tumorboard-Postoperativ](CarePlan-Fall5-Tumorboard-Postoperativ.md), [CarePlan/Fall7-Tumorboard](CarePlan-Fall7-Tumorboard.md) and [CarePlan/Fall9-Tumorboard](CarePlan-Fall9-Tumorboard.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-tumorboard-empfehlung.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-tumorboard-empfehlung.csv), [Excel](../StructureDefinition-senologie-tumorboard-empfehlung.xlsx), [Schematron](../StructureDefinition-senologie-tumorboard-empfehlung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-tumorboard-empfehlung",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung",
  "version" : "0.10.0",
  "name" : "Senologie_Tumorboard_Empfehlung",
  "title" : "BIH Senologie Tumorboard Empfehlung",
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
  "description" : "CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Tumorkonferenz"
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
  "type" : "CarePlan",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CarePlan.status",
      "path" : "CarePlan.status",
      "short" : "Aktiver Care Plan",
      "fixedCode" : "active"
    },
    {
      "id" : "CarePlan.intent",
      "path" : "CarePlan.intent",
      "short" : "Tumorboard-Empfehlung als Planungsplan",
      "fixedCode" : "plan",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category",
      "path" : "CarePlan.category",
      "short" : "Art der Tumorkonferenz / Therapieplanung",
      "comment" : "Codiert nach MII Onko therapieplanung-typ (1:1 wiederverwendet — praeth/postop/postth/ther)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-therapieplanung-typ"
      }
    },
    {
      "id" : "CarePlan.title",
      "path" : "CarePlan.title",
      "short" : "Tumorboard Empfehlung",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.description",
      "path" : "CarePlan.description",
      "short" : "Empfehlungen der interdisziplinären Tumorkonferenz",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.subject",
      "path" : "CarePlan.subject",
      "short" : "Patient für den das Tumorboard stattfindet",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.period",
      "path" : "CarePlan.period",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.period.start",
      "path" : "CarePlan.period.start",
      "short" : "Datum des Tumorboard",
      "comment" : "'Datum'",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.contributor",
      "path" : "CarePlan.contributor",
      "short" : "Ärzte/Spezialisten des Tumorboards"
    },
    {
      "id" : "CarePlan.careTeam",
      "path" : "CarePlan.careTeam",
      "short" : "Beteiligte Fachgruppen",
      "comment" : "References zu CareTeam mit verschiedenen Fachdisziplinen (Chirurgie, Onkologie, Radiologie, Pathologie, etc.)"
    },
    {
      "id" : "CarePlan.addresses",
      "path" : "CarePlan.addresses",
      "short" : "Grund des Tumorboards (Diagnose)",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity",
      "path" : "CarePlan.activity",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "detail.code"
        }],
        "description" : "Slicing nach Art der empfohlenen Maßnahme (über detail.code Pattern)",
        "rules" : "open"
      },
      "short" : "Empfohlene Maßnahmen",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity:operativeTherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "operativeTherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:operativeTherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:operativeTherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene operative Therapie",
      "comment" : "Operative Therapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "387713003",
          "display" : "Surgical procedure (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:chemotherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "chemotherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:chemotherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "MedicationRequest"
    },
    {
      "id" : "CarePlan.activity:chemotherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene Chemotherapie",
      "comment" : "Chemotherapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "385786002",
          "display" : "Chemotherapy care (regime/therapy)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:radiotherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "radiotherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:radiotherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:radiotherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene Strahlentherapie",
      "comment" : "Strahlentherapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1287742003",
          "display" : "Radiotherapy (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:endocrineTherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "endocrineTherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:endocrineTherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "MedicationRequest"
    },
    {
      "id" : "CarePlan.activity:endocrineTherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene endokrine Therapie",
      "comment" : "Endokrine Therapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "169413002",
          "display" : "Hormone therapy (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:targetedTherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "targetedTherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:targetedTherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "MedicationRequest"
    },
    {
      "id" : "CarePlan.activity:targetedTherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene zielgerichtete Therapie",
      "comment" : "Zielgerichtete Therapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "416608005",
          "display" : "Drug therapy"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:immunotherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "immunotherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:immunotherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "MedicationRequest"
    },
    {
      "id" : "CarePlan.activity:immunotherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene Immuntherapie",
      "comment" : "Immuntherapie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "76334006",
          "display" : "Immunotherapy (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:antiresorptiveTherapy",
      "path" : "CarePlan.activity",
      "sliceName" : "antiresorptiveTherapy",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:antiresorptiveTherapy.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "MedicationRequest"
    },
    {
      "id" : "CarePlan.activity:antiresorptiveTherapy.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene antiresorptive Therapie",
      "comment" : "Antiresorptive Therapie: (choice, z.B. Bisphosphonate)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "870370003",
          "display" : "Antiresorptive therapy (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:furtherDiagnostics",
      "path" : "CarePlan.activity",
      "sliceName" : "furtherDiagnostics",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:furtherDiagnostics.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:furtherDiagnostics.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene weitere Diagnostik",
      "comment" : "Weitere Diagnostik: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "165197003",
          "display" : "Diagnostic assessment (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:furtherIntervention",
      "path" : "CarePlan.activity",
      "sliceName" : "furtherIntervention",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:furtherIntervention.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:furtherIntervention.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene weitere Intervention",
      "comment" : "Weitere Intervention: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "71388002",
          "display" : "Procedure (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:genetics",
      "path" : "CarePlan.activity",
      "sliceName" : "genetics",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:genetics.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:genetics.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene genetische Untersuchung",
      "comment" : "Genetische Untersuchung: (choice, z.B. BRCA)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "405825005",
          "display" : "Molecular genetic test"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:clinicalTrial",
      "path" : "CarePlan.activity",
      "sliceName" : "clinicalTrial",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:clinicalTrial.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "ServiceRequest"
    },
    {
      "id" : "CarePlan.activity:clinicalTrial.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Empfohlene klinische Studie",
      "comment" : "Studie: (choice)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "110465008",
          "display" : "Clinical trial (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:clinicalTrial.detail.description",
      "path" : "CarePlan.activity.detail.description",
      "comment" : "Optional 'Sonstige Studie' (Freitext)"
    },
    {
      "id" : "CarePlan.activity:followUp",
      "path" : "CarePlan.activity",
      "sliceName" : "followUp",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "CarePlan.activity:followUp.detail.kind",
      "path" : "CarePlan.activity.detail.kind",
      "patternCode" : "Appointment"
    },
    {
      "id" : "CarePlan.activity:followUp.detail.code",
      "path" : "CarePlan.activity.detail.code",
      "short" : "Follow-up / Nachsorge Plan",
      "comment" : "'Vorsorge/Nachsorge', 'Wiedervorstellung'",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "390906007",
          "display" : "Follow-up encounter (procedure)"
        }]
      }
    },
    {
      "id" : "CarePlan.activity:followUp.detail.scheduled[x]",
      "path" : "CarePlan.activity.detail.scheduled[x]",
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
      "id" : "CarePlan.activity:followUp.detail.scheduled[x]:scheduledTiming",
      "path" : "CarePlan.activity.detail.scheduled[x]",
      "sliceName" : "scheduledTiming",
      "short" : "Zeitplan für Nachsorge/Wiedervorstellung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Timing"
      }]
    },
    {
      "id" : "CarePlan.note",
      "path" : "CarePlan.note",
      "short" : "Allgemeine Anmerkungen des Tumorboards",
      "comment" : "Sonstiges: (choice)"
    }]
  }
}

```
