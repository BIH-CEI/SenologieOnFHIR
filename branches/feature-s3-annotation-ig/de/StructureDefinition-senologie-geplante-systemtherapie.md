# BIH Senologie Geplante Systemtherapie - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Geplante Systemtherapie**

## : BIH Senologie Geplante Systemtherapie 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-geplante-systemtherapie | **:0.10.0 |
| Draft | **:Senologie_Geplante_Systemtherapie |

 
MedicationRequest für geplante Systemtherapie 

**Usages:**

* This Profil is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-geplante-systemtherapie.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-geplante-systemtherapie",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-geplante-systemtherapie",
  "version" : "0.10.0",
  "name" : "Senologie_Geplante_Systemtherapie",
  "title" : "BIH Senologie Geplante Systemtherapie",
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
  "description" : "MedicationRequest für geplante Systemtherapie",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: GeplanteSystemtherapie"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationRequest",
      "path" : "MedicationRequest"
    },
    {
      "id" : "MedicationRequest.extension",
      "path" : "MedicationRequest.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "MedicationRequest.extension:therapyLine",
      "path" : "MedicationRequest.extension",
      "sliceName" : "therapyLine",
      "short" : "Therapielinie",
      "comment" : "Therapielinie: (1, 2, 3, etc.)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-line"]
      }]
    },
    {
      "id" : "MedicationRequest.status",
      "path" : "MedicationRequest.status",
      "short" : "Geplant/In Bearbeitung",
      "fixedCode" : "draft",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.intent",
      "path" : "MedicationRequest.intent",
      "fixedCode" : "plan",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.medication[x]",
      "path" : "MedicationRequest.medication[x]",
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
      "id" : "MedicationRequest.medication[x]:medicationCodeableConcept",
      "path" : "MedicationRequest.medication[x]",
      "sliceName" : "medicationCodeableConcept",
      "short" : "Substanz/Medikament",
      "comment" : "Therapieprotokoll: - geplante Substanzen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.subject",
      "path" : "MedicationRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.reasonCode",
      "path" : "MedicationRequest.reasonCode",
      "short" : "Therapieintention",
      "comment" : "Intention: (z.B. neoadjuvant, adjuvant, palliativ)"
    },
    {
      "id" : "MedicationRequest.reasonReference",
      "path" : "MedicationRequest.reasonReference",
      "short" : "Bezogene Diagnose",
      "comment" : "Reference zur Condition-Ressource der Diagnose",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.courseOfTherapyType",
      "path" : "MedicationRequest.courseOfTherapyType",
      "short" : "Therapieprotokoll",
      "comment" : "Therapieprotokoll: - geplantes Schema/Protokoll — ersetzt ehemalige TherapyProtocol-Extension",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.note",
      "path" : "MedicationRequest.note",
      "short" : "Planungsdetails",
      "comment" : "Details: Freitext"
    },
    {
      "id" : "MedicationRequest.dosageInstruction",
      "path" : "MedicationRequest.dosageInstruction",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.dosageInstruction.timing",
      "path" : "MedicationRequest.dosageInstruction.timing",
      "short" : "Geplante Gabe-Rhythmik"
    },
    {
      "id" : "MedicationRequest.dosageInstruction.doseAndRate.dose[x]",
      "path" : "MedicationRequest.dosageInstruction.doseAndRate.dose[x]",
      "short" : "Geplante Dosis"
    }]
  }
}

```
