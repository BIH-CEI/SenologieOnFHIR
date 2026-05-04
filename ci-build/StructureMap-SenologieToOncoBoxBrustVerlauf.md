# SenologieToOncoBoxBrustVerlauf - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustVerlauf**

## StructureMap: SenologieToOncoBoxBrustVerlauf 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustVerlauf | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrustVerlauf |

 
title: Senologie Bundle to OncoBox Brust Verlauf (inkl. OncoBox 2.0 FM-Felder J03-J05) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustVerlauf",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustVerlauf",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustVerlauf",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Bundle to OncoBox Brust Verlauf (inkl. OncoBox 2.0 FM-Felder J03-J05)\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "MapVerlaufFromBundle",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the OncoBox Brust Logical Model.\r\n============================================================================\r\nMapVerlaufFromBundle: Bundle -> OncoBox Primaerfall.verlauf (repeating)\r\nExtrahiert Verlaufsereignisse aus dem Bundle und mappt auf den OncoBox-\r\nVerlauf-Block. Drei Quellen fuer Verlaufseintraege:\r\n1. Senologie_FollowUp Observations (SCT 396432002) -> M01-M10 + Gesamtbeurteilung\r\nBildet die vollstaendige Verlaufsmeldung ab inkl. Nachsorge-Art, Vitalstatus,\r\nTumorstatus lokal/LK/FM und Zweittumor. Gesamtbeurteilung (D27) wird auf\r\nverlauf.ereignis gemappt: P->6 (Progress), Y->1 (Lokalrezidiv Default).\r\n2. Condition mit clinicalStatus=recurrence -> Rezidiv / Fernmetastase\r\n3. Observation LOINC 21907-1 (Distant metastases.clinical) -> Fernmetastase\r\nFuer Fernmetastasen-Ereignisse (ereignis=3) werden zusaetzlich die\r\nOncoBox 2.0 Felder J03-J05 befuellt:\r\nJ03: FM_OP_Datum       -> aus Procedure (Operation) mit FM-reasonReference\r\nJ04: FM_Therapien      -> Existenz-Check fuer OP/Syst/ST/Endo im Bundle\r\nJ05: FM_Residualstatus -> aus Procedure.outcome (Operation)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "EntryVerlaufFU",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "fuEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '396432002')"
      }],
      "rule" : [{
        "name" : "CallMapVerlaufFU",
        "source" : [{
          "context" : "fuEntry",
          "element" : "resource",
          "variable" : "fuObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl"
        }],
        "dependent" : [{
          "name" : "MapVerlaufFollowUp",
          "variable" : ["fuObs", "verl"]
        }]
      }]
    },
    {
      "name" : "EntryVerlaufFM",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "fmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21907-1')"
      }],
      "rule" : [{
        "name" : "CallMapVerlaufFM",
        "source" : [{
          "context" : "fmEntry",
          "element" : "resource",
          "variable" : "fmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl"
        }],
        "dependent" : [{
          "name" : "MapVerlaufFernmetastase",
          "variable" : ["fmObs", "verl", "src"]
        }]
      }]
    },
    {
      "name" : "EntryVerlaufRez",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "recEntry",
        "condition" : "resource.is(Condition) and resource.clinicalStatus.coding.exists(code = 'recurrence')"
      }],
      "rule" : [{
        "name" : "CallMapVerlaufRez",
        "source" : [{
          "context" : "recEntry",
          "element" : "resource",
          "variable" : "recCond"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "verlauf",
          "variable" : "verl"
        }],
        "dependent" : [{
          "name" : "MapVerlaufRezidiv",
          "variable" : ["recCond", "verl"]
        }]
      }]
    }]
  },
  {
    "name" : "MapVerlaufFollowUp",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapVerlaufFollowUp: Observation (Senologie_FollowUp) -> Verlauf M01-M10\r\nBildet eine Senologie_FollowUp Observation (SCT 396432002) auf den\r\nvollstaendigen OncoBox-Verlauf-Block ab:\r\nM01: Meldedatum       <- effectiveDateTime\r\nM02: Melder           <- performer.display\r\nM03: Nachsorge-Art    <- component[nachsorge-art]\r\nM04: Vitalstatus      <- component[vitalstatus]\r\nM05: Tumorstatus lok. <- component[Tumor_Verlauf] (SCT 445200009)\r\nM06: Tumorstatus LK   <- component[Lymphknoten_Verlauf] (SCT 399656008)\r\nM07: Tumorstatus FM   <- component[Fernmetastasen_Verlauf] (SCT 399608002)\r\nM08: Zweittumor       <- component[zweittumor]\r\nM09: Zweittumor ICD   <- component[zweittumor-icd]\r\nM10: Zweittumor Datum <- component[zweittumor-datum]\r\nEreignis              <- Gesamtbeurteilung (valueCodeableConcept):\r\nP->6 (Progress), Y->1 (Lokalrezidiv Default)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Observation",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetM01Datum",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "MapM02Perf",
      "source" : [{
        "context" : "src",
        "element" : "performer",
        "variable" : "perf"
      }],
      "rule" : [{
        "name" : "SetM02Melder",
        "source" : [{
          "context" : "perf",
          "element" : "display",
          "variable" : "d"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "melder",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "d"
          }]
        }]
      }]
    },
    {
      "name" : "MapM03",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = 'nachsorge-art')"
      }],
      "rule" : [{
        "name" : "MapM03Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM03Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetM03Aktiv",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = 'aktiv'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "nachsorgeArt",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "aktiv"
              }]
            }]
          },
          {
            "name" : "SetM03Passiv",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = 'passiv'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "nachsorgeArt",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "passiv"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapM04",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = 'vitalstatus')"
      }],
      "rule" : [{
        "name" : "MapM04Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM04Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetM04Lebend",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '438949009'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "vitalstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "lebend"
              }]
            }]
          },
          {
            "name" : "SetM04Verstorben",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '419099009'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "vitalstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "verstorben"
              }]
            }]
          },
          {
            "name" : "SetM04Unbekannt",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "vitalstatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "unbekannt"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapM05",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '445200009')"
      }],
      "rule" : [{
        "name" : "MapM05Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM05Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system.contains('verlauf-primaertumor')"
          }],
          "rule" : [{
            "name" : "SetM05",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "tumorstatusLokal",
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
      "name" : "MapM06",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '399656008')"
      }],
      "rule" : [{
        "name" : "MapM06Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM06Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system.contains('verlauf-lymphknoten')"
          }],
          "rule" : [{
            "name" : "SetM06",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "tumorstatusLK",
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
      "name" : "MapM07",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '399608002')"
      }],
      "rule" : [{
        "name" : "MapM07Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM07Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system.contains('verlauf-fernmetastasen')"
          }],
          "rule" : [{
            "name" : "SetM07",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "tumorstatusFM",
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
      "name" : "MapM08",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = 'zweittumor')"
      }],
      "rule" : [{
        "name" : "MapM08Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM08Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetM08Ja",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '373066001'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zweittumor",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "ja"
              }]
            }]
          },
          {
            "name" : "SetM08Nein",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '373067005'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zweittumor",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "nein"
              }]
            }]
          },
          {
            "name" : "SetM08Unbekannt",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = '261665006'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zweittumor",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "unbekannt"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapM09",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = 'zweittumor-icd')"
      }],
      "rule" : [{
        "name" : "MapM09Val",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapM09Coding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
          }],
          "rule" : [{
            "name" : "SetM09",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zweitttumorIcd",
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
      "name" : "MapM10",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = 'zweittumor-datum')"
      }],
      "rule" : [{
        "name" : "SetM10",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val",
          "condition" : "$this.is(dateTime)"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "zweitttumorDatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "MapGesamt",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "MapGesamtCoding",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system.contains('verlauf-gesamtbeurteilung')"
        }],
        "rule" : [{
          "name" : "SetEreignisProgress",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'P'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "ereignis",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "6"
            }]
          }]
        },
        {
          "name" : "SetEreignisRezidiv",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'Y'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "ereignis",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapVerlaufFernmetastase",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapVerlaufFernmetastase: Observation (FM) -> Verlauf + OncoBox 2.0 J03-J05\r\nBildet eine Fernmetastasen-Observation auf den OncoBox-Verlauf-Block ab.\r\nZusaetzlich werden FM-spezifische Therapie-Procedures aus dem Bundle\r\nextrahiert fuer die OncoBox 2.0 Felder.\r\nFM-spezifische Procedures werden identifiziert ueber:\r\n- meta.profile enthält das jeweilige Senologie-Profil\r\n- extension:Intention mit code 'P' (palliativ) als FM-Kontextindikator\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Observation",
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
      "name" : "SetVerlaufDatumFM",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "SetEreignisFM",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "ereignis",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "3"
        }]
      }]
    },
    {
      "name" : "EntryFMOp",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "opEntry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
      }],
      "rule" : [{
        "name" : "MapFMOpProc",
        "source" : [{
          "context" : "opEntry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapIntentionExt",
          "source" : [{
            "context" : "proc",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url.contains('Intention')"
          }],
          "rule" : [{
            "name" : "MapIntentionValue",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "CheckIntentionPalliativ",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'P'"
              }],
              "rule" : [{
                "name" : "SetFMOpDatum",
                "source" : [{
                  "context" : "proc",
                  "element" : "performed",
                  "variable" : "perf",
                  "condition" : "$this.is(dateTime)"
                }],
                "target" : [{
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "fmOpDatum",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "perf"
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "CallMapFMTherapien",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "fmTherapien",
        "variable" : "fmTh"
      }],
      "dependent" : [{
        "name" : "MapFMTherapien",
        "variable" : ["bundle", "fmTh"]
      }]
    },
    {
      "name" : "EntryFMResidual",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "opEntry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
      }],
      "rule" : [{
        "name" : "MapFMResidualProc",
        "source" : [{
          "context" : "opEntry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapIntentionExtR",
          "source" : [{
            "context" : "proc",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url.contains('Intention')"
          }],
          "rule" : [{
            "name" : "MapIntentionValueR",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "CheckIntentionPalliativR",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'P'"
              }],
              "rule" : [{
                "name" : "MapFMResidualCoding",
                "source" : [{
                  "context" : "proc",
                  "element" : "outcome",
                  "variable" : "oc"
                }],
                "rule" : [{
                  "name" : "SetFMResidualCode",
                  "source" : [{
                    "context" : "oc",
                    "element" : "coding",
                    "variable" : "rc",
                    "condition" : "system.contains('residualstatus')"
                  }],
                  "target" : [{
                    "context" : "tgt",
                    "contextType" : "variable",
                    "element" : "fmResidualstatus",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueId" : "rc"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapFMTherapien",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapFMTherapien: Bundle -> FM_Therapien (J04)\r\nPrueft fuer jede Therapieart ob eine Procedure mit palliativer Intention\r\nim Bundle vorhanden ist und setzt entsprechend 0/1.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "EntryFMThOP",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
      }],
      "rule" : [{
        "name" : "MapFMThOPProc",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapIntentionExtOP",
          "source" : [{
            "context" : "proc",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url.contains('Intention')"
          }],
          "rule" : [{
            "name" : "CheckIntentionPalliativOP",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetFMThOP",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'P'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "operation",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "1"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryFMThSyst",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie'))"
      }],
      "rule" : [{
        "name" : "MapFMThSystProc",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapIntentionExtSyst",
          "source" : [{
            "context" : "proc",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url.contains('Intention')"
          }],
          "rule" : [{
            "name" : "CheckIntentionPalliativSyst",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetFMThSyst",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'P'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "systemtherapie",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "1"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryFMThST",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-strahlentherapie'))"
      }],
      "rule" : [{
        "name" : "MapFMThSTProc",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapIntentionExtST",
          "source" : [{
            "context" : "proc",
            "element" : "extension",
            "variable" : "ext",
            "condition" : "url.contains('Intention')"
          }],
          "rule" : [{
            "name" : "CheckIntentionPalliativST",
            "source" : [{
              "context" : "ext",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "SetFMThST",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c",
                "condition" : "code = 'P'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "strahlentherapie",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "1"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryFMThEndo",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie'))"
      }],
      "rule" : [{
        "name" : "MapFMThEndoProc",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "rule" : [{
          "name" : "MapEndocrineCodeCtx",
          "source" : [{
            "context" : "proc",
            "element" : "code",
            "variable" : "code"
          }],
          "rule" : [{
            "name" : "CheckEndocrineCode",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '169413002'"
            }],
            "rule" : [{
              "name" : "MapIntentionExtEndo",
              "source" : [{
                "context" : "proc",
                "element" : "extension",
                "variable" : "ext",
                "condition" : "url.contains('Intention')"
              }],
              "rule" : [{
                "name" : "CheckIntentionPalliativEndo",
                "source" : [{
                  "context" : "ext",
                  "element" : "value",
                  "variable" : "val"
                }],
                "rule" : [{
                  "name" : "SetFMThEndo",
                  "source" : [{
                    "context" : "val",
                    "element" : "coding",
                    "variable" : "ic",
                    "condition" : "code = 'P'"
                  }],
                  "target" : [{
                    "context" : "tgt",
                    "contextType" : "variable",
                    "element" : "endokrineTherapie",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "1"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapVerlaufRezidiv",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapVerlaufRezidiv: Condition (Rezidiv) -> Verlauf (Nicht-FM-Ereignis)\r\nMappt Rezidiv-Conditions auf den OncoBox-Verlauf-Block fuer Lokalrezidive,\r\nRegionaerrezidive und andere Verlaufsereignisse.\r\nFM-spezifische Felder J03-J05 werden hier NICHT befuellt.\r\n============================================================================",
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
      "name" : "MapVerlaufDatumExt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-feststellungsdatum'"
      }],
      "rule" : [{
        "name" : "SetVerlaufDatumExt",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val",
          "condition" : "$this.is(dateTime)"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "datum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "SetVerlaufDatumFallback",
      "source" : [{
        "context" : "src",
        "element" : "recordedDate",
        "variable" : "rd"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "rd"
        }]
      }]
    },
    {
      "name" : "MapEreignis",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapEreignisSCT",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetEreignisLokal",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '255226008'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "ereignis",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetEreignisRegional",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '315266007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "ereignis",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetEreignisKontralateral",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '94222008'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "ereignis",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
