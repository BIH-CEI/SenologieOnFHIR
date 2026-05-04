# SenologieToObdsModulMamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsModulMamma**

## StructureMap: SenologieToObdsModulMamma 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsModulMamma | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsModulMamma |

 
title: Senologie Mamma-Observations to oBDS Modul_Mamma BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsModulMamma",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsModulMamma",
  "version" : "0.1.0",
  "name" : "SenologieToObdsModulMamma",
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
  "description" : "title: Senologie Mamma-Observations to oBDS Modul_Mamma BackboneElement\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
    "mode" : "source",
    "alias" : "ServiceRequest"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Specimen",
    "mode" : "source",
    "alias" : "Specimen"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapModulMamma",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher produces SM_TARGET_PATH\r\n/ SM_SOURCE_PATH errors (~22). The element names are correct per the oBDS\r\nLogical Model.\r\n============================================================================\r\nGemeinsame Modul-Mamma-Map: Extrahiert mammaspezifische Observations aus\r\ndem Bundle und mappt auf das oBDS Modul_Mamma BackboneElement.\r\nWird von Diagnose, OP und Verlauf importiert.\r\nMII Onko Mamma-Profile:\r\n- mii-pr-onko-mamma-rezeptorstatus-estrogen (LOINC 85337-4)\r\n- mii-pr-onko-mamma-rezeptorstatus-progesteron (LOINC 85339-0)\r\n- mii-pr-onko-mamma-her2neu-status (LOINC 85319-2)\r\n- mii-pr-onko-mamma-menopause-status (LOINC 63612-8)\r\nSNOMED-CT Werte:\r\n10828004 = Positive (qualifier value) -> P\r\n260385009 = Negative (qualifier value) -> N\r\n261665006 = Unknown (qualifier value) -> U\r\nMenopausenstatus:\r\n309606002 = Before menopause (finding) -> 1 (praemenopausal)\r\n309607006 = During menopause (finding) -> 2 (perimenopausal, nicht oBDS-konform, gemappt auf U)\r\n309608001 = After menopause (finding) -> 3 (postmenopausal)\r\n============================================================================\r\n============================================================================\r\nMapModulMamma: Bundle -> oBDS Modul_Mamma\r\nExtrahiert Hormonrezeptoren, HER2 und Menopausenstatus aus Observations\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "EntryER",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "erEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85337-4')"
      }],
      "rule" : [{
        "name" : "MapERObs",
        "source" : [{
          "context" : "erEntry",
          "element" : "resource",
          "variable" : "erObs"
        }],
        "rule" : [{
          "name" : "MapERValue",
          "source" : [{
            "context" : "erObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetERPositiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusOestrogen",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetERNegativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusOestrogen",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetERUnbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusOestrogen",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryPR",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "prEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85339-0')"
      }],
      "rule" : [{
        "name" : "MapPRObs",
        "source" : [{
          "context" : "prEntry",
          "element" : "resource",
          "variable" : "prObs"
        }],
        "rule" : [{
          "name" : "MapPRValue",
          "source" : [{
            "context" : "prObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetPRPositiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusProgesteron",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetPRNegativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusProgesteron",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetPRUnbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hormonrezeptorStatusProgesteron",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryHER2",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "herEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85319-2')"
      }],
      "rule" : [{
        "name" : "MapHER2Obs",
        "source" : [{
          "context" : "herEntry",
          "element" : "resource",
          "variable" : "herObs"
        }],
        "rule" : [{
          "name" : "MapHER2Value",
          "source" : [{
            "context" : "herObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetHER2Positiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "her2neuStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetHER2Negativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "her2neuStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetHER2Unbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "her2neuStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryMenopause",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "menoEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '63612-8')"
      }],
      "rule" : [{
        "name" : "MapMenoObs",
        "source" : [{
          "context" : "menoEntry",
          "element" : "resource",
          "variable" : "menoObs"
        }],
        "rule" : [{
          "name" : "MapMenoValue",
          "source" : [{
            "context" : "menoObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetMenoPrae",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '309606002'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "praetherapeutischerMenopausenstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "1"
              }]
            }]
          },
          {
            "name" : "SetMenoPost",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '309608001'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "praetherapeutischerMenopausenstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "3"
              }]
            }]
          },
          {
            "name" : "SetMenoPeri",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '309607006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "praetherapeutischerMenopausenstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          },
          {
            "name" : "SetMenoUnbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "praetherapeutischerMenopausenstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryDrahtmarkierung",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "srEntry",
        "condition" : "resource.is(ServiceRequest)"
      }],
      "rule" : [{
        "name" : "MapDrahtSR",
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
            "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung'"
          }],
          "rule" : [{
            "name" : "MapDrahtValue",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetDrahtMammografie",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'M'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "praeopDrahtmarkierung",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "M"
                }]
              }]
            },
            {
              "name" : "SetDrahtSonografie",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'S'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "praeopDrahtmarkierung",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "S"
                }]
              }]
            },
            {
              "name" : "SetDrahtMRT",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'T'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "praeopDrahtmarkierung",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "T"
                }]
              }]
            },
            {
              "name" : "SetDrahtNein",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'N'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "praeopDrahtmarkierung",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "N"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryIntraopKontrolle",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "specEntry",
        "condition" : "resource.is(Specimen)"
      }],
      "rule" : [{
        "name" : "MapIntraopSpec",
        "source" : [{
          "context" : "specEntry",
          "element" : "resource",
          "variable" : "spec"
        }],
        "rule" : [{
          "name" : "MapIntraopProcessing",
          "source" : [{
            "context" : "spec",
            "element" : "processing",
            "variable" : "proc"
          }],
          "rule" : [{
            "name" : "MapIntraopProc",
            "source" : [{
              "context" : "proc",
              "element" : "procedure",
              "variable" : "p"
            }],
            "rule" : [{
              "name" : "SetIntraopKontrolle",
              "source" : [{
                "context" : "p",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/cs-senologie-obds-intraop-praeparatkontrolle'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "intraopPraeparatkontrolle",
                "transform" : "evaluate",
                "parameter" : [{
                  "valueString" : "c.code"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryTumorSize",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "sizeEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33728-7')"
      }],
      "rule" : [{
        "name" : "MapSizeObs",
        "source" : [{
          "context" : "sizeEntry",
          "element" : "resource",
          "variable" : "sizeObs"
        }],
        "rule" : [{
          "name" : "MapSizeInvasiv",
          "source" : [{
            "context" : "sizeObs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetTumorgroesseInvasiv",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "tumorgroesseInvasiv",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    }]
  }]
}

```
