# Fragebogen: Verlaufsdokumentation / Nachsorge - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Verlaufsdokumentation / Nachsorge**

## Questionnaire: Fragebogen: Verlaufsdokumentation / Nachsorge (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-verlauf | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestVerlauf |

 
Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Template-based Extraction mit contained Templates für Klinischen Status und Tumorstatus. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-verlauf",
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
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
    }
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
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf",
  "version" : "0.1.0",
  "name" : "QuestVerlauf",
  "title" : "Fragebogen: Verlaufsdokumentation / Nachsorge",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
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
        "valueString" : "Außerplanmäßig"
      },
      {
        "valueString" : "Abschlusskontrolle"
      }]
    },
    {
      "linkId" : "kontrolltermin-art-nachsorge",
      "text" : "Art der Nachsorge",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueString" : "Aktiv (persönlich untersucht)"
      },
      {
        "valueString" : "Passiv (aus Akten/Registern)"
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
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "klinisch-allgemeinzustand",
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
        "valueString" : "Eingeschränkt"
      },
      {
        "valueString" : "Schlecht"
      }]
    },
    {
      "linkId" : "klinisch-lokalbefund",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "116339002",
        "display" : "Breast finding"
      }],
      "text" : "Lokalbefund Brust",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Unauffällig"
      },
      {
        "valueString" : "Auffällig"
      }]
    },
    {
      "linkId" : "klinisch-lokalbefund-beschreibung",
      "text" : "Lokalbefund Beschreibung",
      "type" : "text",
      "enableWhen" : [{
        "question" : "klinisch-lokalbefund",
        "operator" : "=",
        "answerString" : "Auffällig"
      }],
      "required" : false
    },
    {
      "linkId" : "klinisch-lymphoedem",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "449620005",
        "display" : "Lymphedema of upper limb"
      }],
      "text" : "Lymphödem",
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
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "tumorstatus-gesamtbeurteilung",
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
        "valueString" : "Kein Anhalt für Tumor"
      }]
    },
    {
      "linkId" : "tumorstatus-lokalrezidiv",
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
      "text" : "Nächster Kontrolltermin",
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
