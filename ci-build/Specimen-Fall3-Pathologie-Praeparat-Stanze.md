# Fall 3: Stanzbiopsie-Präparat rechts - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Stanzbiopsie-Präparat rechts**

## Example Specimen: Fall 3: Stanzbiopsie-Präparat rechts

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-000789-A

**status**: Available

**type**: Stanzbiopsie

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-03-15 | Biopsy - action | Rechte Brust |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall3-Pathologie-Praeparat-Stanze",
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
    "value" : "SPEC-2025-000789-A"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122737001",
      "display" : "Specimen from breast obtained by core needle biopsy"
    }],
    "text" : "Stanzbiopsie"
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "collection" : {
    "collectedDateTime" : "2025-03-15",
    "method" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "129314006",
        "display" : "Biopsy - action"
      }]
    },
    "bodySite" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "73056007",
        "display" : "Right breast structure"
      }],
      "text" : "Rechte Brust"
    }
  }
}

```
