# CS Senologie Studienname - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Studienname**

## CodeSystem: CS Senologie Studienname 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/cs-senologie-studienname | *Version*:0.1.0 |
| Draft as of 2026-05-03 | *Computable Name*:CS_Senologie_Studienname |

 
Auswahlliste klinischer Studien am Brustzentrum für die OncoBox 2.0 Meldung (K02). Enthält häufige interventionelle und nicht-interventionelle Mammakarzinom-Studien. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [VS_Senologie_Studienname](ValueSet-vs-senologie-studienname.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-studienname",
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-studienname",
  "version" : "0.1.0",
  "name" : "CS_Senologie_Studienname",
  "title" : "CS Senologie Studienname",
  "status" : "draft",
  "date" : "2026-05-03T21:28:00+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Auswahlliste klinischer Studien am Brustzentrum für die OncoBox 2.0 Meldung (K02). Enthält häufige interventionelle und nicht-interventionelle Mammakarzinom-Studien.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 9,
  "concept" : [{
    "code" : "keynote-522",
    "display" : "KEYNOTE-522",
    "definition" : "Pembrolizumab + Chemotherapie neoadjuvant/adjuvant bei TNBC (Merck)"
  },
  {
    "code" : "monarche",
    "display" : "monarchE",
    "definition" : "Abemaciclib adjuvant bei HR+/HER2- Hochrisiko-Mammakarzinom (Lilly)"
  },
  {
    "code" : "natalee",
    "display" : "NATALEE",
    "definition" : "Ribociclib adjuvant bei HR+/HER2- Mammakarzinom (Novartis)"
  },
  {
    "code" : "destiny-breast",
    "display" : "DESTINY-Breast",
    "definition" : "Trastuzumab-Deruxtecan bei HER2+ oder HER2-low Mammakarzinom (Daiichi Sankyo/AstraZeneca)"
  },
  {
    "code" : "olympia",
    "display" : "OlympiA",
    "definition" : "Olaparib adjuvant bei gBRCA1/2-mutiertem HER2- Mammakarzinom (AstraZeneca)"
  },
  {
    "code" : "katherine",
    "display" : "KATHERINE",
    "definition" : "T-DM1 adjuvant bei HER2+ nach Non-pCR (Roche)"
  },
  {
    "code" : "compassher2-rd",
    "display" : "COMPASSHer2-RD",
    "definition" : "T-DXd vs. T-DM1 bei HER2+ nach Non-pCR (Register)"
  },
  {
    "code" : "tropion-breast",
    "display" : "TROPION-Breast",
    "definition" : "Datopotamab-Deruxtecan bei HR+/HER2- Mammakarzinom (Daiichi Sankyo/AstraZeneca)"
  },
  {
    "code" : "sonstige",
    "display" : "Sonstige Studie",
    "definition" : "Weitere Studien (Freitext in study.display)"
  }]
}

```
