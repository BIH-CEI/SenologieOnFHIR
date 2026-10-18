# Fall 14: Ki-67 10 % - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Ki-67 10 %**

## Example Observation: Fall 14: Ki-67 10 %

-------

**English**

-------

Profile: [BIH Senologie Ki-67 Proliferationsindex](StructureDefinition-senologie-ki67-proliferationsindex.md)

**status**: Final

**code**: Ki67 [Presence] in Tissue by Immune stain

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**effective**: 2025-01-15

**value**: 10 % (Details: UCUM code% = '%')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall14-Ki67",
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
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "effectiveDateTime" : "2025-01-15",
  "valueQuantity" : {
    "value" : 10,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  }
}

```
