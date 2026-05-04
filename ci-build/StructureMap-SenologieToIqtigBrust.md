# SenologieToIqtigBrust - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigBrust**

## StructureMap: SenologieToIqtigBrust 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBrust | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIqtigBrust |

 
title: Senologie Condition + Pathologie to IQTIG 18.1 Teildatensatz Brust status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigBrust",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBrust",
  "version" : "0.1.0",
  "name" : "SenologieToIqtigBrust",
  "status" : "draft",
  "date" : "2026-05-04T14:15:24+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Condition + Pathologie to IQTIG 18.1 Teildatensatz Brust\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
    "mode" : "source",
    "alias" : "ServiceRequest"
  }],
  "group" : [{
    "name" : "MapBrust",
    "typeMode" : "none",
    "documentation" : "Import-only map: no target `uses` declaration — the calling map\r\n(SenologieToIqtigMammachirurgie181) provides the correct BackboneElement\r\ncontext (teildatensatzBrust). Omitting the root-level target type avoids\r\nSM_TARGET_PATH false positives where the validator would resolve property\r\nnames against iqtig-mammachirurgie-181 root.\r\n============================================================================\r\nTeildatensatz Brust (BRUST): Condition + Observations -> BRUST:*\r\nPro betroffener Brustseite wird ein Brust-Teildatensatz erzeugt. Die\r\nZuordnung zur Operation erfolgt ueber die laufende Nummer (LNRBRUST).\r\nQuellen:\r\n- Condition (Senologie_Diagnose_Maligne / _Benigne) -> Indikation, ICD,\r\nSeitenlokalisation, Diagnosedatum\r\n- Observation (BI-RADS, bildgebende Methode, Praeopbefund) -> Befund\r\n- ServiceRequest (Senologie_OP_Planung) -> Drahtmarkierung, Neoadjuvanz\r\n- Observation (cTNM, Tumorgroesse klinisch) -> Staging-Felder\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Condition",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetLnrBrust",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "laufendeNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapSeitenlokalisation",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapSeiteSCT",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetSeiteR",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '24028007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R"
            }]
          }]
        },
        {
          "name" : "SetSeiteL",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '7771000'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "L"
            }]
          }]
        },
        {
          "name" : "SetSeiteB",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '51440002'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "B"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapIndikation",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapIndikationICD",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "rule" : [{
          "name" : "SetIndikMaligne",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('C50')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "indikation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetIndikDCIS",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D05')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "indikation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetIndikBenigne",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D24')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "indikation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        },
        {
          "name" : "SetIndikRisiko",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('Z40')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "indikation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        },
        {
          "name" : "SetIndikRekon",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('Z42')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "indikation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "5"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapDiagnoseICD",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapICDCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "diagnoseICD",
          "variable" : "icd"
        }],
        "rule" : [{
          "name" : "SetICDCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "icd",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetICDVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "icd",
            "contextType" : "variable",
            "element" : "version",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetDiagnosedatum",
      "source" : [{
        "context" : "src",
        "element" : "onset",
        "variable" : "onset",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "diagnosedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "onset"
        }]
      }]
    },
    {
      "name" : "SetHistPraeopDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "histologischeSicherungPraeop",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0"
        }]
      }]
    },
    {
      "name" : "SetNeoadjDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "neoadjuvanteTherapie",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0"
        }]
      }]
    },
    {
      "name" : "SetTKPraeopDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "tumorkonferenzPraeop",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "9"
        }]
      }]
    }]
  }]
}

```
