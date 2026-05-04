# Fragebogen: Erstanamnese - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Erstanamnese**

## Questionnaire: Fragebogen: Erstanamnese (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestErstanamnese |

 
Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-erstanamnese",
  "contained" : [{
    "resourceType" : "Observation",
    "id" : "anamnese-gynaek-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "89221-6",
        "display" : "Gynecology History and physical note"
      }],
      "text" : "Gynäkologische Anamnese"
    },
    "subject" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "anamnese-raucher-template",
    "status" : "final",
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
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
    }
  },
  {
    "resourceType" : "FamilyMemberHistory",
    "id" : "anamnese-familie-template",
    "status" : "completed",
    "patient" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
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
  "version" : "0.1.0",
  "name" : "QuestErstanamnese",
  "title" : "Fragebogen: Erstanamnese",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
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
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "datum-vorstellung",
      "text" : "Datum der Vorstellung",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "vorstellungsgrund",
      "text" : "Vorstellungsgrund",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "185387006",
          "display" : "Erstvorstellung"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "726007",
          "display" : "Zweitmeinung"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "390906007",
          "display" : "Nachsorge"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "183620003",
          "display" : "Wiedervorstellung"
        }
      }]
    },
    {
      "linkId" : "screeningstatus",
      "text" : "Screeningstatus",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "268547008",
          "display" : "Screening-detektiert"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "444589003",
          "display" : "Intervallkarzinom"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "129434009",
          "display" : "Selbstuntersuchung"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "261087003",
          "display" : "Zufallsbefund"
        }
      }]
    },
    {
      "linkId" : "groesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "8302-2",
        "display" : "Body height"
      }],
      "text" : "Körpergröße (cm)",
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
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ecog",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "89247-1",
        "display" : "ECOG Performance Status"
      }],
      "text" : "ECOG Leistungsstatus",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "0 — Normale Aktivität"
      },
      {
        "valueString" : "1 — Einschränkung bei Anstrengung"
      },
      {
        "valueString" : "2 — Gehfähig, nicht arbeitsfähig"
      },
      {
        "valueString" : "3 — Begrenzte Selbstversorgung"
      },
      {
        "valueString" : "4 — Völlig pflegebedürftig"
      }]
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
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "raucherstatus-wert",
      "text" : "Raucherstatus",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "LA18978-9",
          "display" : "Nie geraucht"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "LA15920-4",
          "display" : "Ehemaliger Raucher"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "LA18976-3",
          "display" : "Aktueller Raucher"
        }
      }]
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
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "menopausenstatus",
      "text" : "Menopausenstatus",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "309606002",
          "display" : "Prämenopausal"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "161541000119104",
          "display" : "Perimenopausal"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76498008",
          "display" : "Postmenopausal"
        }
      }]
    },
    {
      "linkId" : "gravida",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "11996-6",
        "display" : "Pregnancies"
      }],
      "text" : "Gravida (Schwangerschaften)",
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
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "hormonersatztherapie",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "266717002",
        "display" : "Hormone replacement therapy"
      }],
      "text" : "Hormonersatztherapie (HRT)",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373066001",
          "display" : "Ja"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373067005",
          "display" : "Nein"
        }
      }]
    },
    {
      "linkId" : "orale-kontrazeption",
      "text" : "Hormonelle Verhütung",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Nie"
      },
      {
        "valueString" : "Früher"
      },
      {
        "valueString" : "Aktuell"
      }]
    },
    {
      "linkId" : "stilldauer",
      "text" : "Stilldauer (Monate)",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "linkId" : "familienanamnese",
    "text" : "Familienanamnese",
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
      "type" : "group",
      "required" : false,
      "repeats" : true,
      "item" : [{
        "linkId" : "verwandtschaftsgrad",
        "text" : "Verwandtschaftsgrad",
        "type" : "choice",
        "required" : true,
        "answerOption" : [{
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "MTH",
            "display" : "Mutter"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "SIS",
            "display" : "Schwester"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "DAUC",
            "display" : "Tochter"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "GRMTH",
            "display" : "Großmutter"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "AUNT",
            "display" : "Tante"
          }
        }]
      },
      {
        "linkId" : "erkrankung",
        "text" : "Erkrankung",
        "type" : "choice",
        "required" : true,
        "answerOption" : [{
          "valueCoding" : {
            "system" : "http://snomed.info/sct",
            "code" : "254837009",
            "display" : "Mammakarzinom"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://snomed.info/sct",
            "code" : "363443007",
            "display" : "Ovarialkarzinom"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://snomed.info/sct",
            "code" : "74964007",
            "display" : "Sonstiges"
          }
        }]
      },
      {
        "linkId" : "erkrankungsalter",
        "text" : "Erkrankungsalter (Jahre)",
        "type" : "integer",
        "required" : false
      }]
    }]
  }]
}

```
