# Fragebogen: Tumorboard Empfehlung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Tumorboard Empfehlung**

## Questionnaire: Fragebogen: Tumorboard Empfehlung () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard | **:0.10.0 |
| Draft | **:QuestTumorboard |

 
Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinaeren Tumorkonferenz. Pro Therapie-Empfehlung mit Beschluss-Status (empfohlen/bedingt/nicht/nicht diskutiert) und Begruendung. SDC Template-based Extraction zu CarePlan. 

*   
*   
*   

### 

### 

* [Tumorboard 2025-01-28: BET + SLNB empfohlen, adjuvante RT empfohlen, endokrine Therapie empfohlen, Chemotherapie nicht empfohlen (Oncotype DX RS 18).](QuestionnaireResponse-QR-Tumorboard-Fall1.md)
* [Tumorboard 2025-06-03: Mastektomie mit Sofortrekonstruktion und adjuvante Chemotherapie empfohlen, Strahlentherapie und endokrine Therapie nicht empfohlen (hormonrezeptor-negativ).](QuestionnaireResponse-QR-Tumorboard-Fall10.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-tumorboard",
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
    "resourceType" : "CarePlan",
    "id" : "careplan-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
    },
    "status" : "active",
    "intent" : "plan",
    "category" : [{
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='tumorboard-typ').answer.valueCoding"
        }]
      }]
    }],
    "_title" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='tumorboard-titel').answer.valueString"
      }]
    },
    "_description" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='tumorboard-beschreibung').answer.valueString"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "period" : {
      "_start" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='tumorboard-datum').answer.valueDate"
        }]
      }
    },
    "addresses" : [{
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }],
    "activity" : [null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-op-optionen').answer.value"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-optionen').answer.value"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-optionen').answer.value"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-endokrin-optionen').answer.value"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-optionen').answer.value"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-optionen').answer.value"
      }]
    }],
    "note" : [{
      "_text" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='empfehlung-sonstiges').answer.valueString"
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
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#careplan-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard",
  "version" : "0.10.0",
  "name" : "QuestTumorboard",
  "title" : "Fragebogen: Tumorboard Empfehlung",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Tumour Board Recommendation"
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinaeren Tumorkonferenz. Pro Therapie-Empfehlung mit Beschluss-Status (empfohlen/bedingt/nicht/nicht diskutiert) und Begruendung. SDC Template-based Extraction zu CarePlan.",
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
    "linkId" : "tumorboard-datum",
    "text" : "Datum des Tumorboards",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Tumour Board Date"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "date",
    "required" : true
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
      "valueCode" : "optionsOnly"
    }],
    "linkId" : "tumorboard-typ",
    "text" : "Art der Tumorkonferenz",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Type of Tumour Board"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "choice",
    "required" : true,
    "answerOption" : [{
      "valueCoding" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
        "code" : "praeth",
        "display" : "prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)"
      }
    },
    {
      "valueCoding" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
        "code" : "postop",
        "display" : "postoperative Tumorkonferenz (Planung der postoperativen Therapie, z. B. zur Frage adjuvante Therapie)"
      }
    },
    {
      "valueCoding" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
        "code" : "postth",
        "display" : "posttherapeutische Tumorkonferenz (manche Tumore werden nicht operiert)"
      }
    },
    {
      "valueCoding" : {
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ",
        "code" : "ther",
        "display" : "Therapieplanung ohne Tumorkonferenz"
      }
    }]
  },
  {
    "linkId" : "tumorboard-titel",
    "text" : "Titel der Empfehlung",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Recommendation Title"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "tumorboard-beschreibung",
    "text" : "Zusammenfassung der Empfehlung",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Recommendation Summary"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "text",
    "required" : false
  },
  {
    "linkId" : "empfehlung-op-group",
    "text" : "Operative Therapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Surgical Therapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-op-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-op-optionen",
      "text" : "Empfohlene Verfahren",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommended procedures"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-op-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-op-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "392021009",
          "display" : "Brusterhaltende Operation (BET)",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Lumpectomy of breast"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "172043006",
          "display" : "Mastektomie",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Simple mastectomy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "428564008",
          "display" : "Hautsparende Mastektomie",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Skin sparing mastectomy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1380209001",
          "display" : "Nipple-sparing Mastektomie",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Nipple preserving subcutaneous mastectomy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "406505007",
          "display" : "Modifiziert radikale Mastektomie",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Modified radical mastectomy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "395165008",
          "display" : "Nachresektion",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Re-excision of breast for clearance of tumour margins"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "396487001",
          "display" : "Sentinel-Lymphknoten-Biopsie",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Sentinel lymph node biopsy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1396322000",
          "display" : "Targeted Axillary Dissection (TAD)",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Targeted axillary dissection"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "79544006",
          "display" : "Axilladissektion",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Complete axillary lymphadenectomy"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "302343007",
          "display" : "Rekonstruktion mit Implantat",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Insertion of prosthesis for breast"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "303445008",
          "display" : "Rekonstruktion mit Eigengewebe (Lappen)",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Reconstruction of breast with flap"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      }]
    },
    {
      "linkId" : "empfehlung-op-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-strahlentherapie-group",
    "text" : "Strahlentherapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Radiotherapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-strahlentherapie-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-strahlentherapie-optionen",
      "text" : "Zielvolumen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Target volume"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-strahlentherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-strahlentherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "428923005",
          "display" : "Ganze Brust",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Radiotherapy to breast"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "428624002",
          "display" : "Brustwand",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Radiotherapy to chest wall"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "429579007",
          "display" : "Axilla",
          "_display" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "en"
              },
              {
                "url" : "content",
                "valueString" : "Radiotherapy to axilla"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          }
        }
      }]
    },
    {
      "linkId" : "empfehlung-strahlentherapie-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-endokrin-group",
    "text" : "Endokrine Therapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Endocrine Therapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-endokrin-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-endokrin-optionen",
      "text" : "Empfohlene Substanzen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommended agents"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-endokrin-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-endokrin-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373345002",
          "display" : "Tamoxifen"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "386911004",
          "display" : "Letrozole"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "386910003",
          "display" : "Anastrozole"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "387017005",
          "display" : "Exemestane"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "385519002",
          "display" : "Fulvestrant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "108771008",
          "display" : "Goserelin"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397198002",
          "display" : "Leuprorelin"
        }
      }]
    },
    {
      "linkId" : "empfehlung-endokrin-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-chemotherapie-group",
    "text" : "Chemotherapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Chemotherapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-chemotherapie-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-chemotherapie-optionen",
      "text" : "Empfohlene Substanzen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommended agents"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-chemotherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-chemotherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "417916005",
          "display" : "Epirubicin"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "372817009",
          "display" : "Doxorubicin"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "387420009",
          "display" : "Cyclophosphamide"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "387374002",
          "display" : "Paclitaxel"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "426653008",
          "display" : "Albumin bound paclitaxel"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "386918005",
          "display" : "Docetaxel"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "386905002",
          "display" : "Carboplatin"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "386906001",
          "display" : "Capecitabine"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "708166000",
          "display" : "Eribulin"
        }
      }]
    },
    {
      "linkId" : "empfehlung-chemotherapie-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-zielgerichtet-group",
    "text" : "Zielgerichtete Therapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Targeted Therapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-zielgerichtet-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-zielgerichtet-optionen",
      "text" : "Empfohlene Substanzen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommended agents"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-zielgerichtet-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-zielgerichtet-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "387003001",
          "display" : "Trastuzumab"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "704226002",
          "display" : "Pertuzumab"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "702836004",
          "display" : "Trastuzumab emtansine"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "838469001",
          "display" : "Trastuzumab deruxtecan"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "715958001",
          "display" : "Palbociclib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "732257004",
          "display" : "Ribociclib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "761851004",
          "display" : "Abemaciclib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "432162002",
          "display" : "Olaparib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "782199007",
          "display" : "Talazoparib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "871701001",
          "display" : "Sacituzumab govitecan"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "871698009",
          "display" : "Tucatinib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "425820005",
          "display" : "Lapatinib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "736632003",
          "display" : "Neratinib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "788050002",
          "display" : "Alpelisib"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "428698007",
          "display" : "Everolimus"
        }
      }]
    },
    {
      "linkId" : "empfehlung-zielgerichtet-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-immuntherapie-group",
    "text" : "Immuntherapie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Immunotherapy"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-immuntherapie-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-immuntherapie-optionen",
      "text" : "Empfohlene Substanzen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommended agents"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "empfehlung-immuntherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "empfohlen"
        }
      },
      {
        "question" : "empfehlung-immuntherapie-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung",
          "code" : "bedingt-empfohlen"
        }
      }],
      "enableBehavior" : "any",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "716125002",
          "display" : "Pembrolizumab"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "719371003",
          "display" : "Atezolizumab"
        }
      }]
    },
    {
      "linkId" : "empfehlung-immuntherapie-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-diagnostik-group",
    "text" : "Weitere Diagnostik",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Further Diagnostics"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-diagnostik-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-diagnostik-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-studie-group",
    "text" : "Klinische Studie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Clinical Trial"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-studie-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-studie-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-genetik-group",
    "text" : "Genetische Untersuchung",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Genetic Testing"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-genetik-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-genetik-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-nachsorge-group",
    "text" : "Nachsorge",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Follow-Up"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "empfehlung-nachsorge-status",
      "text" : "Status der Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
    },
    {
      "linkId" : "empfehlung-nachsorge-begruendung",
      "text" : "Begruendung / Details (optional)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rationale / Details (Optional)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "empfehlung-sonstiges",
    "text" : "Sonstige Anmerkungen",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Other Remarks"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "text",
    "required" : false
  }]
}

```
