# Fall 13: Mastektomie rechts + ALND - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: Mastektomie rechts + ALND**

## Example Procedure: Fall 13: Mastektomie rechts + ALND

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Total mastectomy

**code**: SSM rechts mit ALND Level I-II

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**performed**: 2025-04-02

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Rechts.md)

**bodySite**: Right breast structure

**outcome**: R0-Resektion



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall13-Operation-Mastektomie-Rechts",
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
      "code" : "172043006",
      "display" : "Total mastectomy"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-872",
      "display" : "Mastektomie mit Entfernung von axillären Lymphknoten"
    }],
    "text" : "SSM rechts mit ALND Level I-II"
  },
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "performedDateTime" : "2025-04-02",
  "reasonReference" : [{
    "reference" : "Condition/Fall13-Diagnose-Rechts"
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
    "text" : "R0-Resektion"
  }
}

```
