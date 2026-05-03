# Fall 10: Sofortrekonstruktion rechts mit Implantat - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Sofortrekonstruktion rechts mit Implantat**

## Example Procedure: Fall 10: Sofortrekonstruktion rechts mit Implantat

Profile: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: kurativ

**partOf**: [Procedure (Modifizierte radikale) Mastektomie](Procedure-Fall10-Operation-Mastektomie-Rechts.md)

**status**: Completed

**category**: Mammoplasty

**code**: Sofortrekonstruktion rechts mit Silikonimplantat

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**performed**: 2025-06-18

**bodySite**: Right breast structure

### FocalDevices

| | | |
| :--- | :--- | :--- |
| - | **Action** | **Manipulated** |
| * | Implantation - action | [Device: status = active; manufacturer = Mentor; lotNumber = REF-2025-RB-001; serialNumber = IMP-2025-001-R; type = Silicone gel-filled breast implant](Device-Fall10-Implantat-Rechts.md) |



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall10-Rekonstruktion-Rechts",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K",
        "display" : "kurativ"
      }]
    }
  }],
  "partOf" : [{
    "reference" : "Procedure/Fall10-Operation-Mastektomie-Rechts"
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "33496007",
      "display" : "Mammoplasty"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-886.17",
      "display" : "Andere plastische Rekonstruktion der Mamma: Einsetzen eines Brustimplantates: nach Mastektomie"
    }],
    "text" : "Sofortrekonstruktion rechts mit Silikonimplantat"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "performedDateTime" : "2025-06-18",
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "focalDevice" : [{
    "action" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "129336009",
        "display" : "Implantation - action"
      }]
    },
    "manipulated" : {
      "reference" : "Device/Fall10-Implantat-Rechts"
    }
  }]
}

```
