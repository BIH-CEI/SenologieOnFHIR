# SenologieToObdsTumorkonferenz - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTumorkonferenz**

## StructureMap: SenologieToObdsTumorkonferenz 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorkonferenz | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:SenologieToObdsTumorkonferenz |

 
title: Senologie FHIR to oBDS Tumorkonferenz status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTumorkonferenz",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorkonferenz",
  "version" : "0.1.0",
  "name" : "SenologieToObdsTumorkonferenz",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
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
      }]
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
      }]
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
      }]
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
      }]
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
      }]
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
      }]
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
      "name" : "MapServiceRequestActivities",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "(detail.kind = 'ServiceRequest') and detail.code.exists()"
      }],
      "rule" : [{
        "name" : "ExtractServiceRequestDetail",
        "source" : [{
          "context" : "act",
          "element" : "detail",
          "variable" : "det",
          "condition" : "kind = 'ServiceRequest'"
        }],
        "rule" : [{
          "name" : "ExtractOpCode",
          "source" : [{
            "context" : "det",
            "element" : "code",
            "variable" : "code",
            "condition" : "coding.exists()"
          }],
          "rule" : [{
            "name" : "SetTypOpServiceRequest",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c"
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
      }]
    },
    {
      "name" : "MapMedicationRequestActivities",
      "source" : [{
        "context" : "src",
        "element" : "activity",
        "variable" : "act",
        "condition" : "(detail.kind = 'MedicationRequest') and detail.code.exists()"
      }],
      "rule" : [{
        "name" : "ExtractMedicationRequestDetail",
        "source" : [{
          "context" : "act",
          "element" : "detail",
          "variable" : "det",
          "condition" : "kind = 'MedicationRequest'"
        }],
        "rule" : [{
          "name" : "ExtractMedCode",
          "source" : [{
            "context" : "det",
            "element" : "code",
            "variable" : "code",
            "condition" : "coding.exists()"
          }],
          "rule" : [{
            "name" : "SetTypMedicationRequest",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c"
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
      }]
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
      }]
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
      }]
    }]
  }]
}

```
