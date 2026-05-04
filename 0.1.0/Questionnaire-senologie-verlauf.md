# Fragebogen: Verlaufsdokumentation / Nachsorge - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Verlaufsdokumentation / Nachsorge**

## Questionnaire: Fragebogen: Verlaufsdokumentation / Nachsorge (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-verlauf | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestVerlauf |

 
Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Definition-based Extraction mit Observation als Ziel fuer klinischen Status und Tumorstatus (Senologie_FollowUp). 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-verlauf",
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf",
  "version" : "0.1.0",
  "name" : "QuestVerlauf",
  "title" : "Fragebogen: Verlaufsdokumentation / Nachsorge",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Definition-based Extraction mit Observation als Ziel fuer klinischen Status und Tumorstatus (Senologie_FollowUp).",
  "item" : [{
    "linkId" : "kontrolltermin",
    "text" : "Kontrolltermin",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "kontrolltermin-datum",
      "text" : "Datum Vorstellung",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "kontrolltermin-art",
      "text" : "Art der Kontrolle",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueString" : "6-Monats-Kontrolle"
      },
      {
        "valueString" : "12-Monats-Kontrolle"
      },
      {
        "valueString" : "Ausserplanmaessig"
      },
      {
        "valueString" : "Abschlusskontrolle"
      }]
    },
    {
      "linkId" : "kontrolltermin-monate-seit-ed",
      "text" : "Monate seit Erstdiagnose",
      "type" : "integer",
      "required" : false
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
    "linkId" : "klinischer-status",
    "text" : "Klinischer Status",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "klinisch-allgemeinzustand",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "365275006",
        "display" : "General well-being finding"
      }],
      "text" : "Allgemeinzustand",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Gut"
      },
      {
        "valueString" : "Eingeschraenkt"
      },
      {
        "valueString" : "Schlecht"
      }]
    },
    {
      "linkId" : "klinisch-lokalbefund",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "116339002",
        "display" : "Breast finding"
      }],
      "text" : "Lokalbefund Brust",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Unauffaellig"
      },
      {
        "valueString" : "Auffaellig"
      }]
    },
    {
      "linkId" : "klinisch-lokalbefund-beschreibung",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.note.text",
      "text" : "Lokalbefund Beschreibung",
      "type" : "text",
      "enableWhen" : [{
        "question" : "klinisch-lokalbefund",
        "operator" : "=",
        "answerString" : "Auffaellig"
      }],
      "required" : false
    },
    {
      "linkId" : "klinisch-lymphoedem",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "449620005",
        "display" : "Lymphedema of upper limb"
      }],
      "text" : "Lymphoedem",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Kein"
      },
      {
        "valueString" : "Grad I"
      },
      {
        "valueString" : "Grad II"
      },
      {
        "valueString" : "Grad III"
      }]
    },
    {
      "linkId" : "klinisch-armumfangsdifferenz",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "301712009",
        "display" : "Arm circumference"
      }],
      "text" : "Armumfangsdifferenz (cm)",
      "type" : "decimal",
      "required" : false
    },
    {
      "linkId" : "klinisch-schmerzen",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "22253000",
        "display" : "Pain"
      }],
      "text" : "Schmerzen",
      "type" : "boolean",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Observation?_profile=https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up"
      }
    }],
    "linkId" : "tumorstatus",
    "text" : "Tumorstatus",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "tumorstatus-gesamtbeurteilung",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.value[x]",
      "text" : "Gesamtbeurteilung Verlauf",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "103338009",
          "display" : "In full remission"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "103337004",
          "display" : "In partial remission"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "58158008",
          "display" : "Stable"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "271299001",
          "display" : "Tumor progression"
        }
      },
      {
        "valueString" : "Kein Anhalt fuer Tumor"
      }]
    },
    {
      "linkId" : "tumorstatus-lokalrezidiv",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "363346000",
        "display" : "Malignant neoplastic disease"
      }],
      "text" : "Lokalrezidiv",
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "tumorstatus-rezidiv-datum",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "432213005",
        "display" : "Date of diagnosis"
      }],
      "text" : "Datum Rezidiv",
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
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399409002",
        "display" : "Distant metastasis present"
      }],
      "text" : "Fernmetastasen",
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "tumorstatus-metastasen-lokalisation",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "385421009",
        "display" : "Site of distant metastasis"
      }],
      "text" : "Metastasenlokalisation",
      "type" : "choice",
      "enableWhen" : [{
        "question" : "tumorstatus-fernmetastasen",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueString" : "Lunge"
      },
      {
        "valueString" : "Leber"
      },
      {
        "valueString" : "Knochen"
      },
      {
        "valueString" : "Hirn"
      },
      {
        "valueString" : "Sonstige"
      }]
    }]
  },
  {
    "linkId" : "weiteres-vorgehen",
    "text" : "Weiteres Vorgehen",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "vorgehen-naechster-termin",
      "text" : "Naechster Kontrolltermin",
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "vorgehen-empfehlung",
      "text" : "Empfehlung",
      "type" : "text",
      "required" : false
    }]
  }]
}

```
