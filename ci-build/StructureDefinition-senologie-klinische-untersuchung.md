# BIH Senologie Klinische Untersuchung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Klinische Untersuchung**

## Resource Profile: BIH Senologie Klinische Untersuchung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Klinische_Untersuchung |

 
Observation für klinische Brustuntersuchung (Mammabefund pro Seite) aus dotbase Questionnaire 'Klinische Untersuchung' 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Klinische-Untersuchung](Observation-Fall1-Klinische-Untersuchung.md) and [Observation/Fall11-Klinische-Untersuchung](Observation-Fall11-Klinische-Untersuchung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-klinische-untersuchung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-klinische-untersuchung.csv), [Excel](StructureDefinition-senologie-klinische-untersuchung.xlsx), [Schematron](StructureDefinition-senologie-klinische-untersuchung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-klinische-untersuchung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung",
  "version" : "0.1.0",
  "name" : "Senologie_Klinische_Untersuchung",
  "title" : "BIH Senologie Klinische Untersuchung",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Observation für klinische Brustuntersuchung (Mammabefund pro Seite) aus dotbase Questionnaire 'Klinische Untersuchung'",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Klinische Brustuntersuchung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "32422-8",
          "display" : "Physical findings of Breast"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
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
      "short" : "Datum der Untersuchung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "short" : "Untersuchte Seite (links/rechts)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.bodySite.coding",
      "path" : "Observation.bodySite.coding",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite"
      }
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:palpationsbefund",
      "path" : "Observation.component",
      "sliceName" : "palpationsbefund",
      "short" : "Palpationsbefund",
      "comment" : "Aus dotbase: Tastbefund der Brust (Verhärtung, Knoten, etc.)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:palpationsbefund.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "118242002",
          "display" : "Finding by palpation"
        }]
      }
    },
    {
      "id" : "Observation.component:palpationsbefund.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:hautveraenderungen",
      "path" : "Observation.component",
      "sliceName" : "hautveraenderungen",
      "short" : "Hautveränderungen",
      "comment" : "Aus dotbase: Hauteinziehung, Rötung, Orangenhaut etc.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:hautveraenderungen.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "115951000119105",
          "display" : "Breast symptom of change in skin"
        }]
      }
    },
    {
      "id" : "Observation.component:hautveraenderungen.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:mamillenbefund",
      "path" : "Observation.component",
      "sliceName" : "mamillenbefund",
      "short" : "Mamillenbefund",
      "comment" : "Aus dotbase: Mamillensekretion, Retraktion etc.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:mamillenbefund.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "248819006",
          "display" : "Nipple finding"
        }]
      }
    },
    {
      "id" : "Observation.component:mamillenbefund.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:lymphknotenstatus",
      "path" : "Observation.component",
      "sliceName" : "lymphknotenstatus",
      "short" : "Klinischer Lymphknotenstatus",
      "comment" : "Aus dotbase: Tastbare axilläre Lymphknoten",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:lymphknotenstatus.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "301782006",
          "display" : "Finding of lymph node of axillary region"
        }]
      }
    },
    {
      "id" : "Observation.component:lymphknotenstatus.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    }]
  }
}

```
