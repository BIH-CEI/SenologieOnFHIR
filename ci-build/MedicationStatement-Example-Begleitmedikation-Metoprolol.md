# Beispiel: Begleitmedikation Metoprolol 47,5 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Begleitmedikation Metoprolol 47,5 mg**

## Example MedicationStatement: Beispiel: Begleitmedikation Metoprolol 47,5 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Metoprolol

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**effective**: 2022-06-01 --> (ongoing)

**dateAsserted**: 2024-01-10

**reasonReference**: [Arterielle Hypertonie](Condition-Example-Diagnose-Mammakarzinom.md)

> **dosage****text**: 1x täglich morgens**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 47.5 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Example-Begleitmedikation-Metoprolol",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "372826007",
      "display" : "Metoprolol"
    }],
    "text" : "Metoprolol"
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "effectivePeriod" : {
    "start" : "2022-06-01"
  },
  "dateAsserted" : "2024-01-10",
  "reasonReference" : [{
    "reference" : "Condition/Example-Diagnose-Mammakarzinom",
    "display" : "Arterielle Hypertonie"
  }],
  "dosage" : [{
    "text" : "1x täglich morgens",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "d"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 47.5,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
