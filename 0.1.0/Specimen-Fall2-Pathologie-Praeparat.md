# Fall 2: Stanzbiopsie-Präparat rechts zentral - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Stanzbiopsie-Präparat rechts zentral**

## Example Specimen: Fall 2: Stanzbiopsie-Präparat rechts zentral

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-000456-A

**status**: Available

**type**: Stanzbiopsie

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-02-15 | Biopsy - action | Rechte Brust, zentraler Drüsenkörper |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall2-Pathologie-Praeparat",
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
    "value" : "SPEC-2025-000456-A"
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "collection" : {
    "collectedDateTime" : "2025-02-15",
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
      "text" : "Rechte Brust, zentraler Drüsenkörper"
    }
  }
}

```
