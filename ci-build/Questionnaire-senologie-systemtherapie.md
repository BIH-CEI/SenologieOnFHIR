# Fragebogen: Systemische Therapie - Kerndatensatz Senologie v0.9.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Systemische Therapie**

## Questionnaire: Fragebogen: Systemische Therapie (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie | *Version*:0.9.0 |
| Draft as of 2026-05-11 | *Computable Name*:QuestSystemtherapie |

 
Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Template-based Extraction mit contained Templates für Procedure und MedicationStatement. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-systemtherapie",
  "contained" : [{
    "resourceType" : "Procedure",
    "id" : "syst-procedure-template",
    "status" : "completed",
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "367336001",
        "display" : "Chemotherapy"
      }],
      "text" : "Systemtherapie"
    },
    "subject" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
    },
    "reasonReference" : [{
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }]
  },
  {
    "resourceType" : "MedicationStatement",
    "id" : "syst-medikation-template",
    "status" : "active",
    "medicationCodeableConcept" : {
      "text" : "Substanz"
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie",
  "version" : "0.9.0",
  "name" : "QuestSystemtherapie",
  "title" : "Fragebogen: Systemische Therapie",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-11T18:43:40+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Template-based Extraction mit contained Templates für Procedure und MedicationStatement.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Condition?patient={{%patient.id}}&clinical-status=active"
      }
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
    "text" : "Bezugsdiagnose",
    "type" : "reference",
    "required" : true
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#syst-procedure-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "therapie-rahmen",
    "text" : "Therapie-Rahmen",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "therapieart",
      "text" : "Therapieart",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "385786002",
          "display" : "Chemotherapie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "169413002",
          "display" : "Endokrine Therapie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "432105003",
          "display" : "Zielgerichtete Therapie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76334006",
          "display" : "Immuntherapie"
        }
      }]
    },
    {
      "linkId" : "intention",
      "text" : "Intention",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373847000",
          "display" : "Neoadjuvant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373846009",
          "display" : "Adjuvant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Palliativ"
        }
      }]
    },
    {
      "linkId" : "first-line",
      "text" : "First-Line-Therapie bei Metastasierung",
      "type" : "boolean",
      "enableWhen" : [{
        "question" : "intention",
        "operator" : "=",
        "answerCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "363676003"
        }
      }],
      "required" : false
    },
    {
      "linkId" : "protokoll",
      "text" : "Protokoll/Schema (z.B. EC-Pac, TCbHP)",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "startdatum",
      "text" : "Startdatum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "enddatum",
      "text" : "Enddatum",
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "geplante-zyklen",
      "text" : "Geplante Zyklen",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "durchgefuehrte-zyklen",
      "text" : "Durchgeführte Zyklen",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "therapiestatus",
      "text" : "Therapiestatus",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Abgeschlossen"
      },
      {
        "valueString" : "Abgebrochen"
      },
      {
        "valueString" : "Laufend"
      }]
    },
    {
      "linkId" : "abbruchgrund",
      "text" : "Abbruchgrund",
      "type" : "text",
      "enableWhen" : [{
        "question" : "therapiestatus",
        "operator" : "=",
        "answerString" : "Abgebrochen"
      }],
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#syst-medikation-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "medikamentengabe",
    "text" : "Medikamentengabe",
    "type" : "group",
    "required" : false,
    "repeats" : true,
    "item" : [{
      "linkId" : "substanz",
      "text" : "Substanz",
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"
    },
    {
      "linkId" : "dosis",
      "text" : "Dosis",
      "type" : "decimal",
      "required" : false
    },
    {
      "linkId" : "dosis-einheit",
      "text" : "Dosis-Einheit",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "mg"
      },
      {
        "valueString" : "mg/m²"
      },
      {
        "valueString" : "mg/kg"
      }]
    },
    {
      "linkId" : "zyklus-nummer",
      "text" : "Zyklus",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "tag-im-zyklus",
      "text" : "Tag im Zyklus",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "gabe-datum",
      "text" : "Gabe-Datum",
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "applikationsart",
      "text" : "Applikationsart",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "i.v."
      },
      {
        "valueString" : "s.c."
      },
      {
        "valueString" : "p.o."
      }]
    }]
  },
  {
    "linkId" : "syst-anmerkungen",
    "text" : "Anmerkungen",
    "type" : "text",
    "required" : false
  }]
}

```
