# Fall 10: Prophylaktische Mastektomie links (risikoreduktiv) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Prophylaktische Mastektomie links (risikoreduktiv)**

## Example Procedure: Fall 10: Prophylaktische Mastektomie links (risikoreduktiv)

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: sonstiges

**status**: Completed

**category**: Simple mastectomy

**code**: Prophylaktische Mastektomie links (risikoreduktiv bei BRCA1)

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**performed**: 2025-06-18

**bodySite**: Left breast structure

**followUp**: Redon-Drainage 10 Ch



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall10-Operation-Mastektomie-Links",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "S",
        "display" : "sonstiges"
      }]
    }
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "172043006",
      "display" : "Simple mastectomy"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-872",
      "display" : "(Modifizierte radikale) Mastektomie"
    }],
    "text" : "Prophylaktische Mastektomie links (risikoreduktiv bei BRCA1)"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "performedDateTime" : "2025-06-18",
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "followUp" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122462000",
      "display" : "Drainage procedure"
    }],
    "text" : "Redon-Drainage 10 Ch"
  }]
}

```
