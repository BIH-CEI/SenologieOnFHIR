# SenologieToIRegOperation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegOperation**

## StructureMap: SenologieToIRegOperation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIRegOperation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIRegOperation |

 
title: Senologie Procedure + Device to IRegG Operation + Artikelidentifikation status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegOperation",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegOperation",
  "version" : "0.1.0",
  "name" : "SenologieToIRegOperation",
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
  "description" : "title: Senologie Procedure + Device to IRegG Operation + Artikelidentifikation\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Device",
    "mode" : "source",
    "alias" : "Device"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
    "mode" : "target",
    "alias" : "IRegMeldung"
  }],
  "group" : [{
    "name" : "MapOperation",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the IRegG Brustimplantat LM.\r\n============================================================================\r\nOperation: Procedure -> OPE_* + OBI_*\r\nBildet eine Senologie_Operation (Procedure) auf die IRegG-Operationsstruktur\r\nab. Umfasst Basisdaten (Datum, Seitenlokalisation, ASA, Implantattyp) sowie\r\nbrustimplantat-spezifische Angaben (Art des Eingriffs, Grund, Lage, Zugang).\r\nDie Artikelidentifikation (Device -> ARI_* + ARB_* + ABI_*) wird ueber\r\nProcedure.focalDevice.manipulated oder Device-Referenzen im Bundle aufgeloest.\r\n============================================================================",
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
      "name" : "MapOpLaufendeNummer",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetOpLaufendeNummer",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "laufendeNummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetOpLaufendeNummerDefault",
      "source" : [{
        "context" : "src",
        "condition" : "identifier.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "laufendeNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
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
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "perf"
        }]
      }]
    },
    {
      "name" : "MapSeitenLokalisation",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapSeiteSCT",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetSeiteRechts",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '24028007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenLokalisationSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetSeiteLinks",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '7771000'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenLokalisationSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetSeiteBeidseits",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '51440002'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenLokalisationSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapAsaKlassifikation",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-asa-klassifikation'"
      }],
      "rule" : [{
        "name" : "MapAsaValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapAsaCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetAsaCode",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "asaSchluessel",
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
      "name" : "SetImplantattypBrust",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "implantattypSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "3"
        }]
      }]
    },
    {
      "name" : "CallMapOBI",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "operationBrustimplantat",
        "variable" : "obi"
      }],
      "dependent" : [{
        "name" : "MapOperationBrustimplantat",
        "variable" : ["src", "obi"]
      }]
    },
    {
      "name" : "MapFocalDevice",
      "source" : [{
        "context" : "src",
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
            "context" : "bundle",
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
              "context" : "tgt",
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
        "context" : "src",
        "condition" : "focalDevice.exists().not()"
      }],
      "rule" : [{
        "name" : "EntryDeviceFallback",
        "source" : [{
          "context" : "bundle",
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
            "context" : "tgt",
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
    },
    {
      "name" : "EntryZubehoer",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Device) and resource.meta.profile.exists($this.contains('ireg-zubehoer') or $this.contains('senologie-zubehoer'))"
      }],
      "rule" : [{
        "name" : "CallMapZubehoer",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "device"
        }],
        "target" : [{
          "context" : "tgt",
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
    "name" : "MapOperationBrustimplantat",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nBrustimplantat-spezifische Operationsdaten: Procedure -> OBI_*\r\nArt des Eingriffs, Grund, Lage, Zugang, Vorbehandlung, Massnahmen\r\n============================================================================",
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
      "name" : "MapArtEingriff",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "MapArtEingriffCoding",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/ireg-art-eingriff'"
        }],
        "rule" : [{
          "name" : "SetArtEingriffDirect",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "artEingriffSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapGrundPrimaerEingriff",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-grund-primaereingriff'"
      }],
      "rule" : [{
        "name" : "MapGrundPrimaerValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapGrundPrimaerCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetGrundPrimaer",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "grundPrimaerEingriffSchluessel",
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
      "name" : "MapGrundAustausch",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-grund-austausch'"
      }],
      "rule" : [{
        "name" : "MapGrundAustauschValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapGrundAustauschCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetGrundAustausch",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "grundAustauschSchluessel",
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
      "name" : "MapGrundRevisionExplantation",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-grund-revision-explantation'"
      }],
      "rule" : [{
        "name" : "MapGrundExplValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapGrundExplCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetGrundExplantation",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "grundRevisionExplantationSchluessel",
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
      "name" : "MapLage",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-lage-implantat'"
      }],
      "rule" : [{
        "name" : "MapLageValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapLageCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetLage",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "lageSchluessel",
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
      "name" : "MapZugang",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-zugang'"
      }],
      "rule" : [{
        "name" : "MapZugangValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapZugangCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetZugang",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zugangSchluessel",
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
      "name" : "MapEntfernungAdmNetz",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-entfernung-adm-netz'"
      }],
      "rule" : [{
        "name" : "MapEntfernungAdmValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapEntfernungAdmCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetEntfernungAdm",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "entfernungAdmNetzSchluessel",
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
      "name" : "MapVerfahrenswechsel",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-verfahrenswechsel'"
      }],
      "rule" : [{
        "name" : "MapVerfahrenValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapVerfahrenCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetVerfahrenswechsel",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "verfahrenswechselSchluessel",
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
      "name" : "MapVorbehandlungen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-vorbehandlung-bi'"
      }],
      "rule" : [{
        "name" : "CallMapVorbehandlung",
        "source" : [{
          "context" : "ext"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "vorbehandlung",
          "variable" : "vorb"
        }],
        "dependent" : [{
          "name" : "MapVorbehandlung",
          "variable" : ["ext", "vorb"]
        }]
      }]
    },
    {
      "name" : "MapMassnahmen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-massnahme-bi'"
      }],
      "rule" : [{
        "name" : "MapMassnahmeValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapMassnahmeCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetMassnahme",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "massnahme",
              "variable" : "mass"
            },
            {
              "context" : "mass",
              "contextType" : "variable",
              "element" : "massnahmeSchluessel",
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
      "name" : "MapOperationsdetails",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-operationsdetail-bi'"
      }],
      "rule" : [{
        "name" : "CallMapOpDetail",
        "source" : [{
          "context" : "ext"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "operationsdetail",
          "variable" : "opd"
        }],
        "dependent" : [{
          "name" : "MapOperationsdetail",
          "variable" : ["ext", "opd"]
        }]
      }]
    },
    {
      "name" : "MapBefunde",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-befund-bi'"
      }],
      "rule" : [{
        "name" : "CallMapBefund",
        "source" : [{
          "context" : "ext"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "befund",
          "variable" : "bef"
        }],
        "dependent" : [{
          "name" : "MapBefund",
          "variable" : ["ext", "bef"]
        }]
      }]
    },
    {
      "name" : "MapProzedurenSchluessel",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapPbiCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "prozedurenSchluessel",
          "variable" : "pbi"
        }],
        "rule" : [{
          "name" : "SetPbiOps",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "pbi",
            "contextType" : "variable",
            "element" : "opsKode",
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
    "name" : "MapVorbehandlung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nVorbehandlung: Extension -> VBI_*\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapBehandlungLokal",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'behandlungLokal'"
      }],
      "rule" : [{
        "name" : "MapVorbehLokalValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapVorbehLokalCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetVorbehandlungLokal",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "behandlungLokalSchluessel",
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
      "name" : "MapBehandlungSystemisch",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'behandlungSystemisch'"
      }],
      "rule" : [{
        "name" : "MapVorbehSystValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapVorbehSystCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetVorbehandlungSystemisch",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "behandlungSystemischSchluessel",
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
    "name" : "MapOperationsdetail",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nOperationsdetail: Extension -> ODB_*\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapOpDetailPrimaerEingriff",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'primaereingriff'"
      }],
      "rule" : [{
        "name" : "MapOpDetailPrimaerValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapOpDetailPrimaerCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetOpDetailPrimaer",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "operationsdetailPrimaerEingriffSchluessel",
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
      "name" : "MapOpDetailAustausch",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'austausch'"
      }],
      "rule" : [{
        "name" : "MapOpDetailAustauschValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapOpDetailAustauschCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetOpDetailAustausch",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "operationsdetailAustauschSchluessel",
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
      "name" : "MapOpDetailRevision",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'revision'"
      }],
      "rule" : [{
        "name" : "MapOpDetailRevisionValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapOpDetailRevisionCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetOpDetailRevision",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "operationsdetailRevisionSchluessel",
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
    "name" : "MapBefund",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nBefund: Extension -> BEB_*\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "BackboneElement",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapBefundRevision",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'befund'"
      }],
      "rule" : [{
        "name" : "MapBefundValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapBefundCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetBefund",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "befundSchluessel",
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
      "name" : "MapBefundAustausch",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "inner",
        "condition" : "url = 'befundAustausch'"
      }],
      "rule" : [{
        "name" : "MapBefundAustauschValue",
        "source" : [{
          "context" : "inner",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapBefundAustauschCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetBefundAustausch",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "befundAustauschSchluessel",
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
    "name" : "MapArtikelidentifikation",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nArtikelidentifikation: Device -> ARI_* + ARB_* + ABI_*\r\nUDI, Hersteller, Seriennummer, LOT, Form, Oberflaeche, Fuellung, Volumen\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Device",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapAriLaufendeNummer",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetAriLaufendeNummer",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "laufendeNummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetAriLaufendeNummerDefault",
      "source" : [{
        "context" : "src",
        "condition" : "identifier.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "laufendeNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapUdiCarrier",
      "source" : [{
        "context" : "src",
        "element" : "udiCarrier",
        "variable" : "udi"
      }],
      "rule" : [{
        "name" : "SetArtikelkennzeichenUDI",
        "source" : [{
          "context" : "udi",
          "element" : "deviceIdentifier",
          "variable" : "di"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artikelkennzeichen",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "di"
          }]
        }]
      },
      {
        "name" : "SetKennzeichenTypUDI",
        "source" : [{
          "context" : "udi"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "kennzeichenTypSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      }]
    },
    {
      "name" : "MapArtikelkennzeichenFallback",
      "source" : [{
        "context" : "src",
        "condition" : "udiCarrier.exists().not()"
      }],
      "rule" : [{
        "name" : "SetArtikelkennzeichenREF",
        "source" : [{
          "context" : "src",
          "element" : "lotNumber",
          "variable" : "lot"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artikelkennzeichen",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "lot"
          }]
        }]
      },
      {
        "name" : "SetKennzeichenTypREF",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "kennzeichenTypSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "2"
          }]
        }]
      }]
    },
    {
      "name" : "SetArtikelArtImplantat",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "st",
        "condition" : "$this = 'active'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelArtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    },
    {
      "name" : "SetArtikelArtExplantat",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "st",
        "condition" : "$this = 'inactive'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelArtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "2"
        }]
      }]
    },
    {
      "name" : "CallMapArb",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelbeschreibung",
        "variable" : "arb"
      }],
      "dependent" : [{
        "name" : "MapArtikelbeschreibung",
        "variable" : ["src", "arb"]
      }]
    }]
  },
  {
    "name" : "MapArtikelbeschreibung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nArtikelbeschreibung: Device -> ARB_*\r\nLOT-Nummer, Seriennummer, Verfalldatum, Bezeichnung\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Device",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetLotNummer",
      "source" : [{
        "context" : "src",
        "element" : "lotNumber",
        "variable" : "lot"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lotNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "lot"
        }]
      }]
    },
    {
      "name" : "SetLotNummerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "lotNumber.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lotNummerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetSerienNummer",
      "source" : [{
        "context" : "src",
        "element" : "serialNumber",
        "variable" : "sn"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "serienNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "sn"
        }]
      }]
    },
    {
      "name" : "SetSerienNummerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "serialNumber.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "serienNummerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapDeviceName",
      "source" : [{
        "context" : "src",
        "element" : "deviceName",
        "variable" : "dn"
      }],
      "rule" : [{
        "name" : "SetArtikelbezeichnung",
        "source" : [{
          "context" : "dn",
          "element" : "name",
          "variable" : "n"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artikelbezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "n"
          }]
        }]
      }]
    },
    {
      "name" : "MapBarcode",
      "source" : [{
        "context" : "src",
        "element" : "udiCarrier",
        "variable" : "udi"
      }],
      "rule" : [{
        "name" : "SetBarcode",
        "source" : [{
          "context" : "udi",
          "element" : "carrierHRF",
          "variable" : "hrf"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "barcode",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "hrf"
          }]
        }]
      }]
    },
    {
      "name" : "CallMapAbi",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelBrustimplantat",
        "variable" : "abi"
      }],
      "dependent" : [{
        "name" : "MapArtikelBrustimplantat",
        "variable" : ["src", "abi"]
      }]
    }]
  },
  {
    "name" : "MapArtikelBrustimplantat",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nArtikelBrustimplantat: Device -> ABI_*\r\nHersteller, Artikeltyp, Form, Oberflaeche, Fuellung, Volumen\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Device",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetHerstellerSonstiger",
      "source" : [{
        "context" : "src",
        "element" : "manufacturer",
        "variable" : "mfr"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "herstellerSonstiger",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "mfr"
        }]
      }]
    },
    {
      "name" : "SetHerstellerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "manufacturer.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "herstellerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapArtikelTyp",
      "source" : [{
        "context" : "src",
        "element" : "type",
        "variable" : "t"
      }],
      "rule" : [{
        "name" : "MapArtikelTypCoding",
        "source" : [{
          "context" : "t",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/ireg-artikel-typ'"
        }],
        "rule" : [{
          "name" : "SetArtikelTypDirect",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "artikelTypSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetArtikelTypDefault",
      "source" : [{
        "context" : "src",
        "condition" : "type.coding.where(system = 'https://www.senologie.org/fhir/CodeSystem/ireg-artikel-typ').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelTypSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    },
    {
      "name" : "MapForm",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-form'"
      }],
      "rule" : [{
        "name" : "MapFormValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapFormCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetForm",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "formSchluessel",
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
      "name" : "SetFormUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-form').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "formUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapOberflaeche",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-oberflaeche'"
      }],
      "rule" : [{
        "name" : "MapOberflaecheValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapOberflaecheCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetOberflaeche",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "oberflaecheSchluessel",
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
      "name" : "SetOberflaecheUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-oberflaeche').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "oberflaecheUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapFuellung",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-fuellung'"
      }],
      "rule" : [{
        "name" : "MapFuellungValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapFuellungCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetFuellung",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "fuellungSchluessel",
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
      "name" : "SetFuellungUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-fuellung').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "fuellungUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapVolumen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-volumen'"
      }],
      "rule" : [{
        "name" : "SetVolumen",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "volumen",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "SetVolumenUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-volumen').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "volumenUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapIntraopVolumen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-implantat-intraop-volumen'"
      }],
      "rule" : [{
        "name" : "SetIntraopVolumen",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "intraoperativesVolumen",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapZubehoer",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nZubehoer: Device -> ZUB_* + ZBI_*\r\nADM/Netz-Zubehoer zum Brustimplantat-Eingriff\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Device",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapZubLaufendeNummer",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetZubLaufendeNummer",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "laufendeNummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetZubLaufendeNummerDefault",
      "source" : [{
        "context" : "src",
        "condition" : "identifier.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "laufendeNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetZubArtImplantat",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "st",
        "condition" : "$this = 'active'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "zubehoerArtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    },
    {
      "name" : "SetZubArtExplantat",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "st",
        "condition" : "$this = 'inactive'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "zubehoerArtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "2"
        }]
      }]
    },
    {
      "name" : "MapZubArtikelNummer",
      "source" : [{
        "context" : "src",
        "element" : "udiCarrier",
        "variable" : "udi"
      }],
      "rule" : [{
        "name" : "SetZubArtikelNummer",
        "source" : [{
          "context" : "udi",
          "element" : "deviceIdentifier",
          "variable" : "di"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artikelNummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "di"
          }]
        }]
      }]
    },
    {
      "name" : "SetZubArtikelNummerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "udiCarrier.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "artikelNummerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetZubLotNummer",
      "source" : [{
        "context" : "src",
        "element" : "lotNumber",
        "variable" : "lot"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lotNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "lot"
        }]
      }]
    },
    {
      "name" : "SetZubLotNummerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "lotNumber.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lotNummerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetZubSerienNummer",
      "source" : [{
        "context" : "src",
        "element" : "serialNumber",
        "variable" : "sn"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "serienNummer",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "sn"
        }]
      }]
    },
    {
      "name" : "SetZubSerienNummerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "serialNumber.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "serienNummerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapZubDeviceName",
      "source" : [{
        "context" : "src",
        "element" : "deviceName",
        "variable" : "dn"
      }],
      "rule" : [{
        "name" : "SetZubArtikelbezeichnung",
        "source" : [{
          "context" : "dn",
          "element" : "name",
          "variable" : "n"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artikelbezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "n"
          }]
        }]
      }]
    },
    {
      "name" : "CallMapZbi",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "zubehoerBrustimplantat",
        "variable" : "zbi"
      }],
      "dependent" : [{
        "name" : "MapZubehoerBrustimplantat",
        "variable" : ["src", "zbi"]
      }]
    }]
  },
  {
    "name" : "MapZubehoerBrustimplantat",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nZubehoerBrustimplantat: Device -> ZBI_*\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Device",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapZbiHersteller",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-zubehoer-hersteller'"
      }],
      "rule" : [{
        "name" : "MapZbiHerstellerValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapZbiHerstellerCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetZbiHersteller",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "herstellerSchluessel",
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
      "name" : "SetZbiHerstellerUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-zubehoer-hersteller').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "herstellerUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "SetZbiHerstellerSonstiger",
      "source" : [{
        "context" : "src",
        "element" : "manufacturer",
        "variable" : "mfr"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "herstellerSonstiger",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "mfr"
        }]
      }]
    },
    {
      "name" : "MapZbiZubehoerTyp",
      "source" : [{
        "context" : "src",
        "element" : "type",
        "variable" : "t"
      }],
      "rule" : [{
        "name" : "MapZbiTypCoding",
        "source" : [{
          "context" : "t",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/ireg-zubehoer-typ'"
        }],
        "rule" : [{
          "name" : "SetZbiZubehoerTyp",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "zubehoerTypSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
