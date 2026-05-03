# Fall 10: PD-L1 Status — CPS 25, positiv (SP142) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: PD-L1 Status — CPS 25, positiv (SP142)**

## Example Observation: Fall 10: PD-L1 Status — CPS 25, positiv (SP142)

Profile: [BIH Senologie PD-L1 Status](StructureDefinition-senologie-pdl1-status.md)

**status**: Final

**category**: Laboratory, A characterization of a given biomarker observation.

**code**: PD-L1 Immunhistochemie

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-06-05

**method**: PD-L1 IHC SP142 (Ventana/Roche)

> **component****code**: PD-L1 Combined Positive Score**value**: 25 score (Details: UCUM code{score} = '{score}')**interpretation**: Positive

> **component****code**: Cells.programmed cell death ligand 1/Viable tumor cells in Tissue by Immune stain**value**: 5 % (Details: UCUM code% = '%')**interpretation**: Positive



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-PDL1-Status",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-06-05",
  "method" : {
    "text" : "PD-L1 IHC SP142 (Ventana/Roche)"
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
      "value" : 25,
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
        "code" : "C199175",
        "display" : "Cells.programmed cell death ligand 1/Viable tumor cells in Tissue by Immune stain"
      }]
    },
    "valueQuantity" : {
      "value" : 5,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    },
    "interpretation" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
        "code" : "POS",
        "display" : "Positive"
      }]
    }]
  }]
}

```
