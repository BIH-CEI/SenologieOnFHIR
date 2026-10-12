# CS Senologie Diagnose Custom - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Diagnose Custom**

## CodeSystem: CS Senologie Diagnose Custom 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom | **:0.10.0 |
| Draft | **:CS_Senologie_Diagnose_Custom |

 
Senologie-spezifische Diagnose-Codes fuer Mamma-Konzepte ohne eindeutiges SNOMED-CT-Mapping (Rezidiv, Mamillensekretion, kosmetische/funktionelle Anomalien, Befund unklarer Dignitaet, Sonstiges). 

* [VS Senologie Diagnose](ValueSet-vs-senologie-diagnose.md)
* [VS Senologie Diagnose Lokal](ValueSet-vs-senologie-diagnose-lokal.md)
* [VS Senologie Diagnose Mamma (24 Choices)](ValueSet-vs-senologie-diagnose-mamma-24.md)

-------

 . 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-diagnose-custom",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"]
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
  }],
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom",
  "version" : "0.10.0",
  "name" : "CS_Senologie_Diagnose_Custom",
  "title" : "CS Senologie Diagnose Custom",
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
  "description" : "Senologie-spezifische Diagnose-Codes fuer Mamma-Konzepte ohne eindeutiges SNOMED-CT-Mapping (Rezidiv, Mamillensekretion, kosmetische/funktionelle Anomalien, Befund unklarer Dignitaet, Sonstiges).",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 7,
  "concept" : [{
    "code" : "bc-recurrence",
    "display" : "Mammakarzinom Rezidiv",
    "definition" : "Wiederauftreten eines bereits behandelten Mammakarzinoms (lokal, regional oder distant). Wo moeglich ueber Condition.clinicalStatus=recurrence auf der bestehenden Diagnose abbilden — dieser Code nur wenn separate Condition gepflegt wird."
  },
  {
    "code" : "mamillensekretion-blutig",
    "display" : "Blutige Mamillensekretion",
    "definition" : "Blutige Sekretion aus der Brustwarze (Symptom, ohne automatische maligne Implikation)."
  },
  {
    "code" : "mamillensekretion-nicht-blutig",
    "display" : "Nicht blutige Mamillensekretion",
    "definition" : "Nicht-blutige Sekretion aus der Brustwarze. SNOMED 54302000 'Discharge from nipple' ist zu unspezifisch fuer die klinische Unterscheidung."
  },
  {
    "code" : "makromastie",
    "display" : "Makromastie",
    "definition" : "Uebergrosse Brust (kosmetisch/funktionell, keine Tumordiagnose)."
  },
  {
    "code" : "anisomastie",
    "display" : "Anisomastie",
    "definition" : "Asymmetrie/Groessenunterschied zwischen den Bruesten (kosmetisch/funktionell). Kein eindeutiges SNOMED-Aequivalent als Diagnose."
  },
  {
    "code" : "befund-unklarer-dignitaet",
    "display" : "Befund unklarer Dignitaet",
    "definition" : "Befund, dessen biologische Wertigkeit (benigne/maligne) noch nicht geklaert ist — Platzhalter bis Definitivdiagnose."
  },
  {
    "code" : "sonstiges",
    "display" : "Sonstiges",
    "definition" : "Sonstige Diagnose, nicht in der Hauptliste enthalten. Freitext-Details im Diagnose-Details-Item."
  }]
}

```
