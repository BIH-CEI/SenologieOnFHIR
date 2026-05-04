# SenologieToObdsOP - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsOP**

## StructureMap: SenologieToObdsOP 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsOP | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsOP |

 
title: Senologie Operation Bundle to oBDS OP-Meldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsOP",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsOP",
  "version" : "0.1.0",
  "name" : "SenologieToObdsOP",
  "status" : "draft",
  "date" : "2026-05-04T06:23:23+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
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
      }]
    },
    {
      "name" : "EntryProcedure",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure)"
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
          "variable" : ["procedure", "op", "src"]
        }]
      }]
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
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "source"
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
      }]
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
      }]
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
      }]
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
        "name" : "CallMapHistologie",
        "source" : [{
          "context" : "histEntry",
          "element" : "resource",
          "variable" : "histObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "histologie",
          "variable" : "histo"
        }],
        "dependent" : [{
          "name" : "MapHistologie",
          "variable" : ["histObs", "histo", "bundle"]
        }]
      }]
    },
    {
      "name" : "EntryPTNM",
      "source" : [{
        "context" : "bundle",
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
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tnm",
          "variable" : "ptnm"
        }],
        "dependent" : [{
          "name" : "MapTNM",
          "variable" : ["tnmObs", "ptnm", "bundle"]
        }]
      }]
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
      }]
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
      }]
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
      }]
    },
    {
      "name" : "CallMapModulMamma",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "modulMamma",
        "variable" : "mamma"
      }],
      "dependent" : [{
        "name" : "MapModulMamma",
        "variable" : ["bundle", "mamma"]
      }]
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
      }]
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
      }]
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
      }]
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
      }]
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
      }]
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
      }]
    }]
  }]
}

```
