# Fall 4: Patientin Julia Fischer - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Patientin Julia Fischer**

## Example Patient: Fall 4: Patientin Julia Fischer

Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)

-------

| | |
| :--- | :--- |
| Contact Detail | München DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall4-Patient-Julia-Fischer",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-004"
  }],
  "name" : [{
    "family" : "Fischer",
    "given" : ["Julia"]
  }],
  "gender" : "female",
  "birthDate" : "1987-11-22",
  "address" : [{
    "city" : "München",
    "country" : "DE"
  }]
}

```
