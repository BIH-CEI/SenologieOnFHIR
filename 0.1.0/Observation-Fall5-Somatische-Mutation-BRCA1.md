# Fall 5: BRCA1 somatisch — Mutation nachgewiesen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: BRCA1 somatisch — Mutation nachgewiesen**

## Example Observation: Fall 5: BRCA1 somatisch — Mutation nachgewiesen

Profile: [BIH Senologie Somatische Mutation](StructureDefinition-senologie-somatische-mutation.md)

**status**: Final

**category**: Laboratory, Genetics

**code**: Genetic variant assessment

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**effective**: 2025-02-01

**interpretation**: Mutation/positiv

**note**: 

> 

BRCA1 somatische Mutation im Tumorgewebe nachgewiesen


### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Gene studied [ID] | BRCA1 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall5-Somatische-Mutation-BRCA1",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectiveDateTime" : "2025-02-01",
  "interpretation" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-genetische-variante-auspraegung",
      "code" : "M",
      "display" : "Mutation/positiv"
    }]
  }],
  "note" : [{
    "text" : "BRCA1 somatische Mutation im Tumorgewebe nachgewiesen"
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
        "code" : "HGNC:1100",
        "display" : "BRCA1"
      }]
    }
  }]
}

```
