# SenologieToObdsFernmetastasen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsFernmetastasen**

## StructureMap: SenologieToObdsFernmetastasen 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsFernmetastasen | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsFernmetastasen |

 
title: Senologie Fernmetastasen Observations to oBDS Fernmetastasen BackboneElement status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsFernmetastasen",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsFernmetastasen",
  "version" : "0.1.0",
  "name" : "SenologieToObdsFernmetastasen",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Fernmetastasen Observations to oBDS Fernmetastasen BackboneElement\r\nstatus: draft",
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
    "name" : "MapFernmetastasenFromBundle",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher produces SM_TARGET_PATH\r\nerrors. The element names are correct per the oBDS Logical Model.\r\n============================================================================\r\nGemeinsame Fernmetastasen-Map: Extrahiert Fernmetastasen-Observations\r\naus dem Bundle und mappt auf das oBDS Fernmetastasen-BackboneElement.\r\nWird von Diagnose und Verlauf importiert.\r\nMII Onko Profil: mii-pr-onko-fernmetastasen\r\n- LOINC 21907-1: Distant metastases.clinical Cancer\r\n- Alternative: LOINC 97956-3 (Fernmetastasen-Assessment)\r\nJede Fernmetastasen-Observation erzeugt einen separaten Eintrag mit\r\nDiagnosedatum und Lokalisation. Die Lokalisation wird via ConceptMap\r\nvon SNOMED zu oBDS-Kuerzeln (PUL, OSS, HEP, BRA, etc.) uebersetzt.\r\n============================================================================\r\n============================================================================\r\nMapFernmetastasenFromBundle: Bundle -> oBDS Fernmetastasen (repeating)\r\nIteriert ueber alle Fernmetastasen-Observations im Bundle\r\n============================================================================",
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
      "name" : "EntryFernmetastasen",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "fmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21907-1')"
      }],
      "rule" : [{
        "name" : "CallMapFernmetastase",
        "source" : [{
          "context" : "fmEntry",
          "element" : "resource",
          "variable" : "fmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fernmetastasen",
          "variable" : "fm"
        }],
        "dependent" : [{
          "name" : "MapFernmetastase",
          "variable" : ["fmObs", "fm"]
        }]
      }]
    },
    {
      "name" : "EntryFernmetastasenAlt",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "fmEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '97956-3')"
      }],
      "rule" : [{
        "name" : "CallMapFernmetastaseAlt",
        "source" : [{
          "context" : "fmEntry",
          "element" : "resource",
          "variable" : "fmObs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fernmetastasen",
          "variable" : "fm"
        }],
        "dependent" : [{
          "name" : "MapFernmetastase",
          "variable" : ["fmObs", "fm"]
        }]
      }]
    }]
  },
  {
    "name" : "MapFernmetastase",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapFernmetastase: Observation -> oBDS Fernmetastase (einzeln)\r\nDiagnosedatum und Lokalisation einer Fernmetastase\r\n============================================================================",
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
      "name" : "SetFMDiagnosedatum",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "diagnosedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "MapFMLokalisation",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "TranslateFMLokalisation",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lokalisation",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "MapFMLokalisationValue",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "TranslateFMLokalisationValue",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lokalisation",
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "c"
          },
          {
            "valueString" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation"
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
