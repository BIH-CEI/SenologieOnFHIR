# Fall 10: Ki-67 55 % - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Ki-67 55 %**

##  Observation: Fall 10: Ki-67 55 %

-------

**German**

-------

Profil: [BIH Senologie Ki-67 Proliferationsindex](StructureDefinition-senologie-ki67-proliferationsindex.md)

**status**: Final

**code**: Ki67 [Presence] in Tissue by Immune stain

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-05-28

**value**: 55 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall10-Ki67",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85330-9",
      "display" : "Ki67 [Presence] in Tissue by Immune stain"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectiveDateTime" : "2025-05-28",
  "valueQuantity" : {
    "value" : 55,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  }
}

```
