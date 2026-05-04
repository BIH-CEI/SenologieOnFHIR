# SenologieToObdsLeistungszustand - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsLeistungszustand**

## StructureMap: SenologieToObdsLeistungszustand 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsLeistungszustand | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsLeistungszustand |

 
title: Senologie ECOG Observation to oBDS Allgemeiner Leistungszustand status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsLeistungszustand",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsLeistungszustand",
  "version" : "0.1.0",
  "name" : "SenologieToObdsLeistungszustand",
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
  "description" : "title: Senologie ECOG Observation to oBDS Allgemeiner Leistungszustand\r\nstatus: draft",
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
    "name" : "MapLeistungszustandFromBundle",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher produces SM_TARGET_PATH\r\nerrors. The element names are correct per the oBDS Logical Model.\r\n============================================================================\r\nGemeinsame Leistungszustand-Map: Extrahiert den ECOG Performance Status\r\naus einer Observation und mappt auf das oBDS-Element allgemeinerLeistungszustand.\r\nWird von Diagnose und Verlauf importiert.\r\nMII Onko Profil: mii-pr-onko-allgemeiner-leistungszustand-ecog\r\nLOINC 89247-1 = \"ECOG Performance Status\"\r\nECOG-Score: 0-4 (direkte Uebernahme), U = unbekannt\r\nDie MII Onko Observation codiert den ECOG-Score als valueCodeableConcept\r\nmit dem Karnofsky/ECOG-CodeSystem.\r\n============================================================================\r\n============================================================================\r\nMapLeistungszustandFromBundle: Bundle -> allgemeinerLeistungszustand\r\nSucht die ECOG-Observation im Bundle und extrahiert den Score\r\n============================================================================",
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
      "name" : "EntryECOG",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "ecogEntry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '89247-1')"
      }],
      "rule" : [{
        "name" : "CallMapLeistungszustand",
        "source" : [{
          "context" : "ecogEntry",
          "element" : "resource",
          "variable" : "ecogObs"
        }],
        "dependent" : [{
          "name" : "MapLeistungszustand",
          "variable" : ["ecogObs", "tgt"]
        }]
      }]
    }]
  },
  {
    "name" : "MapLeistungszustand",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMapLeistungszustand: Observation -> allgemeinerLeistungszustand (code)\r\nExtrahiert den ECOG-Score (0-4) aus der Observation\r\n============================================================================",
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
      "name" : "MapECOGValue",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v"
      }],
      "rule" : [{
        "name" : "ExtractECOGCode",
        "source" : [{
          "context" : "v",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetECOG",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "allgemeinerLeistungszustand",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "cd"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
