# BIH Senologie Follow-Up (Verlaufsmeldung) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Follow-Up (Verlaufsmeldung)**

## Resource Profile: BIH Senologie Follow-Up (Verlaufsmeldung) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_FollowUp |

 
Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert. 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Verlauf-6Monate](Observation-Fall1-Verlauf-6Monate.md), [Observation/Fall1-Verlauf-PostTherapie](Observation-Fall1-Verlauf-PostTherapie.md), [Observation/Fall2-Verlauf-Progression](Observation-Fall2-Verlauf-Progression.md), [Observation/Fall2-Verlauf-Tod](Observation-Fall2-Verlauf-Tod.md)... Show 2 more, [Observation/Fall4-Verlauf-PostTherapie](Observation-Fall4-Verlauf-PostTherapie.md) and [Observation/Fall9-Verlauf-12Monate](Observation-Fall9-Verlauf-12Monate.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-follow-up)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-follow-up.csv), [Excel](StructureDefinition-senologie-follow-up.xlsx), [Schematron](StructureDefinition-senologie-follow-up.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-follow-up",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up",
  "version" : "0.1.0",
  "name" : "Senologie_FollowUp",
  "title" : "BIH Senologie Follow-Up (Verlaufsmeldung)",
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
  "description" : "Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
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
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-verlauf",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.focus",
      "path" : "Observation.focus",
      "short" : "Bezugsdiagnose (beurteilte Condition)",
      "comment" : "Referenz auf die beurteilte Condition (Mammakarzinom). Bei bilateralem Karzinom wird die jeweilige Seite referenziert.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
      }]
    },
    {
      "id" : "Observation.effective[x]:effectiveDateTime",
      "path" : "Observation.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Meldedatum / Untersuchungsdatum (M01)",
      "comment" : "Datum der Verlaufsuntersuchung oder Meldung. Entspricht OncoBox M01 und oBDS Untersuchungsdatum_Verlauf.",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Melder / Meldende Einrichtung (M02)",
      "comment" : "Person oder Einrichtung, die die Verlaufsmeldung erstellt. Entspricht OncoBox M02 und oBDS Melder_ID.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/Organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueCodeableConcept",
      "path" : "Observation.value[x]",
      "sliceName" : "valueCodeableConcept",
      "short" : "Gesamtbeurteilung Tumorstatus (D27)",
      "comment" : "Gesamtbeurteilung des Tumoransprechens: V=CR, T=PR, K=NC/SD, P=Progression, D=divergent, B=MR, R=CRr, Y=Rezidiv, U=unmoeglich, X=fehlend.",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "short" : "Art der Nachsorge (M03)",
      "comment" : "Aktive Nachsorge = Patientin persoenlich untersucht. Passive Nachsorge = Information aus Akten/Registern.",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-nachsorge-art"
      }
    },
    {
      "id" : "Observation.component:Tumor_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Tumor_Verlauf",
      "short" : "Lokaler Tumorstatus (M05)"
    },
    {
      "id" : "Observation.component:Lymphknoten_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Lymphknoten_Verlauf",
      "short" : "Lymphknoten-Tumorstatus (M06)"
    },
    {
      "id" : "Observation.component:Fernmetastasen_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Fernmetastasen_Verlauf",
      "short" : "Fernmetastasen-Tumorstatus (M07)"
    },
    {
      "id" : "Observation.component:zweittumor",
      "path" : "Observation.component",
      "sliceName" : "zweittumor",
      "short" : "Zweittumor diagnostiziert (M08)",
      "comment" : "Wurde bei der Patientin ein zweiter Primaertumor (nicht Rezidiv/Metastase) diagnostiziert? Details (ICD, Datum) werden als eigene Condition dokumentiert.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:zweittumor.code.coding",
      "path" : "Observation.component.code.coding",
      "min" : 1,
      "patternCoding" : {
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
        "code" : "zweittumor"
      }
    },
    {
      "id" : "Observation.component:zweittumor.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-zweittumor"
      }
    }]
  }
}

```
