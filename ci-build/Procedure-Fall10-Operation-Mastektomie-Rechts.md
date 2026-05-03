# Fall 10: Therapeutische Mastektomie rechts + SLNB - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Therapeutische Mastektomie rechts + SLNB**

## Example Procedure: Fall 10: Therapeutische Mastektomie rechts + SLNB

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Simple mastectomy

**code**: Therapeutische Mastektomie rechts

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**performed**: 2025-06-18

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall10-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: R0-Resektion, Sentinel negativ pN0(sn)(0/2), Sofortrekonstruktion mit Implantat

**followUp**: Redon-Drainage 10 Ch, Kompressionsverband



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall10-Operation-Mastektomie-Rechts",
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
      "display" : "Simple mastectomy"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-872",
      "display" : "(Modifizierte radikale) Mastektomie"
    }],
    "text" : "Therapeutische Mastektomie rechts"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "performedDateTime" : "2025-06-18",
  "reasonReference" : [{
    "reference" : "Condition/Fall10-Diagnose-Mammakarzinom"
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
    "text" : "R0-Resektion, Sentinel negativ pN0(sn)(0/2), Sofortrekonstruktion mit Implantat"
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
