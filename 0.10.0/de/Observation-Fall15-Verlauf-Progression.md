# Fall 15: Verlauf 2021-09-14 — Progression mit Fernmetastasen - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Verlauf 2021-09-14 — Progression mit Fernmetastasen**

##  Observation: Fall 15: Verlauf 2021-09-14 — Progression mit Fernmetastasen

-------

**German**

-------

**status**: Final

**code**: Response to cancer treatment

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**focus**: [Condition Mammakarzinom](Condition-Fall15-Diagnose-Mammakarzinom.md)

**effective**: 2021-09-14

**value**: Tumor progression

> **component****code**: Locoregional recurrence**value**: Recurrence local

> **component****code**: Clinical state of distant metastases**value**: Metastatic



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall15-Verlauf-Progression",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "88040-1",
      "display" : "Response to cancer treatment"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall15-Patient-Michaela-Musterfrau"
  },
  "focus" : [{
    "reference" : "Condition/Fall15-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2021-09-14",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "271299001",
      "display" : "Tumor progression"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "395709001",
        "display" : "Locoregional recurrence"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "395709001",
        "display" : "Recurrence local"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373572006",
        "display" : "Clinical state of distant metastases"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "79282002",
        "display" : "Metastatic"
      }]
    }
  }]
}

```
