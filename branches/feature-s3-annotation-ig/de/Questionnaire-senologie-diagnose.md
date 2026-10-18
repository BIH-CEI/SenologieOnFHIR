# Fragebogen: Diagnose Mamma - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Diagnose Mamma**

## Questionnaire: Fragebogen: Diagnose Mamma () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-diagnose | **:0.10.0 |
| Draft | **:QuestDiagnose |

 
Klinische Anker-Diagnose der Senologie (Mammakarzinom, in-situ, B3-Läsion, benigne Befunde, kosmetische/funktionelle Anomalien). Bewusst schlank: TNM, Grading und detailliertes Staging werden in den Folge-Formularen Bildgebung, Pathologie und Verlauf erhoben. 

*   
*   
*   

### 

### 

* [Antworten auf senologie-diagnose fuer Fall 1 (C50.4 links OAQ, gesichert).](QuestionnaireResponse-QR-Diagnose-Fall1.md)
* [Antworten auf senologie-diagnose am Tag der Bildgebung: Verdacht auf Mammakarzinom rechts (BI-RADS 4c), vor der histologischen Sicherung.](QuestionnaireResponse-QR-Diagnose-Fall10-Verdacht.md)
* [Antworten auf senologie-diagnose nach dem Pathologiebefund: Mammakarzinom rechts gesichert (C50.4, triple-negativ, G3).](QuestionnaireResponse-QR-Diagnose-Fall10.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-diagnose",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "kds-senologie"
      },
      {
        "url" : "version",
        "valueString" : "0.10.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.senologie.org/fhir"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"]
  },
  "contained" : [{
    "resourceType" : "Condition",
    "id" : "diagnose-condition-template",
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
      "_valueDateTime" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-datum').answer.valueDate"
        }]
      }
    }],
    "clinicalStatus" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "iif(%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.code = 'bc-recurrence', 'recurrence', 'active')"
          }]
        }
      }]
    },
    "verificationStatus" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sicherheit').answer.valueCoding"
        }],
        "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code" : "confirmed"
      }]
    },
    "code" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.where(system='http://snomed.info/sct')"
        }],
        "system" : "http://snomed.info/sct"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom')"
        }],
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
      }]
    },
    "bodySite" : [{
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding"
        }],
        "system" : "http://snomed.info/sct"
      },
      {
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation",
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "iif(%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding.code = '24028007', 'R', iif(%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding.code = '7771000', 'L', 'B'))"
          }]
        }
      }]
    }],
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "_onsetDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-datum').answer.valueDate"
      }]
    },
    "note" : [{
      "_text" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-details').answer.valueString"
        }]
      }
    }]
  }],
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C4872",
        "display" : "Breast Carcinoma"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
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
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#diagnose-condition-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose",
  "version" : "0.10.0",
  "name" : "QuestDiagnose",
  "title" : "Fragebogen: Diagnose Mamma",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Breast Diagnosis"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "experimental" : true,
  "subjectType" : ["Patient"],
  "date" : "2026-10-12",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Klinische Anker-Diagnose der Senologie (Mammakarzinom, in-situ, B3-Läsion, benigne Befunde, kosmetische/funktionelle Anomalien). Bewusst schlank: TNM, Grading und detailliertes Staging werden in den Folge-Formularen Bildgebung, Pathologie und Verlauf erhoben.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden",
      "valueBoolean" : true
    },
    {
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression",
      "valueExpression" : {
        "language" : "text/fhirpath",
        "expression" : "%patient"
      }
    }],
    "linkId" : "patient-ref",
    "text" : "Patient",
    "type" : "reference",
    "required" : true,
    "readOnly" : true
  },
  {
    "linkId" : "diagnose-gruppe",
    "text" : "Diagnose Mamma",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Breast Diagnosis"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : true,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "diagnose-sct",
      "text" : "Diagnose",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnosis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "diagnose-b3-detail",
      "text" : "Details B3-Läsion",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "B3 Lesion Details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "diagnose-sct",
        "operator" : "=",
        "answerCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "269497004"
        }
      }],
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-b3-subtypen"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "diagnose-sicherheit",
      "text" : "Diagnostische Sicherheit",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnostic Certainty"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-sicherheit"
    },
    {
      "linkId" : "diagnose-details",
      "text" : "Details",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "lokalisation-zeit",
    "text" : "Lokalisation & Zeitpunkt",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Localisation & Date"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : true,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "diagnose-seite",
      "text" : "Seitenlokalisation",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Laterality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"
    },
    {
      "linkId" : "diagnose-datum",
      "text" : "Datum",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "date",
      "required" : true
    }]
  }]
}

```
