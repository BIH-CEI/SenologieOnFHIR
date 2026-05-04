# SenologieToObdsST - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsST**

## StructureMap: SenologieToObdsST 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsST | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsST |

 
title: Senologie FHIR to oBDS Strahlentherapie (ST) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsST",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsST",
  "version" : "0.1.0",
  "name" : "SenologieToObdsST",
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
  "description" : "title: Senologie FHIR to oBDS Strahlentherapie (ST)\r\nstatus: draft",
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
    "name" : "SenologieToObdsST",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapST, MapBestrahlung) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nLogical Model sub-path for BackboneElement slices passed from parent groups.\r\nThe IG Publisher produces SM_TARGET_PATH errors (~19). The element names are\r\ncorrect per the oBDS Logical Model.\r\n============================================================================\r\nHauptgruppe: Bundle → oBDS ST (Strahlentherapie)\r\nEin Bundle enthaelt Strahlentherapie-Procedures (einzelne Bestrahlungsserien)\r\nund ggf. Observations fuer Nebenwirkungen (CTCAE).\r\n============================================================================",
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
      "name" : "EntryST",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-strahlentherapie'))"
      }],
      "rule" : [{
        "name" : "CallMapST",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "st",
          "variable" : "st"
        }],
        "dependent" : [{
          "name" : "MapST",
          "variable" : ["proc", "st", "src"]
        }]
      }]
    }]
  },
  {
    "name" : "MapST",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapST: Procedure → oBDS ST Basisdaten\r\nMapped Intention, Stellung zur OP und erzeugt Bestrahlungs-Eintraege\r\n============================================================================",
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
      "name" : "SetStID",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "stID",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }]
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
      }]
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
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention'"
      }],
      "rule" : [{
        "name" : "ExtractIntentionCoding",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "TranslateIntention",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
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
      "name" : "MapStellungOP",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "TranslateStellungOP",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-stellungzurop'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "stellungOP",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapiestellung"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "CallMapBestrahlung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "bestrahlungen",
        "variable" : "best"
      }],
      "dependent" : [{
        "name" : "MapBestrahlung",
        "variable" : ["src", "best"]
      }]
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
      }]
    },
    {
      "name" : "CallMapNebenwirkungen",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "nebenwirkungen",
        "variable" : "nw"
      }],
      "dependent" : [{
        "name" : "MapNebenwirkungenST",
        "variable" : ["bundle", "nw"]
      }]
    }]
  },
  {
    "name" : "MapBestrahlung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapBestrahlung: Procedure → oBDS Bestrahlung\r\nExtrahiert Bestrahlungsdetails: Zeitraum, Applikationsart, Zielgebiet,\r\nDosis und Boost aus den MII Onko Extensions\r\n============================================================================",
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
      "name" : "MapBestrahlungBeginn",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf"
      }],
      "rule" : [{
        "name" : "SetBestrahlungBeginn",
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
      }]
    },
    {
      "name" : "MapBestrahlungEnde",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf"
      }],
      "rule" : [{
        "name" : "SetBestrahlungEnde",
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
      }]
    },
    {
      "name" : "MapApplikationsart",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "ApplikationsartPerkutan",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "code.startsWith('8-522')"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "applikationsart",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "P"
          }]
        }]
      },
      {
        "name" : "ApplikationsartKontakt",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "code.startsWith('8-524')"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "applikationsart",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "K"
          }]
        }]
      }]
    },
    {
      "name" : "MapZielgebiet",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "ExtractZielgebietCoding",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetZielgebiet",
          "source" : [{
            "context" : "c",
            "element" : "display",
            "variable" : "d"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "zielgebiet",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "d"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapSeiteZielgebiet",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapSeiteExtension",
        "source" : [{
          "context" : "bs",
          "element" : "extension",
          "variable" : "ext",
          "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung-seitenlokalisation'"
        }],
        "rule" : [{
          "name" : "ExtractSeiteCoding",
          "source" : [{
            "context" : "ext",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "TranslateSeiteZielgebiet",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "seiteZielgebiet",
              "transform" : "translate",
              "parameter" : [{
                "valueId" : "c"
              },
              {
                "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation"
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
      "name" : "MapGesamtdosis",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung-gesamtdosis'"
      }],
      "rule" : [{
        "name" : "ExtractGesamtdosisValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetGesamtdosis",
          "source" : [{
            "context" : "val",
            "element" : "value",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtdosis",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        },
        {
          "name" : "SetGesamtdosisEinheit",
          "source" : [{
            "context" : "val",
            "element" : "unit",
            "variable" : "u"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtdosisEinheit",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "u"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapEinzeldosis",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis'"
      }],
      "rule" : [{
        "name" : "ExtractEinzeldosisValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetEinzeldosis",
          "source" : [{
            "context" : "val",
            "element" : "value",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "einzeldosis",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        },
        {
          "name" : "SetEinzeldosisEinheit",
          "source" : [{
            "context" : "val",
            "element" : "unit",
            "variable" : "u"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "einzeldosisEinheit",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "u"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapBoost",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung-boost'"
      }],
      "rule" : [{
        "name" : "ExtractBoostCoding",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetBoost",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "boost",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "c.code"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
