# Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel**

## Example Procedure: Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**performed**: 2025-07-21 --> 2025-11-10

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall10-Diagnose-Mammakarzinom.md)

**outcome**: Chemotherapie planmäßig abgeschlossen

**usedCode**: Carboplatin AUC5 q3w + Paclitaxel 175 mg/m2 q3w x6 Zyklen (TNBC + BRCA1)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall10-Systemtherapie-Adjuvant",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "performedPeriod" : {
    "start" : "2025-07-21",
    "end" : "2025-11-10"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall10-Diagnose-Mammakarzinom"
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
      "code" : "CarboTax",
      "display" : "CarboTax"
    }],
    "text" : "Carboplatin AUC5 q3w + Paclitaxel 175 mg/m2 q3w x6 Zyklen (TNBC + BRCA1)"
  }]
}

```
