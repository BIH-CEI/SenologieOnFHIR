# Fragebogen: Bildgebung Mamma - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Bildgebung Mamma**

## Questionnaire: Fragebogen: Bildgebung Mamma () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung | **:0.10.0 |
| Draft | **:QuestBildgebung |

 
Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure. 

*   
*   
*   

### 

### 

* [Mammographie bilateral 2025-01-15, BI-RADS 5 links OAQ, ACR C, kein Mikrokalk, LK unauffaellig.](QuestionnaireResponse-QR-Bildgebung-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-bildgebung",
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
    "resourceType" : "DiagnosticReport",
    "id" : "bildgebung-report-template",
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
        "code" : "RAD",
        "display" : "Radiology"
      }]
    }],
    "code" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='untersuchung').item.where(linkId='bildgebungsart').answer.valueCoding"
        }],
        "system" : "http://snomed.info/sct"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='untersuchung').item.where(linkId='untersuchung-datum').answer.valueDate"
      }]
    },
    "result" : [{
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%NewBildgebungObsId"
        }]
      }
    }],
    "_conclusion" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='zusammenfassung').item.where(linkId='gesamtbeurteilung').answer.valueString"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "bildgebung-befund-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "imaging"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "72018-2",
        "display" : "Breast Imaging-Reporting and Data System"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    },
    "focus" : [{
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%diagnosis.reference"
        }]
      }
    },
    {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%NewBildgebungBsId"
        }]
      }
    }],
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='untersuchung').item.where(linkId='untersuchung-datum').answer.valueDate"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='birads-kategorie').answer.valueCoding"
        }],
        "system" : "http://snomed.info/sct"
      }]
    },
    "note" : [{
      "_text" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='herdbefund-beschreibung').answer.valueString"
        }]
      }
    }],
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "89180-4",
          "display" : "Breast density"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='acr-brustdichte').answer.valueCoding"
          }],
          "system" : "http://snomed.info/sct"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "27931000119107",
          "display" : "Microcalcification of breast on mammogram"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='mikrokalk').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "284429001",
          "display" : "Examination of axillary lymph nodes"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='lk-status').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "444024003",
          "display" : "Number of suspicious lymph nodes"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='lk-anzahl-suspekt').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom",
          "code" : "us-degum-0"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='us-degum').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "106233006",
          "display" : "Topographical modifier"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='beurteilbarkeit').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "33728-7",
          "display" : "Size of mass"
        }]
      },
      "valueQuantity" : {
        "_value" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='befund').item.where(linkId='herdbefund-groesse').answer.valueInteger"
          }]
        },
        "unit" : "mm",
        "system" : "http://unitsofmeasure.org",
        "code" : "mm"
      }
    }]
  },
  {
    "resourceType" : "BodyStructure",
    "id" : "bildgebung-bodystructure-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation"]
    },
    "extension" : [{
      "extension" : [{
        "url" : "structure",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "76752008",
            "display" : "Breast structure"
          }]
        }
      },
      {
        "url" : "laterality",
        "valueCodeableConcept" : {
          "coding" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-seite').answer.valueCoding"
            }],
            "system" : "http://snomed.info/sct"
          }]
        }
      },
      {
        "url" : "qualifier",
        "valueCodeableConcept" : {
          "coding" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-quadrant').answer.valueCoding"
            }],
            "system" : "http://snomed.info/sct"
          }]
        }
      },
      {
        "extension" : [{
          "url" : "landmarkDescription",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "244091003",
              "display" : "Nipple structure"
            }]
          }
        },
        {
          "url" : "clockFacePosition",
          "valueCodeableConcept" : {
            "coding" : [{
              "extension" : [{
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-uhrzeit').answer.valueCoding"
              }],
              "system" : "http://snomed.info/sct"
            }]
          }
        },
        {
          "extension" : [{
            "url" : "value",
            "valueQuantity" : {
              "_value" : {
                "extension" : [{
                  "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                  "valueString" : "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-mamillenabstand').answer.valueInteger"
                }]
              },
              "unit" : "mm",
              "system" : "http://unitsofmeasure.org",
              "code" : "mm"
            }
          }],
          "url" : "distanceFromLandmark"
        }],
        "url" : "bodyLandmarkOrientation"
      }],
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-BodyStructure.includedStructure"
    }],
    "identifier" : [{
      "system" : "https://www.senologie.org/fhir/sid/tumor-entity",
      "_value" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "iif(%NewBildgebungBsId.exists(), %NewBildgebungBsId.substring(9))"
        }]
      }
    }],
    "active" : true,
    "patient" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    }
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
    "url" : "http://hl7.org/fhir/StructureDefinition/variable",
    "valueExpression" : {
      "name" : "NewBildgebungReportId",
      "language" : "text/fhirpath",
      "expression" : "'urn:uuid:' + uuid()"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/variable",
    "valueExpression" : {
      "name" : "NewBildgebungObsId",
      "language" : "text/fhirpath",
      "expression" : "'urn:uuid:' + uuid()"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/variable",
    "valueExpression" : {
      "name" : "NewBildgebungBsId",
      "language" : "text/fhirpath",
      "expression" : "'urn:uuid:' + uuid()"
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
      "url" : "name",
      "valueCoding" : {
        "system" : "https://www.senologie.org/fhir/CodeSystem/launchContext",
        "code" : "diagnosis",
        "display" : "Diagnose (Anker-Condition)"
      }
    },
    {
      "url" : "type",
      "valueCode" : "Condition"
    },
    {
      "url" : "description",
      "valueString" : "Anker-Diagnose (Condition) für Pre-Population. Vom Frontend nach Diagnose-Choice gesetzt."
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung",
  "version" : "0.10.0",
  "name" : "QuestBildgebung",
  "title" : "Fragebogen: Bildgebung Mamma",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Breast Imaging"
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
  "description" : "Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure.",
  "item" : [{
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-report-template"
        }
      },
      {
        "url" : "fullUrl",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "%NewBildgebungReportId"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "untersuchung",
    "text" : "Untersuchung",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Examination"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : true,
    "item" : [{
      "linkId" : "untersuchung-datum",
      "text" : "Untersuchungsdatum",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Examination Date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "date",
      "required" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "bildgebungsart",
      "text" : "Bildgebungsart",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Imaging Modality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-bildgebung-modalitaet"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "untersuchung-standort",
      "text" : "Standort",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Location"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-standort"
    },
    {
      "linkId" : "befundender-arzt",
      "text" : "Befundender Arzt",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reporting Physician"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "string",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-bodystructure-template"
        }
      },
      {
        "url" : "fullUrl",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "%NewBildgebungBsId"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "lokalisation",
    "text" : "Tumorlokalisation",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Tumour Localisation"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
        "valueExpression" : {
          "language" : "application/x-fhir-query",
          "expression" : "BodyStructure?patient={{%patient.id}}&active=true"
        }
      }],
      "linkId" : "lokalisation-tumor-entitaet-bekannt",
      "text" : "Existierende Tumor-Entität (für Re-Imaging)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Existing Tumour Entity (for Re-Imaging)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "reference",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "lokalisation-seite",
      "text" : "Seite",
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
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "lokalisation-quadrant",
      "text" : "Quadrant",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Quadrant"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-quadrant-mamma"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "lokalisation-uhrzeit",
      "text" : "Uhrzeitposition",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Clock Position"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-clockface-position"
    },
    {
      "linkId" : "lokalisation-mamillenabstand",
      "text" : "Abstand von Mamille (mm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Distance from Nipple (mm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#bildgebung-befund-template"
        }
      },
      {
        "url" : "fullUrl",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "%NewBildgebungObsId"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "befund",
    "text" : "Befund",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Findings"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "birads-kategorie",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "72018-2",
        "display" : "BI-RADS"
      }],
      "text" : "BI-RADS Kategorie",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "BI-RADS Category"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-birads"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "acr-brustdichte",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "89180-4",
        "display" : "Breast density"
      }],
      "text" : "ACR Brustdichte",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ACR Breast Density"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-acr-brustdichte"
    },
    {
      "linkId" : "herdbefund-groesse",
      "text" : "Herdbefund Größe (mm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Mass Size (mm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "herdbefund-beschreibung",
      "text" : "Herdbefund Beschreibung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Mass Description"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "mikrokalk",
      "text" : "Mikrokalkifikationen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Microcalcifications"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-mikrokalk-triage"
    },
    {
      "linkId" : "mikrokalk-beschreibung",
      "text" : "Mikrokalkifikationen Beschreibung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Microcalcifications Description"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "enableWhen" : [{
        "question" : "mikrokalk",
        "operator" : "!=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom",
          "code" : "mikrokalk-nein"
        }
      }],
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "lk-status",
      "text" : "Axilläre Lymphknoten",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Axillary Lymph Nodes"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-lk-status-bildgebung"
    },
    {
      "linkId" : "lk-anzahl-suspekt",
      "text" : "Anzahl suspekter Lymphknoten",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Number of Suspicious Lymph Nodes"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "enableWhen" : [{
        "question" : "lk-status",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom",
          "code" : "lk-suspekt"
        }
      }],
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "us-degum",
      "text" : "US-DEGUM Klassifikation",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "US-DEGUM Classification"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-us-degum"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "beurteilbarkeit",
      "text" : "Beurteilbarkeit",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Assessability"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-beurteilbarkeit"
    }]
  },
  {
    "linkId" : "zusammenfassung",
    "text" : "Zusammenfassung",
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "gesamtbeurteilung",
      "text" : "Gesamtbeurteilung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Overall Assessment"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    },
    {
      "linkId" : "empfehlung",
      "text" : "Empfehlung",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Recommendation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  }]
}

```
