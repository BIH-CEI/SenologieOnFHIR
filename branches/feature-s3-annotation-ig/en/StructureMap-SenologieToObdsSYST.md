# SenologieToObdsSYST - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsSYST**

## StructureMap: SenologieToObdsSYST 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsSYST | *Version*:0.10.0 |
| Draft as of 2026-10-20 | *Computable Name*:SenologieToObdsSYST |

 
title: Senologie FHIR to oBDS Systemische Therapie (SYST) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsSYST",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsSYST",
  "version" : "0.10.0",
  "name" : "SenologieToObdsSYST",
  "status" : "draft",
  "date" : "2026-10-20T05:01:53+00:00",
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
  "description" : "title: Senologie FHIR to oBDS Systemische Therapie (SYST)\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsNebenwirkung"],
  "group" : [{
    "name" : "SenologieToObdsSYST",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapSYST, MapSubstanz) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nLogical Model sub-path for BackboneElement slices passed from parent groups.\r\nThe IG Publisher produces SM_TARGET_PATH errors (~16). The element names are\r\ncorrect per the oBDS Logical Model.\r\n============================================================================\r\nHauptgruppe: Bundle → oBDS SYST\r\nEin Bundle enthaelt eine Systemtherapie-Procedure (uebergeordnet)\r\nund zugehoerige MedicationStatements (einzelne Substanzgaben).\r\n============================================================================",
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
      "name" : "EntrySYST",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie-procedure'))"
      }],
      "rule" : [{
        "name" : "CallMapSYST",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "syst",
          "variable" : "syst"
        }],
        "dependent" : [{
          "name" : "MapSYST",
          "variable" : ["proc", "syst"]
        }]
      },
      {
        "name" : "EntrySubstanzen",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "medEntry",
          "condition" : "resource.is(MedicationStatement)"
        }],
        "rule" : [{
          "name" : "CallMapSubstanz",
          "source" : [{
            "context" : "medEntry",
            "element" : "resource",
            "variable" : "medStmt"
          }],
          "target" : [{
            "context" : "syst",
            "contextType" : "variable",
            "element" : "substanzen",
            "variable" : "subst"
          }],
          "dependent" : [{
            "name" : "MapSubstanz",
            "variable" : ["medStmt", "subst"]
          }]
        }],
        "documentation" : "Substanzen: MedicationStatements (moved from MapSYST)"
      },
      {
        "name" : "CallMapNebenwirkungen",
        "source" : [{
          "context" : "proc"
        }],
        "target" : [{
          "context" : "syst",
          "contextType" : "variable",
          "element" : "nebenwirkungen",
          "variable" : "nw"
        }],
        "dependent" : [{
          "name" : "MapNebenwirkungenSYST",
          "variable" : ["src", "nw"]
        }],
        "documentation" : "Nebenwirkungen (moved from MapSYST)"
      }],
      "documentation" : "Systemtherapie-Procedure extrahieren"
    }]
  },
  {
    "name" : "MapSYST",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapSYST: Procedure → oBDS SYST Basisdaten\r\nMapped Intention, Stellung zur OP, Therapieart, Protokoll, Zeitraum\r\n============================================================================",
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
      "name" : "SetSystID",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "systID",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }],
      "documentation" : "SYST_ID: Procedure.id"
    },
    {
      "name" : "MeldeanlassEnde",
      "source" : [{
        "context" : "src",
        "condition" : "performedPeriod.end.exists()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldeanlass",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "behandlungsende"
        }]
      }],
      "documentation" : "Meldeanlass: abgeleitet aus Procedure.status\r\ncompleted + performedPeriod.end vorhanden -> behandlungsende\r\ncompleted + nur performedPeriod.start -> behandlungsbeginn"
    },
    {
      "name" : "MeldeanlassBeginn",
      "source" : [{
        "context" : "src",
        "condition" : "performedPeriod.end.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldeanlass",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "behandlungsbeginn"
        }]
      }]
    },
    {
      "name" : "MapIntention",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention'"
      }],
      "rule" : [{
        "name" : "ExtractIntentionCoding",
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
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetIntention",
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
        }]
      }],
      "documentation" : "Intention: aus MII Onko Extension mii-ex-onko-systemische-therapie-intention\r\nMII Onko CodeSystem nutzt bereits oBDS-Codes (K, P, D, R, S, X)"
    },
    {
      "name" : "MapStellungOP",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "ExtractStellungCode",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-stellungzurop'"
        }],
        "rule" : [{
          "name" : "SetStellungOP",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungOP",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }],
      "documentation" : "Stellung zur OP: aus Procedure.category (MII Onko StellungZurOp)\r\nMII Onko CodeSystem nutzt bereits oBDS-Codes (O, A, N, I, S)"
    },
    {
      "name" : "MapTherapieart",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "TranslateTherapieart",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "therapieart",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart"
          },
          {
            "valueString" : "code"
          }]
        }]
      }],
      "documentation" : "Therapieart: aus Procedure.category (MII Onko Therapietyp-CodeSystem)\r\nMappt CH, HO, IM, ZS etc."
    },
    {
      "name" : "MapProtokoll",
      "source" : [{
        "context" : "src",
        "element" : "usedCode",
        "variable" : "uc"
      }],
      "rule" : [{
        "name" : "SetProtokoll",
        "source" : [{
          "context" : "uc",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "protokoll",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }],
      "documentation" : "Protokoll: aus Procedure.usedCode.text (Protokollbezeichnung, z.B. \"EC-T\")"
    },
    {
      "name" : "MapBeginn",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf"
      }],
      "rule" : [{
        "name" : "SetBeginn",
        "source" : [{
          "context" : "perf",
          "element" : "start",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "beginn",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }],
      "documentation" : "Beginn: aus Procedure.performedPeriod.start"
    },
    {
      "name" : "MapEnde",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf"
      }],
      "rule" : [{
        "name" : "SetEnde",
        "source" : [{
          "context" : "perf",
          "element" : "end",
          "variable" : "e"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "ende",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "e"
          }]
        }]
      }],
      "documentation" : "Ende: aus Procedure.performedPeriod.end"
    },
    {
      "name" : "MapEndeGrund",
      "source" : [{
        "context" : "src",
        "element" : "outcome",
        "variable" : "oc"
      }],
      "rule" : [{
        "name" : "SetEndeGrundCode",
        "source" : [{
          "context" : "oc",
          "element" : "coding",
          "variable" : "c"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "endeGrund",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "c.code"
          }]
        }]
      }],
      "documentation" : "Ende-Grund: aus Procedure.outcome.coding (MII Onko Ende-Grund CodeSystem)\r\nFalls keine strukturierte Codierung vorhanden, Freitext als Fallback"
    }]
  },
  {
    "name" : "MapSubstanz",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapSubstanz: MedicationStatement → oBDS Substanz\r\nExtrahiert Substanzbezeichnung und ATC-Code aus der Medikation\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "MedicationStatement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapSubstanzBezeichnung",
      "source" : [{
        "context" : "src",
        "element" : "medication",
        "variable" : "med"
      }],
      "rule" : [{
        "name" : "SetSubstanzBezeichnung",
        "source" : [{
          "context" : "med",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }],
      "documentation" : "Bezeichnung: aus medicationCodeableConcept.text oder coding.display"
    },
    {
      "name" : "MapAtcCode",
      "source" : [{
        "context" : "src",
        "element" : "medication",
        "variable" : "med"
      }],
      "rule" : [{
        "name" : "ExtractAtcCoding",
        "source" : [{
          "context" : "med",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/atc'"
        }],
        "rule" : [{
          "name" : "SetAtcCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "code"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "atcCode",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "code"
            }]
          }]
        },
        {
          "name" : "SetAtcVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "atcVersion",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }],
      "documentation" : "ATC-Code: aus medicationCodeableConcept.coding mit ATC-System"
    }]
  }]
}

```
