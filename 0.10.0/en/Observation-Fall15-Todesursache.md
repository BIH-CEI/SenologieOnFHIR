# Fall 15: Todesursache — Mammakarzinom (C50.4) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Todesursache — Mammakarzinom (C50.4)**

## Example Observation: Fall 15: Todesursache — Mammakarzinom (C50.4)

-------

**English**

-------

**status**: Final

**code**: Cause of death

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**effective**: 2021-11-27

**value**: Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse

**note**: 

> 

Tumorbedingt (oBDS-Flag Tod_tumorbedingt=J)




## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall15-Todesursache",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "69453-9",
      "display" : "Cause of death"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall15-Patient-Michaela-Musterfrau"
  },
  "effectiveDateTime" : "2021-11-27",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "10 2022 GM",
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }]
  },
  "note" : [{
    "text" : "Tumorbedingt (oBDS-Flag Tod_tumorbedingt=J)"
  }]
}

```
