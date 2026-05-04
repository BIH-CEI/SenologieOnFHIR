# Fall 1: Patientin Erika Neumann - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Patientin Erika Neumann**

## Example Patient: Fall 1: Patientin Erika Neumann

Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)

-------

| | |
| :--- | :--- |
| Contact Detail | Berlin DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall1-Patient-Erika-Neumann",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-001"
  }],
  "name" : [{
    "family" : "Neumann",
    "given" : ["Erika"]
  }],
  "gender" : "female",
  "birthDate" : "1966-03-12",
  "address" : [{
    "city" : "Berlin",
    "country" : "DE"
  }]
}

```
