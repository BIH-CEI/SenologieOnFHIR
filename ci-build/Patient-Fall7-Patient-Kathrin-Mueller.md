# Fall 7: Patientin Kathrin Mueller - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Patientin Kathrin Mueller**

## Example Patient: Fall 7: Patientin Kathrin Mueller

Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)

-------

| | |
| :--- | :--- |
| Contact Detail | Köln DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall7-Patient-Kathrin-Mueller",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2025-007"
  }],
  "name" : [{
    "family" : "Mueller",
    "given" : ["Kathrin"]
  }],
  "gender" : "female",
  "birthDate" : "1977-06-17",
  "address" : [{
    "city" : "Köln",
    "country" : "DE"
  }]
}

```
