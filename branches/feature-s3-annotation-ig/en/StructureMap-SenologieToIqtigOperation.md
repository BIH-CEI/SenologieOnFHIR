# SenologieToIqtigOperation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigOperation**

## StructureMap: SenologieToIqtigOperation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation | *Version*:0.10.0 |
| Draft as of 2026-10-18 | *Computable Name*:SenologieToIqtigOperation |

 
title: Senologie Procedure + Specimen to IQTIG 18.1 Teildatensatz Operation status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigOperation",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation",
  "version" : "0.10.0",
  "name" : "SenologieToIqtigOperation",
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
  }],
  "group" : [{
    "name" : "MapOperation",
    "typeMode" : "none",
    "documentation" : "Import-only map: no target `uses` declaration — the calling map\r\n(SenologieToIqtigMammachirurgie181) provides the correct BackboneElement\r\ncontext (teildatensatzOperation). Omitting the root-level target type avoids\r\nSM_TARGET_PATH false positives where the validator would resolve property\r\nnames against iqtig-mammachirurgie-181 root.\r\n============================================================================\r\nTeildatensatz Operation (O): Procedure + Specimen + Observations -> O:*\r\nPro Eingriff wird ein Operations-Teildatensatz erzeugt. Quellen:\r\n- Procedure (Senologie_BrustOP / Senologie_Operation) -> OP-Datum, OPS,\r\nSeitenlokalisation, Operationsart\r\n- Specimen (Senologie_Pathologie_Praeparat) -> Schnellschnitt,\r\nPraeparatkontrolle, Praeparat-spezifische Daten\r\n- Observation (Pathologie-Befund) -> Histologie, Grading, pTNM, R-Status\r\n- Observation (Rezeptorstatus: ER/PR/HER2) -> QI-relevante Felder\r\n============================================================================",
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
      }],
      "documentation" : "O:LNROP - Laufende Nummer der Operation (Default 1; ueber Slicing iterierbar)"
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
      }],
      "documentation" : "O:LNRBRUST - Zuordnung zum Brust-Teildatensatz (Default 1)"
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
      }],
      "documentation" : "O:OPDATUM - aus Procedure.performedDateTime"
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
      }],
      "documentation" : "O:SEITE - Seitenlokalisation aus Procedure.bodySite (SNOMED CT)"
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
      }],
      "documentation" : "O:OPSCHLUESSEL - OPS-Kodes aus Procedure.code"
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
      }],
      "documentation" : "O:OPART - Operationsart aus Procedure.category oder Senologie-Operation-Art VS\r\nBET (5-870) -> 1, Mastektomie einfach (5-871) -> 2, Mastektomie SSM (5-872) -> 3,\r\nMastektomie NSM (5-883) -> 4, Revision -> 5, Wiederaufbau (5-885) -> 6"
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
      }],
      "documentation" : "Direkter Map aus Senologie-Operation-Art CodeSystem (falls vorhanden)"
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
      }],
      "documentation" : "Bundle lookups for O:DIGNITAET, O:SCHNELLSCHNITT, O:PRAEPKONTROLLE,\r\nO:HISTMORPH, O:GRADING, O:TGROESSEINV, O:TGROESSEDCIS, O:MULTIFOK,\r\nO:PT/PN/PM, O:UICCPATHO have been moved to the calling orchestrator\r\n(SenologieToIqtigMammachirurgie181.map) to avoid multiple source parameters.\r\n--- Residualstatus R0/R1/R2 aus Procedure.outcome ---\r\nO:RSTATUSLOK / O:RSTATUSGES - aus Procedure.outcome (SNOMED CT)\r\n122538001=R0, 122539009=R1, 122540006=R2, 122541005=RX"
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
      }],
      "documentation" : "--- Lymphknoten aus Pathologie-Observations ---\r\nO:SENTINEL - Sentinel-Biopsie durchgefuehrt (OPS 5-401.1*)"
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
      }],
      "documentation" : "O:AXDISSEKTION - Axilladissektion (OPS 5-402)"
    }]
  }]
}

```
