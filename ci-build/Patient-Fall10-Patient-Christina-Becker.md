# Fall 10: Patientin Christina Becker - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Patientin Christina Becker**

## Example Patient: Fall 10: Patientin Christina Becker

Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)

-------

| | |
| :--- | :--- |
| Contact Detail | Berlin DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall10-Patient-Christina-Becker",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-010"
  }],
  "name" : [{
    "family" : "Becker",
    "given" : ["Christina"]
  }],
  "gender" : "female",
  "birthDate" : "1982-12-14",
  "address" : [{
    "city" : "Berlin",
    "country" : "DE"
  }]
}

```
