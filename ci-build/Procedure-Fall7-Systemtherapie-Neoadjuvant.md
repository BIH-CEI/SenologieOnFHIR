# Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC**

## Example Procedure: Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)](Patient-Fall7-Patient-Kathrin-Mueller.md)

**performed**: 2025-03-24 --> 2025-08-10

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall7-Diagnose-Mammakarzinom.md)

**outcome**: Therapie planmäßig abgeschlossen, klinisch komplette Remission

**usedCode**: Carboplatin AUC2 + Paclitaxel 80 mg/m2 wöchentlich x12, dann Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2 q3w x4



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall7-Systemtherapie-Neoadjuvant",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention",
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
      "code" : "18629005",
      "display" : "Administration of medication"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "8-54",
      "display" : "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "performedPeriod" : {
    "start" : "2025-03-24",
    "end" : "2025-08-10"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall7-Diagnose-Mammakarzinom"
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-ende-grund",
      "code" : "E",
      "display" : "reguläres Ende"
    }],
    "text" : "Therapie planmäßig abgeschlossen, klinisch komplette Remission"
  },
  "usedCode" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-systemische-therapie-protokolle",
      "code" : "CarboTax",
      "display" : "CarboTax"
    }],
    "text" : "Carboplatin AUC2 + Paclitaxel 80 mg/m2 wöchentlich x12, dann Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2 q3w x4"
  }]
}

```
