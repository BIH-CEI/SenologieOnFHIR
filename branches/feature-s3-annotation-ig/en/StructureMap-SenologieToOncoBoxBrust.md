# SenologieToOncoBoxBrust - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrust**

## StructureMap: SenologieToOncoBoxBrust 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust | *Version*:0.10.0 |
| Draft as of 2026-10-20 | *Computable Name*:SenologieToOncoBoxBrust |

 
title: Senologie FHIR Bundle to OncoBox Brust 2.0 (Master Orchestrator) targetSpec: OncoBox Brust 2.0 — Auditjahr 2026, Spezifikation v2.1.1 XSD-Quelle: https://xml-oncobox.de/de/Home/FuerHersteller (Brust2/26_1_oncobox-brust xsd-schema dkgzert (251110).xsd) ersetzt Vorgaengerversion 1.0 / N1.1.1 senologieVersion: 0.9.0 status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrust",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust",
  "version" : "0.10.0",
  "name" : "SenologieToOncoBoxBrust",
  "status" : "draft",
  "date" : "2026-10-20T05:42:12+00:00",
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
  "description" : "title: Senologie FHIR Bundle to OncoBox Brust 2.0 (Master Orchestrator)\r\ntargetSpec: OncoBox Brust 2.0 — Auditjahr 2026, Spezifikation v2.1.1\r\nXSD-Quelle: https://xml-oncobox.de/de/Home/FuerHersteller (Brust2/26_1_oncobox-brust xsd-schema dkgzert (251110).xsd)\r\nersetzt Vorgaengerversion 1.0 / N1.1.1\r\nsenologieVersion: 0.9.0\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Patient",
    "mode" : "source",
    "alias" : "Patient"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Encounter",
    "mode" : "source",
    "alias" : "Encounter"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
    "mode" : "source",
    "alias" : "CarePlan"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ResearchSubject",
    "mode" : "source",
    "alias" : "ResearchSubject"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "SenologieToOncoBoxBrust",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMaster Orchestrator: Bundle -> OncoBox Brust 2.0 Meldung\r\nStruktur in 2.0:\r\nOncoBoxBrust\r\n├─ ImportInfo (DatumXML, NameTudokusys, VersionTudokusys)\r\n└─ Patienten\r\n└─ Patient[]\r\n├─ Stammdaten (OncoBoxID, Geburtsjahr, Geschlecht, …)\r\n└─ Fall[]\r\n├─ Fallinformation (FallID, Falldokumentation)\r\n├─ Anamnese (BRCA Keimbahn, RaucherStatus)\r\n├─ Diagnose (ICD, Seitenlokalisation, cTNM, pTNM)\r\n├─ Tumorkonferenz[]\r\n├─ Histologie[] (Tumortyp, Grading, ER/PR/HER2/Ki67/PD-L1)\r\n├─ Operation[]\r\n├─ Strahlentherapie[]\r\n├─ Systemtherapie[]\r\n├─ Fernmetastase[]\r\n├─ Studie[]\r\n├─ Psychosozial\r\n└─ Follow_Up[]\r\nCodes-Conventions:\r\nGeschlecht: FHIR female=W, male=M, other=D, unknown=X\r\nVersicherungsform: gesetzlich=G, privat=P\r\nSeitenlokalisation: L|R|B|S (links|rechts|beidseits|ohne Seitenang.)\r\nDiagnosesicherheit: 0–7 (oBDS-konform); Histo=H/X (post-OP)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OncoBoxBrust",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapImportInfo",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "ImportInfo",
        "variable" : "ii"
      }],
      "rule" : [{
        "name" : "SetDatumXML",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "ii",
          "contextType" : "variable",
          "element" : "DatumXML",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "2026-05-13"
          }]
        }]
      },
      {
        "name" : "SetNameTudokusys",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "ii",
          "contextType" : "variable",
          "element" : "NameTudokusys",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Senologie-KDS FHIR IG"
          }]
        }]
      },
      {
        "name" : "SetVersionTudokusys",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "ii",
          "contextType" : "variable",
          "element" : "VersionTudokusys",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "0.9.0"
          }]
        }]
      }],
      "documentation" : "=== ImportInfo (Meldungs-Metadaten) ==="
    },
    {
      "name" : "MapPatienten",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "Patienten",
        "variable" : "ps"
      }],
      "rule" : [{
        "name" : "EntryPat",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "patEntry",
          "condition" : "resource.is(Patient)"
        }],
        "rule" : [{
          "name" : "MapPatient",
          "source" : [{
            "context" : "patEntry",
            "element" : "resource",
            "variable" : "pat"
          }],
          "target" : [{
            "context" : "ps",
            "contextType" : "variable",
            "element" : "Patient",
            "variable" : "p"
          }],
          "rule" : [{
            "name" : "MapStammdaten",
            "source" : [{
              "context" : "pat"
            }],
            "target" : [{
              "context" : "p",
              "contextType" : "variable",
              "element" : "Stammdaten",
              "variable" : "sd"
            }],
            "rule" : [{
              "name" : "SetOncoBoxID",
              "source" : [{
                "context" : "pat",
                "element" : "id",
                "variable" : "pid"
              }],
              "target" : [{
                "context" : "sd",
                "contextType" : "variable",
                "element" : "OncoBoxID",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "pid"
                }]
              }]
            },
            {
              "name" : "SetGeburtsjahr",
              "source" : [{
                "context" : "pat",
                "element" : "birthDate",
                "variable" : "bd"
              }],
              "target" : [{
                "context" : "sd",
                "contextType" : "variable",
                "element" : "Geburtsjahr",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "bd"
                }]
              }]
            },
            {
              "name" : "MapGender",
              "source" : [{
                "context" : "pat",
                "element" : "gender",
                "variable" : "g"
              }],
              "rule" : [{
                "name" : "SetGeschlechtW",
                "source" : [{
                  "context" : "g",
                  "condition" : "$this = 'female'"
                }],
                "target" : [{
                  "context" : "sd",
                  "contextType" : "variable",
                  "element" : "Geschlecht",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "W"
                  }]
                }]
              },
              {
                "name" : "SetGeschlechtM",
                "source" : [{
                  "context" : "g",
                  "condition" : "$this = 'male'"
                }],
                "target" : [{
                  "context" : "sd",
                  "contextType" : "variable",
                  "element" : "Geschlecht",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "M"
                  }]
                }]
              },
              {
                "name" : "SetGeschlechtD",
                "source" : [{
                  "context" : "g",
                  "condition" : "$this = 'other'"
                }],
                "target" : [{
                  "context" : "sd",
                  "contextType" : "variable",
                  "element" : "Geschlecht",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "D"
                  }]
                }]
              },
              {
                "name" : "SetGeschlechtX",
                "source" : [{
                  "context" : "g",
                  "condition" : "$this = 'unknown'"
                }],
                "target" : [{
                  "context" : "sd",
                  "contextType" : "variable",
                  "element" : "Geschlecht",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "X"
                  }]
                }]
              }]
            },
            {
              "name" : "SetSterbedatum",
              "source" : [{
                "context" : "pat",
                "element" : "deceased",
                "variable" : "dec",
                "condition" : "$this.is(dateTime)"
              }],
              "target" : [{
                "context" : "sd",
                "contextType" : "variable",
                "element" : "Sterbedatum",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "dec"
                }]
              }]
            }],
            "documentation" : "--- Stammdaten ---"
          },
          {
            "name" : "EntryCond",
            "source" : [{
              "context" : "src",
              "element" : "entry",
              "variable" : "condEntry",
              "condition" : "resource.is(Condition) and resource.meta.profile.exists($this.contains('senologie-diagnose-maligne'))"
            }],
            "rule" : [{
              "name" : "MapFall",
              "source" : [{
                "context" : "condEntry",
                "element" : "resource",
                "variable" : "cond"
              }],
              "target" : [{
                "context" : "p",
                "contextType" : "variable",
                "element" : "Fall",
                "variable" : "f"
              }],
              "rule" : [{
                "name" : "MapFallinfo",
                "source" : [{
                  "context" : "cond"
                }],
                "target" : [{
                  "context" : "f",
                  "contextType" : "variable",
                  "element" : "Fallinformation",
                  "variable" : "fi"
                }],
                "rule" : [{
                  "name" : "SetFallID",
                  "source" : [{
                    "context" : "cond",
                    "element" : "id",
                    "variable" : "cid"
                  }],
                  "target" : [{
                    "context" : "fi",
                    "contextType" : "variable",
                    "element" : "FallID",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueId" : "cid"
                    }]
                  }]
                },
                {
                  "name" : "SetFalldokA",
                  "source" : [{
                    "context" : "cond"
                  }],
                  "target" : [{
                    "context" : "fi",
                    "contextType" : "variable",
                    "element" : "Falldokumentation",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "A"
                    }]
                  }]
                }],
                "documentation" : "-- Fallinformation --"
              },
              {
                "name" : "MapAnamnese",
                "source" : [{
                  "context" : "cond"
                }],
                "target" : [{
                  "context" : "f",
                  "contextType" : "variable",
                  "element" : "Anamnese",
                  "variable" : "an"
                }],
                "rule" : [{
                  "name" : "EntryVorerkrankungen",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "vorEntry",
                    "condition" : "resource.is(Condition) and resource.category.coding.exists(code = 'problem-list-item')"
                  }],
                  "rule" : [{
                    "name" : "SetKrebsvor",
                    "source" : [{
                      "context" : "vorEntry",
                      "element" : "resource",
                      "variable" : "vorCond"
                    }],
                    "target" : [{
                      "context" : "an",
                      "contextType" : "variable",
                      "element" : "Krebsvorerkrankungen",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "J"
                      }]
                    }]
                  }],
                  "documentation" : "Krebsvorerkrankungen aus Condition.evidence oder Anamnese-Obs"
                },
                {
                  "name" : "EntryRaucher",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "rauchEntry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '72166-2')"
                  }],
                  "rule" : [{
                    "name" : "MapRauchObs",
                    "source" : [{
                      "context" : "rauchEntry",
                      "element" : "resource",
                      "variable" : "rauchObs"
                    }],
                    "rule" : [{
                      "name" : "MapRauchVal",
                      "source" : [{
                        "context" : "rauchObs",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapRauchCoding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetRauchR",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA18976-3'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "RaucherStatus",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "R"
                            }]
                          }]
                        },
                        {
                          "name" : "SetRauchG",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA18977-1'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "RaucherStatus",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "G"
                            }]
                          }]
                        },
                        {
                          "name" : "SetRauchEx",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA15920-4'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "RaucherStatus",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "Ex"
                            }]
                          }]
                        },
                        {
                          "name" : "SetRauchN",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA18978-9'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "RaucherStatus",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "N"
                            }]
                          }]
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "RaucherStatus aus ISiK Raucher-Observation (LOINC 72166-2)\r\nWerte sind LOINC LA-Codes (Answer List LL2828-3)"
                },
                {
                  "name" : "EntryGyn",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "gynEntry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '89221-6')"
                  }],
                  "rule" : [{
                    "name" : "MapGynObs",
                    "source" : [{
                      "context" : "gynEntry",
                      "element" : "resource",
                      "variable" : "gynObs"
                    }],
                    "rule" : [{
                      "name" : "SetMenoPost",
                      "source" : [{
                        "context" : "gynObs",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '42802-9')"
                      }],
                      "target" : [{
                        "context" : "an",
                        "contextType" : "variable",
                        "element" : "Praetherapeutischer_Menopausenstatus",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "3"
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "Menopausenstatus: abgeleitet aus Gynaekologische Anamnese\r\nWenn component 42802-9 (Age at menopause) vorhanden → postmenopausal (3)"
                },
                {
                  "name" : "EntryBRCA1",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "brca1Entry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '69548-6') and resource.component.value.coding.exists(code = 'HGNC:1100')"
                  }],
                  "rule" : [{
                    "name" : "MapBRCA1Obs",
                    "source" : [{
                      "context" : "brca1Entry",
                      "element" : "resource",
                      "variable" : "brca1Obs"
                    }],
                    "rule" : [{
                      "name" : "MapBRCA1Val",
                      "source" : [{
                        "context" : "brca1Obs",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapBRCA1Coding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetBRCA1Pos",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA9633-4'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "BRCA1_Keimbahn",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "P"
                            }]
                          }]
                        },
                        {
                          "name" : "SetBRCA1Neg",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA9634-2'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "BRCA1_Keimbahn",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "N"
                            }]
                          }]
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "BRCA1/2/PALB2 Keimbahn-Observations (MII Onko Genetische Variante, LOINC 69548-6)\r\nGen ist als component (48018-6, valueCodeableConcept HGNC) codiert.\r\nvalue (Observation.valueCodeableConcept) ist das Gesamtergebnis (positive/negative)."
                },
                {
                  "name" : "EntryBRCA2",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "brca2Entry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '69548-6') and resource.component.value.coding.exists(code = 'HGNC:1101')"
                  }],
                  "rule" : [{
                    "name" : "MapBRCA2Obs",
                    "source" : [{
                      "context" : "brca2Entry",
                      "element" : "resource",
                      "variable" : "brca2Obs"
                    }],
                    "rule" : [{
                      "name" : "MapBRCA2Val",
                      "source" : [{
                        "context" : "brca2Obs",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapBRCA2Coding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetBRCA2Pos",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA9633-4'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "BRCA2_Keimbahn",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "P"
                            }]
                          }]
                        },
                        {
                          "name" : "SetBRCA2Neg",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd",
                            "condition" : "$this = 'LA9634-2'"
                          }],
                          "target" : [{
                            "context" : "an",
                            "contextType" : "variable",
                            "element" : "BRCA2_Keimbahn",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueString" : "N"
                            }]
                          }]
                        }]
                      }]
                    }]
                  }]
                },
                {
                  "name" : "EntryKomorb",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "komorbEntry",
                    "condition" : "resource.is(Condition) and resource.meta.profile.exists($this.contains('komorbiditaet'))"
                  }],
                  "rule" : [{
                    "name" : "MapKomorbCond",
                    "source" : [{
                      "context" : "komorbEntry",
                      "element" : "resource",
                      "variable" : "kc"
                    }],
                    "rule" : [{
                      "name" : "MapKomorbCode",
                      "source" : [{
                        "context" : "kc",
                        "element" : "code",
                        "variable" : "kcc"
                      }],
                      "target" : [{
                        "context" : "an",
                        "contextType" : "variable",
                        "element" : "KomorbiditaetenVorDiagnose",
                        "variable" : "kvd"
                      }],
                      "rule" : [{
                        "name" : "MapKomorbCoding",
                        "source" : [{
                          "context" : "kcc",
                          "element" : "coding",
                          "variable" : "c",
                          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
                        }],
                        "rule" : [{
                          "name" : "SetKomorbWert",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "kvd",
                            "contextType" : "variable",
                            "element" : "Wert",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueId" : "cd"
                            }]
                          }]
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "Krebsvorerkrankungen: wenn weitere Conditions im Bundle (mit anderen ICD-10-Codes als der Hauptdiagnose)"
                }],
                "documentation" : "-- Anamnese (BRCA Keimbahn, Komorbiditaeten, Menopausenstatus, RaucherStatus) --"
              },
              {
                "name" : "MapDiagnose",
                "source" : [{
                  "context" : "cond"
                }],
                "target" : [{
                  "context" : "f",
                  "contextType" : "variable",
                  "element" : "Diagnose",
                  "variable" : "d"
                }],
                "rule" : [{
                  "name" : "MapCondCode",
                  "source" : [{
                    "context" : "cond",
                    "element" : "code",
                    "variable" : "code"
                  }],
                  "rule" : [{
                    "name" : "MapICD10",
                    "source" : [{
                      "context" : "code",
                      "element" : "coding",
                      "variable" : "c",
                      "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
                    }],
                    "rule" : [{
                      "name" : "SetICD10",
                      "source" : [{
                        "context" : "c",
                        "element" : "code",
                        "variable" : "cd"
                      }],
                      "target" : [{
                        "context" : "d",
                        "contextType" : "variable",
                        "element" : "ICD_10",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "cd"
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapICD11",
                    "source" : [{
                      "context" : "code",
                      "element" : "coding",
                      "variable" : "c",
                      "condition" : "system = 'http://id.who.int/icd/release/11/mms'"
                    }],
                    "rule" : [{
                      "name" : "SetICD11",
                      "source" : [{
                        "context" : "c",
                        "element" : "code",
                        "variable" : "cd"
                      }],
                      "target" : [{
                        "context" : "d",
                        "contextType" : "variable",
                        "element" : "ICD_11",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "cd"
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "ICD-10 / ICD-11 aus Condition.code Slices"
                },
                {
                  "name" : "MapSeite",
                  "source" : [{
                    "context" : "cond",
                    "element" : "bodySite",
                    "variable" : "bs"
                  }],
                  "rule" : [{
                    "name" : "MapSeiteCoding",
                    "source" : [{
                      "context" : "bs",
                      "element" : "coding",
                      "variable" : "c"
                    }],
                    "rule" : [{
                      "name" : "SetSeiteL",
                      "source" : [{
                        "context" : "c",
                        "element" : "code",
                        "variable" : "cd",
                        "condition" : "$this = '7771000'"
                      }],
                      "target" : [{
                        "context" : "d",
                        "contextType" : "variable",
                        "element" : "Seitenlokalisation",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "L"
                        }]
                      }]
                    },
                    {
                      "name" : "SetSeiteR",
                      "source" : [{
                        "context" : "c",
                        "element" : "code",
                        "variable" : "cd",
                        "condition" : "$this = '24028007'"
                      }],
                      "target" : [{
                        "context" : "d",
                        "contextType" : "variable",
                        "element" : "Seitenlokalisation",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "R"
                        }]
                      }]
                    },
                    {
                      "name" : "SetSeiteB",
                      "source" : [{
                        "context" : "c",
                        "element" : "code",
                        "variable" : "cd",
                        "condition" : "$this = '51440002'"
                      }],
                      "target" : [{
                        "context" : "d",
                        "contextType" : "variable",
                        "element" : "Seitenlokalisation",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "B"
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "Seitenlokalisation aus bodySite"
                },
                {
                  "name" : "MapDiagnoseDatum",
                  "source" : [{
                    "context" : "cond",
                    "element" : "extension",
                    "variable" : "ext",
                    "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-feststellungsdatum'"
                  }],
                  "rule" : [{
                    "name" : "SetDiagnosedatum",
                    "source" : [{
                      "context" : "ext",
                      "element" : "value",
                      "variable" : "v"
                    }],
                    "target" : [{
                      "context" : "d",
                      "contextType" : "variable",
                      "element" : "Diagnosedatum",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "v"
                      }]
                    }]
                  }],
                  "documentation" : "Diagnosedatum aus extension[Feststellungsdatum]"
                },
                {
                  "name" : "EntryCTNM",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "ctnmEntry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21908-9')"
                  }],
                  "rule" : [{
                    "name" : "MapCTNM",
                    "source" : [{
                      "context" : "ctnmEntry",
                      "element" : "resource",
                      "variable" : "ctnm"
                    }],
                    "rule" : [{
                      "name" : "PraethT",
                      "source" : [{
                        "context" : "ctnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21905-5')"
                      }],
                      "rule" : [{
                        "name" : "MapPraethTVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPraethTCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPraethT",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Praeth_T",
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
                      "name" : "PraethN",
                      "source" : [{
                        "context" : "ctnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21906-3')"
                      }],
                      "rule" : [{
                        "name" : "MapPraethNVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPraethNCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPraethN",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Praeth_N",
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
                      "name" : "PraethM",
                      "source" : [{
                        "context" : "ctnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21907-1')"
                      }],
                      "rule" : [{
                        "name" : "MapPraethMVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPraethMCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPraethM",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Praeth_M",
                              "transform" : "copy",
                              "parameter" : [{
                                "valueId" : "cd"
                              }]
                            }]
                          }]
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "Diagnosesicherheit: TODO — VerificationStatus hat mehrere Codings; muss\r\ngezielt nach oBDS-Mapping-System gefiltert werden (z.B. mii-vs-onko-primaertumor-diagnosesicherung).\r\n-- cTNM aus klinischer TNM-Observation (LOINC 21908-9) --"
                },
                {
                  "name" : "EntryPTNM",
                  "source" : [{
                    "context" : "src",
                    "element" : "entry",
                    "variable" : "ptnmEntry",
                    "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
                  }],
                  "rule" : [{
                    "name" : "MapPTNM",
                    "source" : [{
                      "context" : "ptnmEntry",
                      "element" : "resource",
                      "variable" : "ptnm"
                    }],
                    "rule" : [{
                      "name" : "PostopT",
                      "source" : [{
                        "context" : "ptnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21899-0')"
                      }],
                      "rule" : [{
                        "name" : "MapPostopTVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPostopTCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPostopT",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Postop_T",
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
                      "name" : "PostopN",
                      "source" : [{
                        "context" : "ptnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21900-6')"
                      }],
                      "rule" : [{
                        "name" : "MapPostopNVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPostopNCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPostopN",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Postop_N",
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
                      "name" : "PostopM",
                      "source" : [{
                        "context" : "ptnm",
                        "element" : "component",
                        "variable" : "comp",
                        "condition" : "code.coding.exists(code = '21901-4')"
                      }],
                      "rule" : [{
                        "name" : "MapPostopMVal",
                        "source" : [{
                          "context" : "comp",
                          "element" : "value",
                          "variable" : "val"
                        }],
                        "rule" : [{
                          "name" : "MapPostopMCode",
                          "source" : [{
                            "context" : "val",
                            "element" : "coding",
                            "variable" : "c",
                            "condition" : "system = 'https://www.uicc.org/resources/tnm'"
                          }],
                          "rule" : [{
                            "name" : "SetPostopM",
                            "source" : [{
                              "context" : "c",
                              "element" : "code",
                              "variable" : "cd"
                            }],
                            "target" : [{
                              "context" : "d",
                              "contextType" : "variable",
                              "element" : "Postop_M",
                              "transform" : "copy",
                              "parameter" : [{
                                "valueId" : "cd"
                              }]
                            }]
                          }]
                        }]
                      }]
                    }]
                  }],
                  "documentation" : "-- pTNM aus pathologischer TNM-Observation (LOINC 21902-2) --"
                }],
                "documentation" : "-- Diagnose --"
              },
              {
                "name" : "EntryHist",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "histEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59847-4')"
                }],
                "rule" : [{
                  "name" : "MapHistEntry",
                  "source" : [{
                    "context" : "histEntry",
                    "element" : "resource",
                    "variable" : "histObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "SetHistDatum",
                    "source" : [{
                      "context" : "histObs",
                      "element" : "effective",
                      "variable" : "eff",
                      "condition" : "$this.is(dateTime)"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Tumor_Histologiedatum",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "eff"
                      }]
                    }]
                  },
                  {
                    "name" : "MapTumortyp",
                    "source" : [{
                      "context" : "histObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "MapTumortypCoding",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system = 'urn:oid:2.16.840.1.113883.6.43.1'"
                      }],
                      "rule" : [{
                        "name" : "SetTumortyp",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "Tumortyp",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Histologie: pro Pathologie-Befund ein Histologie-Block --"
              },
              {
                "name" : "EntryER",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "erEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '40556-3')"
                }],
                "rule" : [{
                  "name" : "MapEREntry",
                  "source" : [{
                    "context" : "erEntry",
                    "element" : "resource",
                    "variable" : "erObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapERValue",
                    "source" : [{
                      "context" : "erObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "TranslateER",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system = 'http://loinc.org'"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "HormonrezeptorStatus_Oestrogen",
                        "transform" : "translate",
                        "parameter" : [{
                          "valueId" : "c"
                        },
                        {
                          "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-loinc-rezeptorstatus-to-obds"
                        },
                        {
                          "valueString" : "code"
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "ERAnteil",
                    "source" : [{
                      "context" : "erObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = '1234804006')"
                    }],
                    "rule" : [{
                      "name" : "MapERAnteilVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "SetERAnteil",
                        "source" : [{
                          "context" : "val",
                          "element" : "value",
                          "variable" : "v"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "Anteil_positiv_Oestrogen",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "v"
                          }]
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "ERIRS",
                    "source" : [{
                      "context" : "erObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = 'irs-score')"
                    }],
                    "rule" : [{
                      "name" : "MapERIRSVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "SetERIRS",
                        "source" : [{
                          "context" : "val",
                          "element" : "value",
                          "variable" : "v"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "IRS_Oestrogen",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "v"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Biomarker (ER/PR/HER2) als separate Histologie-Eintraege --\r\nOncoBox 2.0: Anteil_positiv_Oestrogen, IRS_Oestrogen,\r\nHormonrezeptorStatus_Oestrogen sind SEPARATE Felder\r\nER-Status → Histologie.HormonrezeptorStatus_Oestrogen (P/N/U via translate)"
              },
              {
                "name" : "EntryPR",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "prEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85339-0')"
                }],
                "rule" : [{
                  "name" : "MapPREntry",
                  "source" : [{
                    "context" : "prEntry",
                    "element" : "resource",
                    "variable" : "prObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapPRValue",
                    "source" : [{
                      "context" : "prObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "TranslatePR",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system = 'http://loinc.org'"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "HormonrezeptorStatus_Progesteron",
                        "transform" : "translate",
                        "parameter" : [{
                          "valueId" : "c"
                        },
                        {
                          "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-loinc-rezeptorstatus-to-obds"
                        },
                        {
                          "valueString" : "code"
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "PRAnteil",
                    "source" : [{
                      "context" : "prObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = '1234803000')"
                    }],
                    "rule" : [{
                      "name" : "MapPRAnteilVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "SetPRAnteil",
                        "source" : [{
                          "context" : "val",
                          "element" : "value",
                          "variable" : "v"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "Anteil_positiv_Progesteron",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "v"
                          }]
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "PRIRS",
                    "source" : [{
                      "context" : "prObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = 'irs-score')"
                    }],
                    "rule" : [{
                      "name" : "MapPRIRSVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "SetPRIRS",
                        "source" : [{
                          "context" : "val",
                          "element" : "value",
                          "variable" : "v"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "IRS_Progesteron",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "v"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "PR-Status → Histologie.HormonrezeptorStatus_Progesteron (P/N/U via translate)"
              },
              {
                "name" : "EntryHER2",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "her2Entry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '48676-1')"
                }],
                "rule" : [{
                  "name" : "MapHER2Entry",
                  "source" : [{
                    "context" : "her2Entry",
                    "element" : "resource",
                    "variable" : "her2Obs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "SetHER2IHC0",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA6111-4') or (system.endsWith('her2-ihc-score') and (code = '0'))) and value.coding.exists((code = 'ultralow') or (code = 'her2-ultralow')).not()"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC0"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC0plus",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA6111-4') or (system.endsWith('her2-ihc-score') and (code = '0'))) and value.coding.exists((code = 'ultralow') or (code = 'her2-ultralow'))"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC0-1"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC1",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA11841-6') or (system.endsWith('her2-ihc-score') and (code = '1')))"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC1"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC2neg",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA11842-4') or (system.endsWith('her2-ihc-score') and (code = '2'))) and component.where(code.coding.exists((code = '96893-3') or (code = '85318-4'))).value.coding.exists((code = 'LA6577-6') or (code = '260385009'))"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC2-"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC2pos",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA11842-4') or (system.endsWith('her2-ihc-score') and (code = '2'))) and component.where(code.coding.exists((code = '96893-3') or (code = '85318-4'))).value.coding.exists((code = 'LA6576-8') or (code = '10828004'))"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC2+"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC2ohneISH",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA11842-4') or (system.endsWith('her2-ihc-score') and (code = '2'))) and component.where(code.coding.exists((code = '96893-3') or (code = '85318-4'))).value.coding.exists((code = 'LA6577-6') or (code = 'LA6576-8') or (code = '260385009') or (code = '10828004')).not()"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "U"
                      }]
                    }]
                  },
                  {
                    "name" : "SetHER2IHC3",
                    "source" : [{
                      "context" : "her2Obs",
                      "condition" : "component.where(code.coding.exists(code = '85319-2')).value.coding.exists((code = 'LA11843-2') or (system.endsWith('her2-ihc-score') and (code = '3')))"
                    }],
                    "target" : [{
                      "context" : "h",
                      "contextType" : "variable",
                      "element" : "Her2neuStatus",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "IHC3"
                      }]
                    }]
                  }]
                }],
                "documentation" : "HER2-Status → Histologie.Her2neuStatus\r\nOncoBox 2.0 kennt keine P/N-Werte, sondern die IHC-Stufe (IHC0, IHC0-1, IHC1, IHC2-, IHC2+, IHC3);\r\nHER2-low bleibt damit erhalten. Quelle ist der IHC-Score (LOINC 85319-2), bei 2+ zusaetzlich\r\nDer IHC-Score kommt als LOINC-Antwort (Profil) oder als MII-MTB-Code 0-3 (Pathologie-Formular),\r\nultralow als MII-Leitliniencode oder lokaler Formularcode.\r\ndas ISH-Ergebnis (LOINC 96893-3, im Formular 85318-4; Werte als LOINC-Antwort oder SNOMED CT). 2+ ohne ISH-Ergebnis → 'U'."
              },
              {
                "name" : "EntryKi67",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "ki67Entry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85318-4')"
                }],
                "rule" : [{
                  "name" : "MapKi67Entry",
                  "source" : [{
                    "context" : "ki67Entry",
                    "element" : "resource",
                    "variable" : "ki67Obs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapKi67Val",
                    "source" : [{
                      "context" : "ki67Obs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "SetKi67",
                      "source" : [{
                        "context" : "val",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "Ki_67",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Ki-67 (LOINC 85318-4) --"
              },
              {
                "name" : "EntryGrad",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "gradEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33732-9')"
                }],
                "rule" : [{
                  "name" : "MapGradingEntry",
                  "source" : [{
                    "context" : "gradEntry",
                    "element" : "resource",
                    "variable" : "gradObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapGradingVal",
                    "source" : [{
                      "context" : "gradObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "MapGradingCoding",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetGrading",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "Grading",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Grading (LOINC 33732-9) --"
              },
              {
                "name" : "EntryLKUnt",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "lkuEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21894-1')"
                }],
                "rule" : [{
                  "name" : "MapLKUntEntry",
                  "source" : [{
                    "context" : "lkuEntry",
                    "element" : "resource",
                    "variable" : "lkuObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapLKUntVal",
                    "source" : [{
                      "context" : "lkuObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "SetLKUnt",
                      "source" : [{
                        "context" : "val",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "LK_untersucht",
                        "transform" : "truncate",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Lymphknoten untersucht/befallen, Sentinel-LK --"
              },
              {
                "name" : "EntryLKBef",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "lkbEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21893-3')"
                }],
                "rule" : [{
                  "name" : "MapLKBefEntry",
                  "source" : [{
                    "context" : "lkbEntry",
                    "element" : "resource",
                    "variable" : "lkbObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapLKBefVal",
                    "source" : [{
                      "context" : "lkbObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "SetLKBef",
                      "source" : [{
                        "context" : "val",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "LK_befallen",
                        "transform" : "truncate",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }]
              },
              {
                "name" : "EntrySLKUnt",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "slkuEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92832-5')"
                }],
                "rule" : [{
                  "name" : "MapSLKUntEntry",
                  "source" : [{
                    "context" : "slkuEntry",
                    "element" : "resource",
                    "variable" : "slkuObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapSLKUntVal",
                    "source" : [{
                      "context" : "slkuObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "SetSLKUnt",
                      "source" : [{
                        "context" : "val",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "Sentinel_LK_untersucht",
                        "transform" : "truncate",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }]
              },
              {
                "name" : "EntrySLKBef",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "slkbEntry",
                  "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92833-3')"
                }],
                "rule" : [{
                  "name" : "MapSLKBefEntry",
                  "source" : [{
                    "context" : "slkbEntry",
                    "element" : "resource",
                    "variable" : "slkbObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapSLKBefVal",
                    "source" : [{
                      "context" : "slkbObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "SetSLKBef",
                      "source" : [{
                        "context" : "val",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "h",
                        "contextType" : "variable",
                        "element" : "Sentinel_LK_befallen",
                        "transform" : "truncate",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }]
              },
              {
                "name" : "EntryPDL1",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "pdl1Entry",
                  "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-pdl1-status') or $this.contains('immunohistochemistry-pdl1'))"
                }],
                "rule" : [{
                  "name" : "MapPDL1Entry",
                  "source" : [{
                    "context" : "pdl1Entry",
                    "element" : "resource",
                    "variable" : "pdl1Obs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Histologie",
                    "variable" : "h"
                  }],
                  "rule" : [{
                    "name" : "MapPDL1Val",
                    "source" : [{
                      "context" : "pdl1Obs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "MapPDL1Coding",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetPDL1",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "h",
                          "contextType" : "variable",
                          "element" : "PD_L1",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- PD-L1 Status (MII MTB Immunohistochemistry PDL1 Profil) --"
              },
              {
                "name" : "EntryTK",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "tkEntry",
                  "condition" : "resource.is(CarePlan) and resource.meta.profile.exists($this.contains('senologie-tumorboard-empfehlung'))"
                }],
                "rule" : [{
                  "name" : "MapTKEntry",
                  "source" : [{
                    "context" : "tkEntry",
                    "element" : "resource",
                    "variable" : "tkCP"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Tumorkonferenz",
                    "variable" : "tk"
                  }],
                  "rule" : [{
                    "name" : "SetTKDatum",
                    "source" : [{
                      "context" : "tkCP",
                      "element" : "created",
                      "variable" : "crd"
                    }],
                    "target" : [{
                      "context" : "tk",
                      "contextType" : "variable",
                      "element" : "Tumorkonferenz_Datum",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "crd"
                      }]
                    }]
                  },
                  {
                    "name" : "MapTKTypVal",
                    "source" : [{
                      "context" : "tkCP",
                      "element" : "category",
                      "variable" : "cat"
                    }],
                    "rule" : [{
                      "name" : "MapTKTypCoding",
                      "source" : [{
                        "context" : "cat",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetTKTyp",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "tk",
                          "contextType" : "variable",
                          "element" : "Tumorkonferenz_Typ",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Tumorkonferenz (CarePlan / Senologie_Tumorboard_Empfehlung) --"
              },
              {
                "name" : "EntryFM",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "fmEntry",
                  "condition" : "resource.is(Condition) and resource.category.coding.exists((code = 'distant-metastasis') or (code = 'fernmetastase'))"
                }],
                "rule" : [{
                  "name" : "MapFMEntry",
                  "source" : [{
                    "context" : "fmEntry",
                    "element" : "resource",
                    "variable" : "fmCond"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Fernmetastase",
                    "variable" : "fm"
                  }],
                  "rule" : [{
                    "name" : "MapFMLok",
                    "source" : [{
                      "context" : "fmCond",
                      "element" : "bodySite",
                      "variable" : "bs"
                    }],
                    "rule" : [{
                      "name" : "MapFMLokCoding",
                      "source" : [{
                        "context" : "bs",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetFMLok",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "fm",
                          "contextType" : "variable",
                          "element" : "Fernmetastase_Lokalisation",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapFMDatum",
                    "source" : [{
                      "context" : "fmCond",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-feststellungsdatum'"
                    }],
                    "rule" : [{
                      "name" : "SetFMDatum",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "fm",
                        "contextType" : "variable",
                        "element" : "Fernmetastase_Diagnosedatum",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Fernmetastasen (Condition mit Tumormanifestation Fernmetastase) --"
              },
              {
                "name" : "EntryStud",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "studyEntry",
                  "condition" : "resource.is(ResearchSubject)"
                }],
                "rule" : [{
                  "name" : "MapStudEntry",
                  "source" : [{
                    "context" : "studyEntry",
                    "element" : "resource",
                    "variable" : "rs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Studie",
                    "variable" : "st"
                  }],
                  "rule" : [{
                    "name" : "MapStudStatus",
                    "source" : [{
                      "context" : "rs",
                      "element" : "status",
                      "variable" : "rsStat"
                    }],
                    "rule" : [{
                      "name" : "SetStudOn",
                      "source" : [{
                        "context" : "rsStat",
                        "condition" : "$this = 'on-study'"
                      }],
                      "target" : [{
                        "context" : "st",
                        "contextType" : "variable",
                        "element" : "Studienteilnahme",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "J"
                        }]
                      }]
                    },
                    {
                      "name" : "SetStudOff",
                      "source" : [{
                        "context" : "rsStat",
                        "condition" : "$this = 'off-study'"
                      }],
                      "target" : [{
                        "context" : "st",
                        "contextType" : "variable",
                        "element" : "Studienteilnahme",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "N"
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Studienteilnahme (ResearchSubject / Senologie_Studienteilnahme) --"
              },
              {
                "name" : "EntryOp",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "opEntry",
                  "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
                }],
                "rule" : [{
                  "name" : "MapOpEntry",
                  "source" : [{
                    "context" : "opEntry",
                    "element" : "resource",
                    "variable" : "opProc"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Operation",
                    "variable" : "op"
                  }],
                  "rule" : [{
                    "name" : "SetOpDatum",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "performed",
                      "variable" : "perf",
                      "condition" : "$this.is(dateTime)"
                    }],
                    "target" : [{
                      "context" : "op",
                      "contextType" : "variable",
                      "element" : "OP_Datum",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "perf"
                      }]
                    }]
                  },
                  {
                    "name" : "MapOPS",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "code",
                      "variable" : "opCode"
                    }],
                    "rule" : [{
                      "name" : "MapOPSCoding",
                      "source" : [{
                        "context" : "opCode",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
                      }],
                      "rule" : [{
                        "name" : "SetOPS",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "op",
                          "contextType" : "variable",
                          "element" : "OPS",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapOpIntExt",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention'"
                    }],
                    "rule" : [{
                      "name" : "MapOpIntVal",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "rule" : [{
                        "name" : "MapOpIntCoding",
                        "source" : [{
                          "context" : "v",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetOpIntention",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "op",
                            "contextType" : "variable",
                            "element" : "OP_Intention",
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
                    "name" : "MapUsedCodeMark",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "usedCode",
                      "variable" : "uc"
                    }],
                    "rule" : [{
                      "name" : "MapPraeopMarkCoding",
                      "source" : [{
                        "context" : "uc",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system.contains('praeoperative-markierung')"
                      }],
                      "rule" : [{
                        "name" : "SetPraeopMark",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "op",
                          "contextType" : "variable",
                          "element" : "PraeopMarkierung",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "usedCode: PraeoperativeMarkierung (M/S/T/N) - MII Mamma-Op"
                  },
                  {
                    "name" : "MapOpKompl",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "complication",
                      "variable" : "compl"
                    }],
                    "rule" : [{
                      "name" : "MapOpKomplCoding",
                      "source" : [{
                        "context" : "compl",
                        "element" : "coding",
                        "variable" : "c",
                        "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-operation-komplikation'"
                      }],
                      "rule" : [{
                        "name" : "SetOpKomplArt",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "op",
                          "contextType" : "variable",
                          "element" : "OP_Komplikationen_Art",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Komplikationen: bei Vorhandensein der complication-Liste"
                  },
                  {
                    "name" : "MapPerformer",
                    "source" : [{
                      "context" : "opProc",
                      "element" : "performer",
                      "variable" : "perfp"
                    }],
                    "rule" : [{
                      "name" : "MapPerfFn",
                      "source" : [{
                        "context" : "perfp",
                        "element" : "function",
                        "variable" : "fn"
                      }],
                      "rule" : [{
                        "name" : "MapErstFn",
                        "source" : [{
                          "context" : "fn",
                          "element" : "coding",
                          "variable" : "c",
                          "condition" : "code = '304292004'"
                        }],
                        "rule" : [{
                          "name" : "MapErstActor",
                          "source" : [{
                            "context" : "perfp",
                            "element" : "actor",
                            "variable" : "act"
                          }],
                          "rule" : [{
                            "name" : "SetErstOp",
                            "source" : [{
                              "context" : "act",
                              "element" : "reference",
                              "variable" : "ref"
                            }],
                            "target" : [{
                              "context" : "op",
                              "contextType" : "variable",
                              "element" : "Erstoperateur",
                              "transform" : "copy",
                              "parameter" : [{
                                "valueId" : "ref"
                              }]
                            }]
                          }]
                        }]
                      },
                      {
                        "name" : "MapZweitFn",
                        "source" : [{
                          "context" : "fn",
                          "element" : "coding",
                          "variable" : "c",
                          "condition" : "code = '309388001'"
                        }],
                        "rule" : [{
                          "name" : "MapZweitActor",
                          "source" : [{
                            "context" : "perfp",
                            "element" : "actor",
                            "variable" : "act"
                          }],
                          "rule" : [{
                            "name" : "SetZweitOp",
                            "source" : [{
                              "context" : "act",
                              "element" : "reference",
                              "variable" : "ref"
                            }],
                            "target" : [{
                              "context" : "op",
                              "contextType" : "variable",
                              "element" : "Zweitoperateur",
                              "transform" : "copy",
                              "parameter" : [{
                                "valueId" : "ref"
                              }]
                            }]
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Operateure (G08 = Erstoperateur, G09 = Zweitoperateur)"
                  }]
                }],
                "documentation" : "-- Operation[] aus Procedure (Senologie_Operation) --"
              },
              {
                "name" : "EntryRT",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "rtEntry",
                  "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-strahlentherapie') or $this.contains('strahlentherapie'))"
                }],
                "rule" : [{
                  "name" : "MapRTEntry",
                  "source" : [{
                    "context" : "rtEntry",
                    "element" : "resource",
                    "variable" : "rtProc"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Strahlentherapie",
                    "variable" : "rt"
                  }],
                  "rule" : [{
                    "name" : "MapRTPeriod",
                    "source" : [{
                      "context" : "rtProc",
                      "element" : "performed",
                      "variable" : "perf",
                      "condition" : "$this.is(Period)"
                    }],
                    "rule" : [{
                      "name" : "SetRTBeginn",
                      "source" : [{
                        "context" : "perf",
                        "element" : "start",
                        "variable" : "st"
                      }],
                      "target" : [{
                        "context" : "rt",
                        "contextType" : "variable",
                        "element" : "Strahlentherapie_Beginn",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "st"
                        }]
                      }]
                    },
                    {
                      "name" : "SetRTEnde",
                      "source" : [{
                        "context" : "perf",
                        "element" : "end",
                        "variable" : "en"
                      }],
                      "target" : [{
                        "context" : "rt",
                        "contextType" : "variable",
                        "element" : "Strahlentherapie_Ende",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "en"
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapRTIntExt",
                    "source" : [{
                      "context" : "rtProc",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention'"
                    }],
                    "rule" : [{
                      "name" : "MapRTIntVal",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "rule" : [{
                        "name" : "MapRTIntCoding",
                        "source" : [{
                          "context" : "v",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetRTInt",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "rt",
                            "contextType" : "variable",
                            "element" : "Strahlentherapie_Intention",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueId" : "cd"
                            }]
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Intention"
                  },
                  {
                    "name" : "MapRTBoost",
                    "source" : [{
                      "context" : "rtProc",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url.contains('strahlentherapie-bestrahlung-boost')"
                    }],
                    "rule" : [{
                      "name" : "SetRTBoost",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "target" : [{
                        "context" : "rt",
                        "contextType" : "variable",
                        "element" : "Strahlentherapie_Boost",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "v"
                        }]
                      }]
                    }],
                    "documentation" : "Boost (extension)"
                  },
                  {
                    "name" : "MapRTGesamtdosis",
                    "source" : [{
                      "context" : "rtProc",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url.contains('strahlentherapie-bestrahlung-gesamtdosis')"
                    }],
                    "rule" : [{
                      "name" : "MapRTGesamtdosisVal",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "rule" : [{
                        "name" : "SetRTGesamtdosis",
                        "source" : [{
                          "context" : "v",
                          "element" : "value",
                          "variable" : "vv"
                        }],
                        "target" : [{
                          "context" : "rt",
                          "contextType" : "variable",
                          "element" : "Strahlentherapie_Gesamtdosis",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "vv"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Gesamtdosis (extension)"
                  },
                  {
                    "name" : "MapRTZielgeb",
                    "source" : [{
                      "context" : "rtProc",
                      "element" : "bodySite",
                      "variable" : "bs"
                    }],
                    "rule" : [{
                      "name" : "MapRTZielgebCoding",
                      "source" : [{
                        "context" : "bs",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetRTZielgeb",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "rt",
                          "contextType" : "variable",
                          "element" : "Strahlentherapie_Zielgebiet",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Zielgebiet (bodySite)"
                  }]
                }],
                "documentation" : "-- Strahlentherapie[] aus Procedure --"
              },
              {
                "name" : "EntryST",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "stEntry",
                  "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie'))"
                }],
                "rule" : [{
                  "name" : "MapSTEntry",
                  "source" : [{
                    "context" : "stEntry",
                    "element" : "resource",
                    "variable" : "stProc"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Systemtherapie",
                    "variable" : "syst"
                  }],
                  "rule" : [{
                    "name" : "MapSTPeriod",
                    "source" : [{
                      "context" : "stProc",
                      "element" : "performed",
                      "variable" : "perf",
                      "condition" : "$this.is(Period)"
                    }],
                    "rule" : [{
                      "name" : "SetSTBeginn",
                      "source" : [{
                        "context" : "perf",
                        "element" : "start",
                        "variable" : "st"
                      }],
                      "target" : [{
                        "context" : "syst",
                        "contextType" : "variable",
                        "element" : "Systemtherapie_Beginn",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "st"
                        }]
                      }]
                    },
                    {
                      "name" : "SetSTEnde",
                      "source" : [{
                        "context" : "perf",
                        "element" : "end",
                        "variable" : "en"
                      }],
                      "target" : [{
                        "context" : "syst",
                        "contextType" : "variable",
                        "element" : "Systemtherapie_Ende",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueId" : "en"
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapSTIntExt",
                    "source" : [{
                      "context" : "stProc",
                      "element" : "extension",
                      "variable" : "ext",
                      "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention'"
                    }],
                    "rule" : [{
                      "name" : "MapSTIntVal",
                      "source" : [{
                        "context" : "ext",
                        "element" : "value",
                        "variable" : "v"
                      }],
                      "rule" : [{
                        "name" : "MapSTIntCoding",
                        "source" : [{
                          "context" : "v",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetSTInt",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "syst",
                            "contextType" : "variable",
                            "element" : "Systemtherapie_Intention",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueId" : "cd"
                            }]
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Intention"
                  },
                  {
                    "name" : "MapSTArt",
                    "source" : [{
                      "context" : "stProc",
                      "element" : "category",
                      "variable" : "cat"
                    }],
                    "rule" : [{
                      "name" : "MapSTArtCoding",
                      "source" : [{
                        "context" : "cat",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetSTArt",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "syst",
                          "contextType" : "variable",
                          "element" : "Systemtherapie_Therapieart",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Therapieart aus category"
                  }]
                }],
                "documentation" : "-- Systemtherapie[] aus Procedure --"
              },
              {
                "name" : "EntryFU",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "fuEntry",
                  "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-follow-up'))"
                }],
                "rule" : [{
                  "name" : "MapFUEntry",
                  "source" : [{
                    "context" : "fuEntry",
                    "element" : "resource",
                    "variable" : "fuObs"
                  }],
                  "target" : [{
                    "context" : "f",
                    "contextType" : "variable",
                    "element" : "Follow_Up",
                    "variable" : "fu"
                  }],
                  "rule" : [{
                    "name" : "SetFUDatum",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "effective",
                      "variable" : "eff",
                      "condition" : "$this.is(dateTime)"
                    }],
                    "target" : [{
                      "context" : "fu",
                      "contextType" : "variable",
                      "element" : "Untersuchungsdatum_Verlauf",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "eff"
                      }]
                    }]
                  },
                  {
                    "name" : "SetFUMeldedatum",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "issued",
                      "variable" : "iss"
                    }],
                    "target" : [{
                      "context" : "fu",
                      "contextType" : "variable",
                      "element" : "Meldedatum",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueId" : "iss"
                      }]
                    }]
                  },
                  {
                    "name" : "MapFUValue",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "value",
                      "variable" : "val"
                    }],
                    "rule" : [{
                      "name" : "MapFUGesamtCoding",
                      "source" : [{
                        "context" : "val",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetFUGesamt",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd"
                        }],
                        "target" : [{
                          "context" : "fu",
                          "contextType" : "variable",
                          "element" : "Gesamtbeurteilung_Tumorstatus",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueId" : "cd"
                          }]
                        }]
                      }]
                    }]
                  },
                  {
                    "name" : "MapFUMeth",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "method",
                      "variable" : "m"
                    }],
                    "rule" : [{
                      "name" : "MapFUMethCoding",
                      "source" : [{
                        "context" : "m",
                        "element" : "coding",
                        "variable" : "c"
                      }],
                      "rule" : [{
                        "name" : "SetFUAktiv",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd",
                          "condition" : "$this = 'A'"
                        }],
                        "target" : [{
                          "context" : "fu",
                          "contextType" : "variable",
                          "element" : "Follow_Up_Aktiv_Passiv",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueString" : "A"
                          }]
                        }]
                      },
                      {
                        "name" : "SetFUPassiv",
                        "source" : [{
                          "context" : "c",
                          "element" : "code",
                          "variable" : "cd",
                          "condition" : "$this = 'P'"
                        }],
                        "target" : [{
                          "context" : "fu",
                          "contextType" : "variable",
                          "element" : "Follow_Up_Aktiv_Passiv",
                          "transform" : "copy",
                          "parameter" : [{
                            "valueString" : "P"
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Aktive vs. passive Nachsorge aus method"
                  },
                  {
                    "name" : "FULokTu",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = '21976-6')"
                    }],
                    "rule" : [{
                      "name" : "MapFULokTuVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapFULokTuCoding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetFULokTu",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "fu",
                            "contextType" : "variable",
                            "element" : "Verlauf_Lokaler_Tumorstatus",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueId" : "cd"
                            }]
                          }]
                        }]
                      }]
                    }],
                    "documentation" : "Lokaler / LK / FM Tumorstatus aus components"
                  },
                  {
                    "name" : "FULKTu",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = '21977-4')"
                    }],
                    "rule" : [{
                      "name" : "MapFULKTuVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapFULKTuCoding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetFULKTu",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "fu",
                            "contextType" : "variable",
                            "element" : "Verlauf_Tumorstatus_Lymphknoten",
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
                    "name" : "FUFMTu",
                    "source" : [{
                      "context" : "fuObs",
                      "element" : "component",
                      "variable" : "comp",
                      "condition" : "code.coding.exists(code = '21978-2')"
                    }],
                    "rule" : [{
                      "name" : "MapFUFMTuVal",
                      "source" : [{
                        "context" : "comp",
                        "element" : "value",
                        "variable" : "val"
                      }],
                      "rule" : [{
                        "name" : "MapFUFMTuCoding",
                        "source" : [{
                          "context" : "val",
                          "element" : "coding",
                          "variable" : "c"
                        }],
                        "rule" : [{
                          "name" : "SetFUFMTu",
                          "source" : [{
                            "context" : "c",
                            "element" : "code",
                            "variable" : "cd"
                          }],
                          "target" : [{
                            "context" : "fu",
                            "contextType" : "variable",
                            "element" : "Verlauf_Tumorstatus_Fernmetastasen",
                            "transform" : "copy",
                            "parameter" : [{
                              "valueId" : "cd"
                            }]
                          }]
                        }]
                      }]
                    }]
                  }]
                }],
                "documentation" : "-- Begleitmedikation / CHT-Substanzen aus MedicationAdministration --\r\nOncoBox 2.0 hat CHT_Substanzen / HO_Substanzen / IM_Substanzen / Zielgerichtete_Substanzen\r\nAktuell vereinfacht: jede Substanz wandert in CHT_Substanzen\r\nTODO: Klassifikation nach Substanz-Typ (ATC-Gruppe) fuer korrekte Zuordnung\r\nsrc.entry as medEntry where resource.is(MedicationAdministration) ...\r\n-- Follow_Up[] aus Verlauf-Observation --"
              }]
            }],
            "documentation" : "--- Fall: pro Condition (Brust-Diagnose) ein Fall-Block ---"
          }]
        }]
      }],
      "documentation" : "=== Patienten-Container ==="
    }]
  }]
}

```
