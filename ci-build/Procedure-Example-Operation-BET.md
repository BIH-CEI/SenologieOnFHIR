# Beispiel: BET links mit Sentinel-LK-Biopsie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: BET links mit Sentinel-LK-Biopsie**

## Example Procedure: Beispiel: BET links mit Sentinel-LK-Biopsie

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Excision of mass

**code**: BET links, Sentinel-LK-Biopsie

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**performed**: 2024-04-10

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**outcome**: R0-Resektion

**followUp**: Redon-Drainage 10 Ch, Kompressionsverband



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Example-Operation-BET",
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
      "code" : "5-870.a0",
      "display" : "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Ohne weitere Maßnahmen"
    }],
    "text" : "BET links, Sentinel-LK-Biopsie"
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "performedDateTime" : "2024-04-10",
  "reasonReference" : [{
    "reference" : "Condition/Example-Diagnose-Mammakarzinom"
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
    "text" : "R0-Resektion"
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
