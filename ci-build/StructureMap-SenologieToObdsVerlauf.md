# SenologieToObdsVerlauf - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsVerlauf**

## StructureMap: SenologieToObdsVerlauf 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsVerlauf | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsVerlauf |

 
title: Senologie Verlauf Bundle to oBDS Verlaufsmeldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsVerlauf",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsVerlauf",
  "version" : "0.1.0",
  "name" : "SenologieToObdsVerlauf",
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
  "description" : "title: Senologie Verlauf Bundle to oBDS Verlaufsmeldung\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
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
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTNM",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsHistologie",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsModulMamma",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsFernmetastasen",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsLeistungszustand"],
  "group" : [{
    "name" : "SenologieToObdsVerlauf",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapVerlauf) use `target tgt : BackboneElement`.\r\nSee SenologieToObdsTNM.map for details.\r\n============================================================================\r\nHauptgruppe: Bundle -> oBDS Verlaufsmeldung\r\nDas Bundle enthaelt eine Condition (Rezidiv, clinicalStatus = recurrence)\r\nsowie zugehoerige Observations (TNM, Histologie, Fernmetastasen,\r\nHormonrezeptoren, Leistungszustand).\r\n============================================================================",
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
      "name" : "EntryConditionVerlauf",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition)"
      }],
      "rule" : [{
        "name" : "CallMapVerlauf",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl"
        }],
        "dependent" : [{
          "name" : "MapVerlauf",
          "variable" : ["condition", "verl", "src"]
        }]
      }]
    }]
  },
  {
    "name" : "MapVerlauf",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nVerlauf: Condition (Rezidiv) -> OBDSMeldung.verlauf\r\nVerlauf_ID, Meldeanlass, Untersuchungsdatum, Gesamtbeurteilung Tumorstatus,\r\nlokaler Tumorstatus, LK-Status, FM-Status\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Condition",
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
      "name" : "MapVerlaufID",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetVerlaufID",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlaufID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetMeldeanlass",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldeanlass",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "statusaenderung"
        }]
      }]
    },
    {
      "name" : "MapUntersuchungsdatumExt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-feststellungsdatum'"
      }],
      "rule" : [{
        "name" : "SetUntersuchungsdatumExt",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val",
          "condition" : "$this.is(dateTime)"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "untersuchungsdatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "SetUntersuchungsdatumFallback",
      "source" : [{
        "context" : "src",
        "element" : "recordedDate",
        "variable" : "rd"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "untersuchungsdatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "rd"
        }]
      }]
    },
    {
      "name" : "MapGesamtbeurteilung",
      "source" : [{
        "context" : "src",
        "element" : "stage",
        "variable" : "stg"
      }],
      "rule" : [{
        "name" : "ExtractGesamtbeurteilungCoding",
        "source" : [{
          "context" : "stg",
          "element" : "summary",
          "variable" : "sum"
        }],
        "rule" : [{
          "name" : "TranslateGesamtbeurteilung",
          "source" : [{
            "context" : "sum",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://snomed.info/sct'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtbeurteilungTumorstatus",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-verlauf-gesamtbeurteilung"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetGesamtbeurteilungRezidiv",
      "source" : [{
        "context" : "src",
        "element" : "clinicalStatus",
        "variable" : "cs",
        "condition" : "coding.exists(code = 'recurrence')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "gesamtbeurteilungTumorstatus",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Y"
        }]
      }]
    },
    {
      "name" : "MapLokalerTumorstatus",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-verlauf-lokaler-tumorstatus'"
      }],
      "rule" : [{
        "name" : "MapLokalerStatusValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractLokalerStatus",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetLokalerTumorstatus",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "verlaufLokalerTumorstatus",
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
      "name" : "MapTumorstatusLymphknoten",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-verlauf-tumorstatus-lymphknoten'"
      }],
      "rule" : [{
        "name" : "MapLKStatusValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractLKStatus",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetLKStatus",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "verlaufTumorstatusLymphknoten",
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
      "name" : "MapTumorstatusFernmetastasen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-verlauf-tumorstatus-fernmetastasen'"
      }],
      "rule" : [{
        "name" : "MapFMStatusValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractFMStatus",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetFMStatus",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "verlaufTumorstatusFernmetastasen",
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
      "name" : "CallMapFernmetastasen",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "MapFernmetastasenFromBundle",
        "variable" : ["bundle", "tgt"]
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
      "name" : "EntryTNMClinical",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "tnmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21908-9')"
      }],
      "rule" : [{
        "name" : "CallMapTNMClinical",
        "source" : [{
          "context" : "tnmEntry",
          "element" : "resource",
          "variable" : "tnmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tnm",
          "variable" : "tnm"
        }],
        "dependent" : [{
          "name" : "MapTNM",
          "variable" : ["tnmObs", "tnm", "bundle"]
        }]
      }]
    },
    {
      "name" : "EntryTNMPathological",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "tnmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
      }],
      "rule" : [{
        "name" : "CallMapTNMPathological",
        "source" : [{
          "context" : "tnmEntry",
          "element" : "resource",
          "variable" : "tnmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tnm",
          "variable" : "tnm"
        }],
        "dependent" : [{
          "name" : "MapTNM",
          "variable" : ["tnmObs", "tnm", "bundle"]
        }]
      }]
    },
    {
      "name" : "CallMapLeistungszustand",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "MapLeistungszustandFromBundle",
        "variable" : ["bundle", "tgt"]
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
  }]
}

```
