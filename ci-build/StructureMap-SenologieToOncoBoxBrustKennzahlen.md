# SenologieToOncoBoxBrustKennzahlen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrustKennzahlen**

## StructureMap: SenologieToOncoBoxBrustKennzahlen 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustKennzahlen | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:SenologieToOncoBoxBrustKennzahlen |

 
title: Senologie Bundle to OncoBox Brust DKG-Kennzahlen (KB-1 bis KB-20) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrustKennzahlen",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustKennzahlen",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrustKennzahlen",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie Bundle to OncoBox Brust DKG-Kennzahlen (KB-1 bis KB-20)\r\nstatus: draft",
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "Bundle"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
    "mode" : "target",
    "alias" : "OncoBoxBrust"
  }],
  "group" : [{
    "name" : "MapKennzahlen",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nKennzahlen KB-1 bis KB-20 (DKG-Brustzentrum-Qualitaetsindikatoren)\r\nDie OncoBox erwartet pro Kennzahl einen Zaehler/Nenner-Block. Die\r\nAggregation erfolgt typischerweise ueber alle Primaerfaelle des\r\nBerichtszeitraums. In dieser Transformation werden pro Bundle alle\r\n20 Kennzahlen als \"Shell\"-Eintraege angelegt (Zaehler=0, Nenner=0),\r\ndie dann von einer nachgelagerten Auswerteschicht (CQL) mit den\r\ntatsaechlichen Aggregatwerten befuellt werden.\r\nDie tatsaechliche Berechnung der Kennzahlen aus FHIR-Daten ist ein\r\nAggregationsschritt, der nicht als 1:1-Mapping umsetzbar ist, sondern\r\neine CQL-basierte Auswertung erfordert.\r\nKurzreferenz (aus DKG-Erhebungsbogen / OncoBox Brust N1.1.1):\r\nKB-1  Postop. Fallbesprechung\r\nKB-2  Praetherapeutische Fallbesprechung\r\nKB-3  Fallbesprechung Rezidiv/Metastasen\r\nKB-4  Adjuvante Chemotherapie (invasiv)\r\nKB-5  Adjuvante Chemotherapie (DCIS)\r\nKB-6  Endokrine Therapie\r\nKB-7  Trastuzumab bei HER2+\r\nKB-8  First-Line-Therapie bei Metastasierung\r\nKB-9  Psychoonkologische Mitbetreuung\r\nKB-10 Sozialdienst-Mitbetreuung\r\nKB-11 Studienteilnahme\r\nKB-12 Praeoperative histologische Sicherung\r\nKB-13 Primaerfaelle / Rezidive / Metastasen (Fallzahl)\r\nKB-14 Anzahl Eingriffe bis R0\r\nKB-15 BET-Rate bei pT1\r\nKB-16 Mastektomien\r\nKB-17 Lymphknoten-Entfernung (Mind. 10 LK bei invasivem CA)\r\nKB-18 Drahtmarkierung bei nicht-tastbaren Befunden\r\nKB-19 Revisionsoperationen\r\nKB-20 Checkliste (organisatorisch)\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "OncoBoxBrust",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "InitKB1",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB1Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-1"
          }]
        }]
      },
      {
        "name" : "SetKB1Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Postop. Fallbesprechung"
          }]
        }]
      },
      {
        "name" : "SetKB1Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB1N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB2",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB2Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-2"
          }]
        }]
      },
      {
        "name" : "SetKB2Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Praetherapeutische Fallbesprechung"
          }]
        }]
      },
      {
        "name" : "SetKB2Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB2N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB3",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB3Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-3"
          }]
        }]
      },
      {
        "name" : "SetKB3Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Fallbesprechung Rezidiv/Metastasen"
          }]
        }]
      },
      {
        "name" : "SetKB3Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB3N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB4",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB4Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-4"
          }]
        }]
      },
      {
        "name" : "SetKB4Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Adjuvante Chemotherapie (invasiv)"
          }]
        }]
      },
      {
        "name" : "SetKB4Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB4N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB5",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB5Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-5"
          }]
        }]
      },
      {
        "name" : "SetKB5Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Adjuvante Chemotherapie (DCIS)"
          }]
        }]
      },
      {
        "name" : "SetKB5Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB5N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB6",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB6Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-6"
          }]
        }]
      },
      {
        "name" : "SetKB6Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Endokrine Therapie"
          }]
        }]
      },
      {
        "name" : "SetKB6Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB6N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB7",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB7Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-7"
          }]
        }]
      },
      {
        "name" : "SetKB7Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Trastuzumab bei HER2+"
          }]
        }]
      },
      {
        "name" : "SetKB7Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB7N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB8",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB8Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-8"
          }]
        }]
      },
      {
        "name" : "SetKB8Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "First-Line-Therapie bei Metastasierung"
          }]
        }]
      },
      {
        "name" : "SetKB8Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB8N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB9",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB9Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-9"
          }]
        }]
      },
      {
        "name" : "SetKB9Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Psychoonkologische Mitbetreuung"
          }]
        }]
      },
      {
        "name" : "SetKB9Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB9N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB10",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB10Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-10"
          }]
        }]
      },
      {
        "name" : "SetKB10Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Sozialdienst-Mitbetreuung"
          }]
        }]
      },
      {
        "name" : "SetKB10Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB10N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB11",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB11Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-11"
          }]
        }]
      },
      {
        "name" : "SetKB11Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Studienteilnahme"
          }]
        }]
      },
      {
        "name" : "SetKB11Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB11N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB12",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB12Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-12"
          }]
        }]
      },
      {
        "name" : "SetKB12Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Praeoperative histologische Sicherung"
          }]
        }]
      },
      {
        "name" : "SetKB12Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB12N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB13",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB13Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-13"
          }]
        }]
      },
      {
        "name" : "SetKB13Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Primaerfaelle / Rezidive / Metastasen"
          }]
        }]
      },
      {
        "name" : "SetKB13Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB13N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB14",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB14Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-14"
          }]
        }]
      },
      {
        "name" : "SetKB14Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Anzahl Eingriffe bis R0"
          }]
        }]
      },
      {
        "name" : "SetKB14Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB14N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB15",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB15Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-15"
          }]
        }]
      },
      {
        "name" : "SetKB15Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "BET-Rate bei pT1"
          }]
        }]
      },
      {
        "name" : "SetKB15Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB15N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB16",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB16Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-16"
          }]
        }]
      },
      {
        "name" : "SetKB16Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Mastektomien"
          }]
        }]
      },
      {
        "name" : "SetKB16Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB16N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB17",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB17Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-17"
          }]
        }]
      },
      {
        "name" : "SetKB17Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Lymphknoten-Entfernung (LK-Entf.)"
          }]
        }]
      },
      {
        "name" : "SetKB17Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB17N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB18",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB18Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-18"
          }]
        }]
      },
      {
        "name" : "SetKB18Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Drahtmarkierung"
          }]
        }]
      },
      {
        "name" : "SetKB18Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB18N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB19",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB19Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-19"
          }]
        }]
      },
      {
        "name" : "SetKB19Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Revisionsoperationen"
          }]
        }]
      },
      {
        "name" : "SetKB19Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB19N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    },
    {
      "name" : "InitKB20",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "kennzahl",
        "variable" : "kz"
      }],
      "rule" : [{
        "name" : "SetKB20Id",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "KB-20"
          }]
        }]
      },
      {
        "name" : "SetKB20Name",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "bezeichnung",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "Checkliste"
          }]
        }]
      },
      {
        "name" : "SetKB20Z",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "zaehler",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      },
      {
        "name" : "SetKB20N",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "kz",
          "contextType" : "variable",
          "element" : "nenner",
          "transform" : "copy",
          "parameter" : [{
            "valueInteger" : 0
          }]
        }]
      }]
    }]
  }]
}

```
