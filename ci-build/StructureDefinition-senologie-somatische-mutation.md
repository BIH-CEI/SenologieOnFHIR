# BIH Senologie Somatische Mutation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Somatische Mutation**

## Resource Profile: BIH Senologie Somatische Mutation 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-somatische-mutation | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Somatische_Mutation |

 
Somatischer Mutationsstatus für BRCA1, BRCA2 und PALB2 im Tumorgewebe. Erbt Gen-Kodierung und Ausprägung von MII Onko Genetische Variante. 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Somatische-Mutation-BRCA1](Observation-Fall1-Somatische-Mutation-BRCA1.md), [Observation/Fall1-Somatische-Mutation-BRCA2](Observation-Fall1-Somatische-Mutation-BRCA2.md), [Observation/Fall1-Somatische-Mutation-PALB2](Observation-Fall1-Somatische-Mutation-PALB2.md) and [Observation/Fall5-Somatische-Mutation-BRCA1](Observation-Fall5-Somatische-Mutation-BRCA1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-somatische-mutation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-somatische-mutation.csv), [Excel](StructureDefinition-senologie-somatische-mutation.xlsx), [Schematron](StructureDefinition-senologie-somatische-mutation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-somatische-mutation",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-somatische-mutation",
  "version" : "0.1.0",
  "name" : "Senologie_Somatische_Mutation",
  "title" : "BIH Senologie Somatische Mutation",
  "status" : "draft",
  "date" : "2026-05-04T06:44:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Somatischer Mutationsstatus für BRCA1, BRCA2 und PALB2 im Tumorgewebe. Erbt Gen-Kodierung und Ausprägung von MII Onko Genetische Variante.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "MII-KDS",
    "name" : "MII KDS Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-genetische-variante",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Untersuchungsstatus"
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Genetische Variante (LOINC 69548-6)"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient/in"
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Observation.effective[x]:effectiveDateTime",
      "path" : "Observation.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Zeitpunkt der Bestimmung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.interpretation",
      "path" : "Observation.interpretation",
      "short" : "Ausprägung (M=Mutation, W=Wildtyp, N=nicht bestimmbar, U=unbekannt)"
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "short" : "Tumorprobe"
    },
    {
      "id" : "Observation.component:gene-studied",
      "path" : "Observation.component",
      "sliceName" : "gene-studied",
      "short" : "Untersuchtes Gen (BRCA1/BRCA2/PALB2)"
    }]
  }
}

```
