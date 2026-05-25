// CodeSystem für Senologie-spezifische Form-Antwort-Codes, fuer die kein
// passender, eindeutiger SNOMED-CT Code existiert.
//
// Auswahlpolitik: SCT bevorzugt, wenn ein passender Code in SNOMED CT
// existiert (Ontoserver-verifiziert). Nur Konzepte ohne saubere SCT-Eins-zu-eins
// landen hier als Senologie-Custom-Codes.

CodeSystem: CS_Senologie_Form_Helper
Id: cs-senologie-form-helper
Title: "CS Senologie Form-Helper-Codes"
Description: "Lokale Codes für Form-Antworten ohne eindeutige SCT-Entsprechung (Kontrazeption-Status, Nachsorge-Modus, Allgemeinzustand-vereinfacht, Lymphödem-Grad nach ISL)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

// Kontrazeption-Status — hormonelle Verhuetung
* #kontrazeption-nie "Nie"
    "Patientin hat nie hormonelle Verhuetung verwendet."
* #kontrazeption-frueher "Frueher"
    "Patientin hat hormonelle Verhuetung verwendet, aktuell nicht mehr."
* #kontrazeption-aktuell "Aktuell"
    "Patientin verwendet aktuell hormonelle Verhuetung."

// Nachsorge-Modus
* #nachsorge-aktiv "Aktiv (persoenlich untersucht)"
    "Nachsorge-Termin mit persoenlicher klinischer Untersuchung."
* #nachsorge-passiv "Passiv (aus Akten/Registern)"
    "Nachsorge-Status aus Aktenlage oder Register-Daten ermittelt, ohne persoenliche Untersuchung."

// Vereinfachter Allgemeinzustand (alternativ zu ECOG fuer schnelle Doku)
* #ag-gut "Gut"
    "Allgemeinzustand gut — keine relevanten Einschraenkungen."
* #ag-eingeschraenkt "Eingeschraenkt"
    "Allgemeinzustand eingeschraenkt — Aktivitaetslimit aber selbststaendig."
* #ag-schlecht "Schlecht"
    "Allgemeinzustand schlecht — wesentliche Einschraenkungen, Pflegebedarf."

// Lymphoedem-Grad nach International Society of Lymphology (ISL)
* #lymphoedem-0 "Kein Lymphoedem"
    "ISL Stage 0 — kein klinisches Lymphoedem (ggf. latent/subklinisch)."
* #lymphoedem-1 "Grad I"
    "ISL Stage I — reversibel, Schwellung bildet sich bei Hochlagerung zurueck."
* #lymphoedem-2 "Grad II"
    "ISL Stage II — spontan irreversibel, Schwellung persistiert, fibrotische Veraenderungen."
* #lymphoedem-3 "Grad III"
    "ISL Stage III — lymphostatische Elephantiasis mit massiver Volumenzunahme und Hautveraenderungen."

// Komplikations-Phase (intraop / postop frueh / postop spaet)
// Werden im VS via SCT-Codes gebunden — hier nur als Komment.