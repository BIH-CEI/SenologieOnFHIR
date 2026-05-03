# SenologieToIqtigBasis - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigBasis**

## StructureMap: SenologieToIqtigBasis 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBasis | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:SenologieToIqtigBasis |

 
title: Senologie Patient + Encounter to IQTIG 18.1 Teildatensatz Basis status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigBasis",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBasis",
  "version" : "0.1.0",
  "name" : "SenologieToIqtigBasis",
  "status" : "draft",
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Patient + Encounter to IQTIG 18.1 Teildatensatz Basis\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "mode" : "source",
    "alias" : "Organization"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
    "mode" : "target",
    "alias" : "IQTIG181"
  }],
  "group" : [{
    "name" : "MapBasis",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the IQTIG 18.1 Logical Model.\r\n============================================================================\r\nTeildatensatz Basis (B): Patient + Encounter + Organization -> B:*\r\nEnthaelt die administrativen und demografischen Pflichtfelder fuer die\r\nIQTIG-QS-Meldung (Institutionskennzeichen, Pseudonym-ID, Geburtsdatum,\r\nGeschlecht, Aufnahme/Entlassung).\r\nDie Pseudonymisierung der Versicherten-ID wird von der Vertrauensstelle\r\nuebernommen; hier wird lediglich die bereits pseudonymisierte ID uebertragen.\r\n============================================================================",
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
          "name" : "FilterIKNR",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'https://fhir.de/sid/arge-ik/iknr'"
          }],
          "rule" : [{
            "name" : "SetIKNRKH",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "institutionskennzeichen",
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
            "name" : "SetStandort",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "entlassenderStandort",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        },
        {
          "name" : "FilterBSNR",
          "source" : [{
            "context" : "org",
            "element" : "identifier",
            "variable" : "id",
            "condition" : "system = 'http://fhir.de/sid/kbv/bsnr'"
          }],
          "rule" : [{
            "name" : "SetBSNR",
            "source" : [{
              "context" : "id",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "betriebsstaettennummer",
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
      "name" : "SetDatensatzVersion",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datensatzVersion",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "18.1_2024_V05"
        }]
      }]
    },
    {
      "name" : "EntryPatient",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Patient)"
      }],
      "rule" : [{
        "name" : "CallMapBasisPatient",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "dependent" : [{
          "name" : "MapBasisPatient",
          "variable" : ["patient", "tgt"]
        }]
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
        "name" : "CallMapBasisEncounter",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "encounter"
        }],
        "dependent" : [{
          "name" : "MapBasisEncounter",
          "variable" : ["encounter", "tgt"]
        }]
      }]
    }]
  },
  {
    "name" : "MapBasisPatient",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nPatient -> B:VERSICHERTENIDNEU, B:GEBDATUM, B:GESCHLECHT, B:PLZ\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Patient",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapPseudonymId",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system = 'http://fhir.de/sid/gkv/kvid-10'"
      }],
      "rule" : [{
        "name" : "SetPseudonymId",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pseudonymId",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "MapPseudonymIdFallback",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id",
        "condition" : "system.contains('pseudonym') or system.contains('pid')"
      }],
      "rule" : [{
        "name" : "SetPseudonymIdFallback",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pseudonymId",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetGeburtsdatum",
      "source" : [{
        "context" : "src",
        "element" : "birthDate",
        "variable" : "bd"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geburtsdatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "bd"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtM",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'male'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlecht",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtF",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'female'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlecht",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "2"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtX",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'other'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlecht",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "8"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtU",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'unknown'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlecht",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "9"
        }]
      }]
    },
    {
      "name" : "MapPLZ",
      "source" : [{
        "context" : "src",
        "element" : "address",
        "variable" : "addr"
      }],
      "rule" : [{
        "name" : "SetPLZ",
        "source" : [{
          "context" : "addr",
          "element" : "postalCode",
          "variable" : "plz"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "postleitzahl",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "plz"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapBasisEncounter",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nEncounter -> B:AUFNDATUM, B:ENTLDATUM, B:AUFNGRUND, B:AUFNANLASS, B:ENTLGRUND\r\n============================================================================",
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
      "name" : "MapFallId",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetFallId",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fallId",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
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
      "name" : "MapEntlassungsdatum",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetEntlassungsdatum",
        "source" : [{
          "context" : "period",
          "element" : "end",
          "variable" : "e"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "entlassungsdatum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "e"
          }]
        }]
      }]
    },
    {
      "name" : "MapAufnahmeanlass",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://gematik.de/fhir/isik/StructureDefinition/ISiKAufnahmeanlass'"
      }],
      "rule" : [{
        "name" : "MapAufnahmeanlassValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapAufnahmeanlassCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetAufnahmeanlass",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "aufnahmeanlass",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapAufnahmegrund",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'http://fhir.de/StructureDefinition/Aufnahmegrund'"
      }],
      "rule" : [{
        "name" : "MapAufnahmegrundValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapAufnahmegrundCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetAufnahmegrund",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "aufnahmegrund",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapEntlassungsgrund",
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
            "variable" : "c"
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
              "element" : "entlassungsgrund",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }]
    }]
  }]
}

```
