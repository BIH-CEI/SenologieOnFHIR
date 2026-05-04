# Fall 9: Patientin Andrea Wolf - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Patientin Andrea Wolf**

## Example Patient: Fall 9: Patientin Andrea Wolf

Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)

-------

| | |
| :--- | :--- |
| Contact Detail | Stuttgart DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall9-Patient-Andrea-Wolf",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-009"
  }],
  "name" : [{
    "family" : "Wolf",
    "given" : ["Andrea"]
  }],
  "gender" : "female",
  "birthDate" : "1974-05-29",
  "address" : [{
    "city" : "Stuttgart",
    "country" : "DE"
  }]
}

```
