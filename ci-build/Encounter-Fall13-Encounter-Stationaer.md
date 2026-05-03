# Fall 13: Stationärer Aufenthalt (bilaterale OP) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: Stationärer Aufenthalt (bilaterale OP)**

## Example Encounter: Fall 13: Stationärer Aufenthalt (bilaterale OP)

**status**: finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**period**: 2025-04-01 --> 2025-04-06

**reasonReference**: 

* [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Links.md)
* [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Rechts.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Fall13-Encounter-Stationaer",
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "period" : {
    "start" : "2025-04-01",
    "end" : "2025-04-06"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall13-Diagnose-Links"
  },
  {
    "reference" : "Condition/Fall13-Diagnose-Rechts"
  }]
}

```
