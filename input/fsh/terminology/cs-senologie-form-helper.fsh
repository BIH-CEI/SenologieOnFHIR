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

// R-Status (Resektionsstatus) — SCT hat keine validen R0/R1/R2/RX-Codes
// (395536008/395537004/395538009/395539001 verweisen auf andere Konzepte)
* #r-0 "R0 — kein Residualtumor"
    "Resektion komplett, kein Residualtumor mikroskopisch nachweisbar."
* #r-1 "R1 — mikroskopischer Residualtumor"
    "Residualtumor nur mikroskopisch nachweisbar (margin involvement)."
* #r-2 "R2 — makroskopischer Residualtumor"
    "Residualtumor makroskopisch sichtbar verblieben."
* #r-x "RX — nicht beurteilbar"
    "Residualstatus konnte nicht beurteilt werden."

// B-Klassifikation nach NHSBSP — SCT hat keine entsprechenden Konzept-Codes
* #b-0 "B0 — Specimen unsatisfactory"
    "Material unzureichend fuer Beurteilung."
* #b-1 "B1 — Normalgewebe"
    "Normales/unauffaelliges Brustgewebe."
* #b-2 "B2 — Benigne"
    "Eindeutig benigne Laesion (z.B. Fibroadenom, Mastopathie)."
* #b-3 "B3 — Unklares biologisches Potenzial"
    "Laesion mit unklarem Malignitaetspotenzial (ADH, FEA, LIN, radiaere Narbe, papillaere Laesionen)."
* #b-4 "B4 — Malignitaetsverdaechtig"
    "Suspekt fuer Malignitaet, aber nicht eindeutig diagnostisch."
* #b-5a "B5a — Maligne in-situ"
    "DCIS bzw. nichtinvasives Karzinom."
* #b-5b "B5b — Maligne invasiv"
    "Invasives Karzinom."

// Therapie-Status — SCT-Codes 410546004/410548003 verweisen auf andere Konzepte
* #therapie-laufend "Laufend"
    "Therapie aktuell im Gange."
* #therapie-abgeschlossen "Abgeschlossen"
    "Therapie regulaer beendet (geplanter Zyklus durchlaufen)."
* #therapie-abgebrochen "Abgebrochen"
    "Therapie vor planmaessigem Ende beendet (Nebenwirkungen/Patientenwunsch/Progress)."

// Vorstellungsgrund (klinischer Kontext der Vorstellung)
* #vorstellung-erstvorstellung "Erstvorstellung"
    "Erstkontakt der Patientin im Zentrum/in der Sprechstunde."
* #vorstellung-zweitmeinung "Zweitmeinung"
    "Vorstellung zur Einholung einer Zweitmeinung."
* #vorstellung-wiedervorstellung "Wiedervorstellung"
    "Folgevorstellung im Rahmen einer laufenden Behandlung."
* #vorstellung-nachsorge "Nachsorge"
    "Vorstellung im Rahmen der Tumornachsorge."

// Screeningstatus
* #screening-mammographie-screening "Mammographie-Screening"
    "Detektion im Rahmen des organisierten Mammographie-Screenings."
* #screening-frueherkennung "Frueherkennung"
    "Detektion im Rahmen kurativer/individueller Frueherkennung."
* #screening-symptomatisch "Symptomatisch"
    "Detektion aufgrund von Symptomen (nicht Screening)."

// HER2-FISH-Status — SCT 385432009 ('Not applicable') passt nicht
* #her2-fish-positiv "FISH positiv"
* #her2-fish-negativ "FISH negativ"
* #her2-fish-nicht-durchgefuehrt "FISH nicht durchgefuehrt"

// Praeop-Markierung — SCT 397956004 (Hueft-OP!) / 405815000 (Procedure device) sind falsch
* #markierung-draht "Drahtmarkierung"
    "Praeoperative Drahtmarkierung der Laesion (sono- oder mammographiegesteuert)."
* #markierung-clip "Clip-Markierung"
    "Praeoperativ implantierter Clip zur Lokalisation."
* #markierung-radioaktiv "Radioaktive Markierung (ROLL/SNOLL)"
    "Markierung mit radioaktivem Tracer."
* #markierung-keine "Keine Markierung"
    "Keine praeoperative Markierung durchgefuehrt."

// Therapie-Intention "Revision" — SCT 225298006 ist invalid
* #intention-revision "Revisions-Intention"
    "Revisions-OP nach inkompletter Resektion oder Komplikation."