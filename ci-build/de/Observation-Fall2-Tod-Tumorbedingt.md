# Fall 2: Tod tumorbedingt - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Tod tumorbedingt**

##  Observation: Fall 2: Tod tumorbedingt

-------

**German**

-------

Profil: [MII PR Onkologie Tod](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tod.html)

**status**: Final

**code**: Cause of death

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md)

**effective**: 2026-09-18

**value**: Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge

**interpretation**: Ja, die Person ist an einer Tumorerkrankung oder Folge einer Tumorerkrankung (einschließlich Behandlungskomplikation) verstorben.



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-Tod-Tumorbedingt",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tod"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "184305005"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann-Verstorben"
  },
  "effectiveDateTime" : "2026-09-18",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "C78.7",
      "display" : "Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge"
    }]
  },
  "interpretation" : [{
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-tod",
      "code" : "J",
      "display" : "Ja, die Person ist an einer Tumorerkrankung oder Folge einer Tumorerkrankung (einschließlich Behandlungskomplikation) verstorben."
    }]
  }]
}

```
