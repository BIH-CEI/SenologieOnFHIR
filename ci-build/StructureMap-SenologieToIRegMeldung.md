# SenologieToIRegMeldung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegMeldung**

## StructureMap: SenologieToIRegMeldung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIRegMeldung |

 
title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegMeldung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung",
  "version" : "0.1.0",
  "name" : "SenologieToIRegMeldung",
  "status" : "draft",
  "date" : "2026-05-04T13:47:49+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator)\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Device",
    "mode" : "source",
    "alias" : "Device"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
    "mode" : "target",
    "alias" : "IRegMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToIRegPatient",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIRegOperation",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung"],
  "group" : [{
    "name" : "SenologieToIRegMeldung",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapMeldungskopf, MapFall) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nspecific Logical Model sub-path when a parent group passes a BackboneElement\r\nslice. The IG Publisher resolves target paths against BackboneElement,\r\nproducing ~20 SM_TARGET_PATH / SM_SOURCE_PATH errors. The element names are\r\ncorrect and match the IRegG Brustimplantat Logical Model. These errors are\r\ncosmetic.\r\n============================================================================\r\nMaster Orchestrator: Bundle -> IRegG Brustimplantat-Meldung\r\nEmpfaengt ein FHIR Bundle mit Senologie-Ressourcen (Patient, Procedure,\r\nDevice, Encounter, Condition, Observations) und erzeugt eine vollstaendige\r\nIRegG-Meldung fuer Brustimplantate.\r\nIm Gegensatz zur oBDS-Transformation (mehrere Meldungen pro Bundle)\r\nerzeugt die IRegG-Meldung eine einzelne GEMeldung pro Behandlungsfall.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "IRegMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallMapMeldungskopf",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldung",
        "variable" : "mel"
      }],
      "dependent" : [{
        "name" : "MapMeldungskopf",
        "variable" : ["src", "mel"]
      }]
    },
    {
      "name" : "EntryEncounter",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Encounter)"
      }],
      "rule" : [{
        "name" : "CallMapFall",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "encounter"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fall",
          "variable" : "fall"
        }],
        "dependent" : [{
          "name" : "MapFall",
          "variable" : ["encounter", "fall"]
        }]
      },
      {
        "name" : "EntryAusloeser",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "auslEntry",
          "condition" : "resource.is(Procedure)"
        }],
        "rule" : [{
          "name" : "AusloeserProcContext",
          "source" : [{
            "context" : "auslEntry",
            "element" : "resource",
            "variable" : "procedure"
          }],
          "rule" : [{
            "name" : "MapAusloeserCode",
            "source" : [{
              "context" : "procedure",
              "element" : "code",
              "variable" : "code"
            }],
            "rule" : [{
              "name" : "MapAusloeserCoding",
              "source" : [{
                "context" : "code",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
              }],
              "target" : [{
                "context" : "fall",
                "contextType" : "variable",
                "element" : "ausloeser",
                "variable" : "ausl"
              }],
              "rule" : [{
                "name" : "SetAusloeserOPS",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "ausl",
                  "contextType" : "variable",
                  "element" : "prozedurenSchluessel",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "cd"
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "EntryPatient",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "patEntry",
          "condition" : "resource.is(Patient)"
        }],
        "rule" : [{
          "name" : "CallMapPatientenaufnahme",
          "source" : [{
            "context" : "patEntry",
            "element" : "resource",
            "variable" : "patient"
          }],
          "target" : [{
            "context" : "fall",
            "contextType" : "variable",
            "element" : "patientenaufnahme",
            "variable" : "pat"
          }],
          "dependent" : [{
            "name" : "MapPatientenaufnahme",
            "variable" : ["patient", "pat"]
          }]
        },
        {
          "name" : "EntryGroesse",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "ghEntry",
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '8302-2')"
          }],
          "rule" : [{
            "name" : "GroesseObsContext",
            "source" : [{
              "context" : "ghEntry",
              "element" : "resource",
              "variable" : "obs"
            }],
            "rule" : [{
              "name" : "MapGroesseValue",
              "source" : [{
                "context" : "obs",
                "element" : "value",
                "variable" : "val"
              }],
              "rule" : [{
                "name" : "SetGroesse",
                "source" : [{
                  "context" : "val",
                  "element" : "value",
                  "variable" : "v"
                }],
                "target" : [{
                  "context" : "pat",
                  "contextType" : "variable",
                  "element" : "groesse",
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
          "name" : "EntryGewicht",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "gwEntry",
            "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '29463-7')"
          }],
          "rule" : [{
            "name" : "GewichtObsContext",
            "source" : [{
              "context" : "gwEntry",
              "element" : "resource",
              "variable" : "obs"
            }],
            "rule" : [{
              "name" : "MapGewichtValue",
              "source" : [{
                "context" : "obs",
                "element" : "value",
                "variable" : "val"
              }],
              "rule" : [{
                "name" : "SetGewicht",
                "source" : [{
                  "context" : "val",
                  "element" : "value",
                  "variable" : "v"
                }],
                "target" : [{
                  "context" : "pat",
                  "contextType" : "variable",
                  "element" : "gewicht",
                  "transform" : "truncate",
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
        "name" : "EntryOperation",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "opEntry",
          "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
        }],
        "rule" : [{
          "name" : "CallMapOperation",
          "source" : [{
            "context" : "opEntry",
            "element" : "resource",
            "variable" : "procedure"
          }],
          "target" : [{
            "context" : "fall",
            "contextType" : "variable",
            "element" : "operation",
            "variable" : "op"
          }],
          "dependent" : [{
            "name" : "MapOperation",
            "variable" : ["procedure", "op"]
          }]
        },
        {
          "name" : "DeviceLookupContext",
          "source" : [{
            "context" : "opEntry",
            "element" : "resource",
            "variable" : "procedure"
          }],
          "rule" : [{
            "name" : "MapFocalDevice",
            "source" : [{
              "context" : "procedure",
              "element" : "focalDevice",
              "variable" : "fd"
            }],
            "rule" : [{
              "name" : "MapDeviceRef",
              "source" : [{
                "context" : "fd",
                "element" : "manipulated",
                "variable" : "ref"
              }],
              "rule" : [{
                "name" : "ResolveDeviceRef",
                "source" : [{
                  "context" : "src",
                  "element" : "entry",
                  "variable" : "devEntry",
                  "condition" : "resource.is(Device) and (fullUrl = (%ref.reference))"
                }],
                "rule" : [{
                  "name" : "CallMapArtikel",
                  "source" : [{
                    "context" : "devEntry",
                    "element" : "resource",
                    "variable" : "device"
                  }],
                  "target" : [{
                    "context" : "op",
                    "contextType" : "variable",
                    "element" : "artikelidentifikation",
                    "variable" : "art"
                  }],
                  "dependent" : [{
                    "name" : "MapArtikelidentifikation",
                    "variable" : ["device", "art"]
                  }]
                }]
              }]
            }]
          },
          {
            "name" : "FallbackDevice",
            "source" : [{
              "context" : "procedure",
              "condition" : "focalDevice.exists().not()"
            }],
            "rule" : [{
              "name" : "EntryDeviceFallback",
              "source" : [{
                "context" : "src",
                "element" : "entry",
                "variable" : "devEntry",
                "condition" : "resource.is(Device) and resource.meta.profile.exists($this.contains('senologie-implantat'))"
              }],
              "rule" : [{
                "name" : "CallMapArtikelFallback",
                "source" : [{
                  "context" : "devEntry",
                  "element" : "resource",
                  "variable" : "device"
                }],
                "target" : [{
                  "context" : "op",
                  "contextType" : "variable",
                  "element" : "artikelidentifikation",
                  "variable" : "art"
                }],
                "dependent" : [{
                  "name" : "MapArtikelidentifikation",
                  "variable" : ["device", "art"]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "EntryZubehoer",
          "source" : [{
            "context" : "src",
            "element" : "entry",
            "variable" : "zubEntry",
            "condition" : "resource.is(Device) and resource.meta.profile.exists($this.contains('ireg-zubehoer') or $this.contains('senologie-zubehoer'))"
          }],
          "rule" : [{
            "name" : "CallMapZubehoer",
            "source" : [{
              "context" : "zubEntry",
              "element" : "resource",
              "variable" : "device"
            }],
            "target" : [{
              "context" : "op",
              "contextType" : "variable",
              "element" : "zubehoer",
              "variable" : "zub"
            }],
            "dependent" : [{
              "name" : "MapZubehoer",
              "variable" : ["device", "zub"]
            }]
          }]
        }]
      },
      {
        "name" : "CallMapEntlassung",
        "source" : [{
          "context" : "encounter"
        }],
        "target" : [{
          "context" : "fall",
          "contextType" : "variable",
          "element" : "entlassung",
          "variable" : "entl"
        }],
        "dependent" : [{
          "name" : "MapEntlassung",
          "variable" : ["encounter", "entl"]
        }]
      },
      {
        "name" : "EntryDbiCondition",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "dbiEntry",
          "condition" : "resource.is(Condition)"
        }],
        "rule" : [{
          "name" : "DbiConditionContext",
          "source" : [{
            "context" : "dbiEntry",
            "element" : "resource",
            "variable" : "condition"
          }],
          "rule" : [{
            "name" : "MapDbiCode",
            "source" : [{
              "context" : "condition",
              "element" : "code",
              "variable" : "code"
            }],
            "rule" : [{
              "name" : "WrapDbiEntl",
              "source" : [{
                "context" : "code",
                "element" : "coding",
                "variable" : "c",
                "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
              }],
              "target" : [{
                "context" : "fall",
                "contextType" : "variable",
                "element" : "entlassung",
                "variable" : "entl"
              }],
              "rule" : [{
                "name" : "MapDbiIcd",
                "source" : [{
                  "context" : "c"
                }],
                "target" : [{
                  "context" : "entl",
                  "contextType" : "variable",
                  "element" : "diagnoseBrustimplantat",
                  "variable" : "dbi"
                }],
                "rule" : [{
                  "name" : "SetDbiIcdCode",
                  "source" : [{
                    "context" : "c",
                    "element" : "code",
                    "variable" : "cd"
                  }],
                  "target" : [{
                    "context" : "dbi",
                    "contextType" : "variable",
                    "element" : "icdSchluessel",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueId" : "cd"
                    }]
                  }]
                },
                {
                  "name" : "MapDbiSeite",
                  "source" : [{
                    "context" : "condition",
                    "element" : "bodySite",
                    "variable" : "bs"
                  }],
                  "rule" : [{
                    "name" : "MapDbiSeiteSCT",
                    "source" : [{
                      "context" : "bs",
                      "element" : "coding",
                      "variable" : "bsc",
                      "condition" : "system = 'http://snomed.info/sct'"
                    }],
                    "rule" : [{
                      "name" : "AppendSeiteRechts",
                      "source" : [{
                        "context" : "bsc",
                        "element" : "code",
                        "variable" : "bscd",
                        "condition" : "$this = '24028007'"
                      }],
                      "target" : [{
                        "context" : "dbi",
                        "contextType" : "variable",
                        "element" : "icdSchluessel",
                        "transform" : "append",
                        "parameter" : [{
                          "valueId" : "cd"
                        },
                        {
                          "valueString" : ":R"
                        }]
                      }]
                    },
                    {
                      "name" : "AppendSeiteLinks",
                      "source" : [{
                        "context" : "bsc",
                        "element" : "code",
                        "variable" : "bscd",
                        "condition" : "$this = '7771000'"
                      }],
                      "target" : [{
                        "context" : "dbi",
                        "contextType" : "variable",
                        "element" : "icdSchluessel",
                        "transform" : "append",
                        "parameter" : [{
                          "valueId" : "cd"
                        },
                        {
                          "valueString" : ":L"
                        }]
                      }]
                    },
                    {
                      "name" : "AppendSeiteBeidseits",
                      "source" : [{
                        "context" : "bsc",
                        "element" : "code",
                        "variable" : "bscd",
                        "condition" : "$this = '51440002'"
                      }],
                      "target" : [{
                        "context" : "dbi",
                        "contextType" : "variable",
                        "element" : "icdSchluessel",
                        "transform" : "append",
                        "parameter" : [{
                          "valueId" : "cd"
                        },
                        {
                          "valueString" : ":B"
                        }]
                      }]
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
    "name" : "MapMeldungskopf",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMeldungskopf: Bundle -> meldung (MEL_*)\r\nEinrichtungskennung, Softwareinfo aus Organization und Bundle-Metadaten\r\n============================================================================",
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
      "name" : "EntryOrganization",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Organization)"
      }],
      "rule" : [{
        "name" : "OrgContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "org"
        }],
        "rule" : [{
          "name" : "FilterIrdId",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'http://fhir.de/sid/ird/ge-kennung'"
          }],
          "rule" : [{
            "name" : "SetIdEinrichtung",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "idEinrichtung",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterBsnr",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://fhir.de/sid/arge-ik/iknr'"
          }],
          "rule" : [{
            "name" : "SetBsnr",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "bsnr",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetSpezVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "irdSpezVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "4.1.1"
        }]
      }]
    },
    {
      "name" : "SetSwName",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swName",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Senologie-KDS FHIR IG"
        }]
      }]
    },
    {
      "name" : "SetSwHersteller",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swHersteller",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "BIH at Charite"
        }]
      }]
    },
    {
      "name" : "SetSwVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0.1.0"
        }]
      }]
    }]
  },
  {
    "name" : "MapFall",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nFall: Encounter -> fall (FAL_*)\r\nAufnahmedatum, Art des Aufenthalts, Transfernummer\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Encounter",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapAufnahmedatum",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetAufnahmedatum",
        "source" : [{
          "context" : "period",
          "element" : "start",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "aufnahmedatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "MapArtAufenthalt",
      "source" : [{
        "context" : "src",
        "element" : "class",
        "variable" : "cls"
      }],
      "rule" : [{
        "name" : "SetAufenthaltStationaer",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'IMP'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      },
      {
        "name" : "SetAufenthaltTeilstationaer",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'SS'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "2"
          }]
        }]
      },
      {
        "name" : "SetAufenthaltAmbulant",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'AMB'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "3"
          }]
        }]
      }]
    },
    {
      "name" : "MapTransfernummer",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system = 'http://fhir.de/sid/ird/transfernummer'"
      }],
      "rule" : [{
        "name" : "SetTransfernummer",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "transfernummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetSatzErstellung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datumZeitSatzErstellung",
        "transform" : "evaluate",
        "parameter" : [{
          "valueId" : "src"
        },
        {
          "valueString" : "now()"
        }]
      }]
    },
    {
      "name" : "MapVersionsnummer",
      "source" : [{
        "context" : "src",
        "element" : "meta",
        "variable" : "meta"
      }],
      "rule" : [{
        "name" : "SetVersionsnummer",
        "source" : [{
          "context" : "meta",
          "element" : "versionId",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "versionsnummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "CallMapEntlassung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "entlassung",
        "variable" : "entl"
      }],
      "dependent" : [{
        "name" : "MapEntlassung",
        "variable" : ["src", "entl"]
      }]
    }]
  }]
}

```
