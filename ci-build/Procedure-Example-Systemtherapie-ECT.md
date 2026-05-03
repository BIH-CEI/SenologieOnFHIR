# Beispiel: Neoadjuvante Chemotherapie EC-T - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Neoadjuvante Chemotherapie EC-T**

## Example Procedure: Beispiel: Neoadjuvante Chemotherapie EC-T

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**performed**: 2024-01-15 --> 2024-05-20

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

**outcome**: Therapie planmäßig abgeschlossen, klinisch partielle Remission

**usedCode**: EC-T (4x EC q3w, 4x Docetaxel q3w)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Example-Systemtherapie-ECT",
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
    "reference" : "Patient/example-patient"
  },
  "performedPeriod" : {
    "start" : "2024-01-15",
    "end" : "2024-05-20"
  },
  "reasonReference" : [{
    "reference" : "Condition/Example-Diagnose-Mammakarzinom"
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
    "text" : "EC-T (4x EC q3w, 4x Docetaxel q3w)"
  }]
}

```
