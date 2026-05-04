# SenologieToIqtigMammachirurgie181 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigMammachirurgie181**

## StructureMap: SenologieToIqtigMammachirurgie181 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181 | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIqtigMammachirurgie181 |

 
title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigMammachirurgie181",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181",
  "version" : "0.1.0",
  "name" : "SenologieToIqtigMammachirurgie181",
  "status" : "draft",
  "date" : "2026-05-04T11:47:21+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator)\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Patient",
    "mode" : "source",
    "alias" : "Patient"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Encounter",
    "mode" : "source",
    "alias" : "Encounter"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Specimen",
    "mode" : "source",
    "alias" : "Specimen"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
    "mode" : "target",
    "alias" : "IQTIG181"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBasis",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBrust",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation"],
  "group" : [{
    "name" : "SenologieToIqtigMammachirurgie181",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMaster Orchestrator: Bundle -> IQTIG QS 18.1 Mammachirurgie\r\nEmpfaengt ein FHIR Bundle mit Senologie-Ressourcen (Patient, Encounter,\r\nCondition, Procedure, Specimen, Observations) und erzeugt eine vollstaendige\r\nIQTIG-QS-Meldung mit den drei Teildatensaetzen:\r\n- Teildatensatz Basis (B): Patient + Encounter\r\n- Teildatensatz Brust (BRUST): Condition + Pathologie (ein Eintrag je Seite)\r\n- Teildatensatz Operation (O): Procedure + Specimen (ein Eintrag je OP)\r\nAnalog zur IRegG-Meldung wird eine einzelne QS-Meldung pro Behandlungsfall\r\nerzeugt. Die Zuordnung der Teildatensaetze Brust und Operation erfolgt ueber\r\ndie laufenden Nummern (LNRBRUST, LNROP).\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "IQTIG181",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallMapBasis",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "teildatensatzBasis",
        "variable" : "basis"
      }],
      "dependent" : [{
        "name" : "MapBasis",
        "variable" : ["src", "basis"]
      }]
    },
    {
      "name" : "EntryBrust",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition) and (resource.meta.profile.exists($this.contains('senologie-diagnose')) or resource.code.coding.exists((system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm') and code.startsWith('C50')))"
      }],
      "rule" : [{
        "name" : "CallMapBrust",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "teildatensatzBrust",
          "variable" : "brust"
        }],
        "dependent" : [{
          "name" : "MapBrust",
          "variable" : ["condition", "brust"]
        }]
      },
      {
        "name" : "EntryCT",
        "source" : [{
          "context" : "src",
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
                  "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
          "context" : "src",
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
                "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
                  "context" : "brust",
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
                  "context" : "brust",
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
                  "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
          "context" : "src",
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
                  "context" : "brust",
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
        "name" : "EntryDraht",
        "source" : [{
          "context" : "src",
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
                    "context" : "brust",
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
                    "context" : "brust",
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
                    "context" : "brust",
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
                    "context" : "brust",
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
      }]
    },
    {
      "name" : "EntryOperation",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-brustop') or $this.contains('senologie-operation'))"
      }],
      "rule" : [{
        "name" : "CallMapOperation",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "teildatensatzOperation",
          "variable" : "op"
        }],
        "dependent" : [{
          "name" : "MapOperation",
          "variable" : ["procedure", "op"]
        }]
      },
      {
        "name" : "EntryDignitaet",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "digEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '22748-9')"
        }],
        "rule" : [{
          "name" : "MapDigObs",
          "source" : [{
            "context" : "digEntry",
            "element" : "resource",
            "variable" : "digObs"
          }],
          "rule" : [{
            "name" : "MapDigValue",
            "source" : [{
              "context" : "digObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapDigCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetDigMaligne",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = '1222584008'"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "dignitaetIntraop",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "1"
                  }]
                }]
              },
              {
                "name" : "SetDigBenigne",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = '36103009'"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "dignitaetIntraop",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "2"
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntrySchnellschnitt",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "specEntry",
          "condition" : "resource.is(Specimen) and resource.meta.profile.exists($this.contains('senologie-pathologie-praeparat'))"
        }],
        "rule" : [{
          "name" : "SpecContextSS",
          "source" : [{
            "context" : "specEntry",
            "element" : "resource",
            "variable" : "specimen"
          }],
          "rule" : [{
            "name" : "SetSchnellschnittJa",
            "source" : [{
              "context" : "specimen",
              "element" : "processing",
              "variable" : "proc",
              "condition" : "procedure.coding.exists(code = '123038009')"
            }],
            "target" : [{
              "context" : "op",
              "contextType" : "variable",
              "element" : "intraopSchnellschnitt",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "1"
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntryPraeparatkontrolle",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "specEntry2",
          "condition" : "resource.is(Specimen)"
        }],
        "rule" : [{
          "name" : "SpecContextPK",
          "source" : [{
            "context" : "specEntry2",
            "element" : "resource",
            "variable" : "specimen"
          }],
          "rule" : [{
            "name" : "MapPraepkProcessing",
            "source" : [{
              "context" : "specimen",
              "element" : "processing",
              "variable" : "proc"
            }],
            "rule" : [{
              "name" : "MapPraepkProcedure",
              "source" : [{
                "context" : "proc",
                "element" : "procedure",
                "variable" : "p"
              }],
              "rule" : [{
                "name" : "MapPraepkCoding",
                "source" : [{
                  "context" : "p",
                  "element" : "coding",
                  "variable" : "c",
                  "condition" : "system = 'http://snomed.info/sct'"
                }],
                "rule" : [{
                  "name" : "SetPraepkMammo",
                  "source" : [{
                    "context" : "c",
                    "element" : "code",
                    "variable" : "cd",
                    "condition" : "$this = '71651007'"
                  }],
                  "target" : [{
                    "context" : "op",
                    "contextType" : "variable",
                    "element" : "intraopPraeparatkontrolle",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "1"
                    }]
                  }]
                },
                {
                  "name" : "SetPraepkSono",
                  "source" : [{
                    "context" : "c",
                    "element" : "code",
                    "variable" : "cd",
                    "condition" : "$this = '16310003'"
                  }],
                  "target" : [{
                    "context" : "op",
                    "contextType" : "variable",
                    "element" : "intraopPraeparatkontrolle",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "2"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntryHistologie",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "histEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59847-4')"
        }],
        "rule" : [{
          "name" : "MapHistObs",
          "source" : [{
            "context" : "histEntry",
            "element" : "resource",
            "variable" : "histObs"
          }],
          "rule" : [{
            "name" : "MapHistValue",
            "source" : [{
              "context" : "histObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapHistICDO",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'urn:oid:2.16.840.1.113883.6.43.1'"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "histologieICDO",
                "variable" : "histo"
              }],
              "rule" : [{
                "name" : "SetHistCode",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "histo",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "cd"
                  }]
                }]
              },
              {
                "name" : "SetHistVersion",
                "source" : [{
                  "context" : "c",
                  "element" : "version",
                  "variable" : "v"
                }],
                "target" : [{
                  "context" : "histo",
                  "contextType" : "variable",
                  "element" : "version",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "v"
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntryGrading",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "gradEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33732-9')"
        }],
        "rule" : [{
          "name" : "MapGradingObs",
          "source" : [{
            "context" : "gradEntry",
            "element" : "resource",
            "variable" : "gradObs"
          }],
          "rule" : [{
            "name" : "MapGradingValue",
            "source" : [{
              "context" : "gradObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapGradingCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetGrading",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "grading",
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
        "name" : "EntryTGroesseInv",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "tgInvEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33728-7')"
        }],
        "rule" : [{
          "name" : "MapTGroesseInvObs",
          "source" : [{
            "context" : "tgInvEntry",
            "element" : "resource",
            "variable" : "tgInvObs"
          }],
          "rule" : [{
            "name" : "MapTGroesseInvValue",
            "source" : [{
              "context" : "tgInvObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetTGroesseInv",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "tumorgroesseInvasiv",
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
        "name" : "EntryTGroesseDCIS",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "tgDcisEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44648-0') and resource.meta.profile.exists($this.contains('pathologie'))"
        }],
        "rule" : [{
          "name" : "MapTGroesseDCISObs",
          "source" : [{
            "context" : "tgDcisEntry",
            "element" : "resource",
            "variable" : "tgDcisObs"
          }],
          "rule" : [{
            "name" : "MapTGroesseDCISValue",
            "source" : [{
              "context" : "tgDcisObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetTGroesseDCIS",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "tumorgroesseDCIS",
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
        "name" : "EntryMultifokal",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "mfEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44638-1')"
        }],
        "rule" : [{
          "name" : "MapMFObs",
          "source" : [{
            "context" : "mfEntry",
            "element" : "resource",
            "variable" : "mfObs"
          }],
          "rule" : [{
            "name" : "MapMFValue",
            "source" : [{
              "context" : "mfObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapMFCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetMFNein",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = '56061002'"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "0"
                  }]
                }]
              },
              {
                "name" : "SetMFJa",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = '399566009'"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "1"
                  }]
                }]
              },
              {
                "name" : "SetMFMZ",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd",
                  "condition" : "$this = '367651003'"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "2"
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntryPT",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "ptEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21899-0')"
        }],
        "rule" : [{
          "name" : "MapPTObs",
          "source" : [{
            "context" : "ptEntry",
            "element" : "resource",
            "variable" : "ptObs"
          }],
          "rule" : [{
            "name" : "MapPTValue",
            "source" : [{
              "context" : "ptObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapPTCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetPT",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "pT",
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
        "name" : "EntryPN",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "pnEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21900-6')"
        }],
        "rule" : [{
          "name" : "MapPNObs",
          "source" : [{
            "context" : "pnEntry",
            "element" : "resource",
            "variable" : "pnObs"
          }],
          "rule" : [{
            "name" : "MapPNValue",
            "source" : [{
              "context" : "pnObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapPNCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetPN",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "pN",
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
        "name" : "EntryPM",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "pmEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21901-4')"
        }],
        "rule" : [{
          "name" : "MapPMObs",
          "source" : [{
            "context" : "pmEntry",
            "element" : "resource",
            "variable" : "pmObs"
          }],
          "rule" : [{
            "name" : "MapPMValue",
            "source" : [{
              "context" : "pmObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapPMCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetPM",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "pM",
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
        "name" : "EntryUICCPatho",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "uiccEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
        }],
        "rule" : [{
          "name" : "MapUICCPathoObs",
          "source" : [{
            "context" : "uiccEntry",
            "element" : "resource",
            "variable" : "uiccObs"
          }],
          "rule" : [{
            "name" : "MapUICCPathoValue",
            "source" : [{
              "context" : "uiccObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapUICCPathoCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetUICCPatho",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "uiccStadiumPatho",
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
        "name" : "EntryLKUntersucht",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "lkuEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21894-1')"
        }],
        "rule" : [{
          "name" : "MapLKUntersuchtObs",
          "source" : [{
            "context" : "lkuEntry",
            "element" : "resource",
            "variable" : "lkuObs"
          }],
          "rule" : [{
            "name" : "MapLKUntersuchtValue",
            "source" : [{
              "context" : "lkuObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetLKUntersucht",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "lkUntersucht",
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
        "name" : "EntryLKBefallen",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "lkbEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21893-3')"
        }],
        "rule" : [{
          "name" : "MapLKBefallenObs",
          "source" : [{
            "context" : "lkbEntry",
            "element" : "resource",
            "variable" : "lkbObs"
          }],
          "rule" : [{
            "name" : "MapLKBefallenValue",
            "source" : [{
              "context" : "lkbObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetLKBefallen",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "lkBefallen",
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
        "name" : "EntrySLKUntersucht",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "slkuEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92832-5')"
        }],
        "rule" : [{
          "name" : "MapSLKUntersuchtObs",
          "source" : [{
            "context" : "slkuEntry",
            "element" : "resource",
            "variable" : "slkuObs"
          }],
          "rule" : [{
            "name" : "MapSLKUntersuchtValue",
            "source" : [{
              "context" : "slkuObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetSLKUntersucht",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "sentinelLkUntersucht",
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
        "name" : "EntrySLKBefallen",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "slkbEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92833-3')"
        }],
        "rule" : [{
          "name" : "MapSLKBefallenObs",
          "source" : [{
            "context" : "slkbEntry",
            "element" : "resource",
            "variable" : "slkbObs"
          }],
          "rule" : [{
            "name" : "MapSLKBefallenValue",
            "source" : [{
              "context" : "slkbObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetSLKBefallen",
              "source" : [{
                "context" : "val",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "sentinelLkBefallen",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusER",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusER",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusER",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusPR",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusPR",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "hormonrezeptorStatusPR",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "her2Status",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "her2Status",
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
                "context" : "op",
                "contextType" : "variable",
                "element" : "her2Status",
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
        "name" : "EntryKomplikationen",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "kompEntry",
          "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-operative-komplikation'))"
        }],
        "rule" : [{
          "name" : "MapKomplObs",
          "source" : [{
            "context" : "kompEntry",
            "element" : "resource",
            "variable" : "kompObs"
          }],
          "target" : [{
            "context" : "op",
            "contextType" : "variable",
            "element" : "komplikationen",
            "variable" : "kompItem"
          }],
          "rule" : [{
            "name" : "MapKomplValue",
            "source" : [{
              "context" : "kompObs",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapKomplKuerzelCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetKomplKuerzel",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "kompItem",
                  "contextType" : "variable",
                  "element" : "kuerzel",
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
        "name" : "EntryKomplikationenCond",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "kcEntry",
          "condition" : "resource.is(Condition) and resource.category.coding.exists(code = 'problem-list-item')"
        }],
        "rule" : [{
          "name" : "MapKomplCondItem",
          "source" : [{
            "context" : "kcEntry",
            "element" : "resource",
            "variable" : "kcCond"
          }],
          "target" : [{
            "context" : "op",
            "contextType" : "variable",
            "element" : "komplikationen",
            "variable" : "kompItem"
          }],
          "rule" : [{
            "name" : "MapKomplCondCode",
            "source" : [{
              "context" : "kcCond",
              "element" : "code",
              "variable" : "code"
            }],
            "rule" : [{
              "name" : "MapKomplICDCoding",
              "source" : [{
                "context" : "code",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
              }],
              "rule" : [{
                "name" : "SetKomplICD",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "kompItem",
                  "contextType" : "variable",
                  "element" : "icdCode",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "cd"
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  }]
}

```
