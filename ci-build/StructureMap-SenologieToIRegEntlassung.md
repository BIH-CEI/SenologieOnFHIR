# SenologieToIRegEntlassung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegEntlassung**

## StructureMap: SenologieToIRegEntlassung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:SenologieToIRegEntlassung |

 
title: Senologie Encounter + Condition to IRegG Entlassung + DiagnoseBrustimplantat status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegEntlassung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung",
  "version" : "0.1.0",
  "name" : "SenologieToIRegEntlassung",
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
  "description" : "title: Senologie Encounter + Condition to IRegG Entlassung + DiagnoseBrustimplantat\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
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
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
    "mode" : "target",
    "alias" : "IRegMeldung"
  }],
  "group" : [{
    "name" : "MapEntlassung",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the specific Logical Model sub-path when a parent\r\ngroup passes a BackboneElement slice (e.g., `tgt.entlassung as entl then ...`).\r\nThe IG Publisher resolves target paths against BackboneElement, producing\r\nSM_TARGET_PATH / SM_SOURCE_PATH errors. The element names are correct and\r\nmatch the IRegG Brustimplantat Logical Model. These errors are cosmetic.\r\n============================================================================\r\nEntlassung: Encounter + Condition -> ENT_* + DBI_*\r\nEntlassungsdaten und Brustimplantat-spezifische Entlassungsdiagnosen.\r\nENT_Datum kommt aus Encounter.period.end.\r\nENT_GrundSchluessel kommt aus Encounter.hospitalization.dischargeDisposition.\r\nDBI_* Diagnosen kommen aus Condition-Ressourcen im Bundle (ICD-10-GM).\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Encounter",
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
      "name" : "MapEntlassungsDatum",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetEntlassungsDatum",
        "source" : [{
          "context" : "period",
          "element" : "end",
          "variable" : "e"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "datum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "e"
          }]
        }]
      }]
    },
    {
      "name" : "MapHospitalization",
      "source" : [{
        "context" : "src",
        "element" : "hospitalization",
        "variable" : "hosp"
      }],
      "rule" : [{
        "name" : "MapDischargeDisposition",
        "source" : [{
          "context" : "hosp",
          "element" : "dischargeDisposition",
          "variable" : "dd"
        }],
        "rule" : [{
          "name" : "MapEntlassungsgrundCoding",
          "source" : [{
            "context" : "dd",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://fhir.de/CodeSystem/dkgev/Entlassungsgrund'"
          }],
          "rule" : [{
            "name" : "SetEntlassungsgrund",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "grundSchluessel",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        },
        {
          "name" : "MapEntlassungsgrundFallbackCoding",
          "source" : [{
            "context" : "dd",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system != 'http://fhir.de/CodeSystem/dkgev/Entlassungsgrund'"
          }],
          "rule" : [{
            "name" : "SetEntlassungsgrundFallback",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "grundSchluessel",
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
      "name" : "EntryDbiCondition",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition)"
      }],
      "rule" : [{
        "name" : "DbiConditionContext",
        "source" : [{
          "context" : "entry",
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
            "name" : "MapDbiIcd",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
            }],
            "target" : [{
              "context" : "tgt",
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
}

```
