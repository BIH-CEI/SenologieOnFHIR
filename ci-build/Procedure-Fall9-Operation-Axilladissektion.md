# Fall 9: Axilladissektion links Level I-III - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Axilladissektion links Level I-III**

## Example Procedure: Fall 9: Axilladissektion links Level I-III

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)](Procedure-Fall9-Operation-BET.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Axilladissektion Level I-III

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**performed**: 2025-10-01

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**outcome**: pN3a (12/18 LK befallen)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall9-Operation-Axilladissektion",
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
    "reference" : "Procedure/Fall9-Operation-BET"
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "performedDateTime" : "2025-10-01",
  "reasonReference" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-residualstatus",
      "code" : "R0",
      "display" : "Kein Residualtumor"
    }],
    "text" : "pN3a (12/18 LK befallen)"
  }
}

```
