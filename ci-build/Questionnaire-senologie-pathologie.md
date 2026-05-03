# Fragebogen: Pathologie Befund - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Pathologie Befund**

## Questionnaire: Fragebogen: Pathologie Befund (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-pathologie | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:QuestPathologieBefund |



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-pathologie",
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "TODO-patho-report-template"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "TODO-patho-specimen-template"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "TODO-patho-histo-template"
    }
  },
  {
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "TODO-patho-ihc-template"
    }
  },
  {
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
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "item" : [{
    "linkId" : "praeparat",
    "text" : "Praeparat",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "praeparat-art",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type",
      "text" : "Art des Praeparats",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "86273004",
          "display" : "Biopsy"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "129300006",
          "display" : "Puncture - action"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "65801008",
          "display" : "Excision"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "392021009",
          "display" : "Lumpectomy of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "172043006",
          "display" : "Simple mastectomy"
        }
      },
      {
        "valueString" : "Nachresektat"
      }]
    },
    {
      "linkId" : "praeparat-entnahmedatum",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collected[x]",
      "text" : "Entnahmedatum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "praeparat-seite",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.bodySite",
      "text" : "Seite",
      "type" : "choice",
      "required" : true,
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
      }]
    },
    {
      "linkId" : "praeparat-quadrant",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "246264006",
        "display" : "Site of lesion"
      }],
      "text" : "Lokalisation / Quadrant",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "76365002",
          "display" : "Structure of upper outer quadrant of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "77831004",
          "display" : "Structure of upper inner quadrant of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "33564002",
          "display" : "Lower outer quadrant of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "19100000",
          "display" : "Lower inner quadrant of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "24142002",
          "display" : "Nipple structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "70925003",
          "display" : "Central portion of breast"
        }
      }]
    }]
  },
  {
    "linkId" : "histologie",
    "text" : "Histologie",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "histo-typ",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.value[x]",
      "text" : "Histologischer Typ",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "82711006",
          "display" : "Infiltrating duct carcinoma"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "443451005",
          "display" : "Invasive lobular carcinoma of breast"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "109889007",
          "display" : "Ductal carcinoma in situ of breast"
        }
      },
      {
        "valueString" : "Sonstiges"
      }]
    },
    {
      "linkId" : "histo-grading",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371469007",
        "display" : "Histologic grade"
      }],
      "text" : "Grading (Bloom-Richardson)",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "54102005",
          "display" : "G1 grade"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1663004",
          "display" : "G2 grade"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "61026006",
          "display" : "G3 grade"
        }
      }]
    },
    {
      "linkId" : "histo-tumorgroesse",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "21889-1",
        "display" : "Size Tumor"
      }],
      "text" : "Tumorgroesse in mm",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-invasive-groesse",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "33728-7",
        "display" : "Size.maximum dimension in Tumor"
      }],
      "text" : "Invasive Tumorgroesse in mm",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-dcis-anteil",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "109889007",
        "display" : "Ductal carcinoma in situ of breast"
      }],
      "text" : "DCIS-Anteil",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "histo-resektionsrand",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
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
          "display" : "Residual tumor stage R0"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "278271003",
          "display" : "Residual tumor stage R1"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258253006",
          "display" : "Residual tumor stage RX"
        }
      }]
    },
    {
      "linkId" : "histo-sentinel-anzahl",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85347-3",
        "display" : "Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy"
      }],
      "text" : "Sentinel-LK Anzahl",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-sentinel-befallen",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "92832-5",
        "display" : "Sentinel lymph nodes with metastasis [#] in Cancer specimen"
      }],
      "text" : "Sentinel-LK befallen",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "linkId" : "ihc",
    "text" : "Immunhistochemie / Rezeptorstatus",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "ihc-er-prozent",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85337-4",
        "display" : "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      }],
      "text" : "ER Prozent positiv",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-er-irs",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85310-1",
        "display" : "Estrogen receptor fluorescence intensity [Type] in Breast cancer specimen by Immune stain"
      }],
      "text" : "ER IRS Score (0-12)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-prozent",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85339-0",
        "display" : "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      }],
      "text" : "PR Prozent positiv",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-irs",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85331-7",
        "display" : "Progesterone receptor fluorescence intensity [Type] in Breast cancer specimen by Immune stain"
      }],
      "text" : "PR IRS Score (0-12)",
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-her2-score",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85319-2",
        "display" : "HER2 [Presence] in Breast cancer specimen by Immune stain"
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
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85318-4",
        "display" : "ERBB2 gene duplication [Presence] in Breast cancer specimen by FISH"
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
        "valueString" : "nicht durchgefuehrt"
      }]
    },
    {
      "linkId" : "ihc-ki67",
      "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85330-9",
        "display" : "Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain"
      }],
      "text" : "Ki-67 Index (%)",
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "linkId" : "beurteilung",
    "text" : "Gesamtbeurteilung",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "beurteilung-ptnm",
      "definition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusion",
      "text" : "pTNM Staging",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "beurteilung-freitext",
      "definition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm.data",
      "text" : "Gesamtbeurteilung (Freitext)",
      "type" : "text",
      "required" : false
    }]
  }]
}

```
