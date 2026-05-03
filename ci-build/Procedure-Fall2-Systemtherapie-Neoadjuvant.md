# Fall 2: Neoadjuvante Chemotherapie + Immuntherapie - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Neoadjuvante Chemotherapie + Immuntherapie**

## Example Procedure: Fall 2: Neoadjuvante Chemotherapie + Immuntherapie

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**performed**: 2025-03-01 --> 2025-07-15

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**outcome**: Therapie planmäßig abgeschlossen, klinisch gute Remission

**usedCode**: Carboplatin AUC5 + Paclitaxel 80 mg/m2 wöchentlich x12, dann AC (Doxorubicin/Cyclophosphamid) q3w x4, Pembrolizumab 200 mg q3w durchgehend



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall2-Systemtherapie-Neoadjuvant",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "performedPeriod" : {
    "start" : "2025-03-01",
    "end" : "2025-07-15"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-ende-grund",
      "code" : "E",
      "display" : "reguläres Ende"
    }],
    "text" : "Therapie planmäßig abgeschlossen, klinisch gute Remission"
  },
  "usedCode" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-systemische-therapie-protokolle",
      "code" : "CarboTax",
      "display" : "CarboTax"
    }],
    "text" : "Carboplatin AUC5 + Paclitaxel 80 mg/m2 wöchentlich x12, dann AC (Doxorubicin/Cyclophosphamid) q3w x4, Pembrolizumab 200 mg q3w durchgehend"
  }]
}

```
