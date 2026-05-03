# Fall 6: Patientin Petra Schneider - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: Patientin Petra Schneider**

## Example Patient: Fall 6: Patientin Petra Schneider

Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)

-------

| | |
| :--- | :--- |
| Contact Detail | Frankfurt DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall6-Patient-Petra-Schneider",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-006"
  }],
  "name" : [{
    "family" : "Schneider",
    "given" : ["Petra"]
  }],
  "gender" : "female",
  "birthDate" : "1958-09-08",
  "address" : [{
    "city" : "Frankfurt",
    "country" : "DE"
  }]
}

```
