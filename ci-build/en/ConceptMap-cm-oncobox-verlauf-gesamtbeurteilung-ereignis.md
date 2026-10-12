# MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis**

## ConceptMap: MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-oncobox-verlauf-gesamtbeurteilung-ereignis | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*: |

 
Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-oncobox-verlauf-gesamtbeurteilung-ereignis",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableconceptmap",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableconceptmap"]
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-verlauf-gesamtbeurteilung-ereignis",
  "version" : "0.10.0",
  "title" : "MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis",
  "status" : "draft",
  "experimental" : true,
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
  "description" : "Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt.",
  "sourceUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
  "targetUri" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-verlauf-ereignis",
  "group" : [{
    "source" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
    "target" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-verlauf-ereignis",
    "element" : [{
      "code" : "V",
      "display" : "Vollremission (complete remission, CR)",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "T",
      "display" : "Teilremission (partial remission, PR)",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "K",
      "display" : "keine Aenderung (no change, NC) = stable disease",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "B",
      "display" : "klinische Besserung (minimal response, MR)",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "R",
      "display" : "Vollremission mit residualen Auffaelligkeiten (CRr)",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "P",
      "display" : "Progression",
      "target" : [{
        "code" : "6",
        "display" : "Progress",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "Y",
      "display" : "Rezidiv",
      "target" : [{
        "code" : "1",
        "display" : "Lokalrezidiv",
        "equivalence" : "wider",
        "comment" : "Default-Mapping auf Lokalrezidiv. Differenzierung (2=Regionalrezidiv, 3=Fernmetastase) erfolgt ueber Component-Auswertung Tumor_Verlauf/Lymphknoten_Verlauf/Fernmetastasen_Verlauf in der StructureMap."
      }]
    },
    {
      "code" : "D",
      "display" : "divergentes Geschehen",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "U",
      "display" : "Beurteilung unmoeglich",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "X",
      "display" : "fehlende Angabe",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    }]
  }]
}

```
