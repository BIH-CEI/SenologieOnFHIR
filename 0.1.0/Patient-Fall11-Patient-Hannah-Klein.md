# Fall 11: Patientin Hannah Klein - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Patientin Hannah Klein**

## Example Patient: Fall 11: Patientin Hannah Klein

Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)

-------

| | |
| :--- | :--- |
| Contact Detail | Leipzig DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall11-Patient-Hannah-Klein",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-011"
  }],
  "name" : [{
    "family" : "Klein",
    "given" : ["Hannah"]
  }],
  "gender" : "female",
  "birthDate" : "1991-08-23",
  "address" : [{
    "city" : "Leipzig",
    "country" : "DE"
  }]
}

```
