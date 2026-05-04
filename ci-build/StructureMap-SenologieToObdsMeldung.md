# SenologieToObdsMeldung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToObdsMeldung**

## StructureMap: SenologieToObdsMeldung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToObdsMeldung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToObdsMeldung |

 
title: Senologie FHIR Bundle to oBDS Meldung (Master Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToObdsMeldung",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToObdsMeldung",
  "version" : "0.1.0",
  "name" : "SenologieToObdsMeldung",
  "status" : "draft",
  "date" : "2026-05-04T12:11:06+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie FHIR Bundle to oBDS Meldung (Master Orchestrator)\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition",
    "mode" : "source",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
    "mode" : "source",
    "alias" : "CarePlan"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Patient",
    "mode" : "source",
    "alias" : "Patient"
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
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorzuordnung",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsOP",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsSYST",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsST",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTumorkonferenz",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsVerlauf",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTod",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsTNM",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsHistologie",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsModulMamma",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsFernmetastasen",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsResidualstatus",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsNebenwirkung",
  "https://www.senologie.org/fhir/StructureMap/SenologieToObdsLeistungszustand"],
  "group" : [{
    "name" : "SenologieToObdsMeldung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMaster Orchestrator: Bundle -> oBDS Meldung\r\nEmpfaengt ein FHIR Bundle mit allen Ressourcen eines Patienten und\r\ndispatcht an die jeweiligen Teil-Maps basierend auf Ressourcentyp und Profil.\r\nJede Ressource erzeugt eine separate oBDS-Meldung:\r\n- Condition (Erstdiagnose)         -> Diagnosemeldung\r\n- Condition (Rezidiv)              -> Verlaufsmeldung\r\n- Procedure (Operation)            -> OP-Meldung\r\n- Procedure (Systemtherapie)       -> SYST-Meldung\r\n- Procedure (Strahlentherapie)     -> ST-Meldung\r\n- CarePlan (Tumorboard)            -> Tumorkonferenzmeldung\r\n- Patient (verstorben)             -> Todesmeldung\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OBDSMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallSetMeldungMetadata",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "SetMeldungMetadata",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "EntryDiagnose",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition) and resource.meta.profile.exists($this.contains('senologie-diagnose')) and resource.clinicalStatus.coding.exists(code = 'recurrence').not()"
      }],
      "rule" : [{
        "name" : "DiagnoseConditionContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "rule" : [{
          "name" : "DiagnoseTZ",
          "source" : [{
            "context" : "condition"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "tumorzuordnung",
            "variable" : "tz"
          }],
          "dependent" : [{
            "name" : "MapTumorzuordnung",
            "variable" : ["condition", "tz"]
          }]
        },
        {
          "name" : "DiagnoseDX",
          "source" : [{
            "context" : "condition"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "diagnose",
            "variable" : "dx"
          }],
          "dependent" : [{
            "name" : "MapDiagnose",
            "variable" : ["condition", "dx"]
          }]
        }]
      },
      {
        "name" : "DiagEntryHisto",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "histEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59847-4')"
        }],
        "rule" : [{
          "name" : "DiagCallHisto",
          "source" : [{
            "context" : "histEntry",
            "element" : "resource",
            "variable" : "histObs"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "diagnose",
            "variable" : "dx"
          },
          {
            "context" : "dx",
            "contextType" : "variable",
            "element" : "histologie",
            "variable" : "histo"
          }],
          "dependent" : [{
            "name" : "MapHistologie",
            "variable" : ["histObs", "histo"]
          }]
        }]
      },
      {
        "name" : "DiagEntryCTNM",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "tnmEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21908-9')"
        }],
        "rule" : [{
          "name" : "DiagCallCTNM",
          "source" : [{
            "context" : "tnmEntry",
            "element" : "resource",
            "variable" : "tnmObs"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "diagnose",
            "variable" : "dx"
          },
          {
            "context" : "dx",
            "contextType" : "variable",
            "element" : "cTNM",
            "variable" : "ctnm"
          }],
          "dependent" : [{
            "name" : "MapTNM",
            "variable" : ["tnmObs", "ctnm"]
          }]
        }]
      },
      {
        "name" : "DiagCallECOG",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cond2"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "diagnose",
          "variable" : "dx"
        }],
        "dependent" : [{
          "name" : "MapLeistungszustandFromBundle",
          "variable" : ["src", "dx"]
        }]
      },
      {
        "name" : "DiagCallModulMamma",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cond3"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "diagnose",
          "variable" : "dx"
        },
        {
          "context" : "dx",
          "contextType" : "variable",
          "element" : "modulMamma",
          "variable" : "mamma"
        }],
        "dependent" : [{
          "name" : "MapModulMamma",
          "variable" : ["src", "mamma"]
        }]
      },
      {
        "name" : "DiagEntryWK",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "raEntry",
          "condition" : "resource.is(RiskAssessment)"
        }],
        "rule" : [{
          "name" : "DiagCallWK",
          "source" : [{
            "context" : "raEntry",
            "element" : "resource",
            "variable" : "ra"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "diagnose",
            "variable" : "dx"
          },
          {
            "context" : "dx",
            "contextType" : "variable",
            "element" : "weitereKlassifikationen",
            "variable" : "wk"
          }],
          "dependent" : [{
            "name" : "MapWeitereKlassifikation",
            "variable" : ["ra", "wk"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryVerlauf",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition) and resource.clinicalStatus.coding.exists(code = 'recurrence')"
      }],
      "rule" : [{
        "name" : "VerlaufConditionContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "rule" : [{
          "name" : "VerlaufTZ",
          "source" : [{
            "context" : "condition"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "tumorzuordnung",
            "variable" : "tz"
          }],
          "dependent" : [{
            "name" : "MapTumorzuordnung",
            "variable" : ["condition", "tz"]
          }]
        },
        {
          "name" : "VerlaufMap",
          "source" : [{
            "context" : "condition"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "verlauf",
            "variable" : "verl"
          }],
          "dependent" : [{
            "name" : "MapVerlauf",
            "variable" : ["condition", "verl"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryOP",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-operation') or $this.contains('senologie-brustop'))"
      }],
      "rule" : [{
        "name" : "OPProcedureContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "rule" : [{
          "name" : "OPMap",
          "source" : [{
            "context" : "procedure"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "op",
            "variable" : "op"
          }],
          "dependent" : [{
            "name" : "MapOP",
            "variable" : ["procedure", "op"]
          }]
        }]
      },
      {
        "name" : "OPEntryHisto",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "histEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59847-4')"
        }],
        "rule" : [{
          "name" : "OPCallHisto",
          "source" : [{
            "context" : "histEntry",
            "element" : "resource",
            "variable" : "histObs"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "op",
            "variable" : "op"
          },
          {
            "context" : "op",
            "contextType" : "variable",
            "element" : "histologie",
            "variable" : "histo"
          }],
          "dependent" : [{
            "name" : "MapHistologie",
            "variable" : ["histObs", "histo"]
          }]
        }]
      },
      {
        "name" : "OPEntryPTNM",
        "source" : [{
          "context" : "src",
          "element" : "entry",
          "variable" : "tnmEntry",
          "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
        }],
        "rule" : [{
          "name" : "OPCallPTNM",
          "source" : [{
            "context" : "tnmEntry",
            "element" : "resource",
            "variable" : "tnmObs"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "op",
            "variable" : "op"
          },
          {
            "context" : "op",
            "contextType" : "variable",
            "element" : "tnm",
            "variable" : "ptnm"
          }],
          "dependent" : [{
            "name" : "MapTNM",
            "variable" : ["tnmObs", "ptnm"]
          }]
        }]
      },
      {
        "name" : "OPCallModulMamma",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc2"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "op",
          "variable" : "op"
        },
        {
          "context" : "op",
          "contextType" : "variable",
          "element" : "modulMamma",
          "variable" : "mamma"
        }],
        "dependent" : [{
          "name" : "MapModulMamma",
          "variable" : ["src", "mamma"]
        }]
      }]
    },
    {
      "name" : "EntrySYST",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie-procedure'))"
      }],
      "rule" : [{
        "name" : "SYSTProcedureContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "rule" : [{
          "name" : "SYSTMap",
          "source" : [{
            "context" : "procedure"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "syst",
            "variable" : "syst"
          }],
          "dependent" : [{
            "name" : "MapSYST",
            "variable" : ["procedure", "syst"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryST",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-strahlentherapie'))"
      }],
      "rule" : [{
        "name" : "STProcedureContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "rule" : [{
          "name" : "STMap",
          "source" : [{
            "context" : "procedure"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "st",
            "variable" : "st"
          }],
          "dependent" : [{
            "name" : "MapST",
            "variable" : ["procedure", "st"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryTumorkonferenz",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(CarePlan) and resource.meta.profile.exists($this.contains('senologie-tumorboard-empfehlung'))"
      }],
      "rule" : [{
        "name" : "TumorkonferenzCarePlanContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "careplan"
        }],
        "rule" : [{
          "name" : "TumorkonferenzMap",
          "source" : [{
            "context" : "careplan"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "tumorkonferenz",
            "variable" : "tk"
          }],
          "dependent" : [{
            "name" : "MapTumorkonferenz",
            "variable" : ["careplan", "tk"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryTod",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Patient) and resource.deceased.exists()"
      }],
      "rule" : [{
        "name" : "TodPatientContext",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "rule" : [{
          "name" : "TodMap",
          "source" : [{
            "context" : "patient"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "tod",
            "variable" : "tod"
          }],
          "dependent" : [{
            "name" : "MapTod",
            "variable" : ["patient", "tod"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "SetMeldungMetadata",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nSetMeldungMetadata: Meldungs-Metadaten erzeugen\r\nmeldungID, melderID, meldebegruendung, eigeneLeistung\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OBDSMeldung",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MapMeldungID",
      "source" : [{
        "context" : "src",
        "element" : "identifier",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "SetMeldungIDFromIdentifier",
        "source" : [{
          "context" : "id",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "meldungID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "v"
          }]
        }]
      }]
    },
    {
      "name" : "SetMeldungIDGenerated",
      "source" : [{
        "context" : "src",
        "condition" : "identifier.exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldungID",
        "transform" : "uuid"
      }]
    },
    {
      "name" : "MapMelderID",
      "source" : [{
        "context" : "src",
        "element" : "meta",
        "variable" : "meta"
      }],
      "rule" : [{
        "name" : "SetMelderIDFromSource",
        "source" : [{
          "context" : "meta",
          "element" : "source",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "melderID",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "SetMeldebegruendung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meldebegruendung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "I"
        }]
      }]
    },
    {
      "name" : "SetEigeneLeistung",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "eigeneLeistung",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "J"
        }]
      }]
    }]
  }]
}

```
