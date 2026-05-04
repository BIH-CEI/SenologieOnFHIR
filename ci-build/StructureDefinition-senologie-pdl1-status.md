# BIH Senologie PD-L1 Status - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie PD-L1 Status**

## Resource Profile: BIH Senologie PD-L1 Status 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_PDL1_Status |

 
PD-L1 Immunhistochemie-Befund für Mamma-Karzinom. Erbt TPS, CPS, ICS und TC-Score Slices vom MII MTB PD-L1 Profil. Klinisch relevant bei TNBC (Pembrolizumab-Indikation bei CPS >= 10, KEYNOTE-522). 

**Usages:**

* Examples for this Profile: [Observation/Fall10-PDL1-Status](Observation-Fall10-PDL1-Status.md), [Observation/Fall2-PDL1-Status](Observation-Fall2-PDL1-Status.md) and [Observation/Fall7-PDL1-Status](Observation-Fall7-PDL1-Status.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-pdl1-status)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-pdl1-status.csv), [Excel](StructureDefinition-senologie-pdl1-status.xlsx), [Schematron](StructureDefinition-senologie-pdl1-status.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-pdl1-status",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status",
  "version" : "0.1.0",
  "name" : "Senologie_PDL1_Status",
  "title" : "BIH Senologie PD-L1 Status",
  "status" : "draft",
  "date" : "2026-05-04T07:06:34+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "PD-L1 Immunhistochemie-Befund für Mamma-Karzinom. Erbt TPS, CPS, ICS und TC-Score Slices vom MII MTB PD-L1 Profil. Klinisch relevant bei TNBC (Pembrolizumab-Indikation bei CPS >= 10, KEYNOTE-522).",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-pr-mtb-immunohistochemistry-pdl1",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.text",
      "path" : "Observation.code.text",
      "short" : "PD-L1 Immunhistochemie"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }]
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Datum der IHC-Untersuchung"
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "IHC-Klon / Assay (z.B. SP142, 22C3, SP263)",
      "comment" : "Der verwendete Antikörperklon ist klinisch relevant: SP142 (Ventana) für Atezolizumab, 22C3 (Dako) für Pembrolizumab, SP263 (Ventana) für Durvalumab.",
      "mustSupport" : true
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "short" : "Pathologisches Präparat (Stanzbiopsie / OP-Resektat)"
    },
    {
      "id" : "Observation.component:tps-score",
      "path" : "Observation.component",
      "sliceName" : "tps-score",
      "short" : "Tumor Proportion Score (TPS)"
    },
    {
      "id" : "Observation.component:cps-score",
      "path" : "Observation.component",
      "sliceName" : "cps-score",
      "short" : "Combined Positive Score (CPS)",
      "comment" : "Primärer Score für Pembrolizumab-Indikation bei TNBC. CPS >= 10 ist Schwellenwert (KEYNOTE-522)."
    },
    {
      "id" : "Observation.component:ics-score",
      "path" : "Observation.component",
      "sliceName" : "ics-score",
      "short" : "Immune Cell Score (ICS)",
      "comment" : "Relevant für Atezolizumab-Indikation (IMpassion130). IC >= 1% ist Schwellenwert."
    }]
  }
}

```
