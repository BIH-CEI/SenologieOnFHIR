# SenologieToObdsNebenwirkung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsNebenwirkung**

## StructureMap: SenologieToObdsNebenwirkung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsNebenwirkung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsNebenwirkung |

 
title: Senologie Nebenwirkung Observations to oBDS Nebenwirkungen BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsNebenwirkung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsNebenwirkung",
  "version" : "0.1.0",
  "name" : "SenologieToObdsNebenwirkung",
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
  "description" : "title: Senologie Nebenwirkung Observations to oBDS Nebenwirkungen BackboneElement\r\nstatus: draft",
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
    "url" : "https://www.senologie.org/fhir/StructureDefinition/obds-meldung",
    "mode" : "target",
    "alias" : "OBDSMeldung"
  }],
  "group" : [{
    "name" : "MapNebenwirkungenSYST",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices. The IG Publisher produces SM_TARGET_PATH errors (~3). Element names\r\nare correct per the oBDS Logical Model.\r\n============================================================================\r\nGemeinsame Nebenwirkungen-Map: Extrahiert Nebenwirkungen (Adverse Events)\r\naus dem Bundle und mappt auf das oBDS Nebenwirkungen-BackboneElement.\r\nWird von SYST und ST importiert.\r\nMII Onko Profil: mii-pr-onko-nebenwirkung-adverse-event\r\nDie Nebenwirkung wird als Observation modelliert mit:\r\n- code: CTCAE-Term (NCI Thesaurus Code + Text)\r\n- value: CTCAE-Grad als CodeableConcept\r\n- method: CTCAE-Version\r\noBDS-Struktur:\r\nnebenwirkungen.gradMaximal2OderUnbekannt: Wenn alle Nebenwirkungen\r\nGrad <=2 oder unbekannt sind, wird hier \"2\" oder \"U\" gesetzt.\r\nnebenwirkungen.nebenwirkung[]: Einzelne Nebenwirkungen Grad >=3\r\nmit art/bezeichnung, grad (3, 4, 5) und CTCAE-Version.\r\n============================================================================\r\n============================================================================\r\nMapNebenwirkungenSYST: Bundle -> oBDS Nebenwirkungen (fuer Systemtherapie)\r\nBei SYST: Observations mit CTCAE-Codierung extrahieren,\r\nGrad >=3 als einzelne Eintraege, sonst gradMaximal2OderUnbekannt\r\n============================================================================",
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
      "name" : "SetGradUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "entry.where(resource.is(Observation) and resource.code.coding.exists(system = 'http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl')).exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "gradMaximal2OderUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "U"
        }]
      }]
    },
    {
      "name" : "EntryNebenwirkungen",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "obsEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(system = 'http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl')"
      }],
      "rule" : [{
        "name" : "CallMapNebenwirkungEinzeln",
        "source" : [{
          "context" : "obsEntry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "dependent" : [{
          "name" : "MapNebenwirkungEinzeln",
          "variable" : ["obs", "tgt"]
        }]
      }]
    }]
  },
  {
    "name" : "MapNebenwirkungenST",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapNebenwirkungenST: Bundle -> oBDS Nebenwirkungen (fuer Strahlentherapie)\r\nGleiche Logik wie SYST, aber separat um verschiedene Kontexte zu ermoeglichen\r\n============================================================================",
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
      "name" : "SetGradUnbekannt",
      "source" : [{
        "context" : "src",
        "condition" : "entry.where(resource.is(Observation) and resource.code.coding.exists(system = 'http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl')).exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "gradMaximal2OderUnbekannt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "U"
        }]
      }]
    },
    {
      "name" : "EntryNebenwirkungen",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "obsEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(system = 'http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl')"
      }],
      "rule" : [{
        "name" : "CallMapNebenwirkungEinzeln",
        "source" : [{
          "context" : "obsEntry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "dependent" : [{
          "name" : "MapNebenwirkungEinzeln",
          "variable" : ["obs", "tgt"]
        }]
      }]
    }]
  },
  {
    "name" : "MapNebenwirkungEinzeln",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapNebenwirkungEinzeln: Observation -> oBDS Nebenwirkung (einzeln)\r\nErzeugt einen Nebenwirkung-Eintrag mit Art/Bezeichnung, Grad und Version\r\n============================================================================",
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
      "name" : "MapNebenwirkungGrad",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "CreateNebenwirkung",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "nebenwirkung",
          "variable" : "nw"
        }],
        "rule" : [{
          "name" : "ExtractNwBezeichnung",
          "source" : [{
            "context" : "src",
            "element" : "code",
            "variable" : "obsCode"
          }],
          "rule" : [{
            "name" : "SetNwBezeichnung",
            "source" : [{
              "context" : "obsCode",
              "element" : "text",
              "variable" : "t"
            }],
            "target" : [{
              "context" : "nw",
              "contextType" : "variable",
              "element" : "artBezeichnung",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "t"
              }]
            }]
          },
          {
            "name" : "FallbackNwBezeichnung",
            "source" : [{
              "context" : "obsCode",
              "element" : "coding",
              "variable" : "coding"
            }],
            "rule" : [{
              "name" : "SetNwBezeichnungDisplay",
              "source" : [{
                "context" : "coding",
                "element" : "display",
                "variable" : "d",
                "condition" : "%obsCode.text.exists().not()"
              }],
              "target" : [{
                "context" : "nw",
                "contextType" : "variable",
                "element" : "artBezeichnung",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "d"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "SetNwGrad",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "g"
          }],
          "target" : [{
            "context" : "nw",
            "contextType" : "variable",
            "element" : "grad",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "g"
            }]
          }]
        },
        {
          "name" : "ExtractNwVersion",
          "source" : [{
            "context" : "src",
            "element" : "method",
            "variable" : "method"
          }],
          "rule" : [{
            "name" : "SetNwVersion",
            "source" : [{
              "context" : "method",
              "element" : "text",
              "variable" : "t"
            }],
            "target" : [{
              "context" : "nw",
              "contextType" : "variable",
              "element" : "version",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "t"
              }]
            }]
          },
          {
            "name" : "FallbackNwVersion",
            "source" : [{
              "context" : "method",
              "element" : "coding",
              "variable" : "mc"
            }],
            "rule" : [{
              "name" : "SetNwVersionFromCoding",
              "source" : [{
                "context" : "mc",
                "element" : "code",
                "variable" : "v",
                "condition" : "%method.text.exists().not()"
              }],
              "target" : [{
                "context" : "nw",
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
    }]
  }]
}

```
