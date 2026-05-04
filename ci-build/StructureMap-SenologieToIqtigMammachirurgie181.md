# SenologieToIqtigMammachirurgie181 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToIqtigMammachirurgie181**

## StructureMap: SenologieToIqtigMammachirurgie181 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181 | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToIqtigMammachirurgie181 |

 
title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToIqtigMammachirurgie181",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181",
  "version" : "0.1.0",
  "name" : "SenologieToIqtigMammachirurgie181",
  "status" : "draft",
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator)\r\nstatus: draft",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure",
    "mode" : "source",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "source",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Specimen",
    "mode" : "source",
    "alias" : "Specimen"
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
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBasis",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigBrust",
  "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigOperation"],
  "group" : [{
    "name" : "SenologieToIqtigMammachirurgie181",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMaster Orchestrator: Bundle -> IQTIG QS 18.1 Mammachirurgie\r\nEmpfaengt ein FHIR Bundle mit Senologie-Ressourcen (Patient, Encounter,\r\nCondition, Procedure, Specimen, Observations) und erzeugt eine vollstaendige\r\nIQTIG-QS-Meldung mit den drei Teildatensaetzen:\r\n- Teildatensatz Basis (B): Patient + Encounter\r\n- Teildatensatz Brust (BRUST): Condition + Pathologie (ein Eintrag je Seite)\r\n- Teildatensatz Operation (O): Procedure + Specimen (ein Eintrag je OP)\r\nAnalog zur IRegG-Meldung wird eine einzelne QS-Meldung pro Behandlungsfall\r\nerzeugt. Die Zuordnung der Teildatensaetze Brust und Operation erfolgt ueber\r\ndie laufenden Nummern (LNRBRUST, LNROP).\r\n============================================================================",
    "input" : [{
      "name" : "src",
      "type" : "Bundle",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "IQTIG181",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "CallMapBasis",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "teildatensatzBasis",
        "variable" : "basis"
      }],
      "dependent" : [{
        "name" : "MapBasis",
        "variable" : ["src", "basis"]
      }]
    },
    {
      "name" : "EntryBrust",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition) and (resource.meta.profile.exists($this.contains('senologie-diagnose')) or resource.code.coding.exists((system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm') and code.startsWith('C50')))"
      }],
      "rule" : [{
        "name" : "CallMapBrust",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "teildatensatzBrust",
          "variable" : "brust"
        }],
        "dependent" : [{
          "name" : "MapBrust",
          "variable" : ["condition", "brust", "src"]
        }]
      }]
    },
    {
      "name" : "EntryOperation",
      "source" : [{
        "context" : "src",
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
          "element" : "teildatensatzOperation",
          "variable" : "op"
        }],
        "dependent" : [{
          "name" : "MapOperation",
          "variable" : ["procedure", "op", "src"]
        }]
      }]
    }]
  }]
}

```
