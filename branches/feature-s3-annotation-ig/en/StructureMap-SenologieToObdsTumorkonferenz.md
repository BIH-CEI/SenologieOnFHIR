# SenologieToObdsTumorkonferenz - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTumorkonferenz**

## StructureMap: SenologieToObdsTumorkonferenz 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorkonferenz | *Version*:0.10.0 |
| Draft as of 2026-10-19 | *Computable Name*:SenologieToObdsTumorkonferenz |

 
title: Senologie FHIR to oBDS Tumorkonferenz status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTumorkonferenz",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorkonferenz",
  "version" : "0.10.0",
  "name" : "SenologieToObdsTumorkonferenz",
  "status" : "draft",
  "date" : "2026-10-19T00:09:05+00:00",
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
  "description" : "title: Senologie FHIR to oBDS Tumorkonferenz\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
    "mode" : "source",
    "alias" : "CarePlan"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung"],
  "group" : [{
    "name" : "SenologieToObdsTumorkonferenz",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapTumorkonferenz, MapTherapieempfehlung) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nLogical Model sub-path for BackboneElement slices. The IG Publisher produces\r\nSM_TARGET_PATH errors (~12). Element names are correct per the oBDS LM.\r\n============================================================================\r\nHauptgruppe: CarePlan → oBDS Tumorkonferenz\r\nEin CarePlan (senologie-tumorboard-empfehlung) bildet eine Tumorkonferenz\r\nmit Therapieempfehlungen ab. Die activity-Eintraege enthalten die\r\nempfohlenen Therapiearten (OP, CH, ST, HO, IM, ZS, etc.)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "CarePlan",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OBDSMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallMapTumorkonferenz",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "tumorkonferenz",
        "variable" : "tk"
      }],
      "dependent" : [{
        "name" : "MapTumorkonferenz",
        "variable" : ["src", "tk"]
      }]
    }]
  },
  {
    "name" : "MapTumorkonferenz",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapTumorkonferenz: CarePlan → oBDS Tumorkonferenz Basisdaten\r\nMapped ID, Meldeanlass, Datum und Typ der Konferenz\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "CarePlan",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetTumorkonferenzID",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "tumorkonferenzID",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }],
      "documentation" : "Tumorkonferenz_ID: CarePlan.id"
    },
    {
      "name" : "MeldeanlassBeginn",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "s",
        "condition" : "$this = 'active'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldeanlass",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "behandlungsbeginn"
        }]
      }],
      "documentation" : "Meldeanlass: abgeleitet aus CarePlan.status und Kontext\r\nactive = laufende Planung -> diagnose oder behandlungsbeginn\r\ncompleted = abgeschlossen -> behandlungsende\r\nBei Tumorkonferenzen typischerweise: diagnose, behandlungsbeginn,\r\nbehandlungsende oder statusaenderung"
    },
    {
      "name" : "MeldeanlassEnde",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "s",
        "condition" : "$this = 'completed'"
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
      "name" : "MapDatum",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "p"
      }],
      "rule" : [{
        "name" : "SetDatum",
        "source" : [{
          "context" : "p",
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
      }],
      "documentation" : "Datum: aus CarePlan.period.start (Datum des Tumorboards)"
    },
    {
      "name" : "MapTyp",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "ExtractTypCoding",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetTyp",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "code"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "typ",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "code"
            }]
          }]
        }]
      }],
      "documentation" : "Typ der Tumorkonferenz: praetherapeutisch, postoperativ, posttherapeutisch\r\nAbgeleitet aus CarePlan.category oder einer Extension\r\ncategory.coding mit Tumorkonferenz-Typ"
    },
    {
      "name" : "TypPraeth",
      "source" : [{
        "context" : "src",
        "element" : "title",
        "variable" : "t",
        "condition" : "$this.lower().contains('praeth') or $this.lower().contains('präth')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typ",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "praeth"
        }]
      }],
      "documentation" : "Fallback: Typ aus CarePlan.title ableiten"
    },
    {
      "name" : "TypPostop",
      "source" : [{
        "context" : "src",
        "element" : "title",
        "variable" : "t",
        "condition" : "$this.lower().contains('postop')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typ",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "postop"
        }]
      }]
    },
    {
      "name" : "TypPostth",
      "source" : [{
        "context" : "src",
        "element" : "title",
        "variable" : "t",
        "condition" : "$this.lower().contains('postth')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typ",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "postth"
        }]
      }]
    },
    {
      "name" : "CallMapTherapieempfehlung",
      "source" : [{
        "context" : "src",
        "condition" : "activity.exists()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "therapieempfehlung",
        "variable" : "te"
      }],
      "dependent" : [{
        "name" : "MapTherapieempfehlung",
        "variable" : ["src", "te"]
      }],
      "documentation" : "Therapieempfehlung: aus CarePlan.activity Eintraegen\r\nJede activity repraesentiert eine empfohlene Therapieart"
    }]
  },
  {
    "name" : "MapTherapieempfehlung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapTherapieempfehlung: CarePlan.activity → oBDS Therapieempfehlung\r\nIteriert ueber alle activity-Eintraege und extrahiert Therapietypen.\r\nDie activity-Slices im Senologie-Profil bilden die verschiedenen\r\nTherapiearten ab (operativeTherapy, chemotherapy, radiotherapy, etc.)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "CarePlan",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetTypOp",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '387713003') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "OP"
        }]
      }],
      "documentation" : "Therapieart-activities -> oBDS-Typ. Nur die festen Therapieart-Codes werden uebersetzt;\r\ndie activities je ausgewaehlter Option (OP-Verfahren, Substanzen) und nicht empfohlene\r\nTherapiearten bleiben unberuecksichtigt."
    },
    {
      "name" : "SetTypSt",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '1287742003') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "ST"
        }]
      }]
    },
    {
      "name" : "SetTypCh",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '385786002') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "CH"
        }]
      }]
    },
    {
      "name" : "SetTypHo",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '169413002') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "HO"
        }]
      }]
    },
    {
      "name" : "SetTypIm",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '76334006') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "IM"
        }]
      }]
    },
    {
      "name" : "SetTypZs",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.code.coding.exists(code = '416608005') and detail.statusReason.coding.exists((code = 'nicht-empfohlen') or (code = 'nicht-diskutiert')).not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "typTherapieempfehlung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "ZS"
        }]
      }]
    },
    {
      "name" : "MapOnkoTypActivities",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "detail.exists()"
      }],
      "rule" : [{
        "name" : "ExtractOnkoDetail",
        "source" : [{
          "context" : "act",
          "element" : "detail",
          "variable" : "det"
        }],
        "rule" : [{
          "name" : "ExtractOnkoTypCoding",
          "source" : [{
            "context" : "det",
            "element" : "code",
            "variable" : "code"
          }],
          "rule" : [{
            "name" : "SetTypFromOnkoCS",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "typTherapieempfehlung",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "c.code"
              }]
            }]
          }]
        }]
      }],
      "documentation" : "Fallback: Therapietypen direkt aus activity.detail.code.coding.code extrahieren\r\nwenn die Codierung direkt oBDS-Therapietypen enthaelt (CH, ST, HO, IM, ZS, etc.)"
    },
    {
      "name" : "MapAbweichungPatientenwunsch",
      "source" : [{
        "context" : "src",
        "element" : "note",
        "variable" : "n",
        "condition" : "text.lower().contains('patientenwunsch') and text.lower().contains('abweichung')"
      }],
      "rule" : [{
        "name" : "SetAbweichungJa",
        "source" : [{
          "context" : "n"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "abweichungPatientenwunsch",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "J"
          }]
        }]
      }],
      "documentation" : "Abweichung vom Patientenwunsch: aus CarePlan.note oder Extension\r\nIn der Senologie-Dokumentation als Notiz oder spezifische Extension erfasst"
    },
    {
      "name" : "MapAbweichungExtension",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url.contains('abweichung-patientenwunsch')"
      }],
      "rule" : [{
        "name" : "ExtractAbweichungValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetAbweichungFromExt",
          "source" : [{
            "context" : "val"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "abweichungPatientenwunsch",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "val"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }],
      "documentation" : "Abweichung: aus Extension falls vorhanden"
    }]
  }]
}

```
