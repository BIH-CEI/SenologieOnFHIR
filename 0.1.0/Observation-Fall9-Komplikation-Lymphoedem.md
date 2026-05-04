# Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II**

## Example Observation: Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II

Profile: [BIH Senologie Operative Komplikation](StructureDefinition-senologie-operative-komplikation.md)

**status**: Final

**code**: Clavien-Dindo classification grade

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**focus**: [Procedure Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)](Procedure-Fall9-Operation-BET.md)

**effective**: 2025-10-20

**value**: Clavien-Dindo Grad II

**note**: 

> 

Lymphödem Arm links nach Axilladissektion Level I-III (12/18 LK befallen). Konservative Therapie mit Kompressionswickelung und Lymphdrainage.


**method**: postoperativ, ambulant

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Complication of procedure | Lymphödem Arm links |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall9-Komplikation-Lymphoedem",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "789279006",
      "display" : "Clavien-Dindo classification grade"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "focus" : [{
    "reference" : "Procedure/Fall9-Operation-BET"
  }],
  "effectiveDateTime" : "2025-10-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1367520006",
      "display" : "Clavien-Dindo classification grade II"
    }],
    "text" : "Clavien-Dindo Grad II"
  },
  "note" : [{
    "text" : "Lymphödem Arm links nach Axilladissektion Level I-III (12/18 LK befallen). Konservative Therapie mit Kompressionswickelung und Lymphdrainage."
  }],
  "method" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "373864002",
      "display" : "Outpatient"
    }],
    "text" : "postoperativ, ambulant"
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "116224001",
        "display" : "Complication of procedure"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "449620005",
        "display" : "Lymphedema of upper limb"
      }],
      "text" : "Lymphödem Arm links"
    }
  }]
}

```
