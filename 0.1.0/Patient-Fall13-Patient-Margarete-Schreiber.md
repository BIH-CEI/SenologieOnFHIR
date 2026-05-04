# Fall 13: Patientin Margarete Schreiber - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: Patientin Margarete Schreiber**

## Example Patient: Fall 13: Patientin Margarete Schreiber

Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)

-------

| | |
| :--- | :--- |
| Contact Detail | Berlin DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall13-Patient-Margarete-Schreiber",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-013"
  }],
  "name" : [{
    "family" : "Schreiber",
    "given" : ["Margarete"]
  }],
  "gender" : "female",
  "birthDate" : "1960-08-22",
  "address" : [{
    "city" : "Berlin",
    "country" : "DE"
  }]
}

```
