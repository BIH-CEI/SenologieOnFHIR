# Fall 1: BRCA2 somatisch — Wildtyp - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: BRCA2 somatisch — Wildtyp**

## Example Observation: Fall 1: BRCA2 somatisch — Wildtyp

Profile: [BIH Senologie Somatische Mutation](StructureDefinition-senologie-somatische-mutation.md)

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-25

**interpretation**: Wildtyp/nicht mutiert/ negativ

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Gene studied [ID] | BRCA2 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Somatische-Mutation-BRCA2",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-somatische-mutation"]
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
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code" : "GE"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "69548-6",
      "display" : "Genetic variant assessment"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-25",
  "interpretation" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-genetische-variante-auspraegung",
      "code" : "W",
      "display" : "Wildtyp/nicht mutiert/ negativ"
    }]
  }],
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48018-6",
        "display" : "Gene studied [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.genenames.org/geneId",
        "code" : "HGNC:1101",
        "display" : "BRCA2"
      }]
    }
  }]
}

```
