# Fall 10: ECOG-Leistungszustand nach Abschluss der Therapie - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: ECOG-Leistungszustand nach Abschluss der Therapie**

## Example Observation: Fall 10: ECOG-Leistungszustand nach Abschluss der Therapie

-------

**English**

-------

Profile: [MII PR Onkologie Allgemeiner Leistungszustand ECOG](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-allgemeiner-leistungszustand-ecog.html)

**status**: Final

**code**: ECOG Performance Status score

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2026-04-14

**value**: Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-ECOG-PostTherapie",
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2026-04-14",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog",
      "code" : "0",
      "display" : "Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)"
    }]
  }
}

```
