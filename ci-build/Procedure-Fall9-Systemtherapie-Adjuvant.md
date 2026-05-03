# Fall 9: Adjuvante Chemotherapie EC → Paclitaxel - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Adjuvante Chemotherapie EC → Paclitaxel**

## Example Procedure: Fall 9: Adjuvante Chemotherapie EC → Paclitaxel

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**performed**: 2025-04-28 --> 2025-09-15

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

**outcome**: Chemotherapie planmäßig abgeschlossen

**usedCode**: EC (Epirubicin/Cyclophosphamid) q3w x4, dann Paclitaxel 80 mg/m2 wöchentlich x12



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall9-Systemtherapie-Adjuvant",
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "performedPeriod" : {
    "start" : "2025-04-28",
    "end" : "2025-09-15"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-ende-grund",
      "code" : "E",
      "display" : "reguläres Ende"
    }],
    "text" : "Chemotherapie planmäßig abgeschlossen"
  },
  "usedCode" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-systemische-therapie-protokolle",
      "code" : "EC-P",
      "display" : "EC-P"
    }],
    "text" : "EC (Epirubicin/Cyclophosphamid) q3w x4, dann Paclitaxel 80 mg/m2 wöchentlich x12"
  }]
}

```
