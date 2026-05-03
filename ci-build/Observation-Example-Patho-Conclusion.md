# Beispiel: Pathologische Diagnose/Conclusion - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Pathologische Diagnose/Conclusion**

## Example Observation: Beispiel: Pathologische Diagnose/Conclusion

**status**: Final

**code**: Pathology report final diagnosis Narrative

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**effective**: 2024-03-05

**value**: Invasiv-duktales Mammakarzinom, G2, pT1c, ER+/PR+/HER2-, Ki-67 20%



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Example-Patho-Conclusion",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22637-3",
      "display" : "Pathology report final diagnosis Narrative"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "effectiveDateTime" : "2024-03-05",
  "valueString" : "Invasiv-duktales Mammakarzinom, G2, pT1c, ER+/PR+/HER2-, Ki-67 20%"
}

```
