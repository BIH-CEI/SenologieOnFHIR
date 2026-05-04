# Fall 2: Todesursache — sekundäre Leberkarzinose - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Todesursache — sekundäre Leberkarzinose**

## Example Condition: Fall 2: Todesursache — sekundäre Leberkarzinose

Profile: [MII PR Person Todesursache](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4&canonical=https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache)

**category**: Death diagnosis

**code**: Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall2-Todesursache",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/core/modul-person/StructureDefinition/Todesursache"]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "16100001"
    },
    {
      "system" : "http://loinc.org",
      "code" : "79378-6"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "C78.7",
      "display" : "Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann-Verstorben"
  }
}

```
