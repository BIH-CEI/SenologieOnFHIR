# Fall 1: ECOG-Leistungszustand 6 Monate postoperativ - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: ECOG-Leistungszustand 6 Monate postoperativ**

## Example Observation: Fall 1: ECOG-Leistungszustand 6 Monate postoperativ

-------

**English**

-------

Profile: [MII PR Onkologie Allgemeiner Leistungszustand ECOG](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-allgemeiner-leistungszustand-ecog.html)

**status**: Final

**code**: ECOG Performance Status score

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-08-15

**value**: Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-ECOG-6Monate",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "89247-1",
      "display" : "ECOG Performance Status score"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-08-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog",
      "code" : "0",
      "display" : "Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)"
    }]
  }
}

```
