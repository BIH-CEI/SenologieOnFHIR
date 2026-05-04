# Fall 5: BET rechts + SLNB - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: BET rechts + SLNB**

## Example Procedure: Fall 5: BET rechts + SLNB

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Excision of mass

**code**: BET rechts

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**performed**: 2025-07-15

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: ypT1a R0 — gutes Ansprechen auf neoadjuvante Therapie

**followUp**: Redon-Drainage 10 Ch, Kompressionsverband



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall5-Operation-BET",
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
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "392022002",
      "display" : "Excision of mass"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-870.a1",
      "display" : "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)"
    }],
    "text" : "BET rechts"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "performedDateTime" : "2025-07-15",
  "reasonReference" : [{
    "reference" : "Condition/Fall5-Diagnose-Mammakarzinom"
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
    "text" : "ypT1a R0 — gutes Ansprechen auf neoadjuvante Therapie"
  },
  "followUp" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122462000",
      "display" : "Drainage procedure"
    }],
    "text" : "Redon-Drainage 10 Ch"
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "182531007",
      "display" : "Dressing of wound"
    }],
    "text" : "Kompressionsverband"
  }]
}

```
