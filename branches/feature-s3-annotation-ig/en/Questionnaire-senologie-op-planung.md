# Fragebogen: OP Planung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: OP Planung**

## Questionnaire: Form: Surgical Planning (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-op-planung | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:QuestOPPlanung |

 
Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel. 

*  [Tree view](#tabs-tree) 
*  [Sample Rendering](#tabs-sample) 
*  [Form Logic](#tabs-logic) 

### Test this Questionnaire

### Responses for this Questionnaire

* [Demonstriert das SDC Choice Selection Pattern: Bei bilateralem Karzinom wählt der Arzt die Bezugsdiagnose (Seite) für eine Procedure aus einer candidateExpression-basierten Liste aktiver Mamma-Conditions.](QuestionnaireResponse-Fall13-QR-Bezugsdiagnose-Selection.md)
* [OP-Planung Fall 1: BET links + Sentinel-LK-Biopsie, kurativ, 90 min, Drahtmarkierung.](QuestionnaireResponse-QR-OPPlanung-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-op-planung",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"]
  },
  "contained" : [{
    "resourceType" : "ServiceRequest",
    "id" : "op-planung-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung"]
    },
    "status" : "active",
    "intent" : "plan",
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "reasonReference" : [{
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }]
  }],
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
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#op-planung-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext",
        "code" : "patient"
      }
    },
    {
      "url" : "type",
      "valueCode" : "Patient"
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueCoding" : {
        "system" : "https://www.senologie.org/fhir/CodeSystem/launchContext",
        "code" : "diagnosis",
        "display" : "Diagnose (Anker-Condition)"
      }
    },
    {
      "url" : "type",
      "valueCode" : "Condition"
    },
    {
      "url" : "description",
      "valueString" : "Anker-Diagnose (Condition) für Pre-Population. Vom Frontend nach Diagnose-Choice gesetzt."
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung",
  "version" : "0.10.0",
  "name" : "QuestOPPlanung",
  "title" : "Fragebogen: OP Planung",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Surgical Planning"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
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
  "description" : "Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Condition?patient={{%patient.id}}&code=254837009&clinical-status=active"
      }
    },
    {
      "extension" : [{
        "url" : "path",
        "valueString" : "code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code"
      },
      {
        "url" : "label",
        "valueString" : "ICD-10"
      },
      {
        "url" : "forDisplay",
        "valueBoolean" : false
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
    },
    {
      "extension" : [{
        "url" : "path",
        "valueString" : "bodySite.coding.first().display"
      },
      {
        "url" : "label",
        "valueString" : "Seite"
      },
      {
        "url" : "forDisplay",
        "valueBoolean" : true
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
    }],
    "linkId" : "bezugsdiagnose",
    "text" : "Bezugsdiagnose (Seite)",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Reference Diagnosis (Laterality)"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "reference",
    "required" : true
  },
  {
    "linkId" : "op-art",
    "text" : "Art der geplanten Operation",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Planned Surgery Type"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "string",
    "required" : true
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
      "valueCode" : "optionsOnly"
    }],
    "linkId" : "seitenlokalisation",
    "text" : "Seite",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Laterality"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "choice",
    "required" : true,
    "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "BodyStructure?patient={{%patient.id}}&active=true"
      }
    }],
    "linkId" : "op-tumor-entitaet",
    "text" : "Zu operierende Tumor-Entität(en)",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Tumour Entity/Entities to Operate"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "reference",
    "required" : false,
    "repeats" : true
  },
  {
    "linkId" : "intention",
    "text" : "Intention / Grund der OP",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Surgical Intention / Indication"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "op-dauer-min",
    "text" : "Geplante OP-Dauer (Minuten)",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Planned Surgery Duration (Minutes)"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "integer",
    "required" : false
  },
  {
    "linkId" : "tumor-conference-consent",
    "text" : "CA-Behandlung / Tumorkonferenz-Zustimmung erteilt",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "CA Treatment / Tumour Board Consent Granted"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "boolean",
    "required" : false
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
      "valueCode" : "optionsOnly"
    }],
    "linkId" : "pre-op-markierung",
    "text" : "Präoperative Markierung geplant",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Preoperative Marking Planned"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "choice",
    "required" : false,
    "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-preop-markierung"
  },
  {
    "linkId" : "notes",
    "text" : "Planungsdetails / Freitext",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Planning Details / Free Text"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "text",
    "required" : false,
    "repeats" : true
  },
  {
    "linkId" : "pre-op-blutabnahme",
    "text" : "Präoperative Blutabnahme geplant",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Preoperative Blood Draw Planned"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "boolean",
    "required" : false
  },
  {
    "linkId" : "pre-op-antibiotika",
    "text" : "Präoperative Antibiotikatherapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Preoperative Antibiotic Therapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "string",
    "required" : false
  }]
}

```
