# Fall 14: Nie-Raucher - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Nie-Raucher**

##  Observation: Fall 14: Nie-Raucher

-------

**German**

-------

Profil: [ISiK Raucherstatus](https://simplifier.net/resolve?scope=de.gematik.isik@6.0.0&canonical=https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus)

**status**: Final

**code**: Tobacco smoking status

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**effective**: 2025-01-15

**value**: Never smoker



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall14-Raucherstatus",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "72166-2",
      "display" : "Tobacco smoking status"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "effectiveDateTime" : "2025-01-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA18978-9",
      "display" : "Never smoker"
    }]
  }
}

```
