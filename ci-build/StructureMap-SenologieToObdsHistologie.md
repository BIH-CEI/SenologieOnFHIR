# SenologieToObdsHistologie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsHistologie**

## StructureMap: SenologieToObdsHistologie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsHistologie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsHistologie |

 
title: Senologie Histologie Observations to oBDS Histologie BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsHistologie",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsHistologie",
  "version" : "0.1.0",
  "name" : "SenologieToObdsHistologie",
  "status" : "draft",
  "date" : "2026-05-04T11:47:21+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Histologie Observations to oBDS Histologie BackboneElement\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
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
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapHistologie",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement`. See\r\nSenologieToObdsTNM.map for details on SM_TARGET_PATH errors.\r\n============================================================================\r\nGemeinsame Histologie-Map: Extrahiert Histologiebefunde aus MII Onko\r\nObservations und mappt auf das oBDS Histologie-BackboneElement.\r\nWird von Diagnose, OP und Verlauf importiert.\r\nMII Onko Histologie-Profile:\r\n- mii-pr-onko-histologie-icdo3 (LOINC 59847-4): Morphologie + Freitext\r\n- mii-pr-onko-grading (LOINC 59542-1): Histopathologisches Grading\r\n- mii-pr-onko-anzahl-untersuchte-lymphknoten (LOINC 21894-1)\r\n- mii-pr-onko-anzahl-befallene-lymphknoten (LOINC 21893-3)\r\n- mii-pr-onko-anzahl-untersuchte-sentinel-lymphknoten (LOINC 92832-5)\r\n- mii-pr-onko-anzahl-befallene-sentinel-lymphknoten (LOINC 92831-7)\r\nDie Histologie-Observation (59847-4) ist die Haupt-Ressource.\r\nGrading und Lymphknoten koennen als components in der Haupt-Observation\r\noder als separate Observations vorliegen.\r\n============================================================================\r\n============================================================================\r\nMapHistologie: Observation (Histologie ICD-O-3) -> oBDS Histologie\r\nVerarbeitet die Haupt-Histologie-Observation und extrahiert Morphologie,\r\nGrading und Lymphknoten-Daten aus deren components.\r\n============================================================================",
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
      "name" : "MapHistologieID",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetHistologieID",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "histologieID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetHistologiedatum",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "tumorHistologiedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "MapEinsendeNr",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system = 'http://pathologie.charite.de/fhir/sid/einsende-nr'"
      }],
      "rule" : [{
        "name" : "SetEinsendeNr",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
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
      "name" : "MapMorphologie",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "MapMorphCoding",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'urn:oid:2.16.840.1.113883.6.43.1'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "morphologieICDO",
          "variable" : "morph"
        }],
        "rule" : [{
          "name" : "SetMorphCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "morph",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetMorphVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "morph",
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
      "name" : "MapMorphFreitext",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "SetMorphFreitext",
        "source" : [{
          "context" : "val",
          "element" : "text",
          "variable" : "t"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "morphologieFreitext",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "t"
          }]
        }]
      }]
    },
    {
      "name" : "MapGrading",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '59542-1')"
      }],
      "rule" : [{
        "name" : "MapGradingValue",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "TranslateGrading",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "target" : [{
            "context" : "tgt",
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
    },
    {
      "name" : "MapLKUntersucht",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21894-1')"
      }],
      "rule" : [{
        "name" : "SetLKUntersucht",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lkUntersucht",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "MapLKBefallen",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '21893-3')"
      }],
      "rule" : [{
        "name" : "SetLKBefallen",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lkBefallen",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "MapSentinelLKUntersucht",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '92832-5')"
      }],
      "rule" : [{
        "name" : "SetSentinelLKUntersucht",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "sentinelLKUntersucht",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "val"
          }]
        }]
      }]
    },
    {
      "name" : "MapSentinelLKBefallen",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "comp",
        "condition" : "code.coding.exists(code = '92831-7')"
      }],
      "rule" : [{
        "name" : "SetSentinelLKBefallen",
        "source" : [{
          "context" : "comp",
          "element" : "value",
          "variable" : "val"
        }],
        "target" : [{
          "context" : "tgt",
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
}

```
