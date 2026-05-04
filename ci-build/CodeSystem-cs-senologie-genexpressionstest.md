# CS Senologie Genexpressionstest - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Genexpressionstest**

## CodeSystem: CS Senologie Genexpressionstest 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CS_Senologie_Genexpressionstest |

 
Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Genexpressionstest](ValueSet-vs-senologie-genexpressionstest.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-genexpressionstest",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest",
  "version" : "0.1.0",
  "name" : "CS_Senologie_Genexpressionstest",
  "title" : "CS Senologie Genexpressionstest",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "oncotype-dx",
    "display" : "Oncotype DX",
    "definition" : "21-Gen Recurrence Score Assay (Exact Sciences). Score 0–100."
  },
  {
    "code" : "mammaprint",
    "display" : "MammaPrint",
    "definition" : "70-Gen Signatur (Agendia). Index -1.0 bis +1.0."
  },
  {
    "code" : "prosigna",
    "display" : "Prosigna (PAM50)",
    "definition" : "50-Gen ROR Score Assay (Veracyte). Score 0–100."
  },
  {
    "code" : "endopredict",
    "display" : "EndoPredict",
    "definition" : "12-Gen EPclin Score (Myriad Genetics). Kontinuierlicher Score."
  }]
}

```
