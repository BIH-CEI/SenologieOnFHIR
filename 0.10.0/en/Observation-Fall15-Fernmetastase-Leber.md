# Fall 15: Fernmetastase Leber - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Fernmetastase Leber**

## Example Observation: Fall 15: Fernmetastase Leber

-------

**English**

-------

**status**: Final

**code**: Secondary malignant neoplasm of liver

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**focus**: [Condition Mammakarzinom](Condition-Fall15-Diagnose-Mammakarzinom.md)

**effective**: 2021-09-14

**bodySite**: Liver structure



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall15-Fernmetastase-Leber",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "94381002",
      "display" : "Secondary malignant neoplasm of liver"
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
      "code" : "10200004",
      "display" : "Liver structure"
    }]
  }
}

```
