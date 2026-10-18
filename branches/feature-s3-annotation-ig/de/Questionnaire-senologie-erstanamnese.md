# Fragebogen: Erstanamnese - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Erstanamnese**

## Questionnaire: Fragebogen: Erstanamnese () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese | **:0.10.0 |
| Draft | **:QuestErstanamnese |

 
Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction. 

*   
*   
*   

### 

### 

* [Allgemeine + Gyn + Familienanamnese fuer Fall 1 (Erstvorstellung, postmenopausal, Mutter Mammakarzinom 52J).](QuestionnaireResponse-QR-Erstanamnese-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-erstanamnese",
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
    "id" : "anamnese-gynaek-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "89221-6",
        "display" : "Gynecology History and physical note"
      }],
      "text" : "Gynäkologische Anamnese",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Gynaecological History"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "anamnese-raucher-template",
    "meta" : {
      "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "social-history"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "72166-2",
        "display" : "Tobacco smoking status"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "77176002",
        "display" : "Smoker"
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
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='raucherstatus').item.where(linkId='raucherstatus-wert').answer.valueCoding"
        }]
      }]
    }
  },
  {
    "resourceType" : "FamilyMemberHistory",
    "id" : "anamnese-familie-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese"]
    },
    "status" : "completed",
    "patient" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "relationship" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
        "code" : "FAMMEMB",
        "display" : "family member"
      }]
    }
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
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese",
  "version" : "0.10.0",
  "name" : "QuestErstanamnese",
  "title" : "Fragebogen: Erstanamnese",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Initial Anamnesis"
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
  "description" : "Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction.",
  "item" : [{
    "linkId" : "allgemeine-anamnese",
    "text" : "Allgemeine Anamnese",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "General Medical History"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "datum-vorstellung",
      "text" : "Datum der Vorstellung",
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
      "linkId" : "vorstellungsgrund",
      "text" : "Vorstellungsgrund",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reason for Presentation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-vorstellungsgrund"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "screeningstatus",
      "text" : "Screeningstatus",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Screening Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-detektion-modus"
    },
    {
      "linkId" : "groesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "8302-2",
        "display" : "Body height"
      }],
      "text" : "Körpergröße (cm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Height (cm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "gewicht",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "29463-7",
        "display" : "Body weight"
      }],
      "text" : "Körpergewicht (kg)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Weight (kg)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ecog",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "89247-1",
        "display" : "ECOG Performance Status"
      }],
      "text" : "ECOG Leistungsstatus",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ECOG Performance Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ecog"
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#anamnese-raucher-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "raucherstatus",
    "text" : "Raucherstatus",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Smoking Status"
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
      "linkId" : "raucherstatus-wert",
      "definition" : "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus#Observation.valueCodeableConcept",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "72166-2",
        "display" : "Tobacco smoking status"
      }],
      "text" : "Raucherstatus",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Smoking Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-raucherstatus"
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#anamnese-gynaek-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "gynaekologische-anamnese",
    "text" : "Gynäkologische Anamnese",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Gynaecological History"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "menarchealter",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "42798-9",
        "display" : "Age at menarche"
      }],
      "text" : "Menarchealter (Jahre)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Menarche Age (Years)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "menopausenstatus",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "42802-9",
        "display" : "Age at menopause"
      }],
      "text" : "Menopausenstatus",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Menopausal Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus-erweitert"
    },
    {
      "linkId" : "gravida",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "11996-6",
        "display" : "Pregnancies"
      }],
      "text" : "Gravida (Schwangerschaften)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Gravida (Pregnancies)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "para",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "11977-6",
        "display" : "Parity"
      }],
      "text" : "Para (Geburten)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Parity (Deliveries)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "hormonersatztherapie",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "266717002",
        "display" : "Hormone replacement therapy"
      }],
      "text" : "Hormonersatztherapie (HRT)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Hormone Replacement Therapy (HRT)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ja-nein"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "orale-kontrazeption",
      "text" : "Hormonelle Verhütung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Hormonal Contraception"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-kontrazeption-status"
    },
    {
      "linkId" : "stilldauer",
      "text" : "Stilldauer (Monate)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Breastfeeding Duration (Months)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "linkId" : "familienanamnese",
    "text" : "Familienanamnese",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Family History"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "extension" : [{
        "extension" : [{
          "url" : "template",
          "valueReference" : {
            "reference" : "#anamnese-familie-template"
          }
        }],
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      }],
      "linkId" : "familienmitglied",
      "text" : "Familienmitglied",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Family Member"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "group",
      "required" : false,
      "repeats" : true,
      "item" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
          "valueCode" : "optionsOnly"
        }],
        "linkId" : "verwandtschaftsgrad",
        "text" : "Verwandtschaftsgrad",
        "_text" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "en"
            },
            {
              "url" : "content",
              "valueString" : "Degree of Relationship"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "type" : "choice",
        "required" : true,
        "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-verwandtschaftsgrad"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
          "valueCode" : "optionsOnly"
        }],
        "linkId" : "erkrankung",
        "text" : "Erkrankung",
        "_text" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "en"
            },
            {
              "url" : "content",
              "valueString" : "Condition"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "type" : "choice",
        "required" : true,
        "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-familien-erkrankung"
      },
      {
        "linkId" : "erkrankungsalter",
        "text" : "Erkrankungsalter (Jahre)",
        "_text" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "en"
            },
            {
              "url" : "content",
              "valueString" : "Age at Diagnosis (Years)"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "type" : "integer",
        "required" : false
      }]
    }]
  }]
}

```
