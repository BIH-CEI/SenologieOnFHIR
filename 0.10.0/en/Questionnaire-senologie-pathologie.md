# Fragebogen: Pathologie Befund - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fragebogen: Pathologie Befund**

## Questionnaire: Form: Pathology Report (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Questionnaire/senologie-pathologie | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:QuestPathologieBefund |

 
Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation. 

*  [Tree view](#tabs-tree) 
*  [Sample Rendering](#tabs-sample) 
*  [Form Logic](#tabs-logic) 

### Test this Questionnaire

### Responses for this Questionnaire

* [Stanzbiopsie 2025-01-20: NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki67 15%, pT1c pN0(sn) (postoperative pTNM).](QuestionnaireResponse-QR-Pathologie-Fall1.md)



## Resource Content

```json
{
  "resourceType" : "Questionnaire",
  "id" : "senologie-pathologie",
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
    "id" : "patho-report-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund"]
    },
    "_status" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "iif(%resource.item.where(linkId='befund-status').answer.exists(), %resource.item.where(linkId='befund-status').answer.valueCoding.code, 'final')"
      }]
    },
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
        "code" : "SP",
        "display" : "Surgical Pathology"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "60568-3",
        "display" : "Pathology synoptic report"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    }
  },
  {
    "resourceType" : "Specimen",
    "id" : "patho-specimen-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat"]
    },
    "status" : "available",
    "type" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-art').answer.valueCoding"
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
    "collection" : {
      "_collectedDateTime" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-entnahmedatum').answer.valueDate"
        }]
      },
      "bodySite" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-Specimen.collection.bodySite",
          "valueReference" : {
            "_reference" : {
              "extension" : [{
                "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
                "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
              }]
            }
          }
        }],
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-seite').answer.valueCoding"
          }],
          "system" : "http://snomed.info/sct"
        }]
      }
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-histo-template",
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "33731-1",
        "display" : "Histology type in Cancer specimen"
      }]
    },
    "subject" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-er-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-er-status"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "40556-3",
        "display" : "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
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
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1234806008",
          "display" : "Percent of cells with estrogen receptor"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-prozent').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
          "code" : "irs-score",
          "display" : "IRS (Remmele-Stegner)"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-irs').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "445104009",
          "display" : "Allred score for neoplasm"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-allred').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1236874005",
          "display" : "Intensity of stain of estrogen receptor"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-intensitaet').answer.valueCoding"
          }]
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pr-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pr-status"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85339-0",
        "display" : "Progesterone receptor [Interpretation] in Tissue by Immune stain"
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
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1234803000",
          "display" : "Percent of cells with progesterone receptor"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-prozent').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
          "code" : "irs-score",
          "display" : "IRS (Remmele-Stegner)"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-irs').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "445104009",
          "display" : "Allred score for neoplasm"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-allred').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1237278006",
          "display" : "Intensity of stain of progesterone receptor"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-intensitaet').answer.valueCoding"
          }]
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-her2-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-her2-status"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48676-1",
        "display" : "HER2 [Interpretation] in Tissue"
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
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-gesamt').answer.valueCoding"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%questionnaire.item.where(linkId='ihc').item.where(linkId='ihc-her2-gesamt').answerOption.value.where(code = %resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-gesamt').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
        }]
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85319-2",
          "display" : "HER2 [Presence] in Breast cancer specimen"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-score').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85318-4",
          "display" : "ERBB2 gene duplication"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-fish').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
          "code" : "ish-methode",
          "display" : "ISH-Methode (FISH/CISH/DISH/SISH)"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-ish-methode').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
          "code" : "her2-ratio",
          "display" : "HER2/CEP17 Ratio"
        }]
      },
      "valueQuantity" : {
        "_value" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-ratio').answer.valueDecimal"
          }]
        }
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-ki67-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex"]
    },
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85330-9",
        "display" : "Ki67 [Presence] in Tissue by Immune stain"
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
    "valueQuantity" : {
      "_value" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-ki67').answer.valueInteger"
        }]
      }
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pdl1-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "96338-2",
        "display" : "PD-L1 expression in Tissue by Immune stain"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "95046-2",
          "display" : "PD-L1 expression cell number in Tissue by Immune stain"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-tps').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "96337-4",
          "display" : "Combined positive score"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-cps').answer.valueInteger"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "396395003",
          "display" : "Status of tumor infiltration by lymphocytes"
        }]
      },
      "_valueInteger" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-ic').answer.valueInteger"
        }]
      }
    }]
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-b-klassifikation-template",
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "33731-1",
        "display" : "Histology type in Cancer specimen"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='histologie').item.where(linkId='b-klassifikation').answer.valueCoding"
        }],
        "system" : "http://snomed.info/sct"
      }]
    },
    "specimen" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
        "valueString" : "%NewSpecimenId"
      }]
    }
  },
  {
    "resourceType" : "BodyStructure",
    "id" : "patho-bs-morphology-update-template",
    "meta" : {
      "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation"]
    },
    "active" : true,
    "patient" : {
      "_reference" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.subject.reference"
        }]
      }
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pt-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-t-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "384625004",
        "display" : "pT category (observable entity)"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pt').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pt').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pt').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
        }]
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pn-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-n-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "277206009",
        "display" : "pN category (observable entity)"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pn').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pn').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pn').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
        }]
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pm-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-m-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371497001",
        "display" : "pM category (observable entity)"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pm').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pm').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pm').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
        }]
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-l-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-l-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "395715009",
        "display" : "Lymph node invasion finding"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='l-kategorie').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-v-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-v-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371493002",
        "display" : "Vascular invasion finding"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='v-kategorie').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-pn-perineural-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-pn-kategorie"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371513001",
        "display" : "Perineural invasion finding"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pn-perineural').answer.valueCoding"
        }],
        "system" : "https://www.uicc.org/resources/tnm"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-r-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-r-symbol"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "101659-1",
        "display" : "Residual tumor"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='r-status').answer.valueCoding"
        }],
        "system" : "http://snomed.info/sct"
      }]
    }
  },
  {
    "resourceType" : "Observation",
    "id" : "patho-ptnm-aggregate-template",
    "meta" : {
      "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"]
    },
    "status" : "final",
    "category" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
        "code" : "laboratory"
      }]
    }],
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399588009",
        "display" : "Pathologic TNM stage grouping"
      },
      {
        "system" : "http://loinc.org",
        "code" : "21902-2",
        "display" : "Stage group.pathology Cancer"
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
          "valueString" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }]
      }
    }],
    "valueCodeableConcept" : {
      "coding" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
          "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='ptnm-uicc').answer.valueCoding"
        }]
      }]
    },
    "component" : [{
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21899-0",
          "display" : "Primary tumor.pathology Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pt').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pt').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pt').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21900-6",
          "display" : "Regional lymph nodes.pathology [Class] Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pn').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pn').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pn').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21901-4",
          "display" : "Distant metastases.pathology [Class] Cancer"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pm').answer.valueCoding"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%questionnaire.item.where(linkId='ptnm').item.where(linkId='pm').answerOption.value.where(code = %resource.item.where(linkId='ptnm').item.where(linkId='pm').answer.value.code).extension('http://hl7.org/fhir/StructureDefinition/alternate-codes').value.coding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "33739-4",
          "display" : "Lymphatic vessel invasion"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='l-kategorie').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "33740-2",
          "display" : "Venous vessel invasion"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='v-kategorie').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "92837-4",
          "display" : "Perineural invasion"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='pn-perineural').answer.valueCoding"
          }]
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "101659-1",
          "display" : "Residual tumor"
        }]
      },
      "valueCodeableConcept" : {
        "coding" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue",
            "valueString" : "%resource.item.where(linkId='ptnm').item.where(linkId='r-status').answer.valueCoding"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/variable",
    "valueExpression" : {
      "name" : "NewSpecimenId",
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
  "url" : "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie",
  "version" : "0.10.0",
  "name" : "QuestPathologieBefund",
  "title" : "Fragebogen: Pathologie Befund",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Form: Pathology Report"
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
  "description" : "Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation.",
  "item" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
      "valueCode" : "optionsOnly"
    }],
    "linkId" : "befund-status",
    "text" : "Befundstatus",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Report Status"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "choice",
    "required" : true,
    "answerOption" : [{
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/diagnostic-report-status",
        "code" : "preliminary",
        "display" : "Vorläufig (Schnellschnitt)"
      }
    },
    {
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/diagnostic-report-status",
        "code" : "final",
        "display" : "Abgeschlossen"
      },
      "initialSelected" : true
    },
    {
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/diagnostic-report-status",
        "code" : "amended",
        "display" : "Ergänzt"
      }
    },
    {
      "valueCoding" : {
        "system" : "http://hl7.org/fhir/diagnostic-report-status",
        "code" : "corrected",
        "display" : "Korrigiert"
      }
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-specimen-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "praeparat",
    "text" : "Präparat",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Specimen"
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
      "linkId" : "praeparat-art",
      "text" : "Art des Präparats",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Specimen Type"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : true,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-praeparat-art"
    },
    {
      "linkId" : "praeparat-entnahmedatum",
      "text" : "Entnahmedatum",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date of Removal"
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
      "linkId" : "praeparat-seite",
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
      "linkId" : "praeparat-quadrant",
      "text" : "Lokalisation / Quadrant",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Location / Quadrant"
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
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression",
        "valueExpression" : {
          "language" : "application/x-fhir-query",
          "expression" : "BodyStructure?patient={{%patient.id}}&active=true"
        }
      },
      {
        "extension" : [{
          "url" : "path",
          "valueString" : "location.coding.first().display"
        },
        {
          "url" : "label",
          "valueString" : "Lokalisation"
        },
        {
          "url" : "forDisplay",
          "valueBoolean" : true
        }],
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
      },
      {
        "extension" : [{
          "url" : "path",
          "valueString" : "locationQualifier.first().coding.first().display"
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
      },
      {
        "extension" : [{
          "url" : "path",
          "valueString" : "description"
        },
        {
          "url" : "label",
          "valueString" : "Details"
        },
        {
          "url" : "forDisplay",
          "valueBoolean" : true
        }],
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
      }],
      "linkId" : "praeparat-tumor-entitaet",
      "text" : "Tumor-Entität (aus Bildgebung)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Tumour Entity (from Imaging)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "reference",
      "required" : false
    }]
  },
  {
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-histo-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-b-klassifikation-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-bs-morphology-update-template"
        }
      },
      {
        "url" : "fullUrl",
        "valueExpression" : {
          "language" : "text/fhirpath",
          "expression" : "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "histologie",
    "text" : "Histologie",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Histology"
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
      "linkId" : "b-klassifikation",
      "text" : "Histologie allgemein (NHSBSP B-Klassifikation)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "General Histology (NHSBSP B-Classification)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-b-klassifikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "histo-typ",
      "text" : "Histologischer Typ",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Histological Type"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-histologie-typ"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "histo-grading",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371469007",
        "display" : "Histologic grade"
      }],
      "text" : "Grading (Elston-Ellis)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Grading (Elston-Ellis)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-grading-mamma"
    },
    {
      "linkId" : "histo-tumorgroesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "21889-1",
        "display" : "Size Tumor"
      }],
      "text" : "Tumorgröße (mm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Tumour Size (mm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-invasive-groesse",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "33728-7",
        "display" : "Size.maximum dimension in Tumor"
      }],
      "text" : "Invasive Tumorgröße (mm)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Invasive Tumour Size (mm)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-dcis-anteil",
      "text" : "DCIS-Anteil",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "DCIS Component"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "string",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "histo-resektionsrand",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "395536008",
        "display" : "Surgical margin finding"
      }],
      "text" : "Resektionsrand",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Resection Margin"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"
    },
    {
      "linkId" : "histo-sentinel-anzahl",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85347-3",
        "display" : "Sentinel lymph nodes examined [#]"
      }],
      "text" : "Sentinel-LK untersucht",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Sentinel LN Examined"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "histo-sentinel-befallen",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "92832-5",
        "display" : "Sentinel lymph nodes with metastasis [#]"
      }],
      "text" : "Sentinel-LK befallen",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Sentinel LN Positive"
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
          "reference" : "#patho-pt-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-pn-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-pm-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-l-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-v-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-pn-perineural-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-r-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-ptnm-aggregate-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "ptnm",
    "text" : "pTNM + Invasion + Resektionsstatus",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "pTNM + Invasion + Resection Status"
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
      "linkId" : "pt",
      "text" : "pT",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "pT"
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
                "code" : "1352532000",
                "display" : "pTX (UICC)"
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
                "code" : "1352552004",
                "display" : "pT0 (UICC)"
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
                "code" : "1352558000",
                "display" : "pTis (UICC)"
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
                "code" : "1352535003",
                "display" : "pTis(DCIS) (UICC)"
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
                "code" : "1352563001",
                "display" : "pTis(Paget) (UICC)"
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
                "code" : "1352559008",
                "display" : "pT1 (UICC)"
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
                "code" : "1352562006",
                "display" : "pT1mi (UICC)"
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
                "code" : "1352560003",
                "display" : "pT1a (UICC)"
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
                "code" : "1352543008",
                "display" : "pT1b (UICC)"
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
                "code" : "1352537006",
                "display" : "pT1c (UICC)"
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
                "code" : "1352545001",
                "display" : "pT2 (UICC)"
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
                "code" : "1352533005",
                "display" : "pT3 (UICC)"
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
                "code" : "1352553009",
                "display" : "pT4 (UICC)"
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
                "code" : "1352538001",
                "display" : "pT4a (UICC)"
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
                "code" : "1352561004",
                "display" : "pT4b (UICC)"
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
                "code" : "1352540006",
                "display" : "pT4c (UICC)"
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
                "code" : "1352557005",
                "display" : "pT4d (UICC)"
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
      "linkId" : "pn",
      "text" : "pN",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "pN"
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
                "code" : "1352605004",
                "display" : "pNX (UICC)"
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
                "code" : "1352621009",
                "display" : "pN0 (UICC)"
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
                "code" : "1352614009",
                "display" : "pN1 (UICC)"
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
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1352620005",
                "display" : "pN1mi (UICC)"
              }]
            }
          }],
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
                "code" : "1352619004",
                "display" : "pN1a (UICC)"
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
                "code" : "1352616006",
                "display" : "pN1b (UICC)"
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
                "code" : "1352617002",
                "display" : "pN1c (UICC)"
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
                "code" : "1352610000",
                "display" : "pN2 (UICC)"
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
                "code" : "1352608002",
                "display" : "pN2a (UICC)"
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
                "code" : "1352612008",
                "display" : "pN2b (UICC)"
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
                "code" : "1352622002",
                "display" : "pN3 (UICC)"
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
                "code" : "1352618007",
                "display" : "pN3a (UICC)"
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
                "code" : "1352623007",
                "display" : "pN3b (UICC)"
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
                "code" : "1352606003",
                "display" : "pN3c (UICC)"
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
      "linkId" : "pm",
      "text" : "pM",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "pM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
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
                "code" : "1352583000",
                "display" : "pM1 (UICC)"
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
      "linkId" : "l-kategorie",
      "text" : "L (Lymphangiosis carcinomatosa)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "L (Lymphovascular Invasion)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-l-kategorie"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "v-kategorie",
      "text" : "V (Venöse Invasion)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "V (Venous Invasion)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-v-kategorie"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "pn-perineural",
      "text" : "Pn (Perineuralinvasion)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Pn (Perineural Invasion)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-pn-kategorie"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "r-status",
      "text" : "R-Status (Resektionsstatus)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "R Status (Resection Status)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ptnm-uicc",
      "text" : "UICC-Gesamtstadium (pathologisch)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "UICC Overall Stage (Pathological)"
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
    "extension" : [{
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-er-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-pr-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-her2-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-ki67-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    },
    {
      "extension" : [{
        "url" : "template",
        "valueReference" : {
          "reference" : "#patho-pdl1-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "ihc",
    "text" : "Immunhistochemie / Rezeptorstatus",
    "_text" : {
      "extension" : [{
        "extension" : [{
          "url" : "lang",
          "valueCode" : "en"
        },
        {
          "url" : "content",
          "valueString" : "Immunohistochemistry / Receptor Status"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/translation"
      }]
    },
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "ihc-er-prozent",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1234804006",
        "display" : "Percent of cells with estrogen receptor"
      }],
      "text" : "ER Prozent positiv (%)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ER Percent Positive (%)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-er-irs",
      "code" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
        "code" : "irs-score",
        "display" : "IRS (Remmele-Stegner)"
      }],
      "text" : "ER IRS Score (0–12, Remmele-Stegner, DE-Standard)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ER IRS Score (0-12, Remmele-Stegner)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-er-allred",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "445104009",
        "display" : "Allred score for neoplasm"
      }],
      "text" : "ER Allred Score (0–8, international)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ER Allred Score (0-8)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-er-intensitaet",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1236874005",
        "display" : "Intensity of stain of estrogen receptor"
      }],
      "text" : "ER Färbeintensität",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ER Staining Intensity"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ihc-intensitaet"
    },
    {
      "linkId" : "ihc-pr-prozent",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1234803000",
        "display" : "Percent of cells with progesterone receptor"
      }],
      "text" : "PR Prozent positiv (%)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PR Percent Positive (%)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-irs",
      "code" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
        "code" : "irs-score",
        "display" : "IRS (Remmele-Stegner)"
      }],
      "text" : "PR IRS Score (0–12)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PR IRS Score (0-12)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pr-allred",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "445104009",
        "display" : "Allred score for neoplasm"
      }],
      "text" : "PR Allred Score (0–8)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PR Allred Score (0-8)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-pr-intensitaet",
      "code" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1237278006",
        "display" : "Intensity of stain of progesterone receptor"
      }],
      "text" : "PR Färbeintensität",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PR Staining Intensity"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ihc-intensitaet"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-her2-score",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85319-2",
        "display" : "HER2 [Presence] in Breast cancer specimen"
      }],
      "text" : "HER2 IHC Score",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2 IHC Score"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-ihc-score"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-her2-gesamt",
      "text" : "HER2-Gesamtstatus (Leitlinie, inkl. HER2-low / HER2-ultralow)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2 Overall Status (Guideline)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "required" : false,
      "answerOption" : [{
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
          "code" : "positiv",
          "display" : "HER2-positiv"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1381317004",
                "display" : "Human epidermal growth factor receptor 2 low"
              }]
            }
          }],
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
          "code" : "low",
          "display" : "HER2-low"
        }
      },
      {
        "valueCoding" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/alternate-codes",
            "valueCodeableConcept" : {
              "coding" : [{
                "system" : "http://snomed.info/sct",
                "code" : "1381318009",
                "display" : "Human epidermal growth factor receptor 2 ultralow"
              }]
            }
          }],
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
          "code" : "ultralow",
          "display" : "HER2-ultralow"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
          "code" : "negativ",
          "display" : "HER2-negativ"
        }
      },
      {
        "valueCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
          "code" : "equivocal",
          "display" : "equivocal"
        }
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-her2-fish",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85318-4",
        "display" : "ERBB2 gene duplication"
      }],
      "text" : "HER2 ISH/FISH",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2 ISH/FISH"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "ihc-her2-score",
        "operator" : "=",
        "answerCoding" : {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score",
          "code" : "2",
          "display" : "2+"
        }
      }],
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-fish"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint",
        "valueCode" : "optionsOnly"
      }],
      "linkId" : "ihc-her2-ish-methode",
      "text" : "HER2 ISH-Methode",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2 ISH Method"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "choice",
      "enableWhen" : [{
        "question" : "ihc-her2-fish",
        "operator" : "exists",
        "answerBoolean" : true
      }],
      "required" : false,
      "answerValueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-ish-methode"
    },
    {
      "linkId" : "ihc-her2-ratio",
      "text" : "HER2/CEP17 Ratio (FISH/CISH, Cutoff ≥ 2.0 = amplifiziert)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2/CEP17 Ratio (FISH/CISH)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "decimal",
      "enableWhen" : [{
        "question" : "ihc-her2-fish",
        "operator" : "exists",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "ihc-her2-kopienzahl",
      "text" : "HER2-Kopienzahl pro Zelle (Cutoff ≥ 6 = amplifiziert)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HER2 Copy Number per Cell (Cutoff >= 6)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "decimal",
      "enableWhen" : [{
        "question" : "ihc-her2-fish",
        "operator" : "exists",
        "answerBoolean" : true
      }],
      "required" : false
    },
    {
      "linkId" : "ihc-ki67",
      "code" : [{
        "system" : "http://loinc.org",
        "code" : "85330-9",
        "display" : "Ki67 [Presence] in Tissue by Immune stain"
      }],
      "text" : "Ki-67 Index (%)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Ki-67 Index (%)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pdl1-tps",
      "text" : "PD-L1 TPS (Tumor Proportion Score, %)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PD-L1 TPS (Tumour Proportion Score, %)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pdl1-cps",
      "text" : "PD-L1 CPS (Combined Positive Score)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PD-L1 CPS (Combined Positive Score)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "integer",
      "required" : false
    },
    {
      "linkId" : "ihc-pdl1-ic",
      "text" : "PD-L1 IC (Immune Cell Score, %)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "PD-L1 IC (Immune Cell Score, %)"
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
          "reference" : "#patho-report-template"
        }
      }],
      "url" : "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
    }],
    "linkId" : "beurteilung",
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
    "type" : "group",
    "required" : false,
    "item" : [{
      "linkId" : "beurteilung-ptnm",
      "text" : "pTNM",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "pTNM"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : "string",
      "required" : false
    },
    {
      "linkId" : "beurteilung-freitext",
      "text" : "Gesamtbeurteilung (Freitext)",
      "_text" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Overall Assessment (Free Text)"
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
