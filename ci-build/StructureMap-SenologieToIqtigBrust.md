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
  "date" : "2026-05-04T06:44:52+00:00",
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
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
    "mode" : "target",
    "alias" : "IQTIG181"
  }],
  "group" : [{
    "name" : "MapBrust",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the IQTIG 18.1 Logical Model.\r\n============================================================================\r\nTeildatensatz Brust (BRUST): Condition + Observations -> BRUST:*\r\nPro betroffener Brustseite wird ein Brust-Teildatensatz erzeugt. Die\r\nZuordnung zur Operation erfolgt ueber die laufende Nummer (LNRBRUST).\r\nQuellen:\r\n- Condition (Senologie_Diagnose_Maligne / _Benigne) -> Indikation, ICD,\r\nSeitenlokalisation, Diagnosedatum\r\n- Observation (BI-RADS, bildgebende Methode, Praeopbefund) -> Befund\r\n- ServiceRequest (Senologie_OP_Planung) -> Drahtmarkierung, Neoadjuvanz\r\n- Observation (cTNM, Tumorgroesse klinisch) -> Staging-Felder\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Condition",
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
      "name" : "EntryCT",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "tEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21905-5')"
      }],
      "rule" : [{
        "name" : "MapCTObs",
        "source" : [{
          "context" : "tEntry",
          "element" : "resource",
          "variable" : "tObs"
        }],
        "rule" : [{
          "name" : "MapCTValue",
          "source" : [{
            "context" : "tObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCTCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCT",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "cT",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryCN",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "nEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21906-3')"
      }],
      "rule" : [{
        "name" : "MapCNObs",
        "source" : [{
          "context" : "nEntry",
          "element" : "resource",
          "variable" : "nObs"
        }],
        "rule" : [{
          "name" : "MapCNValue",
          "source" : [{
            "context" : "nObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCNCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCN",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "cN",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryCM",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "mEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21907-1')"
      }],
      "rule" : [{
        "name" : "MapCMObs",
        "source" : [{
          "context" : "mEntry",
          "element" : "resource",
          "variable" : "mObs"
        }],
        "rule" : [{
          "name" : "MapCMValue",
          "source" : [{
            "context" : "mObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCMCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCM",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "cM",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryUICCKlin",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "uiccEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
      }],
      "rule" : [{
        "name" : "MapUICCKlinObs",
        "source" : [{
          "context" : "uiccEntry",
          "element" : "resource",
          "variable" : "uiccObs"
        }],
        "rule" : [{
          "name" : "MapUICCKlinValue",
          "source" : [{
            "context" : "uiccObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapUICCKlinCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetUICCKlin",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "uiccStadiumKlinisch",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryTGroesseKlin",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "tgEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44648-0')"
      }],
      "rule" : [{
        "name" : "MapTGroesseKlinObs",
        "source" : [{
          "context" : "tgEntry",
          "element" : "resource",
          "variable" : "tgObs"
        }],
        "rule" : [{
          "name" : "MapTGroesseKlinValue",
          "source" : [{
            "context" : "tgObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetTGroesseKlin",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "tumorgroesseKlinisch",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryBildgebung",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "bildEntry",
        "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-bildgebung'))"
      }],
      "rule" : [{
        "name" : "MapBildObs",
        "source" : [{
          "context" : "bildEntry",
          "element" : "resource",
          "variable" : "bildObs"
        }],
        "rule" : [{
          "name" : "MapBildMethod",
          "source" : [{
            "context" : "bildObs",
            "element" : "method",
            "variable" : "m"
          }],
          "rule" : [{
            "name" : "MapBildMethodCoding",
            "source" : [{
              "context" : "m",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'http://snomed.info/sct'"
            }],
            "rule" : [{
              "name" : "SetMethMammo",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '71651007'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "bildgebendeMethode",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "1"
                }]
              }]
            },
            {
              "name" : "SetMethSono",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '16310003'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "bildgebendeMethode",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "2"
                }]
              }]
            },
            {
              "name" : "SetMethMRT",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '113091000'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "bildgebendeMethode",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "3"
                }]
              }]
            },
            {
              "name" : "SetMethTomo",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '710324008'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "bildgebendeMethode",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "4"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryBIRADS",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "biradsEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '72133-2')"
      }],
      "rule" : [{
        "name" : "MapBIRADSObs",
        "source" : [{
          "context" : "biradsEntry",
          "element" : "resource",
          "variable" : "biradsObs"
        }],
        "rule" : [{
          "name" : "MapBIRADSValue",
          "source" : [{
            "context" : "biradsObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapBIRADSCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetBIRADS",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "birads",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryBefund",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "befEntry",
        "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-pathologie-befund'))"
      }],
      "rule" : [{
        "name" : "MapBefundObs",
        "source" : [{
          "context" : "befEntry",
          "element" : "resource",
          "variable" : "befObs"
        }],
        "rule" : [{
          "name" : "MapBefundValue",
          "source" : [{
            "context" : "befObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapBefundBCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/cs-senologie-befundcode-b'"
            }],
            "rule" : [{
              "name" : "SetBefundB",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "befundcode",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
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
      "name" : "EntryDraht",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "srEntry",
        "condition" : "resource.is(ServiceRequest) and resource.meta.profile.exists($this.contains('senologie-op-planung'))"
      }],
      "rule" : [{
        "name" : "SRContext",
        "source" : [{
          "context" : "srEntry",
          "element" : "resource",
          "variable" : "sr"
        }],
        "rule" : [{
          "name" : "MapDrahtExt",
          "source" : [{
            "context" : "sr",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/preOpMarkierung'"
          }],
          "rule" : [{
            "name" : "MapDrahtValue",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapDrahtCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetDrahtMammo",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = 'M'"
                }],
                "target" : [{
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "drahtmarkierung",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "1"
                  }]
                }]
              },
              {
                "name" : "SetDrahtSono",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = 'S'"
                }],
                "target" : [{
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "drahtmarkierung",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "2"
                  }]
                }]
              },
              {
                "name" : "SetDrahtMRT",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = 'T'"
                }],
                "target" : [{
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "drahtmarkierung",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "3"
                  }]
                }]
              },
              {
                "name" : "SetDrahtKeine",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = 'N'"
                }],
                "target" : [{
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "drahtmarkierung",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "0"
                  }]
                }]
              }]
            }]
          }]
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
