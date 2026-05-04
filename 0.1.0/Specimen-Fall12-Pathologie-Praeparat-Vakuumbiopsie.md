# Fall 12: Vakuumbiopsie-Präparat links OIQ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 12: Vakuumbiopsie-Präparat links OIQ**

## Example Specimen: Fall 12: Vakuumbiopsie-Präparat links OIQ

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-001201-A

**status**: Available

**type**: Vakuumbiopsie (stereotaktisch gesteuert)

**subject**: [Renate Vogel Female, DoB: 1981-03-06 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-012)](Patient-Fall12-Patient-Renate-Vogel.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-07-15 | Biopsy - action | Linke Brust, oberer innerer Quadrant |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall12-Pathologie-Praeparat-Vakuumbiopsie",
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
    "value" : "SPEC-2025-001201-A"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122737001",
      "display" : "Specimen from breast obtained by core needle biopsy"
    }],
    "text" : "Vakuumbiopsie (stereotaktisch gesteuert)"
  },
  "subject" : {
    "reference" : "Patient/Fall12-Patient-Renate-Vogel"
  },
  "collection" : {
    "collectedDateTime" : "2025-07-15",
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
      "text" : "Linke Brust, oberer innerer Quadrant"
    }
  }
}

```
