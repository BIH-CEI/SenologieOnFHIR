# Fall 2: Studienteilnahme KEYNOTE-522 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Studienteilnahme KEYNOTE-522**

## Example ResearchSubject: Fall 2: Studienteilnahme KEYNOTE-522

Profile: [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)

**Screeningstatus**: Eligible for clinical trial

**Kontaktperson Studie**: Dr. med. Markus Weber, Studienzentrale Onkologie

**Aufklärungsdatum**: 2025-02-25

**status**: On-study-intervention

**period**: 2025-03-01 --> (ongoing)

**study**: [KEYNOTE-522](ResearchStudy-Fall2-ResearchStudy-KEYNOTE522.md)

**individual**: [Lena Hoffmann](Patient-Fall2-Patient-Lena-Hoffmann.md)

**assignedArm**: Interventionsarm: Pembrolizumab + Chemotherapie

**consent**: Studieneinwilligung KEYNOTE-522 vom 2025-02-25



## Resource Content

```json
{
  "resourceType" : "ResearchSubject",
  "id" : "Fall2-Studienteilnahme",
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
    "valueString" : "Dr. med. Markus Weber, Studienzentrale Onkologie"
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum",
    "valueDate" : "2025-02-25"
  }],
  "status" : "on-study-intervention",
  "period" : {
    "start" : "2025-03-01"
  },
  "study" : {
    "reference" : "ResearchStudy/Fall2-ResearchStudy-KEYNOTE522",
    "display" : "KEYNOTE-522"
  },
  "individual" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann",
    "display" : "Lena Hoffmann"
  },
  "assignedArm" : "Interventionsarm: Pembrolizumab + Chemotherapie",
  "consent" : {
    "display" : "Studieneinwilligung KEYNOTE-522 vom 2025-02-25"
  }
}

```
