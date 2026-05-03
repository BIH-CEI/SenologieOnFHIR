# Fall 3: Mastektomie-Präparat rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Mastektomie-Präparat rechts**

## Example Specimen: Fall 3: Mastektomie-Präparat rechts

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-000790-A

**status**: Available

**type**: Mastektomie-Präparat

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-04-08 | Mastectomy | Rechte Brust, Mastektomie mit Axilladissektion |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall3-Pathologie-Praeparat-OP",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat"]
  },
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "PLAC",
        "display" : "Placer Identifier"
      }]
    },
    "system" : "http://pathologie.charite.de/fhir/sid/specimen-id",
    "value" : "SPEC-2025-000790-A"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122600000",
      "display" : "Specimen from breast obtained by modified radical mastectomy"
    }],
    "text" : "Mastektomie-Präparat"
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "collection" : {
    "collectedDateTime" : "2025-04-08",
    "method" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "5884001",
        "display" : "Mastectomy"
      }]
    },
    "bodySite" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "73056007",
        "display" : "Right breast structure"
      }],
      "text" : "Rechte Brust, Mastektomie mit Axilladissektion"
    }
  }
}

```
