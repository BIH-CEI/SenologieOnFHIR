# Fragebogen: Bildgebung Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Bildgebung Mamma**

## Questionnaire: Fragebogen: Bildgebung Mamma (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestBildgebung |

 
Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Definition-based Extraction mit DiagnosticReport und Observation als Ziele. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-bildgebung",
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung",
  "version" : "0.1.0",
  "name" : "QuestBildgebung",
  "title" : "Fragebogen: Bildgebung Mamma",
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Definition-based Extraction mit DiagnosticReport und Observation als Ziele.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "DiagnosticReport"
      }
    }],
    "linkId" : "untersuchung",
    "text" : "Untersuchung",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "untersuchung-datum",
      "text" : "Untersuchungsdatum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "bildgebungsart",
      "text" : "Bildgebungsart",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "24606-6",
          "display" : "MG Breast Screening"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "24601-7",
          "display" : "US Breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "30794-2",
          "display" : "MR Breast"
        }
      },
      {
        "valueString" : "Tomosynthese"
      }]
    },
    {
      "linkId" : "seite",
      "text" : "Seite",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "80248007",
          "display" : "Left breast structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "73056007",
          "display" : "Right breast structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "63762007",
          "display" : "Both breasts"
        }
      }]
    },
    {
      "linkId" : "befundender-arzt",
      "text" : "Befundender Arzt",
      "type" : "string",
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
    "linkId" : "befund",
    "text" : "Befund",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "birads-kategorie",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "241736003",
        "display" : "Breast imaging-reporting and data system"
      }],
      "text" : "BI-RADS Kategorie",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397138000",
          "display" : "Mammography assessment (Category 0) - Need additional imaging evaluation"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397140005",
          "display" : "Mammography assessment (Category 1) - Negative"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397141009",
          "display" : "Mammography assessment (Category 2) - Benign finding"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397143007",
          "display" : "Mammography assessment (Category 3) - Probably benign finding, short interval follow-up"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397144001",
          "display" : "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397145000",
          "display" : "Mammography assessment (Category 5) - Highly suggestive of malignancy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "6111000179101",
          "display" : "Mammography assessment (Category 6) - known biopsy, proven malignancy"
        }
      }]
    },
    {
      "linkId" : "acr-brustdichte",
      "text" : "ACR Brustdichte",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "A – fast vollständig fetthaltig"
      },
      {
        "valueString" : "B – verstreute fibroglanduläre Verdichtungen"
      },
      {
        "valueString" : "C – heterogen dicht"
      },
      {
        "valueString" : "D – extrem dicht"
      }]
    },
    {
      "linkId" : "herdbefund-beschreibung",
      "text" : "Herdbefund Beschreibung",
      "type" : "text",
      "required" : false
    },
    {
      "linkId" : "mikrokalk",
      "text" : "Mikrokalkifikationen vorhanden",
      "type" : "boolean",
      "required" : false
    },
    {
      "linkId" : "mikrokalk-beschreibung",
      "text" : "Mikrokalkifikationen Beschreibung",
      "type" : "text",
      "enableWhen" : [{
        "question" : "mikrokalk",
        "operator" : "=",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "lymphknoten-auffaellig",
      "text" : "Lymphknoten auffällig",
      "type" : "boolean",
      "required" : false
    }]
  },
  {
    "linkId" : "zusammenfassung",
    "text" : "Zusammenfassung",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "gesamtbeurteilung",
      "text" : "Gesamtbeurteilung",
      "type" : "text",
      "required" : false
    },
    {
      "linkId" : "empfehlung",
      "text" : "Empfehlung",
      "type" : "text",
      "required" : false
    }]
  }]
}

```
