# Beispiel: Studienteilnahme ADAPT-HER2 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Studienteilnahme ADAPT-HER2**

## Example ResearchSubject: Beispiel: Studienteilnahme ADAPT-HER2

Profile: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)

**Screeningstatus**: Eligible for clinical trial

**Kontaktperson Studie**: Dr. med. Anna Schmidt, Studienzentrale Senologie

**Aufklärungsdatum**: 2024-02-10

**status**: On-study-intervention

**period**: 2024-02-15 --> (ongoing)

**study**: [ADAPT-HER2](ResearchStudy-Example-ResearchStudy-ADAPT-HER2.md)

**individual**: [Maria Musterfrau](Patient-example-patient.md)

**assignedArm**: Interventionsarm: T-DM1 + endokrine Therapie

**consent**: Studieneinwilligung ADAPT-HER2 vom 2024-02-10



## Resource Content

```json
{
  "resourceType" : "ResearchSubject",
  "id" : "Example-Studienteilnahme",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-studienteilnahme"]
  },
  "extension" : [{
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1304144001",
        "display" : "Eligible for clinical trial"
      }]
    }
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt",
    "valueString" : "Dr. med. Anna Schmidt, Studienzentrale Senologie"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum",
    "valueDate" : "2024-02-10"
  }],
  "status" : "on-study-intervention",
  "period" : {
    "start" : "2024-02-15"
  },
  "study" : {
    "reference" : "ResearchStudy/Example-ResearchStudy-ADAPT-HER2",
    "display" : "ADAPT-HER2"
  },
  "individual" : {
    "reference" : "Patient/example-patient",
    "display" : "Maria Musterfrau"
  },
  "assignedArm" : "Interventionsarm: T-DM1 + endokrine Therapie",
  "consent" : {
    "display" : "Studieneinwilligung ADAPT-HER2 vom 2024-02-10"
  }
}

```
