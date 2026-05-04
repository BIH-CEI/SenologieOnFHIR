# Fragebogen: Pathologie Befund - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Pathologie Befund**

## Questionnaire: Fragebogen: Pathologie Befund (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-pathologie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestPathologieBefund |

 
Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-pathologie",
  "contained" : [{
    "resourceType" : "DiagnosticReport",
    "id" : "patho-report-template",
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
        "code" : "SP",
        "display" : "Surgical Pathology"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "60568-3",
        "display" : "Pathology synoptic report"
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
    "resourceType" : "Specimen",
    "id" : "patho-specimen-template",
    "status" : "available",
    "subject" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%patient"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-histo-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "33731-1",
        "display" : "Histology type in Cancer specimen"
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
    "id" : "patho-ihc-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85337-4",
        "display" : "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      }],
      "text" : "Immunhistochemie / Rezeptorstatus"
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie",
  "version" : "0.1.0",
  "name" : "QuestPathologieBefund",
  "title" : "Fragebogen: Pathologie Befund",
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
  "description" : "Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation.",
  "item" : [{
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-specimen-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "praeparat",
    "text" : "Präparat",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "praeparat-art",
      "text" : "Art des Präparats",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "86273004",
          "display" : "Biopsie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "129300006",
          "display" : "Punktion"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "65801008",
          "display" : "Exzision"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "392021009",
          "display" : "Brusterhaltende Exzision"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "172043006",
          "display" : "Mastektomie-Präparat"
        }
      },
      {
        "valueString" : "Nachresektat"
      }]
    },
    {
      "linkId" : "praeparat-entnahmedatum",
      "text" : "Entnahmedatum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "praeparat-seite",
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
      }]
    },
    {
      "linkId" : "praeparat-quadrant",
      "text" : "Lokalisation / Quadrant",
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
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-histo-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "histologie",
    "text" : "Histologie",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "histo-typ",
      "text" : "Histologischer Typ",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "82711006",
          "display" : "Invasives Karzinom NST"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "443451005",
          "display" : "Invasives lobuläres Karzinom"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "109889007",
          "display" : "DCIS"
        }
      },
      {
        "valueString" : "Sonstiges"
      }]
    },
    {
      "linkId" : "histo-grading",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371469007",
        "display" : "Histologic grade"
      }],
      "text" : "Grading (Elston-Ellis)",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "54102005",
          "display" : "G1"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1663004",
          "display" : "G2"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "61026006",
          "display" : "G3"
        }
      }]
    },
    {
      "linkId" : "histo-tumorgroesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "21889-1",
        "display" : "Size Tumor"
      }],
      "text" : "Tumorgröße (mm)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-invasive-groesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "33728-7",
        "display" : "Size.maximum dimension in Tumor"
      }],
      "text" : "Invasive Tumorgröße (mm)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-dcis-anteil",
      "text" : "DCIS-Anteil",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "histo-resektionsrand",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "395536008",
        "display" : "Surgical margin finding"
      }],
      "text" : "Resektionsrand",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258254000",
          "display" : "R0"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "278271003",
          "display" : "R1"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258253006",
          "display" : "RX"
        }
      }]
    },
    {
      "linkId" : "histo-sentinel-anzahl",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85347-3",
        "display" : "Sentinel lymph nodes examined [#]"
      }],
      "text" : "Sentinel-LK untersucht",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-sentinel-befallen",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "92832-5",
        "display" : "Sentinel lymph nodes with metastasis [#]"
      }],
      "text" : "Sentinel-LK befallen",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-ihc-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "ihc",
    "text" : "Immunhistochemie / Rezeptorstatus",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "ihc-er-prozent",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85337-4",
        "display" : "Estrogen receptor"
      }],
      "text" : "ER Prozent positiv (%)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-er-irs",
      "text" : "ER IRS Score (0–12)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-prozent",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85339-0",
        "display" : "Progesterone receptor"
      }],
      "text" : "PR Prozent positiv (%)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-irs",
      "text" : "PR IRS Score (0–12)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-her2-score",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85319-2",
        "display" : "HER2 [Presence] in Breast cancer specimen"
      }],
      "text" : "HER2 IHC Score",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "0"
      },
      {
        "valueString" : "1+"
      },
      {
        "valueString" : "2+"
      },
      {
        "valueString" : "3+"
      }]
    },
    {
      "linkId" : "ihc-her2-fish",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85318-4",
        "display" : "ERBB2 gene duplication"
      }],
      "text" : "HER2 ISH/FISH",
      "type" : "choice",
      "enableWhen" : [{
        "question" : "ihc-her2-score",
        "operator" : "=",
        "answerString" : "2+"
      }],
      "required" : false,
      "answerOption" : [{
        "valueString" : "positiv"
      },
      {
        "valueString" : "negativ"
      },
      {
        "valueString" : "nicht durchgeführt"
      }]
    },
    {
      "linkId" : "ihc-ki67",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "29593-1",
        "display" : "Ki-67 [Percentile] in Tissue"
      }],
      "text" : "Ki-67 Index (%)",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-report-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "beurteilung",
    "text" : "Gesamtbeurteilung",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "beurteilung-ptnm",
      "text" : "pTNM",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "beurteilung-freitext",
      "text" : "Gesamtbeurteilung (Freitext)",
      "type" : "text",
      "required" : false
    }]
  }]
}

```
