# CS OncoBox Primaerfallart - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS OncoBox Primaerfallart**

## CodeSystem: CS OncoBox Primaerfallart 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-oncobox-primaerfallart | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:CS_OncoBox_Primaerfallart |

 
Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_OncoBox_Primaerfallart](ValueSet-vs-oncobox-primaerfallart.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-oncobox-primaerfallart",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-primaerfallart",
  "version" : "0.1.0",
  "name" : "CS_OncoBox_Primaerfallart",
  "title" : "CS OncoBox Primaerfallart",
  "status" : "draft",
  "date" : "2026-05-04T06:10:53+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01)",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 9,
  "concept" : [{
    "code" : "1",
    "display" : "Invasives Mammakarzinom",
    "definition" : "Invasives Mammakarzinom (C50)"
  },
  {
    "code" : "2",
    "display" : "DCIS",
    "definition" : "Duktales Carcinoma in situ (D05)"
  },
  {
    "code" : "3",
    "display" : "Rezidiv",
    "definition" : "Rezidiv eines Mammakarzinoms"
  },
  {
    "code" : "4",
    "display" : "Primär metastasiert",
    "definition" : "Primär metastasiertes Mammakarzinom"
  },
  {
    "code" : "5",
    "display" : "Phylloides-Tumor",
    "definition" : "Phylloides-Tumor der Mamma"
  },
  {
    "code" : "6",
    "display" : "Sarkom",
    "definition" : "Sarkom der Mamma"
  },
  {
    "code" : "7",
    "display" : "Risikoreduktion",
    "definition" : "Risikoreduzierende Operation (Z40)"
  },
  {
    "code" : "8",
    "display" : "Rekonstruktion",
    "definition" : "Rekonstruktive Mammaoperation (Z42)"
  },
  {
    "code" : "9",
    "display" : "Sonstige",
    "definition" : "Sonstige Primaerfallart"
  }]
}

```
