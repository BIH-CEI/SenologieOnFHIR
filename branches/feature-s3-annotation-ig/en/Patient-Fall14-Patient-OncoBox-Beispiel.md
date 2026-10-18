# Fall 14: OncoBox-Beispielpatient (re-engineered) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: OncoBox-Beispielpatient (re-engineered)**

## Example Patient: Fall 14: OncoBox-Beispielpatient (re-engineered)

-------

**English**

-------

Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)

-------

| | |
| :--- | :--- |
| Active: | true |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall14-Patient-OncoBox-Beispiel",
  "identifier" : [{
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "Fall14-Patient-1"
  }],
  "active" : true,
  "name" : [{
    "family" : "Test",
    "given" : ["Patient"]
  }],
  "gender" : "male",
  "birthDate" : "1946"
}

```
