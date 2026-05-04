# Fragebogen: Tumorboard Empfehlung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Tumorboard Empfehlung**

## Questionnaire: Fragebogen: Tumorboard Empfehlung (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestTumorboard |

 
Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Template-based Extraction mit contained CarePlan und templateExtractValue-Annotationen. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-tumorboard",
  "contained" : [{
    "resourceType" : "CarePlan",
    "id" : "careplan-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"]
    },
    "status" : "active",
    "intent" : "plan",
    "title" : "Tumorboard Empfehlung",
    "_title" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "item.where(linkId='tumorboard-titel').answer.valueString"
      }]
    },
    "description" : "Zusammenfassung",
    "_description" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "item.where(linkId='tumorboard-beschreibung').answer.valueString"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "'Patient/' + %patient.id"
        }]
      }
    },
    "period" : {
      "start" : "2024-01-01",
      "_start" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='tumorboard-datum').answer.valueDate"
        }]
      }
    },
    "addresses" : [{
      "reference" : "placeholder",
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }],
    "note" : [{
      "text" : "Sonstige Anmerkungen",
      "_text" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='empfehlung-sonstiges').answer.valueString"
        }]
      }
    }]
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
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#careplan-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard",
  "version" : "0.1.0",
  "name" : "QuestTumorboard",
  "title" : "Fragebogen: Tumorboard Empfehlung",
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Template-based Extraction mit contained CarePlan und templateExtractValue-Annotationen.",
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
    "linkId" : "tumorboard-datum",
    "text" : "Datum des Tumorboards",
    "type" : "date",
    "required" : true
  },
  {
    "linkId" : "tumorboard-titel",
    "text" : "Titel der Empfehlung",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "tumorboard-beschreibung",
    "text" : "Zusammenfassung der Empfehlung",
    "type" : "text",
    "required" : false
  },
  {
    "linkId" : "empfehlung-op",
    "text" : "Operative Therapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-strahlentherapie",
    "text" : "Strahlentherapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-endokrin",
    "text" : "Endokrine Therapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-chemotherapie",
    "text" : "Chemotherapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-zielgerichtet",
    "text" : "Zielgerichtete Therapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-immuntherapie",
    "text" : "Immuntherapie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-diagnostik",
    "text" : "Weitere Diagnostik empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-studie",
    "text" : "Klinische Studie empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-genetik",
    "text" : "Genetische Untersuchung empfohlen",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-nachsorge",
    "text" : "Nachsorge-Empfehlung",
    "type" : "string",
    "required" : false
  },
  {
    "linkId" : "empfehlung-sonstiges",
    "text" : "Sonstige Anmerkungen",
    "type" : "text",
    "required" : false,
    "repeats" : true
  }]
}

```
