# Fragebogen: Strahlentherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Strahlentherapie**

## Questionnaire: Fragebogen: Strahlentherapie (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestStrahlentherapie |

 
Fragebogen zur strukturierten Dokumentation der Strahlentherapie. Nutzt SDC Template-based Extraction mit contained Procedure-Template. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-strahlentherapie-quest",
  "contained" : [{
    "resourceType" : "Procedure",
    "id" : "strahlentherapie-procedure-template",
    "status" : "completed",
    "category" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1287742003",
        "display" : "Radiotherapy"
      }]
    },
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "108290001",
        "display" : "Radiation oncology AND/OR radiotherapy"
      }],
      "text" : "Strahlentherapie"
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie",
  "version" : "0.1.0",
  "name" : "QuestStrahlentherapie",
  "title" : "Fragebogen: Strahlentherapie",
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Strahlentherapie. Nutzt SDC Template-based Extraction mit contained Procedure-Template.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Condition?patient={{%patient.id}}&clinical-status=active"
      }
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
          "reference" : "#strahlentherapie-procedure-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
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
          "display" : "Adjuvant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "373847000",
          "display" : "Neoadjuvant"
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
      "linkId" : "rt-seite",
      "text" : "Bestrahlte Seite",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "80248007",
          "display" : "Links"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "73056007",
          "display" : "Rechts"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "63762007",
          "display" : "Beidseits"
        }
      }]
    },
    {
      "linkId" : "rt-simultane-rct",
      "text" : "Simultane Radiochemotherapie",
      "type" : "boolean",
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
          "display" : "Ganze Brust"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "78904004",
          "display" : "Brustwand"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "68171009",
          "display" : "Axilläre Lymphknoten"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76838003",
          "display" : "Supraklavikuläre Lymphknoten"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "245282001",
          "display" : "Parasternale Lymphknoten"
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
          "display" : "3D-konformale Bestrahlung"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1163833006",
          "display" : "IMRT (intensitätsmoduliert)"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "152198000",
          "display" : "Brachytherapie"
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
    }]
  },
  {
    "linkId" : "ergebnis",
    "text" : "Ergebnis",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "rt-nebenwirkungen",
      "text" : "Akute Nebenwirkungen",
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
