# Fragebogen: Verlaufsdokumentation / Nachsorge - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Verlaufsdokumentation / Nachsorge**

## Questionnaire: Fragebogen: Verlaufsdokumentation / Nachsorge () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-verlauf | **:0.10.0 |
| Draft | **:QuestVerlauf |

 
Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Template-based Extraction mit contained Templates für Klinischen Status und Tumorstatus. 

*   
*   
*   

### 

### 

* [6-Monats-Kontrolle 2025-07-15: aktive Nachsorge, AZ gut, Lokalbefund unauffaellig, kein Lymphoedem, kein Rezidiv, keine Fernmetastasen.](QuestionnaireResponse-QR-Verlauf-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-verlauf",
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
    "resourceType" : "Observation",
    "id" : "verlauf-klinisch-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "11323-3",
        "display" : "Health status"
      }],
      "text" : "Klinischer Status Verlauf"
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='kontrolltermin').item.where(linkId='kontrolltermin-datum').answer.valueDate"
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "365275006",
          "display" : "General well-being finding"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinischer-status').item.where(linkId='klinisch-allgemeinzustand').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "116339002",
          "display" : "Breast finding"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinischer-status').item.where(linkId='klinisch-lokalbefund').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "449620005",
          "display" : "Lymphedema of upper limb"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinischer-status').item.where(linkId='klinisch-lymphoedem').answer.valueCoding"
          }]
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "verlauf-tumorstatus-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "88040-1",
        "display" : "Response to cancer treatment"
      }],
      "text" : "Tumorstatus Verlauf"
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='kontrolltermin').item.where(linkId='kontrolltermin-datum').answer.valueDate"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='tumorstatus').item.where(linkId='tumorstatus-gesamtbeurteilung').answer.valueCoding"
        }]
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "395709001",
          "display" : "Locoregional recurrence"
        }]
      },
      "_valueBoolean" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='tumorstatus').item.where(linkId='tumorstatus-lokalrezidiv').answer.valueBoolean"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373572006",
          "display" : "Clinical state of distant metastases"
        }]
      },
      "_valueBoolean" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='tumorstatus').item.where(linkId='tumorstatus-fernmetastasen').answer.valueBoolean"
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
    },
    {
      "url" : "description",
      "valueString" : "Anker-Diagnose (Condition) für Pre-Population. Vom Frontend nach Diagnose-Choice gesetzt."
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf",
  "version" : "0.10.0",
  "name" : "QuestVerlauf",
  "title" : "Fragebogen: Verlaufsdokumentation / Nachsorge",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Follow-Up Documentation"
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Template-based Extraction mit contained Templates für Klinischen Status und Tumorstatus.",
  "item" : [{
    "linkId" : "kontrolltermin",
    "text" : "Kontrolltermin",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Follow-Up Appointment"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "kontrolltermin-datum",
      "text" : "Datum Vorstellung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date of Presentation"
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
      "linkId" : "kontrolltermin-art",
      "text" : "Art der Kontrolle",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of Follow-Up"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-kontrolltermin-art"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "kontrolltermin-art-nachsorge",
      "text" : "Art der Nachsorge",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of Aftercare"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-nachsorge-modus"
    },
    {
      "linkId" : "kontrolltermin-monate-seit-ed",
      "text" : "Monate seit Erstdiagnose",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Months Since Initial Diagnosis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#verlauf-klinisch-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "klinischer-status",
    "text" : "Klinischer Status",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Clinical Status"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "klinisch-allgemeinzustand",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "365275006",
        "display" : "General well-being finding"
      }],
      "text" : "Allgemeinzustand",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "General Condition"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-allgemeinzustand"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "klinisch-lokalbefund",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "116339002",
        "display" : "Breast finding"
      }],
      "text" : "Lokalbefund Brust",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Local Breast Finding"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "linkId" : "klinisch-lokalbefund-beschreibung",
      "text" : "Lokalbefund Beschreibung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Local Finding Description"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "enableWhen" : [{
        "question" : "klinisch-lokalbefund",
        "operator" : "=",
        "answerCoding" : {
          "code" : "25719005"
        }
      }],
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "klinisch-lymphoedem",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "449620005",
        "display" : "Lymphedema of upper limb"
      }],
      "text" : "Lymphödem",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Lymphoedema"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-lymphoedem-grad"
    },
    {
      "linkId" : "klinisch-armumfangsdifferenz",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "301712009",
        "display" : "Arm circumference"
      }],
      "text" : "Armumfangsdifferenz (cm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Arm Circumference Difference (cm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "decimal",
      "required" : false
    },
    {
      "linkId" : "klinisch-schmerzen",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "22253000",
        "display" : "Pain"
      }],
      "text" : "Schmerzen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Pain"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "boolean",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#verlauf-tumorstatus-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "tumorstatus",
    "text" : "Tumorstatus",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Tumour Status"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
        "valueExpression" : {
          "language" : "application/x-fhir-query",
          "expression" : "BodyStructure?patient={{%patient.id}}&active=true"
        }
      }],
      "linkId" : "verlauf-tumor-entitaet",
      "text" : "Beurteilte Tumor-Entität(en)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Assessed Tumour Entity/Entities"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "reference",
      "required" : false,
      "repeats" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "tumorstatus-gesamtbeurteilung",
      "text" : "Gesamtbeurteilung Verlauf",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Overall Assessment Follow-Up"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-verlauf-tumorstatus-gesamt"
    },
    {
      "linkId" : "tumorstatus-lokalrezidiv",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "363346000",
        "display" : "Malignant neoplastic disease"
      }],
      "text" : "Lokalrezidiv",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Local Recurrence"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "tumorstatus-rezidiv-datum",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "432213005",
        "display" : "Date of diagnosis"
      }],
      "text" : "Datum Rezidiv",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recurrence Date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "date",
      "enableWhen" : [{
        "question" : "tumorstatus-lokalrezidiv",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "tumorstatus-fernmetastasen",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399409002",
        "display" : "Distant metastasis present"
      }],
      "text" : "Fernmetastasen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Distant Metastases"
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
      "linkId" : "tumorstatus-metastasen-lokalisation",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "385421009",
        "display" : "Site of distant metastasis"
      }],
      "text" : "Metastasenlokalisation",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Metastasis Location"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "tumorstatus-fernmetastasen",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false,
      "repeats" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-fernmetastasen-lokalisation"
    }]
  },
  {
    "linkId" : "weiteres-vorgehen",
    "text" : "Weiteres Vorgehen",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Further Management"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "vorgehen-naechster-termin",
      "text" : "Nächster Kontrolltermin",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Next Follow-Up Appointment"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "vorgehen-empfehlung",
      "text" : "Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  }]
}

```
