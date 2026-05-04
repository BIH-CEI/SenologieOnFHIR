# SenologieToIqtigOperation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigOperation**

## StructureMap: SenologieToIqtigOperation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIqtigOperation |

 
title: Senologie Procedure + Specimen to IQTIG 18.1 Teildatensatz Operation status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigOperation",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation",
  "version" : "0.1.0",
  "name" : "SenologieToIqtigOperation",
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
  "description" : "title: Senologie Procedure + Specimen to IQTIG 18.1 Teildatensatz Operation\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Specimen",
    "mode" : "source",
    "alias" : "Specimen"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
    "mode" : "target",
    "alias" : "IQTIG181"
  }],
  "group" : [{
    "name" : "MapOperation",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the IQTIG 18.1 Logical Model.\r\n============================================================================\r\nTeildatensatz Operation (O): Procedure + Specimen + Observations -> O:*\r\nPro Eingriff wird ein Operations-Teildatensatz erzeugt. Quellen:\r\n- Procedure (Senologie_BrustOP / Senologie_Operation) -> OP-Datum, OPS,\r\nSeitenlokalisation, Operationsart\r\n- Specimen (Senologie_Pathologie_Praeparat) -> Schnellschnitt,\r\nPraeparatkontrolle, Praeparat-spezifische Daten\r\n- Observation (Pathologie-Befund) -> Histologie, Grading, pTNM, R-Status\r\n- Observation (Rezeptorstatus: ER/PR/HER2) -> QI-relevante Felder\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Procedure",
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
      "name" : "SetLnrOp",
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
      "name" : "SetLnrBrustRef",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "bezugLnrBrust",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetOpDatum",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "operationsdatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "perf"
        }]
      }]
    },
    {
      "name" : "MapOpDatumPeriod",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(Period)"
      }],
      "rule" : [{
        "name" : "SetOpDatumPeriod",
        "source" : [{
          "context" : "perf",
          "element" : "start",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "operationsdatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "MapOpSeitenlokalisation",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapOpSeiteSCT",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetOpSeiteR",
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
          "name" : "SetOpSeiteL",
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
          "name" : "SetOpSeiteB",
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
      "name" : "MapProzeduren",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapOpsCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "prozeduren",
          "variable" : "opsItem"
        }],
        "rule" : [{
          "name" : "SetOpsCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "opsItem",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetOpsVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "opsItem",
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
      "name" : "MapOpArtFromOPS",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapOpArtOPS",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "rule" : [{
          "name" : "SetOpArtBET",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-870')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetOpArtMastEinfach",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-871')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetOpArtMastSSM",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-872')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        },
        {
          "name" : "SetOpArtMastNSM",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-883')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        },
        {
          "name" : "SetOpArtRekon",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-885')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "6"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapOpArtCategory",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "MapOpArtCoding",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/cs-senologie-brustop-art'"
        }],
        "rule" : [{
          "name" : "SetOpArtDirect",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryDignitaet",
      "source" : [{
        "context" : "bundle",
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
                "context" : "tgt",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
            "context" : "tgt",
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
        "context" : "bundle",
        "element" : "entry",
        "variable" : "specEntry",
        "condition" : "resource.is(Specimen)"
      }],
      "rule" : [{
        "name" : "SpecContextPK",
        "source" : [{
          "context" : "specEntry",
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
                  "context" : "tgt",
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
                  "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
                "context" : "tgt",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
        "context" : "bundle",
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
                "context" : "tgt",
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
      "name" : "MapResidualstatus",
      "source" : [{
        "context" : "src",
        "element" : "outcome",
        "variable" : "out"
      }],
      "rule" : [{
        "name" : "MapOutcomeCoding",
        "source" : [{
          "context" : "out",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetRStatusLokR0",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122538001'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusLokal",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R0"
            }]
          }]
        },
        {
          "name" : "SetRStatusGesR0",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122538001'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusGesamt",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R0"
            }]
          }]
        },
        {
          "name" : "SetRStatusLokR1",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122539009'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusLokal",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R1"
            }]
          }]
        },
        {
          "name" : "SetRStatusGesR1",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122539009'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusGesamt",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R1"
            }]
          }]
        },
        {
          "name" : "SetRStatusLokR2",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122540006'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusLokal",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R2"
            }]
          }]
        },
        {
          "name" : "SetRStatusGesR2",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122540006'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusGesamt",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R2"
            }]
          }]
        },
        {
          "name" : "SetRStatusLokRX",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122541005'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusLokal",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "RX"
            }]
          }]
        },
        {
          "name" : "SetRStatusGesRX",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '122541005'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "residualstatusGesamt",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "RX"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapSentinel",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapSentinelOPS",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "rule" : [{
          "name" : "SetSentinelJa",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-401.1')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "sentinelDurchgefuehrt",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapAxillaDissektion",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapAxDissOPS",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "rule" : [{
          "name" : "SetAxDissJa",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-402')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "axillaDissektion",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryLKUntersucht",
      "source" : [{
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
              "context" : "tgt",
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
              "context" : "tgt",
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
        "context" : "bundle",
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
          "context" : "tgt",
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
        "context" : "bundle",
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
          "context" : "tgt",
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
}

```
