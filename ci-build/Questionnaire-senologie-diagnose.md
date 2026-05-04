# Fragebogen: Diagnose Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Diagnose Mamma**

## Questionnaire: Fragebogen: Diagnose Mamma (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-diagnose | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestDiagnose |

 
Fragebogen zur Erfassung der senologischen Diagnose. Unterstützt das gesamte Spektrum von invasivem Karzinom über DCIS und B3-Läsionen bis hin zu benignen Befunden. Nutzt SDC Template-based Extraction zur Erzeugung einer Condition-Ressource. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-diagnose",
  "contained" : [{
    "resourceType" : "Condition",
    "id" : "diagnose-maligne-template",
    "clinicalStatus" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active"
      }]
    },
    "verificationStatus" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code" : "confirmed"
      }]
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
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#diagnose-maligne-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose",
  "version" : "0.1.0",
  "name" : "QuestDiagnose",
  "title" : "Fragebogen: Diagnose Mamma",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur Erfassung der senologischen Diagnose. Unterstützt das gesamte Spektrum von invasivem Karzinom über DCIS und B3-Läsionen bis hin zu benignen Befunden. Nutzt SDC Template-based Extraction zur Erzeugung einer Condition-Ressource.",
  "item" : [{
    "linkId" : "diagnose-gruppe",
    "text" : "Diagnose Mamma",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "diagnose-typ",
      "text" : "Falltyp",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueString" : "Erstdiagnose"
      },
      {
        "valueString" : "Rezidiv"
      }]
    },
    {
      "linkId" : "diagnose-sct",
      "text" : "Diagnose",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "254837009",
          "display" : "Mammakarzinom"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "109889007",
          "display" : "Carcinoma in situ (DCIS)"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "439401001",
          "display" : "B3-Läsion"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "254845004",
          "display" : "Fibroadenom"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "27431007",
          "display" : "Fibrozystische Mastopathie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "53430007",
          "display" : "Mastodynie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "4754008",
          "display" : "Gynäkomastie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "83620003",
          "display" : "Mastitis non-puerperalis"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "399123008",
          "display" : "Einfache Mammazyste"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "449837001",
          "display" : "Komplexe Mammazyste"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "718220008",
          "display" : "Genetische Hochrisikosituation"
        }
      }]
    },
    {
      "linkId" : "diagnose-icd10",
      "text" : "ICD-10-GM Code",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "diagnose-icd10-display",
      "text" : "ICD-10-GM Bezeichnung",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "diagnose-b3-detail",
      "text" : "Details B3-Läsion",
      "type" : "choice",
      "enableWhen" : [{
        "question" : "diagnose-sct",
        "operator" : "=",
        "answerCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "439401001"
        }
      }],
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "427785007",
          "display" : "ADH — Atypische duktale Hyperplasie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "860895001",
          "display" : "FEA — Flache epitheliale Atypie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "99571000119102",
          "display" : "Papillom ohne Atypie"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1144917006",
          "display" : "Atypisches Papillom"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "390787006",
          "display" : "Radiäre Narbe / komplex sklerosierende Läsion"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "450697004",
          "display" : "LIN — ALH (Atypische lobuläre Hyperplasie)"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "444739008",
          "display" : "LIN — klassisches LCIS"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "444591006",
          "display" : "LIN — nicht-klassisches (pleomorphes) LCIS"
        }
      }]
    },
    {
      "linkId" : "diagnose-sonstiges",
      "text" : "Details Sonstiges",
      "type" : "string",
      "required" : false
    }]
  },
  {
    "linkId" : "lokalisation-zeit",
    "text" : "Lokalisation & Zeitpunkt",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "diagnose-seite",
      "text" : "Seitenlokalisation",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "24028007",
          "display" : "Rechts"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "7771000",
          "display" : "Links"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "51440002",
          "display" : "Beidseits"
        }
      }]
    },
    {
      "linkId" : "diagnose-datum",
      "text" : "Erstdiagnosedatum",
      "type" : "date",
      "required" : true
    }]
  },
  {
    "linkId" : "staging",
    "text" : "Staging",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "staging-ct",
      "text" : "cT",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "staging-cn",
      "text" : "cN",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "staging-cm",
      "text" : "cM",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "cM0"
      },
      {
        "valueString" : "cM1"
      },
      {
        "valueString" : "cMX"
      }]
    },
    {
      "linkId" : "staging-uicc",
      "text" : "UICC-Stadium",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "staging-grading",
      "text" : "Grading",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "G1"
      },
      {
        "valueString" : "G2"
      },
      {
        "valueString" : "G3"
      },
      {
        "valueString" : "G4"
      }]
    }]
  }]
}

```
