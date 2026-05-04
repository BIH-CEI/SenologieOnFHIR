# Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab**

## Example Procedure: Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**performed**: 2025-02-10 --> 2025-06-30

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

**outcome**: Therapie planmäßig abgeschlossen, klinisch partielle Remission

**usedCode**: EC (Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2) q3w x4, dann Docetaxel 100 mg/m2 + Trastuzumab 6 mg/kg q3w x4



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall5-Systemtherapie-Neoadjuvant",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "performedPeriod" : {
    "start" : "2025-02-10",
    "end" : "2025-06-30"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall5-Diagnose-Mammakarzinom"
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-ende-grund",
      "code" : "E",
      "display" : "reguläres Ende"
    }],
    "text" : "Therapie planmäßig abgeschlossen, klinisch partielle Remission"
  },
  "usedCode" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-systemische-therapie-protokolle",
      "code" : "EC-D",
      "display" : "EC-D"
    }],
    "text" : "EC (Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2) q3w x4, dann Docetaxel 100 mg/m2 + Trastuzumab 6 mg/kg q3w x4"
  }]
}

```
