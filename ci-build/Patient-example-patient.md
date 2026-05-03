# Beispiel: Patientin - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Patientin**

## Example Patient: Beispiel: Patientin

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
