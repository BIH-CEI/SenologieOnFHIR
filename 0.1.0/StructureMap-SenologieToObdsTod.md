# SenologieToObdsTod - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTod**

## StructureMap: SenologieToObdsTod 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTod | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsTod |

 
title: Senologie Patient + Conditions to oBDS Todesmeldung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTod",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTod",
  "version" : "0.1.0",
  "name" : "SenologieToObdsTod",
  "status" : "draft",
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Patient + Conditions to oBDS Todesmeldung\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung"],
  "group" : [{
    "name" : "SenologieToObdsTod",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapTod, MapTodesursache) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nLogical Model sub-path for BackboneElement slices. The IG Publisher produces\r\nSM_TARGET_PATH errors (~10). Element names are correct per the oBDS LM.\r\n============================================================================\r\nHauptgruppe: Bundle -> oBDS Todesmeldung\r\nDas Bundle enthaelt einen Patient (mit deceasedDateTime) und ggf.\r\nConditions fuer Todesursachen (category = cause-of-death).\r\nDie Tumorzuordnung wird aus der Tumor-Condition abgeleitet.\r\n============================================================================",
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
        "condition" : "resource.is(Condition) and resource.category.coding.exists(code = 'encounter-diagnosis')"
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
      "name" : "EntryPatient",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "patEntry",
        "condition" : "resource.is(Patient)"
      }],
      "rule" : [{
        "name" : "CallMapTod",
        "source" : [{
          "context" : "patEntry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tod",
          "variable" : "tod"
        }],
        "dependent" : [{
          "name" : "MapTod",
          "variable" : ["patient", "tod", "src"]
        }]
      }]
    }]
  },
  {
    "name" : "MapTod",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nTod: Patient -> OBDSMeldung.tod\r\nSterbedatum, Tod tumorbedingt, Todesursachen\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Patient",
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
      "name" : "SetAbschlussID",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "abschlussID",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "id"
        }]
      }]
    },
    {
      "name" : "SetSterbedatum",
      "source" : [{
        "context" : "src",
        "element" : "deceased",
        "variable" : "d",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "sterbedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "d"
        }]
      }]
    },
    {
      "name" : "SetTodTumorbedingtDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "todTumorbedingt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "U"
        }]
      }]
    },
    {
      "name" : "EntryCheckTumorbedingt",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "codEntry",
        "condition" : "resource.is(Condition) and resource.category.coding.exists(code = 'cause-of-death')"
      }],
      "rule" : [{
        "name" : "AnalyseCodCondition",
        "source" : [{
          "context" : "codEntry",
          "element" : "resource",
          "variable" : "codCondition"
        }],
        "rule" : [{
          "name" : "CheckCodCode",
          "source" : [{
            "context" : "codCondition",
            "element" : "code",
            "variable" : "code"
          }],
          "rule" : [{
            "name" : "CheckIsCancer",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c",
              "condition" : "(system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm') and code.startsWith('C')"
            }],
            "rule" : [{
              "name" : "SetTodTumorbedingtJa",
              "source" : [{
                "context" : "c"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "todTumorbedingt",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "J"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapTodTumorbedingtExtension",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-tod-tumorbedingt'"
      }],
      "rule" : [{
        "name" : "MapTodTumorbedingtValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractTodTumorbedingtCode",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetTodTumorbedingtExplicit",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "todTumorbedingt",
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
      "name" : "EntryTodesursachen",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "codEntry",
        "condition" : "resource.is(Condition) and resource.category.coding.exists(code = 'cause-of-death')"
      }],
      "rule" : [{
        "name" : "CallMapTodesursache",
        "source" : [{
          "context" : "codEntry",
          "element" : "resource",
          "variable" : "codCondition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "todesursachen",
          "variable" : "tu"
        }],
        "dependent" : [{
          "name" : "MapTodesursache",
          "variable" : ["codCondition", "tu"]
        }]
      }]
    }]
  },
  {
    "name" : "MapTodesursache",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nTodesursache: Condition (cause-of-death) -> OBDSMeldung.tod.todesursachen\r\nICD-10-GM Code und Version der Todesursache\r\n============================================================================",
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
      "name" : "MapTodesursacheCode",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "ExtractTodesursacheICD",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "rule" : [{
          "name" : "SetTodesursacheCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetTodesursacheVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "version",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "v"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
