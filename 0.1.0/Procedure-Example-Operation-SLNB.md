# Beispiel: Sentinel-Lymphknoten-Biopsie links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Sentinel-Lymphknoten-Biopsie links**

## Example Procedure: Beispiel: Sentinel-Lymphknoten-Biopsie links

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Ohne weitere Maßnahmen](Procedure-Example-Operation-BET.md)

**status**: Completed

**category**: Excision of axillary lymph node

**code**: Sentinel-Lymphknoten-Biopsie

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**performed**: 2024-04-10

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**outcome**: Sentinel-LK negativ



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Example-Operation-SLNB",
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
    "reference" : "Procedure/Example-Operation-BET"
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
    "text" : "Sentinel-LK negativ"
  }
}

```
