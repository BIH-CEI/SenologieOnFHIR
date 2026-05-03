# SenologieToObdsDiagnose - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsDiagnose**

## StructureMap: SenologieToObdsDiagnose 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:SenologieToObdsDiagnose |

 
title: Senologie Diagnose Bundle to oBDS Diagnosemeldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsDiagnose",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose",
  "version" : "0.1.0",
  "name" : "SenologieToObdsDiagnose",
  "status" : "draft",
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Diagnose Bundle to oBDS Diagnosemeldung\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/RiskAssessment",
    "mode" : "source",
    "alias" : "RiskAssessment"
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
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsLeistungszustand"],
  "group" : [{
    "name" : "SenologieToObdsDiagnose",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapDiagnose, MapWeitereKlassifikation) use\r\n`target tgt : BackboneElement`. See SenologieToObdsTNM.map for details.\r\n============================================================================\r\nHauptgruppe: Bundle -> oBDS Diagnosemeldung\r\nDas Bundle enthaelt eine Condition (Diagnose) sowie zugehoerige\r\nObservations (TNM, Histologie, Hormonrezeptoren).\r\n============================================================================",
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
      "name" : "EntryConditionDX",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition)"
      }],
      "rule" : [{
        "name" : "CallMapDiagnose",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "diagnose",
          "variable" : "dx"
        }],
        "dependent" : [{
          "name" : "MapDiagnose",
          "variable" : ["condition", "dx", "src"]
        }]
      }]
    }]
  },
  {
    "name" : "MapDiagnose",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nDiagnose: Condition -> OBDSMeldung.diagnose\r\nFreitextdiagnose, ICD-O Topographie, Diagnosesicherung, fruehere Erkrankungen\r\n============================================================================",
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
      "name" : "MapDiagnosetext",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "SetDiagnosetext",
        "source" : [{
          "context" : "code",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "primaertumorDiagnosetext",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }]
    },
    {
      "name" : "MapTopographie",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapTopoCoding",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'urn:oid:2.16.840.1.113883.6.43.1'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "primaertumorTopographieICDO",
          "variable" : "topo"
        }],
        "rule" : [{
          "name" : "SetTopoCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "topo",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetTopoVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "topo",
            "contextType" : "variable",
            "element" : "version",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapTopoFreitext",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "SetTopoFreitext",
        "source" : [{
          "context" : "bs",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "primaertumorTopographieFreitext",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }]
    },
    {
      "name" : "MapDiagnosesicherung",
      "source" : [{
        "context" : "src",
        "element" : "verificationStatus",
        "variable" : "vs"
      }],
      "rule" : [{
        "name" : "ExtractDiagnosesicherungCode",
        "source" : [{
          "context" : "vs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung'"
        }],
        "rule" : [{
          "name" : "SetDiagnosesicherung",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "diagnosesicherung",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapFruehereErkrankungen",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'http://hl7.org/fhir/StructureDefinition/condition-related'"
      }],
      "rule" : [{
        "name" : "MapFruehereErkrankung",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "ref"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fruehereErkrankungen",
          "variable" : "fe"
        }],
        "rule" : [{
          "name" : "SetFrueherFreitext",
          "source" : [{
            "context" : "ref",
            "element" : "display",
            "variable" : "d"
          }],
          "target" : [{
            "context" : "fe",
            "contextType" : "variable",
            "element" : "freitext",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "d"
            }]
          }]
        }]
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
      "name" : "EntryCTNM",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "tnmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21908-9')"
      }],
      "rule" : [{
        "name" : "CallMapCTNM",
        "source" : [{
          "context" : "tnmEntry",
          "element" : "resource",
          "variable" : "tnmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "dependent" : [{
          "name" : "MapTNM",
          "variable" : ["tnmObs", "ctnm", "bundle"]
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
    },
    {
      "name" : "EntryWeitereKlassifikation",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "raEntry",
        "condition" : "resource.is(RiskAssessment)"
      }],
      "rule" : [{
        "name" : "CallMapWeitereKlassifikation",
        "source" : [{
          "context" : "raEntry",
          "element" : "resource",
          "variable" : "ra"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "weitereKlassifikationen",
          "variable" : "wk"
        }],
        "dependent" : [{
          "name" : "MapWeitereKlassifikation",
          "variable" : ["ra", "bundle", "wk"]
        }]
      }]
    }]
  },
  {
    "name" : "MapWeitereKlassifikation",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nWeitere Klassifikation: RiskAssessment (Genexpressionstest) -> Menge_Weitere_Klassifikation\r\nMappt Genexpressionstests wie Oncotype DX, MammaPrint auf das oBDS-Element\r\n\"Weitere_Klassifikation\" (Datum, Name, Stadium/Ergebnis).\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "RiskAssessment",
      "mode" : "source"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetWKDatum",
      "source" : [{
        "context" : "src",
        "element" : "occurrence",
        "variable" : "occ",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "occ"
        }]
      }]
    },
    {
      "name" : "MapWKMethod",
      "source" : [{
        "context" : "src",
        "element" : "method",
        "variable" : "m"
      }],
      "rule" : [{
        "name" : "MapWKMethodCoding",
        "source" : [{
          "context" : "m",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest'"
        }],
        "rule" : [{
          "name" : "SetWKNameDisplay",
          "source" : [{
            "context" : "c",
            "element" : "display",
            "variable" : "d"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "name",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "d"
            }]
          }]
        }]
      },
      {
        "name" : "SetWKNameText",
        "source" : [{
          "context" : "m",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "name",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }]
    },
    {
      "name" : "MapWKPrediction",
      "source" : [{
        "context" : "src",
        "element" : "prediction",
        "variable" : "pred"
      }],
      "rule" : [{
        "name" : "MapWKQR",
        "source" : [{
          "context" : "pred",
          "element" : "qualitativeRisk",
          "variable" : "qr"
        }],
        "rule" : [{
          "name" : "SetWKStadiumQualitativeText",
          "source" : [{
            "context" : "qr",
            "element" : "text",
            "variable" : "t"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "stadium",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "t"
            }]
          }]
        },
        {
          "name" : "MapWKQRCoding",
          "source" : [{
            "context" : "qr",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetWKStadiumQualitativeDisplay",
            "source" : [{
              "context" : "c",
              "element" : "display",
              "variable" : "d"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "stadium",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "d"
              }]
            }]
          }]
        }]
      }]
    }]
  }]
}

```
