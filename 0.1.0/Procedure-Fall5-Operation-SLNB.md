# Fall 5: Sentinel-Lymphknoten-Biopsie rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Sentinel-Lymphknoten-Biopsie rechts**

## Example Procedure: Fall 5: Sentinel-Lymphknoten-Biopsie rechts

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)](Procedure-Fall5-Operation-BET.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Sentinel-Lymphknoten-Biopsie

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**performed**: 2025-07-15

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: Sentinel-LK negativ ypN0(sn)(0/3)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall5-Operation-SLNB",
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
    "reference" : "Procedure/Fall5-Operation-BET"
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
      "code" : "5-401.11",
      "display" : "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"
    }],
    "text" : "Sentinel-Lymphknoten-Biopsie"
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
    "text" : "Sentinel-LK negativ ypN0(sn)(0/3)"
  }
}

```
