# Fragebogen: Erstanamnese - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Erstanamnese**

## Questionnaire: Fragebogen: Erstanamnese (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestErstanamnese |

 
Fragebogen zur Erstanamnese (Allgemeine Anamnese, Gynäkologische Anamnese, Familienanamnese). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Observation, FamilyMemberHistory). 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-erstanamnese",
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
  "date" : "2026-05-04T06:44:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur Erstanamnese (Allgemeine Anamnese, Gynäkologische Anamnese, Familienanamnese). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Observation, FamilyMemberHistory).",
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
          "display" : "New patient consultation"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "726007",
          "display" : "Pathology consultation, comprehensive, records and specimen with report"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "390906007",
          "display" : "Follow-up encounter"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "183620003",
          "display" : "Aftercare follow-up visit"
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
          "display" : "Screening for malignant neoplasm of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "444589003",
          "display" : "Malignant neoplasm detection during interval between recommended screening examinations"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "129434009",
          "display" : "Self-examination of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "261087003",
          "display" : "Incidental"
        }
      }]
    }]
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Observation"
      }
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
          "display" : "Before menopause"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "161541000119104",
          "display" : "Perimenopausal state"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76498008",
          "display" : "Postmenopausal state"
        }
      }]
    },
    {
      "linkId" : "gravida",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "11996-6",
        "display" : "[#] Pregnancies"
      }],
      "text" : "Gravida (Anzahl Schwangerschaften)",
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
      "text" : "Para (Anzahl Geburten)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "hormonersatztherapie",
      "text" : "Hormonersatztherapie",
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "orale-kontrazeption",
      "text" : "Orale Kontrazeption",
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "stilldauer",
      "text" : "Stilldauer",
      "type" : "string",
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
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
        "valueExpression" : {
          "language" : "application/x-fhir-query",
          "expression" : "FamilyMemberHistory"
        }
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
            "display" : "Mother"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "SIS",
            "display" : "Sister"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "DAUC",
            "display" : "Daughter"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "GRMTH",
            "display" : "Grandmother"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
            "code" : "AUNT",
            "display" : "Aunt"
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
            "display" : "Malignant neoplasm of breast"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://snomed.info/sct",
            "code" : "363443007",
            "display" : "Malignant tumor of ovary"
          }
        },
        {
          "valueCoding" : {
            "system" : "http://snomed.info/sct",
            "code" : "74964007",
            "display" : "Other"
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
