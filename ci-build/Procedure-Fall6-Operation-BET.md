# Fall 6: BET links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: BET links**

## Example Procedure: Fall 6: BET links

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**status**: Completed

**category**: Excision of mass

**code**: BET links (DCIS-Exzision)

**subject**: [Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)](Patient-Fall6-Patient-Petra-Schneider.md)

**performed**: 2025-04-22

**reasonReference**: [Condition Ductal carcinoma in situ of breast](Condition-Fall6-Diagnose-DCIS.md)

**bodySite**: Left breast structure

**outcome**: R0, knapper Resektionsrand (2 mm). Tis(DCIS), kein invasiver Anteil.

**followUp**: Redon-Drainage 10 Ch, Kompressionsverband



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall6-Operation-BET",
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
      "code" : "5-870.91",
      "display" : "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Lokale Exzision: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)"
    }],
    "text" : "BET links (DCIS-Exzision)"
  },
  "subject" : {
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "performedDateTime" : "2025-04-22",
  "reasonReference" : [{
    "reference" : "Condition/Fall6-Diagnose-DCIS"
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
    "text" : "R0, knapper Resektionsrand (2 mm). Tis(DCIS), kein invasiver Anteil."
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
