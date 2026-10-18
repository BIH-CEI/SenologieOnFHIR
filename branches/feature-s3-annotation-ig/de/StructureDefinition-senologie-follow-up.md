# BIH Senologie Follow-Up (Verlaufsmeldung) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Follow-Up (Verlaufsmeldung)**

## : BIH Senologie Follow-Up (Verlaufsmeldung) 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up | **:0.10.0 |
| Draft | **:Senologie_FollowUp |

 
Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert. 

**Usages:**

* Use this Profil: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profil: [Observation/Fall1-Verlauf-6Monate](Observation-Fall1-Verlauf-6Monate.md), [Observation/Fall1-Verlauf-PostTherapie](Observation-Fall1-Verlauf-PostTherapie.md), [Observation/Fall10-Verlauf-PostTherapie](Observation-Fall10-Verlauf-PostTherapie.md), [Observation/Fall14-FollowUp](Observation-Fall14-FollowUp.md)... Show 4 more, [Observation/Fall2-Verlauf-Progression](Observation-Fall2-Verlauf-Progression.md), [Observation/Fall2-Verlauf-Tod](Observation-Fall2-Verlauf-Tod.md), [Observation/Fall4-Verlauf-PostTherapie](Observation-Fall4-Verlauf-PostTherapie.md) and [Observation/Fall9-Verlauf-12Monate](Observation-Fall9-Verlauf-12Monate.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-follow-up.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-follow-up",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "kds-senologie"
      },
      {
        "url" : "version",
        "valueString" : "0.10.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.senologie.org/fhir"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C4872",
        "display" : "Breast Carcinoma"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-09-15"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up",
  "version" : "0.10.0",
  "name" : "Senologie_FollowUp",
  "title" : "BIH Senologie Follow-Up (Verlaufsmeldung)",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-12",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
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
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Verlauf"
  },
  {
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
      }],
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.Meldedatum",
        "comment" : "Datum, an dem die letzte Untersuchung durchgeführt wurde, die zur Einschätzung des Tumorstatus geführt hat."
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
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.Melder"
      }]
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
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.Gesamtbeurteilung"
      }]
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
      },
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.NachsorgeArt"
      }]
    },
    {
      "id" : "Observation.component:Tumor_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Tumor_Verlauf",
      "short" : "Lokaler Tumorstatus (M05)",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.TumorstatusLokal"
      }]
    },
    {
      "id" : "Observation.component:Lymphknoten_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Lymphknoten_Verlauf",
      "short" : "Lymphknoten-Tumorstatus (M06)",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.TumorstatusLK"
      }]
    },
    {
      "id" : "Observation.component:Fernmetastasen_Verlauf",
      "path" : "Observation.component",
      "sliceName" : "Fernmetastasen_Verlauf",
      "short" : "Fernmetastasen-Tumorstatus (M07)",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.TumorstatusFM"
      }]
    },
    {
      "id" : "Observation.component:zweittumor",
      "path" : "Observation.component",
      "sliceName" : "zweittumor",
      "short" : "Zweittumor diagnostiziert (M08)",
      "comment" : "Wurde bei der Patientin ein zweiter Primaertumor (nicht Rezidiv/Metastase) diagnostiziert? Details (ICD, Datum) werden als eigene Condition dokumentiert.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Verlauf.Zweittumor"
      }]
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
