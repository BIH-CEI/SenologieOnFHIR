# Fall 10: Stanzbiopsie-Präparat rechts OAQ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Stanzbiopsie-Präparat rechts OAQ**

## Example Specimen: Fall 10: Stanzbiopsie-Präparat rechts OAQ

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-001001-A

**status**: Available

**type**: Stanzbiopsie

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-05-25 | Biopsy - action | Rechte Brust, oberer äußerer Quadrant |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall10-Pathologie-Praeparat",
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
    "value" : "SPEC-2025-001001-A"
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
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "collection" : {
    "collectedDateTime" : "2025-05-25",
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
      "text" : "Rechte Brust, oberer äußerer Quadrant"
    }
  }
}

```
