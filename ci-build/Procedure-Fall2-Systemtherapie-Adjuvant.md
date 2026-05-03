# Fall 2: Adjuvante Pembrolizumab Maintenance - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Adjuvante Pembrolizumab Maintenance**

## Example Procedure: Fall 2: Adjuvante Pembrolizumab Maintenance

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Immuntherapie mit monoklonalen Antikörpern: PD-1-Antikörper

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**performed**: 2025-10-01 --> 2026-07-01

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**outcome**: Pembrolizumab Maintenance für 9 Zyklen, dann Abbruch wegen Progression

**usedCode**: Pembrolizumab 200 mg q3w, adjuvant Maintenance



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall2-Systemtherapie-Adjuvant",
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
      "code" : "8-547.32",
      "display" : "Immuntherapie mit monoklonalen Antikörpern: PD-1-Antikörper"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "performedPeriod" : {
    "start" : "2025-10-01",
    "end" : "2026-07-01"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "outcome" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-ende-grund",
      "code" : "P",
      "display" : "Abbruch wegen Progress"
    }],
    "text" : "Pembrolizumab Maintenance für 9 Zyklen, dann Abbruch wegen Progression"
  },
  "usedCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "716125002",
      "display" : "Pembrolizumab"
    }],
    "text" : "Pembrolizumab 200 mg q3w, adjuvant Maintenance"
  }]
}

```
