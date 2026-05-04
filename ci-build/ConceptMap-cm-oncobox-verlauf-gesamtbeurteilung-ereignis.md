# MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis**

## ConceptMap: MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-oncobox-verlauf-gesamtbeurteilung-ereignis | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-oncobox-verlauf-gesamtbeurteilung-ereignis",
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-verlauf-gesamtbeurteilung-ereignis",
  "version" : "0.1.0",
  "title" : "MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
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
