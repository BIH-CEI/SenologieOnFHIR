# Fall 4: Neoadjuvante TCHP - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Neoadjuvante TCHP**

## Example Procedure: Fall 4: Neoadjuvante TCHP

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**performed**: 2025-03-10 --> 2025-07-20

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall4-Diagnose-Mammakarzinom.md)

**outcome**: Therapie planmäßig abgeschlossen, klinisch komplette Remission

**usedCode**: TCHP: Docetaxel 75 mg/m2 + Carboplatin AUC6 + Trastuzumab 6 mg/kg + Pertuzumab 420 mg, q3w x6 Zyklen



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall4-Systemtherapie-Neoadjuvant",
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "performedPeriod" : {
    "start" : "2025-03-10",
    "end" : "2025-07-20"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
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
      "code" : "TCH",
      "display" : "TCH"
    }],
    "text" : "TCHP: Docetaxel 75 mg/m2 + Carboplatin AUC6 + Trastuzumab 6 mg/kg + Pertuzumab 420 mg, q3w x6 Zyklen"
  }]
}

```
