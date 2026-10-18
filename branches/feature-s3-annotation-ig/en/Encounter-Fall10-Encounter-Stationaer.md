# Fall 10: Stationärer Aufenthalt (Mastektomie mit Implantatrekonstruktion) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Stationärer Aufenthalt (Mastektomie mit Implantatrekonstruktion)**

## Example Encounter: Fall 10: Stationärer Aufenthalt (Mastektomie mit Implantatrekonstruktion)

-------

**English**

-------

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.4.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**period**: 2025-06-17 --> 2025-06-23

**reasonReference**: [Condition Invasives Mammakarzinom NST rechts, triple-negativ, PALB2-Keimbahnmutation](Condition-Fall10-Diagnose-Mammakarzinom.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Fall10-Encounter-Stationaer",
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "period" : {
    "start" : "2025-06-17",
    "end" : "2025-06-23"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall10-Diagnose-Mammakarzinom"
  }]
}

```
