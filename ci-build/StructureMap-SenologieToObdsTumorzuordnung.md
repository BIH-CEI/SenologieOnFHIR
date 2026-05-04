# SenologieToObdsTumorzuordnung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTumorzuordnung**

## StructureMap: SenologieToObdsTumorzuordnung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsTumorzuordnung |

 
title: Senologie Diagnose to oBDS Tumorzuordnung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTumorzuordnung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "version" : "0.1.0",
  "name" : "SenologieToObdsTumorzuordnung",
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
  "description" : "title: Senologie Diagnose to oBDS Tumorzuordnung\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapTumorzuordnung",
    "typeMode" : "none",
    "documentation" : "Known limitation: MapTumorzuordnung uses `target tgt : BackboneElement`\r\nbecause FML has no syntax to declare the Logical Model sub-path for\r\nBackboneElement slices. The IG Publisher produces SM_TARGET_PATH errors (~5).\r\nElement names are correct per the oBDS Logical Model.\r\n============================================================================\r\nTumorzuordnung: Condition (Diagnose) -> OBDSMeldung.tumorzuordnung\r\nWird von allen Meldungstypen importiert, da die Tumorzuordnung in jeder\r\noBDS-Meldung enthalten sein muss.\r\n============================================================================",
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
      "name" : "MapTumorID",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system = 'https://www.senologie.org/fhir/sid/tumor-id'"
      }],
      "rule" : [{
        "name" : "SetTumorID",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tumorID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "MapPrimaertumorICD",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapICD10Coding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "primaertumorICD",
          "variable" : "icd"
        }],
        "rule" : [{
          "name" : "SetICDCode",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "icd",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        },
        {
          "name" : "SetICDVersion",
          "source" : [{
            "context" : "c",
            "element" : "version",
            "variable" : "v"
          }],
          "target" : [{
            "context" : "icd",
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
      "name" : "SetDiagnosedatum",
      "source" : [{
        "context" : "src",
        "element" : "onset",
        "variable" : "onset",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "diagnosedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "onset"
        }]
      }]
    },
    {
      "name" : "MapSeitenlokalisation",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "TranslateSeitenlokalisation",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "seitenlokalisation",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "MapMorphologieICDO",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapMorphCoding",
        "source" : [{
          "context" : "code",
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
    }]
  }]
}

```
