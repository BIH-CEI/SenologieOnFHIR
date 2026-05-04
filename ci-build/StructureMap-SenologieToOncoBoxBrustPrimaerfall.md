# SenologieToOncoBoxBrustPrimaerfall - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustPrimaerfall**

## StructureMap: SenologieToOncoBoxBrustPrimaerfall 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustPrimaerfall | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrustPrimaerfall |

 
title: Senologie Condition + Patient + Encounter to OncoBox Brust Primaerfall status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustPrimaerfall",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustPrimaerfall",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustPrimaerfall",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Condition + Patient + Encounter to OncoBox Brust Primaerfall\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/ResearchSubject",
    "mode" : "source",
    "alias" : "ResearchSubject"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustOperation",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustTherapie",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustVerlauf"],
  "group" : [{
    "name" : "MapPrimaerfall",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the OncoBox Brust Logical Model.\r\n============================================================================\r\nPrimaerfall: Condition (Brust-Diagnose) + Patient + Encounter -> Primaerfall\r\nPro Primaerfall (Condition mit ICD-10 aus dem Mamma-Spektrum) werden\r\nPatientendaten, Fall-Daten, Diagnose-Block und Therapie-Subblocks befuellt.\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Condition",
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
      "name" : "SetFallId",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "cid"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "fallId",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "cid"
        }]
      }]
    },
    {
      "name" : "MapPrimaerfallart",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapPrimaerfallartICD",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "rule" : [{
          "name" : "SetPfArtInvasiv",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('C50')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "primaerfallart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetPfArtDCIS",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D05')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "primaerfallart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetPfArtRisiko",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('Z40')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "primaerfallart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "7"
            }]
          }]
        },
        {
          "name" : "SetPfArtRekon",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('Z42')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "primaerfallart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "8"
            }]
          }]
        },
        {
          "name" : "SetPfArtBenigne",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D24')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "primaerfallart",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "9"
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
        "name" : "CallMapPatient",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "patient",
          "variable" : "pat"
        }],
        "dependent" : [{
          "name" : "MapPatient",
          "variable" : ["patient", "pat", "bundle"]
        }]
      },
      {
        "name" : "PseudCtx",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "patient"
        }],
        "rule" : [{
          "name" : "SetPatientPseudonym",
          "source" : [{
            "context" : "patient",
            "element" : "id",
            "variable" : "pid"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "patientPseudonym",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "pid"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryEncounter",
      "source" : [{
        "context" : "bundle",
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
          "variable" : ["encounter", "fall"]
        }]
      }]
    },
    {
      "name" : "CallMapDiagnose",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "diagnose",
        "variable" : "diag"
      }],
      "dependent" : [{
        "name" : "MapDiagnose",
        "variable" : ["src", "diag", "bundle"]
      }]
    },
    {
      "name" : "EntryOperation",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-brustop') or $this.contains('senologie-operation'))"
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
      "name" : "EntrySystemtherapie",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie-procedure'))"
      }],
      "rule" : [{
        "name" : "CallMapSystemtherapie",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "systemtherapie",
          "variable" : "syst"
        }],
        "dependent" : [{
          "name" : "MapSystemtherapie",
          "variable" : ["procedure", "syst", "bundle"]
        }]
      }]
    },
    {
      "name" : "EntryEndoTherapie",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-systemtherapie-procedure'))"
      }],
      "rule" : [{
        "name" : "CheckHO",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure",
          "condition" : "code.coding.exists((system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ') and (code = 'HO'))"
        }],
        "rule" : [{
          "name" : "CallMapEndoTherapie",
          "source" : [{
            "context" : "procedure"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "endokrineTherapie",
            "variable" : "endo"
          }],
          "dependent" : [{
            "name" : "MapEndokrineTherapie",
            "variable" : ["procedure", "endo", "bundle"]
          }]
        }]
      }]
    },
    {
      "name" : "EntryRT",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-strahlentherapie'))"
      }],
      "rule" : [{
        "name" : "CallMapStrahlentherapie",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "procedure"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "strahlentherapie",
          "variable" : "rt"
        }],
        "dependent" : [{
          "name" : "MapStrahlentherapie",
          "variable" : ["procedure", "rt", "bundle"]
        }]
      }]
    },
    {
      "name" : "EntryTK",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(CarePlan) and resource.meta.profile.exists($this.contains('senologie-tumorboard'))"
      }],
      "rule" : [{
        "name" : "CallMapTK",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "cp"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "tumorkonferenz",
          "variable" : "tk"
        }],
        "dependent" : [{
          "name" : "MapTumorkonferenz",
          "variable" : ["cp", "tk"]
        }]
      }]
    },
    {
      "name" : "EntryPsychoonko",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Procedure) and resource.meta.profile.exists($this.contains('senologie-psychoonkologie'))"
      }],
      "rule" : [{
        "name" : "CallMapPsych",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "proc"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "psychoonkologie",
          "variable" : "psych"
        }],
        "dependent" : [{
          "name" : "MapPsychoonkologie",
          "variable" : ["proc", "psych"]
        }]
      }]
    },
    {
      "name" : "EntryResearchSubject",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(ResearchSubject)"
      }],
      "rule" : [{
        "name" : "CallMapStud",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "rs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "studienteilnahme",
          "variable" : "stud"
        }],
        "dependent" : [{
          "name" : "MapStudienteilnahme",
          "variable" : ["rs", "stud"]
        }]
      }]
    },
    {
      "name" : "CallMapVerlauf",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "MapVerlaufFromBundle",
        "variable" : ["bundle", "tgt"]
      }]
    }]
  },
  {
    "name" : "MapPatient",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nPatient -> Patient-Block (Geburtsdatum, Geschlecht, PLZ, Menopausenstatus)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Patient",
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
      "name" : "SetPatGebdat",
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
      "name" : "SetPatGeschlW",
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
          "valueString" : "W"
        }]
      }]
    },
    {
      "name" : "SetPatGeschlM",
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
          "valueString" : "M"
        }]
      }]
    },
    {
      "name" : "SetPatGeschlD",
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
          "valueString" : "D"
        }]
      }]
    },
    {
      "name" : "SetPatGeschlU",
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
          "valueString" : "U"
        }]
      }]
    },
    {
      "name" : "MapPatPLZ",
      "source" : [{
        "context" : "src",
        "element" : "address",
        "variable" : "addr"
      }],
      "rule" : [{
        "name" : "SetPatPLZ",
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
    },
    {
      "name" : "EntryMeno",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '86805-9')"
      }],
      "rule" : [{
        "name" : "MapMenoObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "rule" : [{
          "name" : "MapMenoVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapMenoCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetMenoPrae",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '289903006'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "menopausenstatus",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "1"
                }]
              }]
            },
            {
              "name" : "SetMenoPeri",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '289904000'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "menopausenstatus",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "2"
                }]
              }]
            },
            {
              "name" : "SetMenoPost",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '76977008'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "menopausenstatus",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "3"
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapFall",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nFall -> Fall-Block (Typ, Aufnahme/Entlassung)\r\n============================================================================",
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
      "name" : "MapFallTyp",
      "source" : [{
        "context" : "src",
        "element" : "class",
        "variable" : "cls"
      }],
      "rule" : [{
        "name" : "SetFallTypStat",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'IMP'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fallTyp",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "1"
          }]
        }]
      },
      {
        "name" : "SetFallTypAmb",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'AMB'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fallTyp",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "2"
          }]
        }]
      },
      {
        "name" : "SetFallTypTeilstat",
        "source" : [{
          "context" : "cls",
          "element" : "code",
          "variable" : "cd",
          "condition" : "$this = 'SS'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "fallTyp",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "3"
          }]
        }]
      }]
    },
    {
      "name" : "MapFallPeriod",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetFallAufn",
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
      },
      {
        "name" : "SetFallEntl",
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
    }]
  },
  {
    "name" : "MapDiagnose",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nDiagnose -> Diagnose-Block\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Condition",
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
      "name" : "SetDiagDatum",
      "source" : [{
        "context" : "src",
        "element" : "onset",
        "variable" : "on",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "diagnosedatum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "on"
        }]
      }]
    },
    {
      "name" : "MapDiagICD",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapDiagICDCoding",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "diagnoseICD",
          "variable" : "icd"
        }],
        "rule" : [{
          "name" : "SetDiagICDCode",
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
          "name" : "SetDiagICDVersion",
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
      "name" : "MapDignitaet",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "MapDignICD",
        "source" : [{
          "context" : "code",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'"
        }],
        "rule" : [{
          "name" : "SetDignMaligne",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('C50')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "dignitaet",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetDignInSitu",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D05')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "dignitaet",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetDignBenigne",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this.startsWith('D24')"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "dignitaet",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapDiagSeite",
      "source" : [{
        "context" : "src",
        "element" : "bodySite",
        "variable" : "bs"
      }],
      "rule" : [{
        "name" : "MapDiagSeiteSCT",
        "source" : [{
          "context" : "bs",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetDiagSeiteR",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '24028007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "R"
            }]
          }]
        },
        {
          "name" : "SetDiagSeiteL",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '7771000'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "L"
            }]
          }]
        },
        {
          "name" : "SetDiagSeiteB",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '51440002'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "seitenlokalisation",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "B"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "SetHistPraeopDefault",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "histologischeSicherungPraeop",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0"
        }]
      }]
    },
    {
      "name" : "EntryHistPraeop",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Specimen) and resource.meta.profile.exists($this.contains('senologie-pathologie-praeparat'))"
      }],
      "rule" : [{
        "name" : "MapHistPraeopSpec",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "specimen"
        }],
        "rule" : [{
          "name" : "MapHistPraeopType",
          "source" : [{
            "context" : "specimen",
            "element" : "type",
            "variable" : "t"
          }],
          "rule" : [{
            "name" : "SetHistPraeopStanz",
            "source" : [{
              "context" : "t",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '122737001'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "histologischeSicherungPraeop",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "1"
              }]
            }]
          },
          {
            "name" : "SetHistPraeopVakuum",
            "source" : [{
              "context" : "t",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '399014008'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "histologischeSicherungPraeop",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "2"
              }]
            }]
          },
          {
            "name" : "SetHistPraeopFNA",
            "source" : [{
              "context" : "t",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '119342007'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "histologischeSicherungPraeop",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "3"
              }]
            }]
          },
          {
            "name" : "SetHistPraeopOffen",
            "source" : [{
              "context" : "t",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '119380005'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "histologischeSicherungPraeop",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "4"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryBg",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.meta.profile.exists($this.contains('senologie-bildgebung'))"
      }],
      "rule" : [{
        "name" : "CallMapBg",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "bildgebung",
          "variable" : "bg"
        }],
        "dependent" : [{
          "name" : "MapBildgebung",
          "variable" : ["obs", "bg"]
        }]
      }]
    },
    {
      "name" : "EntryCT",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21905-5')"
      }],
      "rule" : [{
        "name" : "MapCT",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "rule" : [{
          "name" : "MapCTVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCTCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCT",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ctnm",
                "contextType" : "variable",
                "element" : "cT",
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
      "name" : "EntryCN",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21906-3')"
      }],
      "rule" : [{
        "name" : "MapCN",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "rule" : [{
          "name" : "MapCNVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCNCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCN",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ctnm",
                "contextType" : "variable",
                "element" : "cN",
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
      "name" : "EntryCM",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21907-1')"
      }],
      "rule" : [{
        "name" : "MapCM",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "rule" : [{
          "name" : "MapCMVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapCMCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCM",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ctnm",
                "contextType" : "variable",
                "element" : "cM",
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
      "name" : "EntryTGKlin",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44648-0')"
      }],
      "rule" : [{
        "name" : "MapTGKlin",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "rule" : [{
          "name" : "MapTGKlinVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetTGKlin",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "ctnm",
              "contextType" : "variable",
              "element" : "tumorgroesseKlinisch",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryPT",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21899-0')"
      }],
      "rule" : [{
        "name" : "MapPT",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapPTVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapPTCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetPT",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ptnm",
                "contextType" : "variable",
                "element" : "pT",
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
      "name" : "EntryPN",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21900-6')"
      }],
      "rule" : [{
        "name" : "MapPN",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapPNVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapPNCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetPN",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ptnm",
                "contextType" : "variable",
                "element" : "pN",
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
      "name" : "EntryPM",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21901-4')"
      }],
      "rule" : [{
        "name" : "MapPM",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapPMVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapPMCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetPM",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ptnm",
                "contextType" : "variable",
                "element" : "pM",
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
      "name" : "EntryTGInv",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33728-7')"
      }],
      "rule" : [{
        "name" : "MapTGInv",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapTGInvVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetTGInv",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "ptnm",
              "contextType" : "variable",
              "element" : "tumorgroesseInvasiv",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryCTNMDetail",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21908-9')"
      }],
      "rule" : [{
        "name" : "MapCTNMDetail",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "cTNM",
          "variable" : "ctnm"
        }],
        "rule" : [{
          "name" : "MapCTNMVersion",
          "source" : [{
            "context" : "obs",
            "element" : "method",
            "variable" : "method"
          }],
          "rule" : [{
            "name" : "ExtractCTNMVersionCode",
            "source" : [{
              "context" : "method",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCTNMVersion",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ctnm",
                "contextType" : "variable",
                "element" : "tnmVersion",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "MapCUICC",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "ExtractCUICC",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetCUICC",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ctnm",
                "contextType" : "variable",
                "element" : "uiccStadium",
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
      "name" : "EntryPTNMDetail",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21902-2')"
      }],
      "rule" : [{
        "name" : "MapPTNMDetail",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapPTNMVersion",
          "source" : [{
            "context" : "obs",
            "element" : "method",
            "variable" : "method"
          }],
          "rule" : [{
            "name" : "ExtractPTNMVersionCode",
            "source" : [{
              "context" : "method",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetPTNMVersion",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ptnm",
                "contextType" : "variable",
                "element" : "tnmVersion",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "MapPUICC",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "ExtractPUICC",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetPUICC",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "ptnm",
                "contextType" : "variable",
                "element" : "uiccStadium",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "MapYSymbol",
          "source" : [{
            "context" : "obs",
            "element" : "component",
            "variable" : "comp",
            "condition" : "code.coding.exists(code = '59479-6')"
          }],
          "rule" : [{
            "name" : "MapYValue",
            "source" : [{
              "context" : "comp",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "ExtractYCode",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetYSymbol",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "ySymbol",
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
          "name" : "MapLKat",
          "source" : [{
            "context" : "obs",
            "element" : "component",
            "variable" : "comp",
            "condition" : "code.coding.exists(code = '33739-4')"
          }],
          "rule" : [{
            "name" : "MapLValue",
            "source" : [{
              "context" : "comp",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "ExtractLCode",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetLKat",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "l",
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
          "name" : "MapVKat",
          "source" : [{
            "context" : "obs",
            "element" : "component",
            "variable" : "comp",
            "condition" : "code.coding.exists(code = '33740-2')"
          }],
          "rule" : [{
            "name" : "MapVValue",
            "source" : [{
              "context" : "comp",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "ExtractVCode",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetVKat",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "v",
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
          "name" : "MapPnKat",
          "source" : [{
            "context" : "obs",
            "element" : "component",
            "variable" : "comp",
            "condition" : "code.coding.exists(code = '92837-4')"
          }],
          "rule" : [{
            "name" : "MapPnValue",
            "source" : [{
              "context" : "comp",
              "element" : "value",
              "variable" : "val"
            }],
            "rule" : [{
              "name" : "ExtractPnCode",
              "source" : [{
                "context" : "val",
                "element" : "coding",
                "variable" : "c"
              }],
              "rule" : [{
                "name" : "SetPnKat",
                "source" : [{
                  "context" : "c",
                  "element" : "code",
                  "variable" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "pn",
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
    },
    {
      "name" : "EntryTGDCIS",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44648-0') and resource.meta.profile.exists($this.contains('pathologie'))"
      }],
      "rule" : [{
        "name" : "MapTGDCIS",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "pTNM",
          "variable" : "ptnm"
        }],
        "rule" : [{
          "name" : "MapTGDCISVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetTGDCIS",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "ptnm",
              "contextType" : "variable",
              "element" : "tumorgroesseDCIS",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryMultifokal",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '44638-1')"
      }],
      "rule" : [{
        "name" : "MapMFObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "rule" : [{
          "name" : "MapMFValue",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapMFCoding",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "WrapMFNein",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '56061002'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "pTNM",
                "variable" : "ptnm"
              }],
              "rule" : [{
                "name" : "SetMFNein",
                "source" : [{
                  "context" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "0"
                  }]
                }]
              }]
            },
            {
              "name" : "WrapMFMultifokal",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '399566009'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "pTNM",
                "variable" : "ptnm"
              }],
              "rule" : [{
                "name" : "SetMFMultifokal",
                "source" : [{
                  "context" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "1"
                  }]
                }]
              }]
            },
            {
              "name" : "WrapMFMultizentrisch",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd",
                "condition" : "$this = '367651003'"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "pTNM",
                "variable" : "ptnm"
              }],
              "rule" : [{
                "name" : "SetMFMultizentrisch",
                "source" : [{
                  "context" : "cd"
                }],
                "target" : [{
                  "context" : "ptnm",
                  "contextType" : "variable",
                  "element" : "multifokalitaet",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "2"
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryHistologie",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '59847-4')"
      }],
      "rule" : [{
        "name" : "MapHistObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "rule" : [{
          "name" : "MapHistValue",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapHistICDO",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "system = 'urn:oid:2.16.840.1.113883.6.43.1'"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "diagnoseICDO",
              "variable" : "icdo"
            }],
            "rule" : [{
              "name" : "SetHistCode",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "icdo",
                "contextType" : "variable",
                "element" : "code",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "cd"
                }]
              }]
            },
            {
              "name" : "SetHistVersion",
              "source" : [{
                "context" : "c",
                "element" : "version",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "icdo",
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
    },
    {
      "name" : "EntryGrading",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '33732-9')"
      }],
      "rule" : [{
        "name" : "MapGradingObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "rule" : [{
          "name" : "MapGradingVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "MapGrading",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c"
            }],
            "rule" : [{
              "name" : "SetGrading",
              "source" : [{
                "context" : "c",
                "element" : "code",
                "variable" : "cd"
              }],
              "target" : [{
                "context" : "tgt",
                "contextType" : "variable",
                "element" : "grading",
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
      "name" : "EntryLKUnt",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21894-1')"
      }],
      "rule" : [{
        "name" : "MapLKUnt",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lymphknoten",
          "variable" : "lk"
        }],
        "rule" : [{
          "name" : "MapLKUntVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetLKUnt",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "lk",
              "contextType" : "variable",
              "element" : "untersucht",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryLKBef",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '21893-3')"
      }],
      "rule" : [{
        "name" : "MapLKBef",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lymphknoten",
          "variable" : "lk"
        }],
        "rule" : [{
          "name" : "MapLKBefVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetLKBef",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "lk",
              "contextType" : "variable",
              "element" : "befallen",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntrySLKUnt",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92832-5')"
      }],
      "rule" : [{
        "name" : "MapSLKUnt",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lymphknoten",
          "variable" : "lk"
        }],
        "rule" : [{
          "name" : "MapSLKUntVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetSLKUnt",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "lk",
              "contextType" : "variable",
              "element" : "sentinelUntersucht",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntrySLKBef",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '92833-3')"
      }],
      "rule" : [{
        "name" : "MapSLKBef",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "lymphknoten",
          "variable" : "lk"
        }],
        "rule" : [{
          "name" : "MapSLKBefVal",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetSLKBef",
            "source" : [{
              "context" : "val",
              "element" : "value",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "lk",
              "contextType" : "variable",
              "element" : "sentinelBefallen",
              "transform" : "truncate",
              "parameter" : [{
                "valueId" : "v"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryER",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85337-4')"
      }],
      "rule" : [{
        "name" : "MapERObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "rezeptorstatus",
          "variable" : "rez"
        }],
        "rule" : [{
          "name" : "MapER",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetERPositiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "erStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetERNegativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "erStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetERUnbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "erStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryPR",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85339-0')"
      }],
      "rule" : [{
        "name" : "MapPRObs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "rezeptorstatus",
          "variable" : "rez"
        }],
        "rule" : [{
          "name" : "MapPR",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetPRPositiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "prStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetPRNegativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "prStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetPRUnbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "prStatus",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "EntryHER2",
      "source" : [{
        "context" : "bundle",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Observation) and resource.code.coding.exists(code = '85319-2')"
      }],
      "rule" : [{
        "name" : "MapHER2Obs",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "obs"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "rezeptorstatus",
          "variable" : "rez"
        }],
        "rule" : [{
          "name" : "MapHER2",
          "source" : [{
            "context" : "obs",
            "element" : "value",
            "variable" : "val"
          }],
          "rule" : [{
            "name" : "SetHER2Positiv",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '10828004'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "her2Status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "P"
              }]
            }]
          },
          {
            "name" : "SetHER2Negativ",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '260385009'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "her2Status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "N"
              }]
            }]
          },
          {
            "name" : "SetHER2Unbekannt",
            "source" : [{
              "context" : "val",
              "element" : "coding",
              "variable" : "c",
              "condition" : "code = '261665006'"
            }],
            "target" : [{
              "context" : "rez",
              "contextType" : "variable",
              "element" : "her2Status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "U"
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapBildgebung",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nBildgebung -> Bildgebung-Block\r\n============================================================================",
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
      "name" : "SetBgDatum",
      "source" : [{
        "context" : "src",
        "element" : "effective",
        "variable" : "eff",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "eff"
        }]
      }]
    },
    {
      "name" : "MapBgMethode",
      "source" : [{
        "context" : "src",
        "element" : "method",
        "variable" : "m"
      }],
      "rule" : [{
        "name" : "MapBgMethodeCoding",
        "source" : [{
          "context" : "m",
          "element" : "coding",
          "variable" : "c",
          "condition" : "system = 'http://snomed.info/sct'"
        }],
        "rule" : [{
          "name" : "SetBgMammo",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '71651007'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "methode",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetBgSono",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '16310003'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "methode",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetBgMRT",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '113091000'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "methode",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        },
        {
          "name" : "SetBgTomo",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = '241489003'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "methode",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "4"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "MapBgBirads",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "val"
      }],
      "rule" : [{
        "name" : "MapBgBiradsCoding",
        "source" : [{
          "context" : "val",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetBgBirads",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "birads",
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
    "name" : "MapTumorkonferenz",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nTumorkonferenz -> Tumorkonferenz-Block\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "CarePlan",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetTKLnr",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "lnr",
        "transform" : "copy",
        "parameter" : [{
          "valueInteger" : 1
        }]
      }]
    },
    {
      "name" : "MapTKPeriod",
      "source" : [{
        "context" : "src",
        "element" : "period",
        "variable" : "period"
      }],
      "rule" : [{
        "name" : "SetTKDatum",
        "source" : [{
          "context" : "period",
          "element" : "start",
          "variable" : "s"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "datum",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }]
    },
    {
      "name" : "MapTKTyp",
      "source" : [{
        "context" : "src",
        "element" : "category",
        "variable" : "cat"
      }],
      "rule" : [{
        "name" : "MapTKTypCoding",
        "source" : [{
          "context" : "cat",
          "element" : "coding",
          "variable" : "c"
        }],
        "rule" : [{
          "name" : "SetTKTypPrae",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'praetherapeutisch'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "typ",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetTKTypPost",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'postoperativ'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "typ",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetTKTypRez",
          "source" : [{
            "context" : "c",
            "element" : "code",
            "variable" : "cd",
            "condition" : "$this = 'rezidiv'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "typ",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "3"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapPsychoonkologie",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nPsychoonkologie -> Psychoonkologie-Block (KB-9)\r\nProcedure.status = completed -> erfolgt = '1', Procedure.performedDateTime -> datum\r\nProcedure.status = not-done  -> erfolgt = '0'\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Procedure",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetPsychJa",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "s",
        "condition" : "$this = 'completed'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "erfolgt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    },
    {
      "name" : "SetPsychNein",
      "source" : [{
        "context" : "src",
        "element" : "status",
        "variable" : "s",
        "condition" : "$this = 'not-done'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "erfolgt",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "0"
        }]
      }]
    },
    {
      "name" : "SetPsychDatum",
      "source" : [{
        "context" : "src",
        "element" : "performed",
        "variable" : "perf",
        "condition" : "$this.is(dateTime)"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "datum",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "perf"
        }]
      }]
    }]
  },
  {
    "name" : "MapStudienteilnahme",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nStudienteilnahme -> Studien-Block\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "ResearchSubject",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "BackboneElement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "SetStudJa",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "teilgenommen",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }]
    }]
  }]
}

```
