# Fall 3: Patientin Sabine Weber - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Patientin Sabine Weber**

## Example Patient: Fall 3: Patientin Sabine Weber

Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)

-------

| | |
| :--- | :--- |
| Contact Detail | Berlin DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall3-Patient-Sabine-Weber",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-003"
  }],
  "name" : [{
    "family" : "Weber",
    "given" : ["Sabine"]
  }],
  "gender" : "female",
  "birthDate" : "1953-07-15",
  "address" : [{
    "city" : "Berlin",
    "country" : "DE"
  }]
}

```
