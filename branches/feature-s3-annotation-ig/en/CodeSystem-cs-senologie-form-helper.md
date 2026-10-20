# CS Senologie Form-Helper-Codes - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Form-Helper-Codes**

## CodeSystem: CS Senologie Form-Helper-Codes 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/form-helper | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:CS_Senologie_Form_Helper |

 
Lokale Codes für Form-Antworten ohne eindeutige SCT-Entsprechung (Kontrazeption-Status, Nachsorge-Modus, Allgemeinzustand-vereinfacht, Lymphödem-Grad nach ISL). 

This Code system is referenced in the definition of the following value sets:

* [VS Senologie Allgemeinzustand](ValueSet-vs-senologie-allgemeinzustand.md)
* [VS Senologie B-Klassifikation (NHSBSP)](ValueSet-vs-senologie-b-klassifikation.md)
* [VS Senologie HER2 FISH-Ergebnis](ValueSet-vs-senologie-her2-fish.md)
* [VS Senologie Kontrazeption Status](ValueSet-vs-senologie-kontrazeption-status.md)
* [VS Senologie Lymphoedem Grad](ValueSet-vs-senologie-lymphoedem-grad.md)
* [VS Senologie Nachsorge-Modus](ValueSet-vs-senologie-nachsorge-modus.md)
* [VS Senologie Pre-OP-Markierung](ValueSet-vs-senologie-preop-markierung.md)
* [VS Senologie Therapie-Intention](ValueSet-vs-senologie-therapie-intention.md)
* [VS Senologie Therapie-Status](ValueSet-vs-senologie-therapie-status.md)
* [VS Senologie Vorstellungsgrund](ValueSet-vs-senologie-vorstellungsgrund.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-form-helper",
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
  "url" : "https://www.senologie.org/fhir/CodeSystem/form-helper",
  "version" : "0.10.0",
  "name" : "CS_Senologie_Form_Helper",
  "title" : "CS Senologie Form-Helper-Codes",
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
  "description" : "Lokale Codes für Form-Antworten ohne eindeutige SCT-Entsprechung (Kontrazeption-Status, Nachsorge-Modus, Allgemeinzustand-vereinfacht, Lymphödem-Grad nach ISL).",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 41,
  "concept" : [{
    "code" : "kontrazeption-nie",
    "display" : "Nie",
    "definition" : "Patientin hat nie hormonelle Verhuetung verwendet."
  },
  {
    "code" : "kontrazeption-frueher",
    "display" : "Frueher",
    "definition" : "Patientin hat hormonelle Verhuetung verwendet, aktuell nicht mehr."
  },
  {
    "code" : "kontrazeption-aktuell",
    "display" : "Aktuell",
    "definition" : "Patientin verwendet aktuell hormonelle Verhuetung."
  },
  {
    "code" : "nachsorge-aktiv",
    "display" : "Aktiv (persoenlich untersucht)",
    "definition" : "Nachsorge-Termin mit persoenlicher klinischer Untersuchung."
  },
  {
    "code" : "nachsorge-passiv",
    "display" : "Passiv (aus Akten/Registern)",
    "definition" : "Nachsorge-Status aus Aktenlage oder Register-Daten ermittelt, ohne persoenliche Untersuchung."
  },
  {
    "code" : "ag-gut",
    "display" : "Gut",
    "definition" : "Allgemeinzustand gut — keine relevanten Einschraenkungen."
  },
  {
    "code" : "ag-eingeschraenkt",
    "display" : "Eingeschraenkt",
    "definition" : "Allgemeinzustand eingeschraenkt — Aktivitaetslimit aber selbststaendig."
  },
  {
    "code" : "ag-schlecht",
    "display" : "Schlecht",
    "definition" : "Allgemeinzustand schlecht — wesentliche Einschraenkungen, Pflegebedarf."
  },
  {
    "code" : "lymphoedem-0",
    "display" : "Kein Lymphoedem",
    "definition" : "ISL Stage 0 — kein klinisches Lymphoedem (ggf. latent/subklinisch)."
  },
  {
    "code" : "lymphoedem-1",
    "display" : "Grad I",
    "definition" : "ISL Stage I — reversibel, Schwellung bildet sich bei Hochlagerung zurueck."
  },
  {
    "code" : "lymphoedem-2",
    "display" : "Grad II",
    "definition" : "ISL Stage II — spontan irreversibel, Schwellung persistiert, fibrotische Veraenderungen."
  },
  {
    "code" : "lymphoedem-3",
    "display" : "Grad III",
    "definition" : "ISL Stage III — lymphostatische Elephantiasis mit massiver Volumenzunahme und Hautveraenderungen."
  },
  {
    "code" : "r-0",
    "display" : "R0 — kein Residualtumor",
    "definition" : "Resektion komplett, kein Residualtumor mikroskopisch nachweisbar."
  },
  {
    "code" : "r-1",
    "display" : "R1 — mikroskopischer Residualtumor",
    "definition" : "Residualtumor nur mikroskopisch nachweisbar (margin involvement)."
  },
  {
    "code" : "r-2",
    "display" : "R2 — makroskopischer Residualtumor",
    "definition" : "Residualtumor makroskopisch sichtbar verblieben."
  },
  {
    "code" : "r-x",
    "display" : "RX — nicht beurteilbar",
    "definition" : "Residualstatus konnte nicht beurteilt werden."
  },
  {
    "code" : "b-0",
    "display" : "B0 — Specimen unsatisfactory",
    "definition" : "Material unzureichend fuer Beurteilung."
  },
  {
    "code" : "b-1",
    "display" : "B1 — Normalgewebe",
    "definition" : "Normales/unauffaelliges Brustgewebe."
  },
  {
    "code" : "b-2",
    "display" : "B2 — Benigne",
    "definition" : "Eindeutig benigne Laesion (z.B. Fibroadenom, Mastopathie)."
  },
  {
    "code" : "b-3",
    "display" : "B3 — Unklares biologisches Potenzial",
    "definition" : "Laesion mit unklarem Malignitaetspotenzial (ADH, FEA, LIN, radiaere Narbe, papillaere Laesionen)."
  },
  {
    "code" : "b-4",
    "display" : "B4 — Malignitaetsverdaechtig",
    "definition" : "Suspekt fuer Malignitaet, aber nicht eindeutig diagnostisch."
  },
  {
    "code" : "b-5a",
    "display" : "B5a — Maligne in-situ",
    "definition" : "DCIS bzw. nichtinvasives Karzinom."
  },
  {
    "code" : "b-5b",
    "display" : "B5b — Maligne invasiv",
    "definition" : "Invasives Karzinom."
  },
  {
    "code" : "therapie-laufend",
    "display" : "Laufend",
    "definition" : "Therapie aktuell im Gange."
  },
  {
    "code" : "therapie-abgeschlossen",
    "display" : "Abgeschlossen",
    "definition" : "Therapie regulaer beendet (geplanter Zyklus durchlaufen)."
  },
  {
    "code" : "therapie-abgebrochen",
    "display" : "Abgebrochen",
    "definition" : "Therapie vor planmaessigem Ende beendet (Nebenwirkungen/Patientenwunsch/Progress)."
  },
  {
    "code" : "vorstellung-erstvorstellung",
    "display" : "Erstvorstellung",
    "definition" : "Erstkontakt der Patientin im Zentrum/in der Sprechstunde."
  },
  {
    "code" : "vorstellung-zweitmeinung",
    "display" : "Zweitmeinung",
    "definition" : "Vorstellung zur Einholung einer Zweitmeinung."
  },
  {
    "code" : "vorstellung-wiedervorstellung",
    "display" : "Wiedervorstellung",
    "definition" : "Folgevorstellung im Rahmen einer laufenden Behandlung."
  },
  {
    "code" : "vorstellung-nachsorge",
    "display" : "Nachsorge",
    "definition" : "Vorstellung im Rahmen der Tumornachsorge."
  },
  {
    "code" : "screening-mammographie-screening",
    "display" : "Mammographie-Screening",
    "definition" : "Detektion im Rahmen des organisierten Mammographie-Screenings."
  },
  {
    "code" : "screening-frueherkennung",
    "display" : "Frueherkennung",
    "definition" : "Detektion im Rahmen kurativer/individueller Frueherkennung."
  },
  {
    "code" : "screening-symptomatisch",
    "display" : "Symptomatisch",
    "definition" : "Detektion aufgrund von Symptomen (nicht Screening)."
  },
  {
    "code" : "her2-fish-positiv",
    "display" : "FISH positiv"
  },
  {
    "code" : "her2-fish-negativ",
    "display" : "FISH negativ"
  },
  {
    "code" : "her2-fish-nicht-durchgefuehrt",
    "display" : "FISH nicht durchgefuehrt"
  },
  {
    "code" : "markierung-draht",
    "display" : "Drahtmarkierung",
    "definition" : "Praeoperative Drahtmarkierung der Laesion (sono- oder mammographiegesteuert)."
  },
  {
    "code" : "markierung-clip",
    "display" : "Clip-Markierung",
    "definition" : "Praeoperativ implantierter Clip zur Lokalisation."
  },
  {
    "code" : "markierung-radioaktiv",
    "display" : "Radioaktive Markierung (ROLL/SNOLL)",
    "definition" : "Markierung mit radioaktivem Tracer."
  },
  {
    "code" : "markierung-keine",
    "display" : "Keine Markierung",
    "definition" : "Keine praeoperative Markierung durchgefuehrt."
  },
  {
    "code" : "intention-revision",
    "display" : "Revisions-Intention",
    "definition" : "Revisions-OP nach inkompletter Resektion oder Komplikation."
  }]
}

```
