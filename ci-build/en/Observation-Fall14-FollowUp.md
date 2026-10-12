# Fall 14: Follow-Up nach Therapie — PR - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Follow-Up nach Therapie — PR**

## Example Observation: Fall 14: Follow-Up nach Therapie — PR

-------

**English**

-------

Profile: [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md)

**status**: Final

**code**: Status of regression of tumor (observable entity)

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**focus**: [Condition Bösartige Neubildung der unteren inneren Quadranten der Brustdrüse](Condition-Fall14-Diagnose-Mammakarzinom.md)

**effective**: 2025-03-17

**issued**: 2025-03-17 12:00:00+0100

**value**: Progression

**method**: Aktive Nachsorge



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall14-FollowUp",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "396432002",
      "display" : "Status of regression of tumor (observable entity)"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "focus" : [{
    "reference" : "Condition/Fall14-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-03-17",
  "issued" : "2025-03-17T12:00:00+01:00",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
      "code" : "P",
      "display" : "Progression"
    }]
  },
  "method" : {
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
      "code" : "aktiv",
      "display" : "Aktive Nachsorge"
    }]
  }
}

```
