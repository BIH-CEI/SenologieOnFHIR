# Fall 1: ER-Status — positiv, IRS 12, 95 % / Strong - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: ER-Status — positiv, IRS 12, 95 % / Strong**

## Example Observation: Fall 1: ER-Status — positiv, IRS 12, 95 % / Strong

-------

**English**

-------

Profile: [BIH Senologie ER-Status](StructureDefinition-senologie-er-status.md)

**status**: Final

**code**: Estrogen receptor Ag [Presence] in Tissue by Immune stain

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-23

**value**: Positive

> **component****code**: Percent of cells with estrogen receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)**value**: 95 % (Details: UCUM code% = '%')

> **component****code**: Intensity of stain of estrogen receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)**value**: Strong

> **component****code**: IRS (Remmele-Stegner)**value**: 12 {score} (Details: UCUM code{score} = '{score}')

> **component****code**: Allred score for neoplasm**value**: 8 {score} (Details: UCUM code{score} = '{score}')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-ER-Status",
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
        "code" : "1234804006",
        "display" : "Percent of cells with estrogen receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)"
      }]
    },
    "valueQuantity" : {
      "value" : 95,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1236874005",
        "display" : "Intensity of stain of estrogen receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA13035-3",
        "display" : "Strong"
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
      "value" : 12,
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
      "value" : 8,
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
    }
  }]
}

```
