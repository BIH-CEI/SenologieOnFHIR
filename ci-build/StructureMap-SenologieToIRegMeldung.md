# SenologieToIRegMeldung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegMeldung**

## StructureMap: SenologieToIRegMeldung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIRegMeldung |

 
title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegMeldung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung",
  "version" : "0.1.0",
  "name" : "SenologieToIRegMeldung",
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
  "description" : "title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator)\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Encounter",
    "mode" : "source",
    "alias" : "Encounter"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Device",
    "mode" : "source",
    "alias" : "Device"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
    "mode" : "target",
    "alias" : "IRegMeldung"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToIRegPatient",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIRegOperation",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIRegEntlassung"],
  "group" : [{
    "name" : "SenologieToIRegMeldung",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups (MapMeldungskopf, MapFall) use\r\n`target tgt : BackboneElement` because FML has no syntax to declare the\r\nspecific Logical Model sub-path when a parent group passes a BackboneElement\r\nslice. The IG Publisher resolves target paths against BackboneElement,\r\nproducing ~20 SM_TARGET_PATH / SM_SOURCE_PATH errors. The element names are\r\ncorrect and match the IRegG Brustimplantat Logical Model. These errors are\r\ncosmetic.\r\n============================================================================\r\nMaster Orchestrator: Bundle -> IRegG Brustimplantat-Meldung\r\nEmpfaengt ein FHIR Bundle mit Senologie-Ressourcen (Patient, Procedure,\r\nDevice, Encounter, Condition, Observations) und erzeugt eine vollstaendige\r\nIRegG-Meldung fuer Brustimplantate.\r\nIm Gegensatz zur oBDS-Transformation (mehrere Meldungen pro Bundle)\r\nerzeugt die IRegG-Meldung eine einzelne GEMeldung pro Behandlungsfall.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "IRegMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallMapMeldungskopf",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldung",
        "variable" : "mel"
      }],
      "dependent" : [{
        "name" : "MapMeldungskopf",
        "variable" : ["src", "mel"]
      }]
    },
    {
      "name" : "EntryEncounter",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Encounter)"
      }],
      "rule" : [{
        "name" : "CallMapFall",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "encounter"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fall",
          "variable" : "fall"
        }],
        "dependent" : [{
          "name" : "MapFall",
          "variable" : ["encounter", "fall", "src"]
        }]
      }]
    }]
  },
  {
    "name" : "MapMeldungskopf",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMeldungskopf: Bundle -> meldung (MEL_*)\r\nEinrichtungskennung, Softwareinfo aus Organization und Bundle-Metadaten\r\n============================================================================",
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
          "name" : "FilterIrdId",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'http://fhir.de/sid/ird/ge-kennung'"
          }],
          "rule" : [{
            "name" : "SetIdEinrichtung",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "idEinrichtung",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterBsnr",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://fhir.de/sid/arge-ik/iknr'"
          }],
          "rule" : [{
            "name" : "SetBsnr",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "bsnr",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetSpezVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "irdSpezVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "4.1.1"
        }]
      }]
    },
    {
      "name" : "SetSwName",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swName",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "Senologie-KDS FHIR IG"
        }]
      }]
    },
    {
      "name" : "SetSwHersteller",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swHersteller",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "BIH at Charite"
        }]
      }]
    },
    {
      "name" : "SetSwVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "swVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0.1.0"
        }]
      }]
    }]
  },
  {
    "name" : "MapFall",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nFall: Encounter -> fall (FAL_*)\r\nAufnahmedatum, Art des Aufenthalts, Transfernummer\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Encounter",
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
      "name" : "MapAufnahmedatum",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetAufnahmedatum",
        "source" : [{
          "context" : "period",
          "element" : "start",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "aufnahmedatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "MapArtAufenthalt",
      "source" : [{
        "context" : "src",
        "element" : "class",
        "variable" : "cls"
      }],
      "rule" : [{
        "name" : "SetAufenthaltStationaer",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'IMP'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      },
      {
        "name" : "SetAufenthaltTeilstationaer",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'SS'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "2"
          }]
        }]
      },
      {
        "name" : "SetAufenthaltAmbulant",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'AMB'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "artAufenthaltSchluessel",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "3"
          }]
        }]
      }]
    },
    {
      "name" : "MapTransfernummer",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system = 'http://fhir.de/sid/ird/transfernummer'"
      }],
      "rule" : [{
        "name" : "SetTransfernummer",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "transfernummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetSatzErstellung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datumZeitSatzErstellung",
        "transform" : "evaluate",
        "parameter" : [{
          "valueId" : "src"
        },
        {
          "valueString" : "now()"
        }]
      }]
    },
    {
      "name" : "MapVersionsnummer",
      "source" : [{
        "context" : "src",
        "element" : "meta",
        "variable" : "meta"
      }],
      "rule" : [{
        "name" : "SetVersionsnummer",
        "source" : [{
          "context" : "meta",
          "element" : "versionId",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "versionsnummer",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "EntryAusloeser",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure)"
      }],
      "rule" : [{
        "name" : "AusloeserProcContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "rule" : [{
          "name" : "MapAusloeserCode",
          "source" : [{
            "context" : "procedure",
            "element" : "code",
            "variable" : "code"
          }],
          "rule" : [{
            "name" : "MapAusloeserCoding",
            "source" : [{
              "context" : "code",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/ops'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "ausloeser",
              "variable" : "ausl"
            }],
            "rule" : [{
              "name" : "SetAusloeserOPS",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ausl",
                "contextType" : "variable",
                "element" : "prozedurenSchluessel",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryPatient",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Patient)"
      }],
      "rule" : [{
        "name" : "CallMapPatientenaufnahme",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "patientenaufnahme",
          "variable" : "pat"
        }],
        "dependent" : [{
          "name" : "MapPatientenaufnahme",
          "variable" : ["patient", "pat", "bundle"]
        }]
      }]
    },
    {
      "name" : "EntryOperation",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
      }],
      "rule" : [{
        "name" : "CallMapOperation",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "operation",
          "variable" : "op"
        }],
        "dependent" : [{
          "name" : "MapOperation",
          "variable" : ["procedure", "op", "bundle"]
        }]
      }]
    },
    {
      "name" : "CallMapEntlassung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "entlassung",
        "variable" : "entl"
      }],
      "dependent" : [{
        "name" : "MapEntlassung",
        "variable" : ["src", "entl", "bundle"]
      }]
    }]
  }]
}

```
