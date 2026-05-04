# Fall 8: Patient Klaus Hartmann - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Patient Klaus Hartmann**

## Example Patient: Fall 8: Patient Klaus Hartmann

Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008)

-------

| | |
| :--- | :--- |
| Contact Detail | Dresden DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall8-Patient-Klaus-Hartmann",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-008"
  }],
  "name" : [{
    "family" : "Hartmann",
    "given" : ["Klaus"]
  }],
  "gender" : "male",
  "birthDate" : "1956-02-11",
  "address" : [{
    "city" : "Dresden",
    "country" : "DE"
  }]
}

```
