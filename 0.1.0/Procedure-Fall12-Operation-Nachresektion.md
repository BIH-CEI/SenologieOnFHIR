# Fall 12: Nachresektion / offene Biopsie links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Nachresektion / offene Biopsie links**

## Example Procedure: Fall 12: Nachresektion / offene Biopsie links

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: diagnostisch

**status**: Completed

**category**: Excision of mass

**code**: Offene Biopsie / Nachresektion links OIQ

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

**performed**: 2025-08-05

**reasonReference**: [Condition Neoplasm of uncertain behavior of breast](Condition-Fall12-Diagnose-ADH.md)

**bodySite**: Left breast structure

**outcome**: R0, kein Upgrade — nur ADH, kein DCIS, kein invasives Karzinom

**followUp**: Keine Drainage, Steristrips



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall12-Operation-Nachresektion",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "D",
        "display" : "diagnostisch"
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
      "code" : "5-870.a0",
      "display" : "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Direkte Adaptation der benachbarten Wundflächen oder Verzicht auf Adaptation"
    }],
    "text" : "Offene Biopsie / Nachresektion links OIQ"
  },
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "performedDateTime" : "2025-08-05",
  "reasonReference" : [{
    "reference" : "Condition/Fall12-Diagnose-ADH"
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
    "text" : "R0, kein Upgrade — nur ADH, kein DCIS, kein invasives Karzinom"
  },
  "followUp" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122462000",
      "display" : "Drainage procedure"
    }],
    "text" : "Keine Drainage"
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "182531007",
      "display" : "Dressing of wound"
    }],
    "text" : "Steristrips"
  }]
}

```
