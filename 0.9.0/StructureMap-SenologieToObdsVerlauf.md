# SenologieToObdsVerlauf - Kerndatensatz Senologie v0.9.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsVerlauf**

## StructureMap: SenologieToObdsVerlauf 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsVerlauf | *Version*:0.9.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsVerlauf |

 
title: Senologie Verlauf Bundle to oBDS Verlaufsmeldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsVerlauf",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsVerlauf",
  "version" : "0.9.0",
  "name" : "SenologieToObdsVerlauf",
  "status" : "draft",
  "date" : "2026-05-04T16:55:55+00:00",
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
          "variable" : ["condition", "verl"]
        }]
      },
      {
        "name" : "CallMapFernmetastasen",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cond2"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl2"
        }],
        "dependent" : [{
          "name" : "MapFernmetastasenFromBundle",
          "variable" : ["src", "verl2"]
        }]
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
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "verlauf",
            "variable" : "verl3"
          },
          {
            "context" : "verl3",
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
        }]
      },
      {
        "name" : "EntryTNMClinical",
        "source" : [{
          "context" : "src",
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
            "element" : "verlauf",
            "variable" : "verl4"
          },
          {
            "context" : "verl4",
            "contextType" : "variable",
            "element" : "tnm",
            "variable" : "tnm"
          }],
          "dependent" : [{
            "name" : "MapTNM",
            "variable" : ["tnmObs", "tnm"]
          }]
        }]
      },
      {
        "name" : "EntryTNMPathological",
        "source" : [{
          "context" : "src",
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
            "element" : "verlauf",
            "variable" : "verl5"
          },
          {
            "context" : "verl5",
            "contextType" : "variable",
            "element" : "tnm",
            "variable" : "tnm"
          }],
          "dependent" : [{
            "name" : "MapTNM",
            "variable" : ["tnmObs", "tnm"]
          }]
        }]
      },
      {
        "name" : "CallMapLeistungszustand",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cond3"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl6"
        }],
        "dependent" : [{
          "name" : "MapLeistungszustandFromBundle",
          "variable" : ["src", "verl6"]
        }]
      },
      {
        "name" : "CallMapModulMamma",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cond4"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl7"
        },
        {
          "context" : "verl7",
          "contextType" : "variable",
          "element" : "modulMamma",
          "variable" : "mamma"
        }],
        "dependent" : [{
          "name" : "MapModulMamma",
          "variable" : ["src", "mamma"]
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
    }]
  }]
}

```
