# Fall 10: Brustimplantat rechts (Sofortrekonstruktion) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Brustimplantat rechts (Sofortrekonstruktion)**

## Example Device: Fall 10: Brustimplantat rechts (Sofortrekonstruktion)

Profile: [BIH LM Senologie Brustimplantat](StructureDefinition-senologie-implantat.md)

**status**: Active

**manufacturer**: Mentor

**lotNumber**: REF-2025-RB-001

**serialNumber**: IMP-2025-001-R

**type**: Silikon-Brustimplantat

**patient**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "Fall10-Implantat-Rechts",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-implantat"]
  },
  "status" : "active",
  "manufacturer" : "Mentor",
  "lotNumber" : "REF-2025-RB-001",
  "serialNumber" : "IMP-2025-001-R",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "465380004",
      "display" : "Silicone gel-filled breast implant"
    }],
    "text" : "Silikon-Brustimplantat"
  },
  "patient" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  }
}

```
