# Fall 15: Histologie 2021-09-14 (Re-Biopsie) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Histologie 2021-09-14 (Re-Biopsie)**

##  Observation: Fall 15: Histologie 2021-09-14 (Re-Biopsie)

-------

**German**

-------

**status**: Final

**code**: Histology type in Cancer specimen

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**focus**: [Condition Mammakarzinom](Condition-Fall15-Diagnose-Mammakarzinom.md)

**effective**: 2021-09-14

**value**: Invasive ductal carcinoma, NOS

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Histologic grade | G3 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall15-Histologie-Rebiopsie",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "33731-1",
      "display" : "Histology type in Cancer specimen"
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
      "system" : "http://terminology.hl7.org/CodeSystem/icd-o-3",
      "version" : "31",
      "code" : "8500/3",
      "display" : "Invasive ductal carcinoma, NOS"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "371469007",
        "display" : "Histologic grade"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "61026006",
        "display" : "G3"
      }]
    }
  }]
}

```
