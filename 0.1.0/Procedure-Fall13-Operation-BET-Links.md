# Fall 13: BET links + SLNB - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: BET links + SLNB**

## Example Procedure: Fall 13: BET links + SLNB

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Excision of mass

**code**: BET links — Segmentresektion

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**performed**: 2025-04-02

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Links.md)

**bodySite**: Left breast structure

**outcome**: R0-Resektion



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall13-Operation-BET-Links",
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
      "display" : "Partielle (brusterhaltende) Exzision der Mamma: Lokale Exzision"
    }],
    "text" : "BET links — Segmentresektion"
  },
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "performedDateTime" : "2025-04-02",
  "reasonReference" : [{
    "reference" : "Condition/Fall13-Diagnose-Links"
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
  }
}

```
