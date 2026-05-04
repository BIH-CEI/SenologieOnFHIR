# BIH Senologie OP Planung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie OP Planung**

## Resource Profile: BIH Senologie OP Planung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_OP_Planung |

 
ServiceRequest für OP Planung aus dotbase Questionnaire 'OP Planung ärztlich V1.0' 

**Usages:**

* Examples for this Profile: [ServiceRequest/Fall1-OP-Planung](ServiceRequest-Fall1-OP-Planung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-op-planung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-op-planung.csv), [Excel](StructureDefinition-senologie-op-planung.xlsx), [Schematron](StructureDefinition-senologie-op-planung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-op-planung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung",
  "version" : "0.1.0",
  "name" : "Senologie_OP_Planung",
  "title" : "BIH Senologie OP Planung",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "ServiceRequest für OP Planung aus dotbase Questionnaire 'OP Planung ärztlich V1.0'",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
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
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.extension",
      "path" : "ServiceRequest.extension",
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
      "id" : "ServiceRequest.extension:operationsDuration",
      "path" : "ServiceRequest.extension",
      "sliceName" : "operationsDuration",
      "short" : "Geplante OP-Dauer",
      "comment" : "In Minuten aus dotbase 'OP Dauer'",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:tumorConferenceConsent",
      "path" : "ServiceRequest.extension",
      "sliceName" : "tumorConferenceConsent",
      "short" : "CA-Behandlung/Tumorkonferenz-Zustimmung",
      "comment" : "Aus dotbase: 'CA-Behandlung' Ja/Nein",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-tumor-conference-consent"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:preOpMarkierung",
      "path" : "ServiceRequest.extension",
      "sliceName" : "preOpMarkierung",
      "short" : "Präoperative Markierung geplant",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:preOpBlutabnahme",
      "path" : "ServiceRequest.extension",
      "sliceName" : "preOpBlutabnahme",
      "short" : "Präoperative Blutabnahme geplant",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-blutabnahme"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:preOpAntibiotikatherapie",
      "path" : "ServiceRequest.extension",
      "sliceName" : "preOpAntibiotikatherapie",
      "short" : "Präoperative Antibiotikatherapie",
      "comment" : "Aus dotbase: 'Präoperative Antibiotikatherapie' + optional Sonstiges",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-antibiotikatherapie"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:operatingTableSetup",
      "path" : "ServiceRequest.extension",
      "sliceName" : "operatingTableSetup",
      "short" : "OP-Lagerung/Tischanordnung",
      "comment" : "Aus dotbase: 'Lagerung', 'Fallwagen'",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operating-table-setup"]
      }]
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "short" : "Geplant/In Bearbeitung",
      "fixedCode" : "draft",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "fixedCode" : "plan",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.category",
      "path" : "ServiceRequest.category",
      "short" : "OP Planung",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "comment" : "Aus dotbase: 'Operation' - geplante OP Art (weibl. Geschlechtsorgane, Diagnose rechts/links, etc.)",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code.coding",
      "path" : "ServiceRequest.code.coding",
      "short" : "Art der geplanten Operation"
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.performer",
      "path" : "ServiceRequest.performer",
      "short" : "Geplanter Operateur",
      "comment" : "Aus dotbase: 'Operateur' als Text"
    },
    {
      "id" : "ServiceRequest.reasonCode",
      "path" : "ServiceRequest.reasonCode",
      "short" : "Intention/Grund für OP",
      "comment" : "Aus dotbase: 'Intention' (diagnostisch/therapeutisch)"
    },
    {
      "id" : "ServiceRequest.bodySite",
      "path" : "ServiceRequest.bodySite",
      "short" : "Seite/Lateralität",
      "comment" : "Aus dotbase: Seite (Links/Rechts/Beidseits)"
    },
    {
      "id" : "ServiceRequest.bodySite.coding",
      "path" : "ServiceRequest.bodySite.coding",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.note",
      "path" : "ServiceRequest.note",
      "short" : "Planungsdetails",
      "comment" : "Aus dotbase: 'Details' Freitext"
    }]
  }
}

```
