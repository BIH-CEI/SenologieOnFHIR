# Fall 1: HER2-Status — HER2-low (IHC 1+, KEINE ISH nötig) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: HER2-Status — HER2-low (IHC 1+, KEINE ISH nötig)**

## Example Observation: Fall 1: HER2-Status — HER2-low (IHC 1+, KEINE ISH nötig)

-------

**English**

-------

Profile: [BIH Senologie HER2-Status (IHC)](StructureDefinition-senologie-her2-status.md)

**status**: Final

**code**: HER2 Ag [Interpretation] in Tissue

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-23

**value**: HER2-low

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | HER2 Ag [Presence] in Breast cancer specimen by Immune stain | 1+ |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-HER2-Status",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-her2-status"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "48676-1",
      "display" : "HER2 Ag [Interpretation] in Tissue"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-23",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
      "code" : "low",
      "display" : "HER2-low"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds",
      "code" : "N",
      "display" : "negativ"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "1381317004",
      "display" : "Human epidermal growth factor receptor 2 low"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85319-2",
        "display" : "HER2 Ag [Presence] in Breast cancer specimen by Immune stain"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "LA11841-6",
        "display" : "1+"
      }]
    }
  }]
}

```
