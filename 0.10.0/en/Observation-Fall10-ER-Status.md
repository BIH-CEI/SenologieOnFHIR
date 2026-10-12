# Fall 10: ER-Status — negativ, IRS 0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: ER-Status — negativ, IRS 0**

## Example Observation: Fall 10: ER-Status — negativ, IRS 0

-------

**English**

-------

Profile: [BIH Senologie ER-Status](StructureDefinition-senologie-er-status.md)

**status**: Final

**code**: Estrogen receptor Ag [Presence] in Tissue by Immune stain

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-05-28

**value**: Negative

> **component****code**: Percent of cells with estrogen receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)**value**: 0 % (Details: UCUM code% = '%')

> **component****code**: IRS (Remmele-Stegner)**value**: 0 {score} (Details: UCUM code{score} = '{score}')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-ER-Status",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-28",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6577-6",
      "display" : "Negative"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie",
      "code" : "negativ",
      "display" : "negativ"
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
      "value" : 0,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
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
      "value" : 0,
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
    }
  }]
}

```
