# SenologieToObdsResidualstatus - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsResidualstatus**

## StructureMap: SenologieToObdsResidualstatus 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsResidualstatus | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsResidualstatus |

 
title: Senologie Residualstatus Observation to oBDS Residualstatus BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsResidualstatus",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsResidualstatus",
  "version" : "0.1.0",
  "name" : "SenologieToObdsResidualstatus",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Residualstatus Observation to oBDS Residualstatus BackboneElement\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "mode" : "source",
    "alias" : "CodeableConcept"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapResidualstatusFromObservation",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher produces SM_TARGET_PATH\r\nerrors (~12). The element names are correct per the oBDS Logical Model.\r\n============================================================================\r\nGemeinsame Residualstatus-Map: Extrahiert den Residualtumorstatus\r\n(R-Klassifikation) und mappt auf das oBDS Residualstatus-BackboneElement.\r\nWird von OP importiert.\r\nMII Onko Profil: mii-pr-onko-residualstatus\r\nDie Observation hat zwei relevante components:\r\n- Lokale Beurteilung des Residualstatus\r\n- Gesamtbeurteilung des Residualstatus\r\nAlternativ kann der Residualstatus direkt aus Procedure.outcome kommen\r\n(aelteres Mapping-Pattern, bleibt als Fallback erhalten).\r\noBDS Residualstatus-Codes: R0, R1, R1(is), R1(cy+), R2, RX, U\r\n============================================================================\r\n============================================================================\r\nMapResidualstatusFromObservation: Observation -> oBDS Residualstatus\r\nExtrahiert lokale und Gesamtbeurteilung aus Observation.components\r\n============================================================================",
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
      "name" : "MapLokaleBeurteilung",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '84892-9')"
      }],
      "rule" : [{
        "name" : "MapLokaleBeurteilungValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractLokaleBeurteilungDirect",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus'"
          }],
          "rule" : [{
            "name" : "SetLokaleBeurteilungDirect",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "lokaleBeurteilung",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        },
        {
          "name" : "TranslateLokaleBeurteilung",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://snomed.info/sct'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "lokaleBeurteilung",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapGesamtbeurteilung",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21976-6')"
      }],
      "rule" : [{
        "name" : "MapGesamtbeurteilungValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "ExtractGesamtbeurteilungDirect",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus'"
          }],
          "rule" : [{
            "name" : "SetGesamtbeurteilungDirect",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "gesamtbeurteilung",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        },
        {
          "name" : "TranslateGesamtbeurteilung",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c",
            "condition" : "system = 'http://snomed.info/sct'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtbeurteilung",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapResidualstatusFallback",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val",
        "condition" : "%src.component.exists().not()"
      }],
      "rule" : [{
        "name" : "FallbackDirectCodes",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus'"
        }],
        "rule" : [{
          "name" : "SetLokaleBeurteilungFallback",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "lokaleBeurteilung",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetGesamtbeurteilungFallback",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtbeurteilung",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      },
      {
        "name" : "FallbackSnomedCodes",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "TranslateLokaleBeurteilungFallback",
          "source" : [{
            "context" : "c"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "lokaleBeurteilung",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
            },
            {
              "valueString" : "code"
            }]
          }]
        },
        {
          "name" : "TranslateGesamtbeurteilungFallback",
          "source" : [{
            "context" : "c"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "gesamtbeurteilung",
            "transform" : "translate",
            "parameter" : [{
              "valueId" : "c"
            },
            {
              "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
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
    "name" : "MapResidualstatusFromOutcome",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapResidualstatusFromOutcome: Procedure.outcome -> oBDS Residualstatus\r\nAelteres Pattern: Residualstatus direkt aus Procedure.outcome (CodeableConcept)\r\nBleibt als Kompatibilitaets-Gruppe erhalten\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "CodeableConcept",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapResidualDirect",
      "source" : [{
        "context" : "src",
        "element" : "coding",
        "variable" : "c",
        "condition" : "system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus'"
      }],
      "rule" : [{
        "name" : "SetLokaleBeurteilung",
        "source" : [{
          "context" : "c",
          "element" : "code",
          "variable" : "cd"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lokaleBeurteilung",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "cd"
          }]
        }]
      },
      {
        "name" : "SetGesamtbeurteilung",
        "source" : [{
          "context" : "c",
          "element" : "code",
          "variable" : "cd"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "gesamtbeurteilung",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "cd"
          }]
        }]
      }]
    },
    {
      "name" : "MapResidualSNOMED",
      "source" : [{
        "context" : "src",
        "element" : "coding",
        "variable" : "c",
        "condition" : "system = 'http://snomed.info/sct'"
      }],
      "rule" : [{
        "name" : "TranslateLokaleBeurteilung",
        "source" : [{
          "context" : "c"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lokaleBeurteilung",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
          },
          {
            "valueString" : "code"
          }]
        }]
      },
      {
        "name" : "TranslateGesamtbeurteilung",
        "source" : [{
          "context" : "c"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "gesamtbeurteilung",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    }]
  }]
}

```
