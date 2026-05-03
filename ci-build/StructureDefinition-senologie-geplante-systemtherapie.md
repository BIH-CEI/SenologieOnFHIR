# BIH Senologie Geplante Systemtherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Geplante Systemtherapie**

## Resource Profile: BIH Senologie Geplante Systemtherapie 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-geplante-systemtherapie | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:Senologie_Geplante_Systemtherapie |

 
MedicationRequest für geplante Systemtherapie aus dotbase Questionnaire 'Geplante Systemtherapie' 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-geplante-systemtherapie)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-geplante-systemtherapie.csv), [Excel](StructureDefinition-senologie-geplante-systemtherapie.xlsx), [Schematron](StructureDefinition-senologie-geplante-systemtherapie.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-geplante-systemtherapie",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-geplante-systemtherapie",
  "version" : "0.1.0",
  "name" : "Senologie_Geplante_Systemtherapie",
  "title" : "BIH Senologie Geplante Systemtherapie",
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
  "description" : "MedicationRequest für geplante Systemtherapie aus dotbase Questionnaire 'Geplante Systemtherapie'",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationRequest",
      "path" : "MedicationRequest"
    },
    {
      "id" : "MedicationRequest.extension",
      "path" : "MedicationRequest.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "MedicationRequest.extension:therapyLine",
      "path" : "MedicationRequest.extension",
      "sliceName" : "therapyLine",
      "short" : "Therapielinie",
      "comment" : "Aus dotbase: 'Therapielinie' (1, 2, 3, etc.)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line"]
      }]
    },
    {
      "id" : "MedicationRequest.status",
      "path" : "MedicationRequest.status",
      "short" : "Geplant/In Bearbeitung",
      "fixedCode" : "draft",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.intent",
      "path" : "MedicationRequest.intent",
      "fixedCode" : "plan",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.medication[x]",
      "path" : "MedicationRequest.medication[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "MedicationRequest.medication[x]:medicationCodeableConcept",
      "path" : "MedicationRequest.medication[x]",
      "sliceName" : "medicationCodeableConcept",
      "short" : "Substanz/Medikament",
      "comment" : "Aus dotbase: 'Therapieprotokoll' - geplante Substanzen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.subject",
      "path" : "MedicationRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.reasonCode",
      "path" : "MedicationRequest.reasonCode",
      "short" : "Therapieintention",
      "comment" : "Aus dotbase: 'Intention' (z.B. neoadjuvant, adjuvant, palliativ)"
    },
    {
      "id" : "MedicationRequest.reasonReference",
      "path" : "MedicationRequest.reasonReference",
      "short" : "Bezogene Diagnose",
      "comment" : "Reference zur Condition-Ressource der Diagnose",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.courseOfTherapyType",
      "path" : "MedicationRequest.courseOfTherapyType",
      "short" : "Therapieprotokoll",
      "comment" : "Aus dotbase: 'Therapieprotokoll' - geplantes Schema/Protokoll — ersetzt ehemalige TherapyProtocol-Extension",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.note",
      "path" : "MedicationRequest.note",
      "short" : "Planungsdetails",
      "comment" : "Aus dotbase: 'Details' Freitext"
    },
    {
      "id" : "MedicationRequest.dosageInstruction",
      "path" : "MedicationRequest.dosageInstruction",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.dosageInstruction.timing",
      "path" : "MedicationRequest.dosageInstruction.timing",
      "short" : "Geplante Gabe-Rhythmik"
    },
    {
      "id" : "MedicationRequest.dosageInstruction.doseAndRate.dose[x]",
      "path" : "MedicationRequest.dosageInstruction.doseAndRate.dose[x]",
      "short" : "Geplante Dosis"
    }]
  }
}

```
