# Fragebogen: Systemische Therapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Systemische Therapie**

## Questionnaire: Fragebogen: Systemische Therapie (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestSystemtherapie |

 
Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Procedure, MedicationStatement, Observation). 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-systemtherapie",
  "contained" : [{
    "resourceType" : "Procedure",
    "id" : "postop-procedure-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
    },
    "status" : "completed",
    "subject" : {
      "reference" : "placeholder"
    },
    "reasonReference" : [{
      "reference" : "placeholder",
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }]
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
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#postop-procedure-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie",
  "version" : "0.1.0",
  "name" : "QuestSystemtherapie",
  "title" : "Fragebogen: Systemische Therapie",
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
  "description" : "Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Procedure, MedicationStatement, Observation).",
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
    "type" : "reference",
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
          "display" : "Chemotherapy care"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "169413002",
          "display" : "Endocrine therapy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "432105003",
          "display" : "Targeted therapy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76334006",
          "display" : "Immunotherapy"
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
          "display" : "Neoadjuvant intent"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373846009",
          "display" : "Adjuvant - intent"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Palliative intent"
        }
      }]
    },
    {
      "linkId" : "protokoll",
      "text" : "Protokoll/Schema (z.B. \"EC → Paclitaxel\", \"TCbHP\")",
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
      "linkId" : "abbruchgrund",
      "text" : "Abbruchgrund",
      "type" : "text",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "MedicationStatement"
      }
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
      "required" : false,
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
      "text" : "Zyklus-Nummer",
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
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Observation"
      }
    }],
    "linkId" : "therapieergebnis",
    "text" : "Therapieergebnis",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "ansprechen",
      "text" : "Ansprechen",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Complete Response"
      },
      {
        "valueString" : "Partial Response"
      },
      {
        "valueString" : "Stable Disease"
      },
      {
        "valueString" : "Progressive Disease"
      }]
    }]
  },
  {
    "linkId" : "syst-anmerkungen",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.note.text",
    "text" : "Anmerkungen",
    "type" : "text",
    "required" : false
  }]
}

```
