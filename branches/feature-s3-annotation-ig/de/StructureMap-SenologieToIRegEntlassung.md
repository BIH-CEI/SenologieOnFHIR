# SenologieToIRegEntlassung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegEntlassung**

## StructureMap: SenologieToIRegEntlassung 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung | **:0.10.0 |
| Draft | **:SenologieToIRegEntlassung |

 
title: Senologie Encounter + Condition to IRegG Entlassung + DiagnoseBrustimplantat status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegEntlassung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung",
  "version" : "0.10.0",
  "name" : "SenologieToIRegEntlassung",
  "status" : "draft",
  "date" : "2026-10-20T05:01:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
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
      }],
      "documentation" : "--- ENT_* Entlassungsdaten ---\r\nENT_Datum: aus Encounter.period.end (Entlassungsdatum)"
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
          }],
          "documentation" : "Fallback: beliebiges Coding"
        }]
      }],
      "documentation" : "ENT_GrundSchluessel: aus Encounter.hospitalization.dischargeDisposition\r\n2-stelliger Entlassungs-/Verlegungsgrund nach §301 SGB V"
    }]
  }]
}

```
