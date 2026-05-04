# Fall 12: Patientin Renate Vogel - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Patientin Renate Vogel**

## Example Patient: Fall 12: Patientin Renate Vogel

Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)

-------

| | |
| :--- | :--- |
| Contact Detail | Bonn DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall12-Patient-Renate-Vogel",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-012"
  }],
  "name" : [{
    "family" : "Vogel",
    "given" : ["Renate"]
  }],
  "gender" : "female",
  "birthDate" : "1981-03-06",
  "address" : [{
    "city" : "Bonn",
    "country" : "DE"
  }]
}

```
