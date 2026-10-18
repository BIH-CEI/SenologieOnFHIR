# SenologieToObdsOP - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsOP**

## StructureMap: SenologieToObdsOP 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsOP | *Version*:0.10.0 |
| Draft as of 2026-10-18 | *Computable Name*:SenologieToObdsOP |

 
title: Senologie Operation Bundle to oBDS OP-Meldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsOP",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsOP",
  "version" : "0.10.0",
  "name" : "SenologieToObdsOP",
  "status" : "draft",
  "date" : "2026-10-18T23:31:26+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Operation Bundle to oBDS OP-Meldung\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Specimen",
    "mode" : "source",
    "alias" : "Specimen"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTNM",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsHistologie",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsModulMamma",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsResidualstatus",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsNebenwirkung"],
  "group" : [{
    "name" : "SenologieToObdsOP",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapOP, MapKomplikationen, MapOperateur) use\r\n`target tgt : BackboneElement`. See SenologieToObdsTNM.map for details.\r\n============================================================================\r\nHauptgruppe: Bundle -> oBDS OP-Meldung\r\nDas Bundle enthaelt eine Procedure (OP), die zugehoerige Condition (Diagnose),\r\nsowie Observations (pTNM, Histologie) und ggf. Specimen.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OBDSMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "EntryConditionTZ",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition)"
      }],
      "rule" : [{
        "name" : "ConditionContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "rule" : [{
          "name" : "CallMapTumorzuordnung",
          "source" : [{
            "context" : "condition"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "tumorzuordnung",
            "variable" : "tz"
          }],
          "dependent" : [{
            "name" : "MapTumorzuordnung",
            "variable" : ["condition", "tz"]
          }]
        }]
      }],
      "documentation" : "Tumorzuordnung: aus der Condition-Ressource im Bundle"
    },
    {
      "name" : "EntryProcedure",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.partOf.exists().not()"
      }],
      "rule" : [{
        "name" : "CallMapOP",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "op",
          "variable" : "op"
        }],
        "dependent" : [{
          "name" : "MapOP",
          "variable" : ["procedure", "op"]
        }]
      },
      {
        "name" : "EntrySubProcOPS",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "subEntry",
          "condition" : "resource.is(Procedure) and resource.partOf.reference.endsWith(entry.resource.id)"
        }],
        "rule" : [{
          "name" : "SubProcContext",
          "source" : [{
            "context" : "subEntry",
            "element" : "resource",
            "variable" : "subProc"
          }],
          "rule" : [{
            "name" : "MapSubProcedureCode",
            "source" : [{
              "context" : "subProc",
              "element" : "code",
              "variable" : "subCode"
            }],
            "rule" : [{
              "name" : "MapSubOPSCoding",
              "source" : [{
                "context" : "subCode",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
              }],
              "target" : [{
                "context" : "op",
                "contextType" : "variable",
                "element" : "opsKodes",
                "variable" : "ops"
              }],
              "rule" : [{
                "name" : "SetSubOPSCode",
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
                "name" : "SetSubOPSVersion",
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
          }]
        }],
        "documentation" : "Sub-Procedures: OPS-Codes von Procedure.partOf=Hauptprozedur einsammeln"
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
          "name" : "CallMapHistologie",
          "source" : [{
            "context" : "histEntry",
            "element" : "resource",
            "variable" : "histObs"
          }],
          "target" : [{
            "context" : "op",
            "contextType" : "variable",
            "element" : "histologie",
            "variable" : "histo"
          }],
          "dependent" : [{
            "name" : "MapHistologie",
            "variable" : ["histObs", "histo"]
          }]
        },
        {
          "name" : "EntrySpecimen",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "specEntry",
            "condition" : "resource.is(Specimen)"
          }],
          "rule" : [{
            "name" : "SpecimenContext",
            "source" : [{
              "context" : "specEntry",
              "element" : "resource",
              "variable" : "specimen"
            }],
            "rule" : [{
              "name" : "MapAccessionId",
              "source" : [{
                "context" : "specimen",
                "element" : "accessionIdentifier",
                "variable" : "accId"
              }],
              "rule" : [{
                "name" : "SetEinsendeNrFromSpecimen",
                "source" : [{
                  "context" : "accId",
                  "element" : "value",
                  "variable" : "v"
                }],
                "target" : [{
                  "context" : "histo",
                  "contextType" : "variable",
                  "element" : "histologieEinsendeNr",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "v"
                  }]
                }]
              }]
            },
            {
              "name" : "MapSpecimenCollection",
              "source" : [{
                "context" : "specimen",
                "element" : "collection",
                "variable" : "coll"
              }],
              "rule" : [{
                "name" : "SetHistologiedatumFromSpecimen",
                "source" : [{
                  "context" : "coll",
                  "element" : "collected",
                  "variable" : "collDt",
                  "condition" : "$this.is(dateTime)"
                }],
                "target" : [{
                  "context" : "histo",
                  "contextType" : "variable",
                  "element" : "tumorHistologiedatum",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "collDt"
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
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59542-1')"
          }],
          "rule" : [{
            "name" : "MapGradingSepObs",
            "source" : [{
              "context" : "gradEntry",
              "element" : "resource",
              "variable" : "gradObs"
            }],
            "rule" : [{
              "name" : "MapGradingSepValue",
              "source" : [{
                "context" : "gradObs",
                "element" : "value",
                "variable" : "val"
              }],
              "rule" : [{
                "name" : "TranslateGradingSeparate",
                "source" : [{
                  "context" : "val",
                  "element" : "coding",
                  "variable" : "c"
                }],
                "target" : [{
                  "context" : "histo",
                  "contextType" : "variable",
                  "element" : "grading",
                  "transform" : "translate",
                  "parameter" : [{
                    "valueId" : "c"
                  },
                  {
                    "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-grading"
                  },
                  {
                    "valueString" : "code"
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
            "variable" : "lkEntry",
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21894-1')"
          }],
          "rule" : [{
            "name" : "MapLKUntersuchtSep",
            "source" : [{
              "context" : "lkEntry",
              "element" : "resource",
              "variable" : "lkObs"
            }],
            "rule" : [{
              "name" : "SetLKUntersuchtSeparate",
              "source" : [{
                "context" : "lkObs",
                "element" : "value",
                "variable" : "val"
              }],
              "target" : [{
                "context" : "histo",
                "contextType" : "variable",
                "element" : "lkUntersucht",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "val"
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
            "name" : "MapLKBefallenSep",
            "source" : [{
              "context" : "lkbEntry",
              "element" : "resource",
              "variable" : "lkbObs"
            }],
            "rule" : [{
              "name" : "SetLKBefallenSeparate",
              "source" : [{
                "context" : "lkbObs",
                "element" : "value",
                "variable" : "val"
              }],
              "target" : [{
                "context" : "histo",
                "contextType" : "variable",
                "element" : "lkBefallen",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "val"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "EntrySentinelLKUntersucht",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "slkEntry",
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92832-5')"
          }],
          "rule" : [{
            "name" : "MapSentinelLKUntersuchtSep",
            "source" : [{
              "context" : "slkEntry",
              "element" : "resource",
              "variable" : "slkObs"
            }],
            "rule" : [{
              "name" : "SetSentinelLKUntersuchtSeparate",
              "source" : [{
                "context" : "slkObs",
                "element" : "value",
                "variable" : "val"
              }],
              "target" : [{
                "context" : "histo",
                "contextType" : "variable",
                "element" : "sentinelLKUntersucht",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "val"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "EntrySentinelLKBefallen",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "slkbEntry",
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92831-7')"
          }],
          "rule" : [{
            "name" : "MapSentinelLKBefallenSep",
            "source" : [{
              "context" : "slkbEntry",
              "element" : "resource",
              "variable" : "slkbObs"
            }],
            "rule" : [{
              "name" : "SetSentinelLKBefallenSeparate",
              "source" : [{
                "context" : "slkbObs",
                "element" : "value",
                "variable" : "val"
              }],
              "target" : [{
                "context" : "histo",
                "contextType" : "variable",
                "element" : "sentinelLKBefallen",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "val"
                }]
              }]
            }]
          }]
        }],
        "documentation" : "Bundle lookups moved from MapOP"
      },
      {
        "name" : "EntryPTNM",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "tnmEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
        }],
        "rule" : [{
          "name" : "CallMapPTNM",
          "source" : [{
            "context" : "tnmEntry",
            "element" : "resource",
            "variable" : "tnmObs"
          }],
          "target" : [{
            "context" : "op",
            "contextType" : "variable",
            "element" : "tnm",
            "variable" : "ptnm"
          }],
          "dependent" : [{
            "name" : "MapTNM",
            "variable" : ["tnmObs", "ptnm"]
          }]
        }]
      },
      {
        "name" : "CallMapModulMamma",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc2"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "op",
          "variable" : "op2"
        },
        {
          "context" : "op2",
          "contextType" : "variable",
          "element" : "modulMamma",
          "variable" : "mamma"
        }],
        "dependent" : [{
          "name" : "MapModulMamma",
          "variable" : ["src", "mamma"]
        }]
      }],
      "documentation" : "OP: aus der Procedure-Ressource im Bundle (nur Hauptprozedur, kein partOf).\r\nSubprozeduren (partOf gesetzt) sind keine eigene OP-Meldung — ihre OPS-Codes\r\nwerden unten unter \"EntrySubProcOPS\" in dieselbe Meldung eingesammelt."
    }]
  },
  {
    "name" : "MapOP",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nOP: Procedure -> OBDSMeldung.op\r\nIntention, Datum, OPS-Codes\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Procedure",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapOPID",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetOPID",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "opID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }],
      "documentation" : "OP_ID: aus Procedure.identifier"
    },
    {
      "name" : "MapIntention",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention'"
      }],
      "rule" : [{
        "name" : "MapIntentionValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractIntentionCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention'"
          }],
          "rule" : [{
            "name" : "SetIntentionDirect",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "intention",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        },
        {
          "name" : "TranslateIntention",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://snomed.info/sct'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "intention",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }],
      "documentation" : "Intention: aus Procedure.extension[Intention] mit Uebersetzung SNOMED -> oBDS"
    },
    {
      "name" : "SetOPDatum",
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
      }],
      "documentation" : "Datum: aus Procedure.performedDateTime"
    },
    {
      "name" : "MapOPSKodes",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapOPSCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "opsKodes",
          "variable" : "ops"
        }],
        "rule" : [{
          "name" : "SetOPSCode",
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
          "name" : "SetOPSVersion",
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
      }],
      "documentation" : "OPS-Codes: aus Procedure.code.coding (OPS-System, 1..*)"
    },
    {
      "name" : "CallMapResidualstatus",
      "source" : [{
        "context" : "src",
        "element" : "outcome",
        "variable" : "outcome"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "residualstatus",
        "variable" : "rs"
      }],
      "dependent" : [{
        "name" : "MapResidualstatusFromOutcome",
        "variable" : ["outcome", "rs"]
      }],
      "documentation" : "Histologie, pTNM, ModulMamma bundle lookups moved to calling group.\r\nResidualstatus: aus Procedure.outcome"
    },
    {
      "name" : "CallMapKomplikationen",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "komplikationen",
        "variable" : "komp"
      }],
      "dependent" : [{
        "name" : "MapKomplikationen",
        "variable" : ["src", "komp"]
      }],
      "documentation" : "Komplikationen: aus Procedure.complication"
    },
    {
      "name" : "CallMapOperateur",
      "source" : [{
        "context" : "src",
        "element" : "performer",
        "variable" : "perf"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "operateure",
        "variable" : "op"
      }],
      "dependent" : [{
        "name" : "MapOperateur",
        "variable" : ["perf", "op"]
      }],
      "documentation" : "Operateure: aus Procedure.performer"
    }]
  },
  {
    "name" : "MapKomplikationen",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nKomplikationen: Procedure -> OBDSMeldung.op.komplikationen\r\nKomplikationskuerzel (oBDS) und ICD-10-kodierte Komplikationen\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Procedure",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetKeineKomplikation",
      "source" : [{
        "context" : "src",
        "condition" : "complication.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "komplikationNeinOderUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "N"
        }]
      }],
      "documentation" : "Keine Komplikation: wenn complication leer ist"
    },
    {
      "name" : "MapKomplikationenObds",
      "source" : [{
        "context" : "src",
        "element" : "complication",
        "variable" : "comp"
      }],
      "rule" : [{
        "name" : "MapKomplikationObds",
        "source" : [{
          "context" : "comp",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-operation-komplikation'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "komplikation",
          "variable" : "k"
        }],
        "rule" : [{
          "name" : "SetKomplikationKuerzel",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "k",
            "contextType" : "variable",
            "element" : "kuerzel",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }],
      "documentation" : "Komplikationen vorhanden: oBDS-Kuerzel aus complication[compl_obds]"
    },
    {
      "name" : "MapKomplikationenIcd",
      "source" : [{
        "context" : "src",
        "element" : "complication",
        "variable" : "comp"
      }],
      "rule" : [{
        "name" : "MapKomplikationIcd",
        "source" : [{
          "context" : "comp",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "komplikation",
          "variable" : "k"
        }],
        "rule" : [{
          "name" : "MapKompIcd",
          "source" : [{
            "context" : "c"
          }],
          "target" : [{
            "context" : "k",
            "contextType" : "variable",
            "element" : "icd",
            "variable" : "icd"
          }],
          "rule" : [{
            "name" : "SetKompIcdCode",
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
            "name" : "SetKompIcdVersion",
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
      }],
      "documentation" : "Komplikationen mit ICD-10-Kodierung aus complication[compl_icd10]"
    }]
  },
  {
    "name" : "MapOperateur",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nOperateur: Procedure.performer -> OBDSMeldung.op.operateure\r\nNachname, Vornamen, Hauptoperateur-Kennzeichen\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapOperateurName",
      "source" : [{
        "context" : "src",
        "element" : "actor",
        "variable" : "actor"
      }],
      "rule" : [{
        "name" : "SetOperateurName",
        "source" : [{
          "context" : "actor",
          "element" : "display",
          "variable" : "d"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "nachname",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "d"
          }]
        }]
      }],
      "documentation" : "Operateur-Daten aus Procedure.performer.actor (Reference -> Practitioner)\r\nNachname + Vornamen aus actor.display (Format: \"Nachname, Vornamen\")"
    },
    {
      "name" : "MapHauptoperateur",
      "source" : [{
        "context" : "src",
        "element" : "function",
        "variable" : "func"
      }],
      "rule" : [{
        "name" : "SetHauptoperateurJa",
        "source" : [{
          "context" : "func",
          "element" : "coding",
          "variable" : "c",
          "condition" : "code = 'primary'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "hauptoperateur",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "J"
          }]
        }]
      },
      {
        "name" : "SetHauptoperateurNein",
        "source" : [{
          "context" : "func",
          "element" : "coding",
          "variable" : "c",
          "condition" : "code = 'secondary'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "hauptoperateur",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "N"
          }]
        }]
      }],
      "documentation" : "Hauptoperateur: aus Procedure.performer.function"
    },
    {
      "name" : "SetHauptoperateurDefault",
      "source" : [{
        "context" : "src",
        "condition" : "function.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "hauptoperateur",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "J"
        }]
      }],
      "documentation" : "Fallback: wenn keine function angegeben, erster Performer = Hauptoperateur"
    }]
  }]
}

```
