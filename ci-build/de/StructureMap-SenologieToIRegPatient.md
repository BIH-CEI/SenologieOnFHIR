# SenologieToIRegPatient - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIRegPatient**

## StructureMap: SenologieToIRegPatient 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureMap/SenologieToIRegPatient | **:0.10.0 |
| Draft | **:SenologieToIRegPatient |

 
title: Senologie Patient + Observations to IRegG Patientenaufnahme status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIRegPatient",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIRegPatient",
  "version" : "0.10.0",
  "name" : "SenologieToIRegPatient",
  "status" : "draft",
  "date" : "2026-10-13T14:29:54+00:00",
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
  "description" : "title: Senologie Patient + Observations to IRegG Patientenaufnahme\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
    "mode" : "target",
    "alias" : "IRegMeldung"
  }],
  "group" : [{
    "name" : "MapPatientenaufnahme",
    "typeMode" : "none",
    "documentation" : "Known limitation: Sub-groups use `target tgt : BackboneElement` because FML\r\nhas no syntax to declare the Logical Model sub-path for BackboneElement\r\nslices passed from parent groups. The IG Publisher may produce SM_TARGET_PATH\r\nerrors. The element names are correct per the IRegG Brustimplantat LM.\r\n============================================================================\r\nPatientenaufnahme: Patient + Observations -> PAT_* + PAB_*\r\nDemografische und klinische Patientendaten bei Aufnahme.\r\nPAT_Alter wird aus Patient.birthDate berechnet (Differenz zu heute).\r\nPAT_Groesse und PAT_Gewicht kommen aus Observations (LOINC-kodiert).\r\nPAB_* Brustimplantat-spezifische Daten kommen aus Extensions am Patient.\r\n============================================================================",
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
      "name" : "SetGeschlechtMale",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'male'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlechtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "1"
        }]
      }],
      "documentation" : "--- PAT_* Basisdaten ---\r\nPAT_GeschlechtSchluessel (enum_0070): aus Patient.gender\r\nmale = 1, female = 2, other = 3, unknown = 9"
    },
    {
      "name" : "SetGeschlechtFemale",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'female'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlechtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "2"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtOther",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'other'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlechtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "3"
        }]
      }]
    },
    {
      "name" : "SetGeschlechtUnknown",
      "source" : [{
        "context" : "src",
        "element" : "gender",
        "variable" : "g",
        "condition" : "$this = 'unknown'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "geschlechtSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "9"
        }]
      }]
    },
    {
      "name" : "SetAlter",
      "source" : [{
        "context" : "src",
        "element" : "birthDate",
        "variable" : "bd"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "alter",
        "transform" : "evaluate",
        "parameter" : [{
          "valueId" : "src"
        },
        {
          "valueString" : "today().toString().substring(0, 4).toInteger() - birthDate.toString().substring(0, 4).toInteger()"
        }]
      }],
      "documentation" : "PAT_Alter: berechnet aus Patient.birthDate\r\nFML truncate() berechnet Differenz in Jahren\r\nOhne aeusseres truncate(): Matchbox akzeptiert keine verschachtelten\r\nTransformationen (\"Found ( expecting ,\") und lud diese Map deshalb nie.\r\nDer Ausdruck liefert bereits eine ganze Zahl."
    },
    {
      "name" : "CallMapPAB",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "brustimplantat",
        "variable" : "pab"
      }],
      "dependent" : [{
        "name" : "MapPatientBrustimplantat",
        "variable" : ["src", "pab"]
      }],
      "documentation" : "PAT_Groesse and PAT_Gewicht bundle lookups moved to calling group.\r\n--- PAB_* Brustimplantat-spezifische Patientendaten ---"
    }]
  },
  {
    "name" : "MapPatientBrustimplantat",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nBrustimplantat-spezifische Patientendaten: Patient -> PAB_*\r\nAutoimmunerkrankung, Verlauf, biologisches Geschlecht bei Geburt\r\n============================================================================",
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
      "name" : "MapAutoimmunerkrankung",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-autoimmunerkrankung'"
      }],
      "rule" : [{
        "name" : "MapAutoimmunValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapAutoimmunCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetAutoimmunCode",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "autoimmunerkrankungSchluessel",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }],
      "documentation" : "PAB_AutoimmunerkrankungSchluessel (enum_0122): aus Extension"
    },
    {
      "name" : "SetAutoimmunDefault",
      "source" : [{
        "context" : "src",
        "condition" : "extension.where(url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-autoimmunerkrankung').exists().not()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "autoimmunerkrankungSchluessel",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "9"
        }]
      }],
      "documentation" : "Fallback: wenn keine Extension vorhanden, setze Standardwert \"unbekannt\""
    },
    {
      "name" : "MapVerlaufAutoimmunerkrankung",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'https://www.senologie.org/fhir/StructureDefinition/ireg-verlauf-autoimmunerkrankung'"
      }],
      "rule" : [{
        "name" : "MapVerlaufValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "MapVerlaufCoding",
          "source" : [{
            "context" : "val",
            "element" : "coding",
            "variable" : "c"
          }],
          "rule" : [{
            "name" : "SetVerlaufAutoimmunCode",
            "source" : [{
              "context" : "c",
              "element" : "code",
              "variable" : "cd"
            }],
            "target" : [{
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "verlaufAutoimmunerkrankungSchluessel",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "cd"
              }]
            }]
          }]
        }]
      }],
      "documentation" : "PAB_VerlaufAutoimmunerkrankungSchluessel (enum_0123): aus Extension"
    },
    {
      "name" : "MapGeschlechtGeburt",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "ext",
        "condition" : "url = 'http://hl7.org/fhir/StructureDefinition/patient-birthsex'"
      }],
      "rule" : [{
        "name" : "MapBirthsexValue",
        "source" : [{
          "context" : "ext",
          "element" : "value",
          "variable" : "val"
        }],
        "rule" : [{
          "name" : "SetGeburtGeschlechtMale",
          "source" : [{
            "context" : "val",
            "condition" : "$this = 'M'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "geschlechtGeburtSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "1"
            }]
          }]
        },
        {
          "name" : "SetGeburtGeschlechtFemale",
          "source" : [{
            "context" : "val",
            "condition" : "$this = 'F'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "geschlechtGeburtSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "2"
            }]
          }]
        },
        {
          "name" : "SetGeburtGeschlechtUnknown",
          "source" : [{
            "context" : "val",
            "condition" : "$this = 'UNK'"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "geschlechtGeburtSchluessel",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "9"
            }]
          }]
        }]
      }],
      "documentation" : "PAB_GeschlechtGeburtSchluessel (enum_0170): aus birthsex Extension\r\nBiologisches Geschlecht bei Geburt"
    }]
  }]
}

```
