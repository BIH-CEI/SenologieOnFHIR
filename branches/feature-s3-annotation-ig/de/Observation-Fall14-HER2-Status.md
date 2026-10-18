# Fall 14: HER2 IHC 2+ (equivocal) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: HER2 IHC 2+ (equivocal)**

##  Observation: Fall 14: HER2 IHC 2+ (equivocal)

-------

**German**

-------

Profil: [BIH Senologie HER2-Status (IHC)](StructureDefinition-senologie-her2-status.md)

**status**: Final

**code**: HER2 Ag [Interpretation] in Tissue

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**effective**: 2025-01-15

**value**: HER2-low

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | HER2 Ag [Presence] in Breast cancer specimen by Immune stain | 2+ |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall14-HER2-Status",
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
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "effectiveDateTime" : "2025-01-15",
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
        "code" : "LA11842-4",
        "display" : "2+"
      }]
    }
  }]
}

```
