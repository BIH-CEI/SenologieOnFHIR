# Fragebogen: Postoperative Dokumentation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Postoperative Dokumentation**

## Questionnaire: Fragebogen: Postoperative Dokumentation (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-postop | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestPostOPDokumentation |

 
Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Template-based Extraction mit zwei contained Templates: Procedure (Senologie_Operation) und Observation (Senologie_Operative_Komplikation). 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-postop",
  "contained" : [{
    "resourceType" : "Procedure",
    "id" : "postop-procedure-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
    },
    "status" : "completed",
    "subject" : {
      "reference" : "placeholder"
    },
    "reasonReference" : [{
      "reference" : "placeholder",
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "postop-komplikation-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "789279006",
        "display" : "Clavien-Dindo classification grade"
      }]
    },
    "subject" : {
      "reference" : "placeholder"
    }
  }],
  "extension" : [{
    "extension" : [{
      "url" : "name",
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext",
        "code" : "patient"
      }
    },
    {
      "url" : "type",
      "valueCode" : "Patient"
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-postop",
  "version" : "0.1.0",
  "name" : "QuestPostOPDokumentation",
  "title" : "Fragebogen: Postoperative Dokumentation",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Template-based Extraction mit zwei contained Templates: Procedure (Senologie_Operation) und Observation (Senologie_Operative_Komplikation).",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
      "valueExpression" : {
        "language" : "application/x-fhir-query",
        "expression" : "Condition?patient={{%patient.id}}&code=254837009&clinical-status=active"
      }
    },
    {
      "extension" : [{
        "url" : "path",
        "valueString" : "code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code"
      },
      {
        "url" : "label",
        "valueString" : "ICD-10"
      },
      {
        "url" : "forDisplay",
        "valueBoolean" : false
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
    },
    {
      "extension" : [{
        "url" : "path",
        "valueString" : "bodySite.coding.first().display"
      },
      {
        "url" : "label",
        "valueString" : "Seite"
      },
      {
        "url" : "forDisplay",
        "valueBoolean" : true
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
    }],
    "linkId" : "bezugsdiagnose",
    "text" : "Bezugsdiagnose (Seite)",
    "type" : "reference",
    "required" : true
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#postop-procedure-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "operation",
    "text" : "Operative Therapie",
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "op-kategorie",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.category",
      "text" : "Art der Operation",
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art"
    },
    {
      "linkId" : "op-seite",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.bodySite",
      "text" : "Seite",
      "type" : "choice",
      "required" : true,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "80248007",
          "display" : "Left breast structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "73056007",
          "display" : "Right breast structure"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "63762007",
          "display" : "Both breasts"
        }
      }]
    },
    {
      "linkId" : "op-datum",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.performedDateTime",
      "text" : "OP-Datum",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "op-code-text",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.code.text",
      "text" : "Beschreibung der OP (Freitext, z.B. \"BET links, Sentinel-LK-Biopsie\")",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "op-intention",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.extension:Intention.valueCodeableConcept",
      "text" : "OP-Intention",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "K",
          "display" : "kurativ"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "P",
          "display" : "palliativ"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "D",
          "display" : "diagnostisch"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "R",
          "display" : "Revision/Komplikation"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "S",
          "display" : "sonstiges"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
          "code" : "X",
          "display" : "Fehlende Angabe"
        }
      }]
    },
    {
      "linkId" : "op-outcome",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.outcome.text",
      "text" : "OP-Outcome (z.B. R-Status, Sentinel)",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "followup-drainage",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operation#Procedure.note.text",
      "text" : "Drainage",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "followup-verband",
      "text" : "Verband",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "followup-antibiotika",
      "text" : "Antibiotikatherapie",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "followup-mobilisation",
      "text" : "Mobilisation",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "followup-labor",
      "text" : "Laborkontrolle",
      "type" : "string",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#postop-komplikation-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "komplikation",
    "text" : "Operative Komplikation",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "clavien-dindo",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation#Observation.valueCodeableConcept",
      "text" : "Clavien-Dindo-Grad",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1367519000",
          "display" : "Clavien-Dindo classification grade I"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1367520006",
          "display" : "Clavien-Dindo classification grade II"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1367521005",
          "display" : "Clavien-Dindo classification grade III"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1367524002",
          "display" : "Clavien-Dindo classification grade IV"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "1367527009",
          "display" : "Clavien-Dindo classification grade V"
        }
      }]
    },
    {
      "linkId" : "komplikation-datum",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation#Observation.effectiveDateTime",
      "text" : "Datum der Komplikation",
      "type" : "date",
      "required" : false
    },
    {
      "linkId" : "komplikation-zeitpunkt",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation#Observation.method",
      "text" : "Zeitpunkt",
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueString" : "Intraoperativ"
      },
      {
        "valueString" : "Postoperativ"
      },
      {
        "valueString" : "Stationaer"
      },
      {
        "valueString" : "Ambulant"
      }]
    },
    {
      "linkId" : "komplikation-art",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation#Observation.component.valueCodeableConcept.text",
      "text" : "Art der Komplikation (Freitext)",
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "komplikation-kommentar",
      "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation#Observation.note.text",
      "text" : "Konsequenz / Kommentar",
      "type" : "text",
      "required" : false
    }]
  }]
}

```
