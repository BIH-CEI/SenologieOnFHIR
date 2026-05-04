# Fall 2: ECOG-Leistungszustand bei Progression - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: ECOG-Leistungszustand bei Progression**

## Example Observation: Fall 2: ECOG-Leistungszustand bei Progression

Profile: [MII PR Onkologie Allgemeiner Leistungszustand ECOG](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.onkologie@2026.0.3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog)

**status**: Final

**code**: ECOG Performance Status score

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2026-03-15

**value**: Gehfähig, Selbstversorgung möglich, aber nicht arbeitsfähig; kann mehr als 50 % der Wachzeit aufstehen (50 - 60 % nach Karnofsky)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-ECOG-Progression",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectiveDateTime" : "2026-03-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog",
      "code" : "2",
      "display" : "Gehfähig, Selbstversorgung möglich, aber nicht arbeitsfähig; kann mehr als 50 % der Wachzeit aufstehen (50 - 60 % nach Karnofsky)"
    }]
  }
}

```
