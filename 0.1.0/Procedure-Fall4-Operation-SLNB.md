# Fall 4: Sentinel-Lymphknoten-Biopsie links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Sentinel-Lymphknoten-Biopsie links**

## Example Procedure: Fall 4: Sentinel-Lymphknoten-Biopsie links

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)](Procedure-Fall4-Operation-BET.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Sentinel-Lymphknoten-Biopsie

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**performed**: 2025-08-12

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall4-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**outcome**: Sentinel-LK negativ ypN0(sn)(0/3)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall4-Operation-SLNB",
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
    "reference" : "Procedure/Fall4-Operation-BET"
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "performedDateTime" : "2025-08-12",
  "reasonReference" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
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
    "text" : "Sentinel-LK negativ ypN0(sn)(0/3)"
  }
}

```
