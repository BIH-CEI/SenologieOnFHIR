# SenologieToOncoBoxBrustOperation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustOperation**

## StructureMap: SenologieToOncoBoxBrustOperation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustOperation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrustOperation |

 
title: Senologie Procedure + Specimen to OncoBox Brust Operation status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustOperation",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustOperation",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustOperation",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Procedure + Specimen to OncoBox Brust Operation\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
    "mode" : "source",
    "alias" : "ServiceRequest"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "MapOperation",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the OncoBox Brust Logical Model.\r\n============================================================================\r\nOperation: Procedure (+ Specimen / Observation) -> Operation-Block\r\nPro Brust-Procedure wird ein Operation-Block erzeugt mit OP-Datum,\r\nSeitenlokalisation, OPS-Kodes, Operationsart, Drahtmarkierung, Sentinel,\r\nResidualstatus und Komplikationen.\r\n============================================================================",
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
      "name" : "SetOpLnr",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lnr",
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
        "element" : "datum",
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
          "element" : "datum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "MapOpSeite",
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
      "name" : "MapOpsCodes",
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
          "element" : "opsCodes",
          "variable" : "ops"
        }],
        "rule" : [{
          "name" : "SetOpsCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "ops",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetOpsVer",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "ops",
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
      "name" : "MapOpArt",
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
          "name" : "SetOpArtMastEinf",
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
          "name" : "SetOpArtSSM",
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
          "name" : "SetOpArtNSM",
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
        },
        {
          "name" : "SetOpArtAxilla",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-402')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "7"
            }]
          }]
        },
        {
          "name" : "SetOpArtSLNB",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('5-401.1')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "operationsart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "8"
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
            "element" : "sentinel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapAxDiss",
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
      "name" : "EntryDrahtSR",
      "source" : [{
        "context" : "bundle",
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
            "name" : "MapDrahtVal",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetDrahtKeine",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'N'"
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
            },
            {
              "name" : "SetDrahtSono",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'S'"
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
              "name" : "SetDrahtMammo",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'M'"
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
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'T'"
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
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntrySpecimen",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Specimen) and resource.meta.profile.exists($this.contains('senologie-pathologie-praeparat'))"
      }],
      "rule" : [{
        "name" : "SpecCtx",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "specimen"
        }],
        "rule" : [{
          "name" : "SetSSJa",
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
        },
        {
          "name" : "MapPKProcessing",
          "source" : [{
            "context" : "specimen",
            "element" : "processing",
            "variable" : "proc"
          }],
          "rule" : [{
            "name" : "MapPKProcedure",
            "source" : [{
              "context" : "proc",
              "element" : "procedure",
              "variable" : "p"
            }],
            "rule" : [{
              "name" : "MapPKCoding",
              "source" : [{
                "context" : "p",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'http://snomed.info/sct'"
              }],
              "rule" : [{
                "name" : "SetPKMammo",
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
                "name" : "SetPKSono",
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
      "name" : "MapROutcome",
      "source" : [{
        "context" : "src",
        "element" : "outcome",
        "variable" : "out"
      }],
      "rule" : [{
        "name" : "MapROutcomeCoding",
        "source" : [{
          "context" : "out",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetRLokR0",
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
          "name" : "SetRGesR0",
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
          "name" : "SetRLokR1",
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
          "name" : "SetRGesR1",
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
          "name" : "SetRLokR2",
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
          "name" : "SetRGesR2",
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
          "name" : "SetRLokRX",
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
          "name" : "SetRGesRX",
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
      "name" : "SetRevisionDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "revisionsOp",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0"
        }]
      }]
    },
    {
      "name" : "MapRevisionCode",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapRevisionOPS",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }]
      }]
    },
    {
      "name" : "MapRevisionReason",
      "source" : [{
        "context" : "src",
        "element" : "reasonCode",
        "variable" : "rc"
      }],
      "rule" : [{
        "name" : "MapRevisionReasonSCT",
        "source" : [{
          "context" : "rc",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetRevisionJaSCT",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '282032007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "revisionsOp",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      },
      {
        "name" : "SetRevisionJaText",
        "source" : [{
          "context" : "rc",
          "element" : "text",
          "variable" : "txt",
          "condition" : "$this.contains('Revision')"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "revisionsOp",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      },
      {
        "name" : "SetRevisionJaNachresekt",
        "source" : [{
          "context" : "rc",
          "element" : "text",
          "variable" : "txt",
          "condition" : "$this.contains('Nachresektion')"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "revisionsOp",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      }]
    },
    {
      "name" : "MapAnzahlR0",
      "source" : [{
        "context" : "src",
        "element" : "outcome",
        "variable" : "out"
      }],
      "rule" : [{
        "name" : "MapAnzahlR0Coding",
        "source" : [{
          "context" : "out",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system.exists()"
        }],
        "rule" : [{
          "name" : "SetAnzahlR0Default",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'R0'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "anzahlEingriffeR0",
            "transform" : "copy",
            "parameter" : [{
              "valueInteger" : 1
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryKomp",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-operative-komplikation'))"
      }],
      "rule" : [{
        "name" : "MapKompObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "komplikationen",
          "variable" : "komp"
        }],
        "rule" : [{
          "name" : "MapKompKuerzelComp",
          "source" : [{
            "context" : "obs",
            "element" : "component",
            "variable" : "comp",
            "condition" : "code.coding.exists(code = '116224001')"
          }],
          "rule" : [{
            "name" : "MapKompKuerzelVal",
            "source" : [{
              "context" : "comp",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "MapKompKuerzelCoding",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetKompKuerzel",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "komp",
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
        },
        {
          "name" : "MapKompClavien",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapKompClavienCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'http://snomed.info/sct'"
            }],
            "rule" : [{
              "name" : "SetKompClavien",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "komp",
                "contextType" : "variable",
                "element" : "clavienDindo",
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
      "name" : "MapKompIcd",
      "source" : [{
        "context" : "src",
        "element" : "complication",
        "variable" : "comp"
      }],
      "rule" : [{
        "name" : "MapKompIcdCoding",
        "source" : [{
          "context" : "comp",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "komplikationen",
          "variable" : "komp"
        }],
        "rule" : [{
          "name" : "SetKompIcdCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "komp",
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
}

```
