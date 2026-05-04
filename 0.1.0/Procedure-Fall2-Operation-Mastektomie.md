# Fall 2: Mastektomie rechts + Axilladissektion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Mastektomie rechts + Axilladissektion**

## Example Procedure: Fall 2: Mastektomie rechts + Axilladissektion

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Simple mastectomy

**code**: Mastektomie rechts

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**performed**: 2025-08-05

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: ypT1a R0, gutes Ansprechen auf neoadjuvante Therapie

**complication**: Serom postoperativ

**followUp**: Redon-Drainage 12 Ch x2, Kompressionsverband Thoraxwand



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall2-Operation-Mastektomie",
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
    "text" : "Mastektomie rechts"
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
    "text" : "ypT1a R0, gutes Ansprechen auf neoadjuvante Therapie"
  },
  "complication" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "56021002",
      "display" : "Seroma"
    }],
    "text" : "Serom postoperativ"
  }],
  "followUp" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122462000",
      "display" : "Drainage procedure"
    }],
    "text" : "Redon-Drainage 12 Ch x2"
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "182531007",
      "display" : "Dressing of wound"
    }],
    "text" : "Kompressionsverband Thoraxwand"
  }]
}

```
