# Fall 15: Fernmetastase Lunge - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Fernmetastase Lunge**

##  Observation: Fall 15: Fernmetastase Lunge

-------

**German**

-------

**status**: Final

**code**: Secondary malignant neoplasm of lung

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**focus**: [Condition Mammakarzinom](Condition-Fall15-Diagnose-Mammakarzinom.md)

**effective**: 2021-09-14

**bodySite**: Lung structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall15-Fernmetastase-Lunge",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "94391008",
      "display" : "Secondary malignant neoplasm of lung"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall15-Patient-Michaela-Musterfrau"
  },
  "focus" : [{
    "reference" : "Condition/Fall15-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2021-09-14",
  "bodySite" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "39607008",
      "display" : "Lung structure"
    }]
  }
}

```
