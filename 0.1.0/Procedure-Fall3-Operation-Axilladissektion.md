# Fall 3: Axilladissektion rechts Level I-II - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Axilladissektion rechts Level I-II**

## Example Procedure: Fall 3: Axilladissektion rechts Level I-II

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure (Modifizierte radikale) Mastektomie](Procedure-Fall3-Operation-Mastektomie.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Axilladissektion Level I-II

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**performed**: 2025-04-08

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall3-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: pN1a (2/12 LK positiv)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall3-Operation-Axilladissektion",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K",
        "display" : "kurativ"
      }]
    }
  }],
  "partOf" : [{
    "reference" : "Procedure/Fall3-Operation-Mastektomie"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "234262008",
      "display" : "Excision of axillary lymph node"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-402.11",
      "display" : "Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) als selbständiger Eingriff: Axillär: Level 1"
    }],
    "text" : "Axilladissektion Level I-II"
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "performedDateTime" : "2025-04-08",
  "reasonReference" : [{
    "reference" : "Condition/Fall3-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus",
      "code" : "R0",
      "display" : "Kein Residualtumor"
    }],
    "text" : "pN1a (2/12 LK positiv)"
  }
}

```
