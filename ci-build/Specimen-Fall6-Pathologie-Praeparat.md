# Fall 6: Vakuumbiopsie-Präparat links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 6: Vakuumbiopsie-Präparat links**

## Example Specimen: Fall 6: Vakuumbiopsie-Präparat links

Profile: [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

**identifier**: Placer Identifier/SPEC-2025-002345-A

**status**: Available

**type**: Vakuumbiopsie

**subject**: [Petra Schneider Female, DoB: 1958-09-08 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-006)](Patient-Fall6-Patient-Petra-Schneider.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-04-02 | Biopsy - action | Linke Brust, Mikrokalzifikationen |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "Fall6-Pathologie-Praeparat",
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
    "value" : "SPEC-2025-002345-A"
  }],
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "119380005",
      "display" : "Specimen from breast obtained by biopsy"
    }],
    "text" : "Vakuumbiopsie"
  },
  "subject" : {
    "reference" : "Patient/Fall6-Patient-Petra-Schneider"
  },
  "collection" : {
    "collectedDateTime" : "2025-04-02",
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
      "text" : "Linke Brust, Mikrokalzifikationen"
    }
  }
}

```
