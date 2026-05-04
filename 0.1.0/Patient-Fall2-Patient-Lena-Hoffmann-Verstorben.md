# Fall 2: Patientin Lena Hoffmann (verstorben) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Patientin Lena Hoffmann (verstorben)**

## Example Patient: Fall 2: Patientin Lena Hoffmann (verstorben)

Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)

-------

| | |
| :--- | :--- |
| Deceased: | 2026-09-18 |
| Contact Detail | Berlin DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall2-Patient-Lena-Hoffmann-Verstorben",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-002"
  }],
  "name" : [{
    "family" : "Hoffmann",
    "given" : ["Lena"]
  }],
  "gender" : "female",
  "birthDate" : "1980-09-28",
  "deceasedDateTime" : "2026-09-18",
  "address" : [{
    "city" : "Berlin",
    "country" : "DE"
  }]
}

```
