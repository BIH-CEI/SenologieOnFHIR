# Fall 2: PD-L1 Status — CPS 15, positiv (22C3) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: PD-L1 Status — CPS 15, positiv (22C3)**

## Example Observation: Fall 2: PD-L1 Status — CPS 15, positiv (22C3)

Profile: [BIH Senologie PD-L1 Status](StructureDefinition-senologie-pdl1-status.md)

**status**: Final

**category**: Laboratory, A characterization of a given biomarker observation.

**code**: PD-L1 Immunhistochemie

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-02-18

**method**: PD-L1 IHC 22C3 pharmDx (Dako/Agilent)

> **component****code**: PD-L1 Combined Positive Score**value**: 15 score (Details: UCUM code{score} = '{score}')**interpretation**: Positive

> **component****code**: PD-L1 Tumor Proportion Score**value**: 10 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-PDL1-Status",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  },
  {
    "coding" : [{
      "system" : "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
      "code" : "biomarker-category"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1234806008",
      "display" : "Observation using immunohistochemistry (observable entity)"
    }],
    "text" : "PD-L1 Immunhistochemie"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2025-02-18",
  "method" : {
    "text" : "PD-L1 IHC 22C3 pharmDx (Dako/Agilent)"
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html",
        "code" : "C176582",
        "display" : "PD-L1 Combined Positive Score"
      }]
    },
    "valueQuantity" : {
      "value" : 15,
      "unit" : "score",
      "system" : "http://unitsofmeasure.org",
      "code" : "{score}"
    },
    "interpretation" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
        "code" : "POS",
        "display" : "Positive"
      }]
    }]
  },
  {
    "code" : {
      "coding" : [{
        "system" : "https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html",
        "code" : "C184941",
        "display" : "PD-L1 Tumor Proportion Score"
      }]
    },
    "valueQuantity" : {
      "value" : 10,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  }]
}

```
