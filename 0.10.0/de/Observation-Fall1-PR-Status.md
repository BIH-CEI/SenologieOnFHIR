# Fall 1: PR-Status — positiv, IRS 8, 60 % / Moderate - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: PR-Status — positiv, IRS 8, 60 % / Moderate**

##  Observation: Fall 1: PR-Status — positiv, IRS 8, 60 % / Moderate

-------

**German**

-------

Profil: [BIH Senologie PR-Status](StructureDefinition-senologie-pr-status.md)

**status**: Final

**code**: Progesterone receptor [Interpretation] in Tissue by Immune stain

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-23

**value**: Positive

> **component****code**: Percent of cells with progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry**value**: 60 % (Details: UCUM code% = '%')

> **component****code**: Intensity of stain of progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)**value**: Moderate

> **component****code**: IRS (Remmele-Stegner)**value**: 8 {score} (Details: UCUM code{score} = '{score}')

> **component****code**: Allred score for neoplasm**value**: 7 {score} (Details: UCUM code{score} = '{score}')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-PR-Status",
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-23",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6576-8",
      "display" : "Positive"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie",
      "code" : "positiv",
      "display" : "positiv"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1234803000",
        "display" : "Percent of cells with progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry"
      }]
    },
    "valueQuantity" : {
      "value" : 60,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1237278006",
        "display" : "Intensity of stain of progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA13034-6",
        "display" : "Moderate"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
        "code" : "irs-score"
      }]
    },
    "valueQuantity" : {
      "value" : 8,
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
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
    "valueQuantity" : {
      "value" : 7,
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
    }
  }]
}

```
