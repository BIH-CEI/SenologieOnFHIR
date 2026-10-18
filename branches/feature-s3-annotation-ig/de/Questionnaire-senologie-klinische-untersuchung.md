# Fragebogen: Klinische Untersuchung Mamma - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Klinische Untersuchung Mamma**

## Questionnaire: Fragebogen: Klinische Untersuchung Mamma () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung | **:0.10.0 |
| Draft | **:QuestKlinischeUntersuchung |

 
Klinische Inspektion, Palpation und klinisches TNM-Staging der Senologie. Bewusst ohne Sonographie/Bildgebung (→ Bildgebung-Form) und Biopsie-Doku (→ Pathologie-Form). 

*   
*   
*   

### 

### 

* [Klinische Untersuchung Fall 1: tastbarer Knoten OAQ links, Inspektion unauffaellig, cT1c cN0 cM0 IA.](QuestionnaireResponse-QR-KlinUntersuchung-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-klinische-untersuchung",
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
    "resourceType" : "Observation",
    "id" : "klin-unt-obs-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "exam"
      }]
    }],
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
    }],
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='datum').answer.valueDate"
      }]
    },
    "note" : [{
      "_text" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='zusammenfassung').item.where(linkId='zusammenfassung-text').answer.valueString"
        }]
      }
    }],
    "component" : [{
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "24028007",
                "display" : "Right"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "76752008",
          "display" : "Breast structure"
        }]
      },
      "_valueBoolean" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts-vorhanden').answer.valueBoolean.exists(), %resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts-vorhanden').answer.valueBoolean, true)"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "24028007",
                "display" : "Right"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "46662001",
          "display" : "Examination of breast"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "7771000",
                "display" : "Left"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "46662001",
          "display" : "Examination of breast"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "366348007",
          "display" : "Finding of symmetry of breasts"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='inspektion').item.where(linkId='symmetrie').answer.valueCoding"
          }],
          "system" : "http://snomed.info/sct"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "271691008",
          "display" : "Finding of asymmetry"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='inspektion').item.where(linkId='asymmetrisch-zugunsten').answer.valueCoding"
          }],
          "system" : "http://snomed.info/sct"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "24028007",
                "display" : "Right"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "248804005",
          "display" : "Ptotic breast"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='inspektion').item.where(linkId='ptosis-rechts').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "7771000",
                "display" : "Left"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "248804005",
          "display" : "Ptotic breast"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='inspektion').item.where(linkId='ptosis-links').answer.valueCoding"
          }],
          "system" : "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "24028007",
                "display" : "Right"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "118242002",
          "display" : "Finding by palpation"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-mamma-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "7771000",
                "display" : "Left"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "118242002",
          "display" : "Finding by palpation"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-mamma-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "24028007",
                "display" : "Right"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "284429001",
          "display" : "Examination of axillary lymph nodes"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-axilla-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "7771000",
                "display" : "Left"
              }]
            }
          }],
          "system" : "http://snomed.info/sct",
          "code" : "284429001",
          "display" : "Examination of axillary lymph nodes"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "_code" : {
            "extension" : [{
              "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
              "valueString" : "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-axilla-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
            }]
          }
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "399504009",
          "display" : "cT category (observable entity)"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.valueCoding"
          }],
          "system" : "https://www.uicc.org/resources/tnm"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answerOption.value.where(code = %resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "399534004",
          "display" : "cN category (observable entity)"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.valueCoding"
          }],
          "system" : "https://www.uicc.org/resources/tnm"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answerOption.value.where(code = %resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Status of disease (observable entity)"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='zusammenfassung').item.where(linkId='tumornachweis').answer.valueCoding"
          }],
          "system" : "http://snomed.info/sct"
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "klin-unt-ctnm-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "exam"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399537006",
        "display" : "Clinical TNM stage grouping"
      },
      {
        "system" : "http://loinc.org",
        "code" : "21908-9",
        "display" : "Stage group.clinical Cancer"
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
    }],
    "_effectiveDateTime" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%resource.item.where(linkId='datum').answer.valueDate"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ctnm-uicc').answer.valueCoding"
        }]
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21905-5",
          "display" : "Primary tumor.clinical [Class] Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answerOption.value.where(code = %resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21906-3",
          "display" : "Regional lymph nodes.clinical [Class] Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answerOption.value.where(code = %resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21907-1",
          "display" : "Distant metastases.clinical [Class] Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cm').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='klinisches-tnm').item.where(linkId='cm').answerOption.value.where(code = %resource.item.where(linkId='klinisches-tnm').item.where(linkId='cm').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
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
      "url" : "name",
      "valueCoding" : {
        "system" : "https://www.senologie.org/fhir/CodeSystem/launchContext",
        "code" : "diagnosis"
      }
    },
    {
      "url" : "type",
      "valueCode" : "Condition"
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  },
  {
    "extension" : [{
      "url" : "template",
      "valueReference" : {
        "reference" : "#klin-unt-obs-template"
      }
    }],
    "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
  }],
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung",
  "version" : "0.10.0",
  "name" : "QuestKlinischeUntersuchung",
  "title" : "Fragebogen: Klinische Untersuchung Mamma",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Clinical Breast Examination"
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
  "description" : "Klinische Inspektion, Palpation und klinisches TNM-Staging der Senologie. Bewusst ohne Sonographie/Bildgebung (→ Bildgebung-Form) und Biopsie-Doku (→ Pathologie-Form).",
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
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Patient"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "reference",
    "required" : true,
    "readOnly" : true
  },
  {
    "linkId" : "datum",
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
    "linkId" : "detailliert",
    "text" : "Detailliert anlegen?",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Create Detailed Entry?"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "boolean",
    "required" : false
  },
  {
    "linkId" : "inspektion",
    "text" : "Inspektion",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Inspection"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "linkId" : "inspektion-mamma-rechts-vorhanden",
      "text" : "Mamma rechts vorhanden",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Right Breast Present"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "boolean",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "inspektion-mamma-rechts",
      "text" : "Inspektion Mamma rechts",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Inspection Right Breast"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "linkId" : "inspektion-mamma-links-vorhanden",
      "text" : "Mamma links vorhanden",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Left Breast Present"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "boolean",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "inspektion-mamma-links",
      "text" : "Inspektion Mamma links",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Inspection Left Breast"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "symmetrie",
      "text" : "Symmetrie Mammae",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Breast Symmetry"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-symmetrie"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "asymmetrisch-zugunsten",
      "text" : "Asymmetrisch zugunsten",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Asymmetric in Favour of"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "symmetrie",
        "operator" : "=",
        "answerCoding" : {
          "system" : "http://snomed.info/sct",
          "code" : "31739005"
        }
      }],
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ptosis-rechts",
      "text" : "Ptosis rechts (Regnault)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Ptosis Right (Regnault)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ptosis-grad"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ptosis-links",
      "text" : "Ptosis links (Regnault)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Ptosis Left (Regnault)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ptosis-grad"
    },
    {
      "linkId" : "inspektion-details",
      "text" : "Details Inspektion",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Inspection Details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "linkId" : "palpation",
    "text" : "Palpation",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Palpation"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "item" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "palpation-mamma-rechts",
      "text" : "Palpation Mamma/Thoraxwand rechts",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Palpation Breast/Chest Wall Right"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "palpation-mamma-links",
      "text" : "Palpation Mamma/Thoraxwand links",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Palpation Breast/Chest Wall Left"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "palpation-axilla-rechts",
      "text" : "Palpation Axilla/LAW rechts",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Palpation Axilla/LAW Right"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "palpation-axilla-links",
      "text" : "Palpation Axilla/LAW links",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Palpation Axilla/LAW Left"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
    },
    {
      "linkId" : "palpation-details",
      "text" : "Details Palpation",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Palpation Details"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "text",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#klin-unt-ctnm-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "klinisches-tnm",
    "text" : "Klinisches TNM (Einschätzung des Untersuchers)",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Clinical TNM (Examiner Assessment)"
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
      "linkId" : "ct",
      "text" : "cT",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "cT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352975000",
                "display" : "cTX (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "TX",
          "display" : "TX — Primärtumor kann nicht beurteilt werden"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352986003",
                "display" : "cT0 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T0",
          "display" : "T0 — Kein Anhalt für Primärtumor"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352984000",
                "display" : "cTis (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "Tis",
          "display" : "Tis — Carcinoma in situ"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352965003",
                "display" : "cTis(DCIS) (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "Tis(DCIS)",
          "display" : "Tis (DCIS) — Ductales Carcinoma in situ"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352987007",
                "display" : "cTis(Paget) (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "Tis(Paget)",
          "display" : "Tis (Paget) — M. Paget der Mamille ohne nachweisbaren Tumor"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352996007",
                "display" : "cT1 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T1",
          "display" : "T1 — Tumor ≤ 2 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352979006",
                "display" : "cT1mi (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T1mi",
          "display" : "T1mi — Mikroinvasion ≤ 0,1 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352983006",
                "display" : "cT1a (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T1a",
          "display" : "T1a — > 0,1 cm und ≤ 0,5 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352968001",
                "display" : "cT1b (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T1b",
          "display" : "T1b — > 0,5 cm und ≤ 1 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352973007",
                "display" : "cT1c (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T1c",
          "display" : "T1c — > 1 cm und ≤ 2 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352993004",
                "display" : "cT2 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T2",
          "display" : "T2 — > 2 cm und ≤ 5 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352966002",
                "display" : "cT3 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T3",
          "display" : "T3 — > 5 cm"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352997003",
                "display" : "cT4 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T4",
          "display" : "T4 — jede Größe mit Ausdehnung auf Brustwand/Haut"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352982001",
                "display" : "cT4a (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T4a",
          "display" : "T4a — Ausdehnung auf Brustwand"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352960008",
                "display" : "cT4b (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T4b",
          "display" : "T4b — Hautulzeration / -ödem / Satellitenmetastasen"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352980009",
                "display" : "cT4c (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T4c",
          "display" : "T4c — T4a + T4b"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352963005",
                "display" : "cT4d (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "T4d",
          "display" : "T4d — Inflammatorisches Karzinom"
        }
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "cn",
      "text" : "cN",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "cN"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353039008",
                "display" : "cNX (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "NX",
          "display" : "NX — Regionäre LK können nicht beurteilt werden"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353041009",
                "display" : "cN0 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N0",
          "display" : "N0 — Keine regionären LK-Metastasen"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353043007",
                "display" : "cN1 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N1",
          "display" : "N1 — Bewegliche ipsilaterale axilläre LK Level I/II"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N1mi",
          "display" : "N1 (mi) — Mikrometastasen (> 0,2 mm und/oder > 200 Zellen, aber ≤ 2 mm)"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353046004",
                "display" : "cN1a (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N1a",
          "display" : "N1a — 1–3 axilläre LK"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353048003",
                "display" : "cN1b (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N1b",
          "display" : "N1b — Mammaria-interna-LK ohne axilläre"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353044001",
                "display" : "cN1c (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N1c",
          "display" : "N1c — N1a + N1b"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353047008",
                "display" : "cN2 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N2",
          "display" : "N2 — Fixierte/verbackene axilläre oder klinisch erkennbare A. mammaria interna"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353050006",
                "display" : "cN2a (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N2a",
          "display" : "N2a — 4–9 axilläre LK"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353055001",
                "display" : "cN2b (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N2b",
          "display" : "N2b — Klinisch erkennbare Mammaria-interna-LK ohne axilläre"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353053008",
                "display" : "cN3 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N3",
          "display" : "N3 — Infraklavikuläre / supraklavikuläre / Kombinationen"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353057009",
                "display" : "cN3a (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N3a",
          "display" : "N3a — ≥ 10 axilläre LK oder infraklavikuläre LK"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353054002",
                "display" : "cN3b (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N3b",
          "display" : "N3b — Klinisch erkennbare A. mammaria interna + axilläre LK"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1353051005",
                "display" : "cN3c (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "N3c",
          "display" : "N3c — Supraklavikuläre LK"
        }
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "cm",
      "text" : "cM",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "cM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352512001",
                "display" : "cM0 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "M0",
          "display" : "M0 — Keine Fernmetastasen"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352513006",
                "display" : "cM1 (UICC)"
              }]
            }
          }],
          "system" : "https://www.uicc.org/resources/tnm",
          "code" : "M1",
          "display" : "M1 — Fernmetastasen vorhanden"
        }
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ctnm-uicc",
      "text" : "cUICC-Gesamtstadium (klinisch)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "cUICC Overall Stage (Clinical)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-uicc-stadium-mamma"
    }]
  },
  {
    "linkId" : "zusammenfassung",
    "text" : "Zusammenfassung",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Summary"
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
      "linkId" : "tumornachweis",
      "text" : "Tumornachweis",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Tumour Evidence"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status"
    },
    {
      "linkId" : "zusammenfassung-text",
      "text" : "Zusammenfassung (Freitext)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Summary (Free Text)"
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
