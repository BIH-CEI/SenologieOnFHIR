# Fall 14: PR positiv, IRS 9, 73 % - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: PR positiv, IRS 9, 73 %**

##  Observation: Fall 14: PR positiv, IRS 9, 73 %

-------

**German**

-------

Profil: [BIH Senologie PR-Status](StructureDefinition-senologie-pr-status.md)

**status**: Final

**code**: Progesterone receptor [Interpretation] in Tissue by Immune stain

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**effective**: 2025-01-15

**value**: Positive

> **component****code**: Percent of cells with progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry**value**: 73 % (Details: UCUM code% = '%')

> **component****code**: Intensity of stain of progesterone receptor in primary malignant neoplasm of breast by immunohistochemistry (observable entity)**value**: Moderate

> **component****code**: IRS (Remmele-Stegner)**value**: 9 {score} (Details: UCUM code{score} = '{score}')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall14-PR-Status",
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
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "effectiveDateTime" : "2025-01-15",
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
      "value" : 73,
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
      "value" : 9,
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
    }
  }]
}

```
