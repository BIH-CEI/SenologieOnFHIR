# Fall 15: Patientin Michaela van Musterfrau (oBDS-Testpatient) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Patientin Michaela van Musterfrau (oBDS-Testpatient)**

##  Patient: Fall 15: Patientin Michaela van Musterfrau (oBDS-Testpatient)

-------

**German**

-------

Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)

-------

| | |
| :--- | :--- |
| Deceased: | 2021-11-27 |
| Other Id: | `http://fhir.bih-charite.de/sid/patient-id`/SENO-OBDS-60 |
| Alt. Name: | Krüger (Name changed for Marriage) |
| Contact Detail | Kellerstr. 7 Heilbronn 74072 DE |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Fall15-Patient-Michaela-Musterfrau",
  "identifier" : [{
    "system" : "http://fhir.de/sid/gkv/kvid-10",
    "value" : "T221038567"
  },
  {
    "system" : "http://fhir.bih-charite.de/sid/patient-id",
    "value" : "SENO-OBDS-60"
  }],
  "name" : [{
    "use" : "official",
    "family" : "van Musterfrau",
    "given" : ["Michaela"],
    "prefix" : ["Dr."]
  },
  {
    "use" : "maiden",
    "family" : "Krüger"
  }],
  "gender" : "female",
  "birthDate" : "1950-10-15",
  "deceasedDateTime" : "2021-11-27",
  "address" : [{
    "line" : ["Kellerstr. 7"],
    "city" : "Heilbronn",
    "postalCode" : "74072",
    "country" : "DE"
  }]
}

```
