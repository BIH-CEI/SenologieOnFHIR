# Fall 2: Axilladissektion rechts Level I-III - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Axilladissektion rechts Level I-III**

## Example Procedure: Fall 2: Axilladissektion rechts Level I-III

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure (Modifizierte radikale) Mastektomie](Procedure-Fall2-Operation-Mastektomie.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Axilladissektion Level I-III

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**performed**: 2025-08-05

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: ypN0 (0/14 LK negativ)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall2-Operation-Axilladissektion",
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
    "reference" : "Procedure/Fall2-Operation-Mastektomie"
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
      "code" : "5-402.12",
      "display" : "Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) als selbständiger Eingriff: Axillär: Level 1 und 2"
    }],
    "text" : "Axilladissektion Level I-III"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "performedDateTime" : "2025-08-05",
  "reasonReference" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
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
    "text" : "ypN0 (0/14 LK negativ)"
  }
}

```
