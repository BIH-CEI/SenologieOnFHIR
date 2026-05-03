# Fragebogen: OP Planung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: OP Planung**

## Questionnaire: Fragebogen: OP Planung (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-op-planung | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:QuestOPPlanung |

 
Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-op-planung",
  "contained" : [{
    "resourceType" : "ServiceRequest",
    "id" : "op-planung-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung"]
    },
    "status" : "draft",
    "intent" : "plan",
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
  }],
  "extension" : [{
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "#op-planung-template"
    }
  },
  {
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung",
  "version" : "0.1.0",
  "name" : "QuestOPPlanung",
  "title" : "Fragebogen: OP Planung",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-03T20:30:38+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel.",
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
    "linkId" : "op-art",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.code.text",
    "text" : "Art der geplanten Operation",
    "type" : "string",
    "required" : true
  },
  {
    "linkId" : "seitenlokalisation",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.bodySite",
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
    "linkId" : "intention",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.reasonCode.text",
    "text" : "Intention / Grund der OP",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "op-dauer-min",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:operationsDuration.valueDuration.value",
    "text" : "Geplante OP-Dauer (Minuten)",
    "type" : "integer",
    "required" : false
  },
  {
    "linkId" : "tumor-conference-consent",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:tumorConferenceConsent.valueCodeableConcept",
    "text" : "CA-Behandlung / Tumorkonferenz-Zustimmung erteilt",
    "type" : "boolean",
    "required" : false
  },
  {
    "linkId" : "pre-op-markierung",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpMarkierung.valueCodeableConcept",
    "text" : "Präoperative Markierung geplant",
    "type" : "choice",
    "required" : false,
    "answerOption" : [{
      "valueCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "405815000",
        "display" : "Procedure device"
      }
    },
    {
      "valueCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "397956004",
        "display" : "Wire guided localization of breast lesion"
      }
    },
    {
      "valueCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "77343006",
        "display" : "Angiography"
      }
    },
    {
      "valueString" : "Keine"
    }]
  },
  {
    "linkId" : "notes",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.note.text",
    "text" : "Planungsdetails / Freitext",
    "type" : "text",
    "required" : false,
    "repeats" : true
  },
  {
    "linkId" : "pre-op-blutabnahme",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpBlutabnahme.valueCodeableConcept",
    "text" : "Präoperative Blutabnahme geplant",
    "type" : "boolean",
    "required" : false
  },
  {
    "linkId" : "pre-op-antibiotika",
    "definition" : "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpAntibiotikatherapie.valueString",
    "text" : "Präoperative Antibiotikatherapie",
    "type" : "string",
    "required" : false
  }]
}

```
