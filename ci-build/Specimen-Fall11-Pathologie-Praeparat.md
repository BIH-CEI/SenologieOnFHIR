# Fall 11: Stanzbiopsie-Präparat links oben außen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 11: Stanzbiopsie-Präparat links oben außen**

## Example Specimen: Fall 11: Stanzbiopsie-Präparat links oben außen

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-001101-A

**status**: Available

**type**: Stanzbiopsie

**subject**: [Hannah Klein Female, DoB: 1991-08-23 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-011)](Patient-Fall11-Patient-Hannah-Klein.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-09-05 | Biopsy - action | Linke Brust, oberer äußerer Quadrant |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall11-Pathologie-Praeparat",
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
    "value" : "SPEC-2025-001101-A"
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
    "reference" : "Patient/Fall11-Patient-Hannah-Klein"
  },
  "collection" : {
    "collectedDateTime" : "2025-09-05",
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
        "code" : "80248007",
        "display" : "Left breast structure"
      }],
      "text" : "Linke Brust, oberer äußerer Quadrant"
    }
  }
}

```
