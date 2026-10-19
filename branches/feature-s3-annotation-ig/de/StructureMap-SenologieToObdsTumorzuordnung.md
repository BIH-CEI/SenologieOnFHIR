# SenologieToObdsTumorzuordnung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsTumorzuordnung**

## StructureMap: SenologieToObdsTumorzuordnung 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung | **:0.10.0 |
| Draft | **:SenologieToObdsTumorzuordnung |

 
title: Senologie Diagnose to oBDS Tumorzuordnung status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsTumorzuordnung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "version" : "0.10.0",
  "name" : "SenologieToObdsTumorzuordnung",
  "status" : "draft",
  "date" : "2026-10-19T00:09:05+00:00",
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
      }],
      "documentation" : "Tumor_ID: aus Condition.identifier (Tumor-Kennung)"
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
      }],
      "documentation" : "Primaertumor_ICD: ICD-10-GM Code und Version aus Condition.code"
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
      }],
      "documentation" : "Diagnosedatum: aus Condition.onsetDateTime"
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
      }],
      "documentation" : "Seitenlokalisation: aus Condition.bodySite mit Uebersetzung SNOMED -> oBDS"
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
      }],
      "documentation" : "Morphologie_ICD_O: aus Condition.code ICD-O Morphologie (falls vorhanden)"
    }]
  }]
}

```
