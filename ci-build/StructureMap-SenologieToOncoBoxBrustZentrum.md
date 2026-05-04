# SenologieToOncoBoxBrustZentrum - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustZentrum**

## StructureMap: SenologieToOncoBoxBrustZentrum 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustZentrum | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrustZentrum |

 
title: Senologie Organization to OncoBox Brust Zentrum status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustZentrum",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustZentrum",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustZentrum",
  "status" : "draft",
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Organization to OncoBox Brust Zentrum\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "MapZentrum",
    "typeMode" : "none",
    "documentation" : "Known limitation: MapZentrum uses `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices. The IG Publisher produces SM_TARGET_PATH / SM_SOURCE_PATH errors\r\n(~12). Element names are correct per the OncoBox Brust Logical Model.\r\n============================================================================\r\nZentrum / Meldungs-Metadaten: Organization + Bundle.timestamp -> Zentrum\r\nDie Zentrums-ID (OnkoZert-Kennung) ist zentrumsspezifisch und wird als\r\nKonfigurationswert oder ueber Organization.identifier gepflegt. Der\r\nBerichtszeitraum (01.07.Vorjahr - 30.06.aktuellesJahr) ist meldungs-\r\nspezifisch und wird hier aus Bundle.timestamp abgeleitet; in der Praxis\r\ntypischerweise ueber Parameter gesetzt.\r\n============================================================================",
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
      "name" : "SetOncoBoxVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "oncoBoxVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "N1.1.1"
        }]
      }]
    },
    {
      "name" : "SetMeldungsdatum",
      "source" : [{
        "context" : "src",
        "element" : "timestamp",
        "variable" : "ts"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldungsdatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "ts"
        }]
      }]
    },
    {
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
          "name" : "SetZentrumName",
          "source" : [{
            "context" : "org",
            "element" : "name",
            "variable" : "name"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "zentrumName",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "name"
            }]
          }]
        },
        {
          "name" : "FilterIKNR",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://fhir.de/sid/arge-ik/iknr'"
          }],
          "rule" : [{
            "name" : "SetIKNR",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "iknr",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterStandort",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'http://fhir.de/sid/standortnummer'"
          }],
          "rule" : [{
            "name" : "SetStandortId",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "standortId",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterZentrumIdOZ",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://www.onkozert.de/sid/zentrum-id'"
          }],
          "rule" : [{
            "name" : "SetZentrumId",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zentrumId",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterZentrumIdIKNR",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://fhir.de/sid/arge-ik/iknr'"
          }],
          "rule" : [{
            "name" : "SetZentrumIdIKNRFallback",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "zentrumId",
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
}

```
