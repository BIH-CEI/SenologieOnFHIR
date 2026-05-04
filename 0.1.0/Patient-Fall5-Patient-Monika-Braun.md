# Fall 5: Patientin Monika Braun - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Patientin Monika Braun**

## Example Patient: Fall 5: Patientin Monika Braun

Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)

-------

| | |
| :--- | :--- |
| Contact Detail | Hamburg DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall5-Patient-Monika-Braun",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-005"
  }],
  "name" : [{
    "family" : "Braun",
    "given" : ["Monika"]
  }],
  "gender" : "female",
  "birthDate" : "1970-04-03",
  "address" : [{
    "city" : "Hamburg",
    "country" : "DE"
  }]
}

```
