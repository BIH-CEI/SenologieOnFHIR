# Fragebogen: Senologie Diagnose - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Senologie Diagnose**

## Questionnaire: Fragebogen: Senologie Diagnose 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-diagnose-maligne | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:QuestionnaireSenologieDiagnose |



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-diagnose-maligne",
  "contained" : [{
    "resourceType" : "Condition",
    "id" : "condition-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
    },
    "clinicalStatus" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active",
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "iif(%resource.item.where(linkId='diagnose').item.where(linkId='diagnose.rezidiv').answer.valueBoolean, 'recurrence', 'active')"
          }]
        }
      }]
    },
    "verificationStatus" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code" : "confirmed"
      }]
    },
    "code" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext",
        "valueString" : "item.where(linkId='diagnose')"
      }],
      "coding" : [{
        "_system" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.code').answer.valueCoding.system"
          }]
        },
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.code').answer.valueCoding.code"
          }]
        },
        "_display" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.code').answer.valueCoding.display"
          }]
        }
      },
      {
        "_system" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.icd10').answer.valueCoding.system"
          }]
        },
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.icd10').answer.valueCoding.code"
          }]
        },
        "_display" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose.icd10').answer.valueCoding.display"
          }]
        }
      }]
    },
    "bodySite" : [{
      "coding" : [{
        "_system" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.seite').answer.valueCoding.system"
          }]
        },
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.seite').answer.valueCoding.code"
          }]
        },
        "_display" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.seite').answer.valueCoding.display"
          }]
        }
      }]
    }],
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%patient.id"
        }]
      }
    },
    "recordedDate" : "2024-01-01",
    "_recordedDate" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.datum').answer.valueDate"
      }]
    },
    "stage" : [{
      "summary" : {
        "coding" : [{
          "_system" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.stadium').answer.valueCoding.system"
            }]
          },
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "item.where(linkId='diagnose').item.where(linkId='diagnose.stadium').answer.valueCoding.code"
            }]
          }
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
        "reference" : "#condition-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose-maligne",
  "version" : "0.1.0",
  "name" : "QuestionnaireSenologieDiagnose",
  "title" : "Fragebogen: Senologie Diagnose",
  "status" : "draft",
  "subjectType" : ["Patient"],
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "item" : [{
    "linkId" : "diagnose",
    "text" : "Diagnose",
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "%resource.code.coding.where(system='http://snomed.info/sct').first()"
        }
      }],
      "linkId" : "diagnose.code",
      "text" : "Diagnose (SNOMED)",
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose"
    },
    {
      "linkId" : "diagnose.icd10",
      "text" : "ICD-10-GM Code",
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10"
    },
    {
      "linkId" : "diagnose.seite",
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
          "code" : "51440002",
          "display" : "Right and left"
        }
      }]
    },
    {
      "linkId" : "diagnose.datum",
      "text" : "Datum der Erstdiagnose",
      "type" : "date",
      "required" : true
    },
    {
      "linkId" : "diagnose.sicherung",
      "text" : "Diagnosesicherung",
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnosesicherung"
    },
    {
      "linkId" : "diagnose.rezidiv",
      "text" : "Handelt es sich um ein Rezidiv?",
      "type" : "boolean",
      "required" : true
    },
    {
      "linkId" : "diagnose.fruehereDiagnose",
      "text" : "Referenz auf frühere Diagnose",
      "type" : "reference",
      "enableWhen" : [{
        "question" : "diagnose.rezidiv",
        "operator" : "=",
        "answerBoolean" : true
      }]
    },
    {
      "linkId" : "diagnose.stadium",
      "text" : "Stadium",
      "type" : "choice",
      "answerOption" : [{
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "261613009",
          "display" : "Stage 0"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258215001",
          "display" : "Stage 1"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258219007",
          "display" : "Stage 2"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258224005",
          "display" : "Stage 3"
        }
      },
      {
        "valueCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "258228008",
          "display" : "Stage IV"
        }
      }]
    },
    {
      "linkId" : "diagnose.metastasen",
      "text" : "Metastasierungsstatus",
      "type" : "choice",
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-metastasierung"
    }]
  }]
}

```
