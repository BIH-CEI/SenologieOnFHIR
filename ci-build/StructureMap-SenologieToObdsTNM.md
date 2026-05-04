# SenologieToObdsTNM - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTNM**

## StructureMap: SenologieToObdsTNM 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTNM | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsTNM |

 
title: Senologie TNM Observations to oBDS TNM BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTNM",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTNM",
  "version" : "0.1.0",
  "name" : "SenologieToObdsTNM",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie TNM Observations to oBDS TNM BackboneElement\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapTNM",
    "typeMode" : "none",
    "documentation" : "Known limitation: MapTNM uses `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups (diagnose.cTNM, diagnose.pTNM, op.tnm,\r\nverlauf.tnm). The IG Publisher produces SM_TARGET_PATH errors (~24). The\r\nelement names are correct per the oBDS Logical Model.\r\n============================================================================\r\nGemeinsame TNM-Map: Extrahiert TNM-Staging aus einer TNM-Klassifikation-\r\nObservation (MII Onko) und mappt auf das oBDS TNM-BackboneElement.\r\nWird von Diagnose (cTNM), OP (pTNM) und Verlauf (c/pTNM) importiert.\r\nDie TNM-Klassifikation-Observation enthaelt T/N/M/L/V/Pn als components\r\nmit LOINC-kodierten Codes.\r\nMII Onko TNM LOINC-Codes:\r\nKlinisch: 21908-9 (Gesamt), 21905-5 (cT), 21906-3 (cN), 21907-1 (cM)\r\nPathologisch: 21902-2 (Gesamt), 21899-0 (pT), 21900-6 (pN), 21901-4 (pM)\r\nSymbole: 59479-6 (y), 21983-2 (r), 101659-7 (a), 42030-7 (m)\r\nZusatz: 33739-4 (L), 33740-2 (V), 92837-4 (Pn)\r\n============================================================================\r\n============================================================================\r\nMapTNM: Observation (TNM-Klassifikation) -> oBDS TNM BackboneElement\r\nGenerische Gruppe, die sowohl klinisches als auch pathologisches TNM\r\nverarbeitet. Der c/p/u-Praefix wird aus dem jeweiligen LOINC-Code\r\nder T/N/M-Komponenten abgeleitet.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Observation",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "SetTNMDatum",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "MapTNMVersion",
      "source" : [{
        "context" : "src",
        "element" : "method",
        "variable" : "method"
      }],
      "rule" : [{
        "name" : "ExtractTNMVersionCode",
        "source" : [{
          "context" : "method",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetTNMVersion",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "version",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapYSymbol",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '59479-6')"
      }],
      "rule" : [{
        "name" : "MapYValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractYCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetYSymbol",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "ySymbol",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapRSymbol",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21983-2')"
      }],
      "rule" : [{
        "name" : "MapRValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractRCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetRSymbol",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "rSymbol",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapASymbol",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '101659-7')"
      }],
      "rule" : [{
        "name" : "MapAValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractACode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetASymbol",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "aSymbol",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapTClinical",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21905-5')"
      }],
      "rule" : [{
        "name" : "SetCPrefixT",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixT",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "c"
          }]
        }]
      },
      {
        "name" : "MapTClinValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractTClinCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetTClinical",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "t",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapTPathological",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21899-0')"
      }],
      "rule" : [{
        "name" : "SetPPrefixT",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixT",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "p"
          }]
        }]
      },
      {
        "name" : "MapTPathValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractTPathCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetTPathological",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "t",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapMSymbol",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '42030-7')"
      }],
      "rule" : [{
        "name" : "MapMSymbolValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractMSymbolCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetMSymbol",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "mSymbol",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapNClinical",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21906-3')"
      }],
      "rule" : [{
        "name" : "SetCPrefixN",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixN",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "c"
          }]
        }]
      },
      {
        "name" : "MapNClinValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractNClinCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetNClinical",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "n",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapNPathological",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21900-6')"
      }],
      "rule" : [{
        "name" : "SetPPrefixN",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixN",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "p"
          }]
        }]
      },
      {
        "name" : "MapNPathValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractNPathCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetNPathological",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "n",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapMClinical",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21907-1')"
      }],
      "rule" : [{
        "name" : "SetCPrefixM",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixM",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "c"
          }]
        }]
      },
      {
        "name" : "MapMClinValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractMClinCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetMClinical",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "m",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapMPathological",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21901-4')"
      }],
      "rule" : [{
        "name" : "SetPPrefixM",
        "source" : [{
          "context" : "comp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cpuPraefixM",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "p"
          }]
        }]
      },
      {
        "name" : "MapMPathValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractMPathCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetMPathological",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "m",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapL",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '33739-4')"
      }],
      "rule" : [{
        "name" : "MapLValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractLCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetL",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "l",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapV",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '33740-2')"
      }],
      "rule" : [{
        "name" : "MapVValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractVCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetV",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "v",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapPn",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '92837-4')"
      }],
      "rule" : [{
        "name" : "MapPnValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractPnCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetPn",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "pn",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapS",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21924-6')"
      }],
      "rule" : [{
        "name" : "MapSValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractSCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetS",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "s",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapUICC",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "ExtractUICC",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetUICC",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "uiccStadium",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
