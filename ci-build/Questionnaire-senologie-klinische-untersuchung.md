# Fragebogen: Klinische Untersuchung Mamma - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Klinische Untersuchung Mamma**

## Questionnaire: Fragebogen: Klinische Untersuchung Mamma (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:QuestKlinischeUntersuchung |

 
Fragebogen zur strukturierten Dokumentation der klinischen Brustuntersuchung. Nutzt SDC Template-based Extraction mit dem Senologie_Klinische_Untersuchung-Profil (Observation) als Ziel. Das Extraction-Template liegt unter input/resources/Questionnaire-senologie-klinische-untersuchung-template.json. 



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-klinische-untersuchung",
  "contained" : [{
    "resourceType" : "Observation",
    "id" : "observation-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "32422-8",
        "display" : "Physical findings of Breast"
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
    "focus" : [{
      "reference" : "placeholder",
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
        }]
      }
    }],
    "effectiveDateTime" : "2024-01-01",
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "item.where(linkId='untersuchung-datum').answer.valueDate"
      }]
    },
    "bodySite" : {
      "coding" : [{
        "_system" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='seitenlokalisation').answer.valueCoding.system"
          }]
        },
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='seitenlokalisation').answer.valueCoding.code"
          }]
        },
        "_display" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "item.where(linkId='seitenlokalisation').answer.valueCoding.display"
          }]
        }
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "118242002",
          "display" : "Finding by palpation"
        }]
      },
      "valueString" : "Palpationsbefund",
      "_valueString" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='palpationsbefund').answer.valueString"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "115951000119105",
          "display" : "Breast symptom of change in skin"
        }]
      },
      "valueString" : "Hautveränderungen",
      "_valueString" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='hautveraenderungen').answer.valueString"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "248819006",
          "display" : "Nipple finding"
        }]
      },
      "valueString" : "Mamillenbefund",
      "_valueString" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='mamillenbefund').answer.valueString"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "301782006",
          "display" : "Finding of lymph node of axillary region"
        }]
      },
      "valueString" : "Lymphknotenstatus",
      "_valueString" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "item.where(linkId='lymphknotenstatus').answer.valueString"
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
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract",
    "valueReference" : {
      "reference" : "#observation-template"
    }
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung",
  "version" : "0.1.0",
  "name" : "QuestKlinischeUntersuchung",
  "title" : "Fragebogen: Klinische Untersuchung Mamma",
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
  "description" : "Fragebogen zur strukturierten Dokumentation der klinischen Brustuntersuchung. Nutzt SDC Template-based Extraction mit dem Senologie_Klinische_Untersuchung-Profil (Observation) als Ziel. Das Extraction-Template liegt unter input/resources/Questionnaire-senologie-klinische-untersuchung-template.json.",
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
    "linkId" : "untersuchung-datum",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime",
    "text" : "Untersuchungsdatum",
    "type" : "date",
    "required" : true
  },
  {
    "linkId" : "seitenlokalisation",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.bodySite",
    "text" : "Untersuchte Seite",
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
    "linkId" : "palpationsbefund",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString",
    "code" : [{
      "system" : "http://snomed.info/sct",
      "code" : "118242002",
      "display" : "Finding by palpation"
    }],
    "text" : "Palpationsbefund",
    "type" : "text",
    "required" : false
  },
  {
    "linkId" : "hautveraenderungen",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString",
    "code" : [{
      "system" : "http://snomed.info/sct",
      "code" : "115951000119105",
      "display" : "Breast symptom of change in skin"
    }],
    "text" : "Hautveränderungen",
    "type" : "text",
    "required" : false
  },
  {
    "linkId" : "mamillenbefund",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString",
    "code" : [{
      "system" : "http://snomed.info/sct",
      "code" : "248819006",
      "display" : "Nipple finding"
    }],
    "text" : "Mamillenbefund (Retraktion, Sekretion, Ekzem)",
    "type" : "text",
    "required" : false
  },
  {
    "linkId" : "lymphknotenstatus",
    "definition" : "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString",
    "code" : [{
      "system" : "http://snomed.info/sct",
      "code" : "284429001",
      "display" : "Examination of axillary lymph nodes"
    }],
    "text" : "Klinischer Lymphknotenstatus (axillär)",
    "type" : "text",
    "required" : false
  }]
}

```
