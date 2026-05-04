# Fragebogen: Strahlentherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Strahlentherapie**

## Questionnaire: Fragebogen: Strahlentherapie (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestStrahlentherapie |

 
Fragebogen zur strukturierten Dokumentation der Strahlentherapie in der Senologie. Nutzt SDC Definition-based Extraction mit Procedure als Ziel. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-strahlentherapie-quest",
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie",
  "version" : "0.1.0",
  "name" : "QuestStrahlentherapie",
  "title" : "Fragebogen: Strahlentherapie",
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Strahlentherapie in der Senologie. Nutzt SDC Definition-based Extraction mit Procedure als Ziel.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Procedure"
      }
    }],
    "linkId" : "therapie-rahmen",
    "text" : "Therapie-Rahmen",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "rt-intention",
      "text" : "Intention",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373846009",
          "display" : "Adjuvant - intent"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373847000",
          "display" : "Neoadjuvant intent"
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
      "linkId" : "rt-startdatum",
      "text" : "Startdatum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "rt-enddatum",
      "text" : "Enddatum",
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "rt-bezogene-op",
      "text" : "Bezogene Operation (Referenz auf vorherige OP)",
      "type" : "string",
      "required" : false
    }]
  },
  {
    "linkId" : "bestrahlungsplan",
    "text" : "Bestrahlungsplan",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "rt-zielvolumen",
      "text" : "Zielvolumen",
      "type" : "choice",
      "required" : false,
      "repeats" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76752008",
          "display" : "Breast structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "78904004",
          "display" : "Chest wall structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "68171009",
          "display" : "Axillary lymph node structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "16051009",
          "display" : "Structure of apical axillary lymph node"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76838003",
          "display" : "Structure of supraclavicular lymph node"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "245282001",
          "display" : "Internal mammary lymph node group"
        }
      }]
    },
    {
      "linkId" : "rt-applikationsart",
      "text" : "Applikationsart",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1163834000",
          "display" : "3D conformal radiation therapy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1163833006",
          "display" : "Intensity modulated radiation therapy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "152198000",
          "display" : "Brachytherapy"
        }
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
        "valueCoding" : {
          "system" : "http://unitsofmeasure.org",
          "code" : "Gy",
          "display" : "Gy"
        }
      }],
      "linkId" : "rt-gesamtdosis",
      "text" : "Gesamtdosis (Gy)",
      "type" : "decimal",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
        "valueCoding" : {
          "system" : "http://unitsofmeasure.org",
          "code" : "Gy",
          "display" : "Gy"
        }
      }],
      "linkId" : "rt-einzeldosis",
      "text" : "Einzeldosis pro Fraktion (Gy)",
      "type" : "decimal",
      "required" : false
    },
    {
      "linkId" : "rt-fraktionen",
      "text" : "Anzahl Fraktionen",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "linkId" : "boost",
    "text" : "Boost",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "rt-boost",
      "text" : "Boost durchgeführt",
      "type" : "boolean",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-unit",
        "valueCoding" : {
          "system" : "http://unitsofmeasure.org",
          "code" : "Gy",
          "display" : "Gy"
        }
      }],
      "linkId" : "rt-boost-dosis",
      "text" : "Boost-Dosis (Gy)",
      "type" : "decimal",
      "enableWhen" : [{
        "question" : "rt-boost",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "rt-boost-fraktionen",
      "text" : "Boost-Fraktionen",
      "type" : "integer",
      "enableWhen" : [{
        "question" : "rt-boost",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "rt-boost-technik",
      "text" : "Boost-Technik",
      "type" : "choice",
      "enableWhen" : [{
        "question" : "rt-boost",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false,
      "answerOption" : [{
        "valueString" : "Elektronen"
      },
      {
        "valueString" : "Photonen"
      },
      {
        "valueString" : "Brachytherapie"
      }]
    }]
  },
  {
    "linkId" : "ergebnis",
    "text" : "Ergebnis",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "rt-nebenwirkungen",
      "text" : "Akute Nebenwirkungen (Radiodermatitis, Fatigue, etc.)",
      "type" : "text",
      "required" : false
    },
    {
      "linkId" : "rt-therapiestatus",
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
      "linkId" : "rt-abbruchgrund",
      "text" : "Abbruchgrund",
      "type" : "text",
      "enableWhen" : [{
        "question" : "rt-therapiestatus",
        "operator" : "=",
        "answerString" : "Abgebrochen"
      }],
      "required" : false
    }]
  }]
}

```
