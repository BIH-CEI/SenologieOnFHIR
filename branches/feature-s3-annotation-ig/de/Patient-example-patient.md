# Beispiel: Patientin - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Patientin**

##  Patient: Beispiel: Patientin

-------

**German**

-------

Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)

-------



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "example-patient",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-2024-001"
  }],
  "name" : [{
    "family" : "Musterfrau",
    "given" : ["Maria"]
  }],
  "gender" : "female",
  "birthDate" : "1965-03-12"
}

```
