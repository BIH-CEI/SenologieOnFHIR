# SenologieToOncoBoxBrustTherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustTherapie**

## StructureMap: SenologieToOncoBoxBrustTherapie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustTherapie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrustTherapie |

 
title: Senologie Procedure (Syst / RT) to OncoBox Brust Therapie status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustTherapie",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustTherapie",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustTherapie",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Procedure (Syst / RT) to OncoBox Brust Therapie\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "MapSystemtherapie",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapSystemtherapie, MapStrahlentherapie) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nLogical Model sub-path for BackboneElement slices. The IG Publisher produces\r\nSM_TARGET_PATH errors (~19). Element names are correct per the OncoBox Brust\r\nLogical Model.\r\n============================================================================\r\nSystemtherapie: Procedure (Senologie_Systemtherapie_Procedure) -> Syst-Block\r\nRelevante Felder fuer OncoBox / Kennzahlen:\r\n- KB-4 / KB-5: adjuvante Chemo (invasiv / DCIS)\r\n- KB-7: Trastuzumab bei HER2-positiven Patientinnen\r\n- KB-8: First-Line-Therapie bei Metastasierung\r\n============================================================================",
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
      "name" : "SetSystLnr",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lnr",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapSystArt",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapSystArtCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetSystChemo",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '367336001'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "therapieart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetSystImmun",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '76334006'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "therapieart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetSystZiel",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '169413002'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "therapieart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapStellExt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapiestellung'"
      }],
      "rule" : [{
        "name" : "MapStellVal",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetStellNeo",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'neoadjuvant'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "N"
            }]
          }]
        },
        {
          "name" : "SetStellAdj",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'adjuvant'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "A"
            }]
          }]
        },
        {
          "name" : "SetStellPal",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'palliativ'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "P"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapSystPeriod",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(Period)"
      }],
      "rule" : [{
        "name" : "SetSystBeginn",
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
      },
      {
        "name" : "SetSystEnde",
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
      "name" : "MapTrastu",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapTrastuCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetTrastuJa",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '387208009'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "enthaeltTrastuzumab",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapFirstLine",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-first-line-therapy'"
      }],
      "rule" : [{
        "name" : "SetFirstLineJa",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val",
          "condition" : "$this = true"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "firstLine",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      },
      {
        "name" : "SetFirstLineNein",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val",
          "condition" : "$this = false"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "firstLine",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "0"
          }]
        }]
      }]
    },
    {
      "name" : "MapSystProtokoll",
      "source" : [{
        "context" : "src",
        "element" : "usedCode",
        "variable" : "uc"
      }],
      "rule" : [{
        "name" : "SetSystProtokollText",
        "source" : [{
          "context" : "uc",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "protokoll",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapStrahlentherapie",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nStrahlentherapie: Procedure (Senologie_Strahlentherapie) -> RT-Block\r\n============================================================================",
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
      "name" : "SetRTLnr",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lnr",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapRTPeriod",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(Period)"
      }],
      "rule" : [{
        "name" : "SetRTBeginn",
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
      },
      {
        "name" : "SetRTEnde",
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
      "name" : "MapRTStellExt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapiestellung'"
      }],
      "rule" : [{
        "name" : "MapRTStellVal",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetRTNeo",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'neoadjuvant'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "N"
            }]
          }]
        },
        {
          "name" : "SetRTAdj",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'adjuvant'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "A"
            }]
          }]
        },
        {
          "name" : "SetRTPal",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "code = 'palliativ'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stellungZurOP",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "P"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapRTGesamtdosis",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-bestrahlung-gesamtdosis'"
      }],
      "rule" : [{
        "name" : "ExtractRTGesamtdosisValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetRTGesamtdosis",
          "source" : [{
            "context" : "val",
            "element" : "value",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtdosisGy",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapRTEinzeldosis",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis'"
      }],
      "rule" : [{
        "name" : "ExtractRTEinzeldosisValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetRTEinzeldosis",
          "source" : [{
            "context" : "val",
            "element" : "value",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "einzeldosisGy",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapRTZiel",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapRTZielCoding",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetRTBrust",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '76752008'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "zielgebiet",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetRTLAW",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '59441001'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "zielgebiet",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapEndokrineTherapie",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nEndokrine Therapie: Procedure (therapieart=HO) -> EndokrineTherapie-Block\r\nEndokrine Therapien (Tamoxifen, Aromatasehemmer, GnRH, Fulvestrant,\r\nCDK4/6-Inhibitoren) werden als Systemtherapie-Procedures mit therapieart=HO\r\nmodelliert. Die Substanzklasse wird ueber ATC-Codes abgeleitet:\r\n1=Tamoxifen (L02BA01), 2=Aromatasehemmer (L02BG*),\r\n3=GnRH-Analogon (L02AE*), 4=Fulvestrant (L02BA03),\r\n5=CDK4/6-Inhibitor (L01EF*), 9=sonstige\r\n============================================================================",
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
      "name" : "SetEndoLnr",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lnr",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapEndoPeriod",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(Period)"
      }],
      "rule" : [{
        "name" : "SetEndoBeginn",
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
      },
      {
        "name" : "SetEndoEnde",
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
      "name" : "MapEndoStellExt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url.contains('mii-ex-onko-systemische-therapie-intention')"
      }],
      "rule" : [{
        "name" : "MapEndoStellVal",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapEndoStellCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetEndoAdj",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = 'K'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "stellungZurOP",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "A"
              }]
            }]
          },
          {
            "name" : "SetEndoPal",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = 'P'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "stellungZurOP",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetEndoNeo",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd",
              "condition" : "$this = 'N'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "stellungZurOP",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapEndoSubstanzATC",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapEndoSubstanzATCCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/atc'"
        }],
        "rule" : [{
          "name" : "SetEndoTamox",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'L02BA01'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "substanz",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetEndoFulv",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'L02BA03'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "substanz",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        },
        {
          "name" : "SetEndoAI",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('L02BG')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "substanz",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetEndoGnRH",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('L02AE')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "substanz",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        },
        {
          "name" : "SetEndoCDK",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('L01EF')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "substanz",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "5"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
