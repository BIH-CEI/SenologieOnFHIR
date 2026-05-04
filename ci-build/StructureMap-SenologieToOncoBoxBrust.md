# SenologieToOncoBoxBrust - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SenologieToOncoBoxBrust**

## StructureMap: SenologieToOncoBoxBrust 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:SenologieToOncoBoxBrust |

 
title: Senologie FHIR Bundle to OncoBox Brust N1.1.1 (Orchestrator) status: draft 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "SenologieToOncoBoxBrust",
  "url" : "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust",
  "version" : "0.1.0",
  "name" : "SenologieToOncoBoxBrust",
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
  "description" : "title: Senologie FHIR Bundle to OncoBox Brust N1.1.1 (Orchestrator)\r\nstatus: draft",
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
  "import" : ["https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustZentrum",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustPrimaerfall",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustOperation",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustTherapie",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustVerlauf",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustKennzahlen",
  "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrustVerlauf"],
  "group" : [{
    "name" : "SenologieToOncoBoxBrust",
    "typeMode" : "none",
    "documentation" : "============================================================================\r\nMaster Orchestrator: Bundle -> OncoBox Brust N1.1.1 Meldung\r\nErzeugt aus einem FHIR-Bundle mit Senologie-Ressourcen eine OncoBox-Brust-\r\nMeldung. Pro Patientin/Fall wird ein Primaerfall-Block erzeugt. Die Kennzahlen\r\n(KB-1 bis KB-20) werden ueber eine separate Sub-Map aggregiert befuellt.\r\nScope: OncoBox Brust N1.1.1 + OncoBox 2.0 FM-Erweiterung (J03-J05)\r\n(DKG/OnkoZert-Zertifizierung Brustzentren)\r\n============================================================================",
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
      "name" : "CallMapZentrum",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "zentrum",
        "variable" : "zentrum"
      }],
      "dependent" : [{
        "name" : "MapZentrum",
        "variable" : ["src", "zentrum"]
      }]
    },
    {
      "name" : "EntryPrimaerfall",
      "source" : [{
        "context" : "src",
        "element" : "entry",
        "variable" : "entry",
        "condition" : "resource.is(Condition) and resource.code.coding.exists((system = 'http://fhir.de/CodeSystem/bfarm/icd-10-gm') and (code.startsWith('C50') or code.startsWith('D05') or code.startsWith('D24') or code.startsWith('Z40') or code.startsWith('Z42')))"
      }],
      "rule" : [{
        "name" : "CallMapPrimaerfall",
        "source" : [{
          "context" : "entry",
          "element" : "resource",
          "variable" : "condition"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "primaerfall",
          "variable" : "pf"
        }],
        "dependent" : [{
          "name" : "MapPrimaerfall",
          "variable" : ["condition", "pf", "src"]
        }]
      }]
    },
    {
      "name" : "CallMapKennzahlen",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "MapKennzahlen",
        "variable" : ["src", "tgt"]
      }]
    }]
  }]
}

```
