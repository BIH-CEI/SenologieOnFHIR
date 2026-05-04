# Fall 8: Sentinel-Lymphknoten-Biopsie rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Sentinel-Lymphknoten-Biopsie rechts**

## Example Procedure: Fall 8: Sentinel-Lymphknoten-Biopsie rechts

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure (Modifizierte radikale) Mastektomie](Procedure-Fall8-Operation-Mastektomie.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Sentinel-Lymphknoten-Biopsie

**subject**: [Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008)](Patient-Fall8-Patient-Klaus-Hartmann.md)

**performed**: 2025-07-01

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall8-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**outcome**: Sentinel-LK negativ pN0(sn)(0/3)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall8-Operation-SLNB",
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
    "reference" : "Procedure/Fall8-Operation-Mastektomie"
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
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "performedDateTime" : "2025-07-01",
  "reasonReference" : [{
    "reference" : "Condition/Fall8-Diagnose-Mammakarzinom"
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
    "text" : "Sentinel-LK negativ pN0(sn)(0/3)"
  }
}

```
