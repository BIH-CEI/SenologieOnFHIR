# Fragebogen: Bildgebung Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Bildgebung Mamma**

## Questionnaire: Fragebogen: Bildgebung Mamma (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestBildgebung |

 
Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-bildgebung",
  "contained" : [{
    "resourceType" : "DiagnosticReport",
    "id" : "bildgebung-report-template",
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
        "code" : "RAD",
        "display" : "Radiology"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "24606-6",
        "display" : "Breast Screening"
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
    "resourceType" : "Observation",
    "id" : "bildgebung-befund-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "72018-2",
        "display" : "Breast Imaging-Reporting and Data System"
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
    "resourceType" : "BodyStructure",
    "id" : "bildgebung-bodystructure-template",
    "active" : true,
    "patient" : {
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung",
  "version" : "0.1.0",
  "name" : "QuestBildgebung",
  "title" : "Fragebogen: Bildgebung Mamma",
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure.",
  "item" : [{
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-report-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
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
          "display" : "Mammographie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "24590-2",
          "display" : "Sonographie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://loinc.org",
          "code" : "24589-4",
          "display" : "MRT Mamma"
        }
      },
      {
        "valueString" : "Tomosynthese"
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
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-bodystructure-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "lokalisation",
    "text" : "Tumorlokalisation",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "lokalisation-seite",
      "text" : "Seite",
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
      "linkId" : "lokalisation-quadrant",
      "text" : "Quadrant",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76365002",
          "display" : "Oberer äußerer Quadrant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "77831004",
          "display" : "Oberer innerer Quadrant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "33564002",
          "display" : "Unterer äußerer Quadrant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "19100000",
          "display" : "Unterer innerer Quadrant"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "24142002",
          "display" : "Mamille"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "70925003",
          "display" : "Zentral"
        }
      }]
    },
    {
      "linkId" : "lokalisation-uhrzeit",
      "text" : "Uhrzeitposition",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "12 Uhr"
      },
      {
        "valueString" : "1 Uhr"
      },
      {
        "valueString" : "2 Uhr"
      },
      {
        "valueString" : "3 Uhr"
      },
      {
        "valueString" : "4 Uhr"
      },
      {
        "valueString" : "5 Uhr"
      },
      {
        "valueString" : "6 Uhr"
      },
      {
        "valueString" : "7 Uhr"
      },
      {
        "valueString" : "8 Uhr"
      },
      {
        "valueString" : "9 Uhr"
      },
      {
        "valueString" : "10 Uhr"
      },
      {
        "valueString" : "11 Uhr"
      }]
    },
    {
      "linkId" : "lokalisation-mamillenabstand",
      "text" : "Abstand von Mamille (mm)",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-befund-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "befund",
    "text" : "Befund",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "birads-kategorie",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "72018-2",
        "display" : "BI-RADS"
      }],
      "text" : "BI-RADS Kategorie",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397138000",
          "display" : "BI-RADS 0 — Zusätzliche Bildgebung erforderlich"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397140005",
          "display" : "BI-RADS 1 — Unauffällig"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397141009",
          "display" : "BI-RADS 2 — Gutartiger Befund"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397143007",
          "display" : "BI-RADS 3 — Wahrscheinlich gutartig"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397144001",
          "display" : "BI-RADS 4 — Suspekt"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "397145000",
          "display" : "BI-RADS 5 — Hochverdächtig auf Malignität"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "6111000179101",
          "display" : "BI-RADS 6 — Histologisch gesichert maligne"
        }
      }]
    },
    {
      "linkId" : "acr-brustdichte",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "89180-4",
        "display" : "Breast density"
      }],
      "text" : "ACR Brustdichte",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "A — Fast vollständig fetthaltig"
      },
      {
        "valueString" : "B — Verstreute fibroglanduläre Verdichtungen"
      },
      {
        "valueString" : "C — Heterogen dicht"
      },
      {
        "valueString" : "D — Extrem dicht"
      }]
    },
    {
      "linkId" : "herdbefund-groesse",
      "text" : "Herdbefund Größe (mm)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "herdbefund-beschreibung",
      "text" : "Herdbefund Beschreibung",
      "type" : "text",
      "required" : false
    },
    {
      "linkId" : "mikrokalk",
      "text" : "Mikrokalkifikationen",
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
      "text" : "Axilläre Lymphknoten auffällig",
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
