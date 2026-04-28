// CodeSystem für Senologie Follow-Up / Verlaufsmeldung (OncoBox M01-M10)
// Lokale Codes für Konzepte ohne SNOMED CT Mapping

Alias: $CS_FOLLOWUP = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

CodeSystem: CS_Senologie_FollowUp
Id: cs-senologie-follow-up
Title: "CS Senologie Follow-Up"
Description: "Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Komponentenbezeichner und Wertcodes für Felder ohne SNOMED-CT-Äquivalent."

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

// --- Komponentencodes (Slicing-Diskriminatoren) ---
* #nachsorge-art "Art der Nachsorge"
    "Komponente: Aktive oder passive Nachsorge (M03)"
* #vitalstatus "Vitalstatus"
    "Komponente: Vitalstatus der Patientin zum Meldezeitpunkt (M04)"
* #zweittumor "Zweittumor"
    "Komponente: Zweittumor ja/nein/unbekannt (M08)"
* #zweittumor-icd "Zweittumor ICD-10-GM Diagnose"
    "Komponente: ICD-10-GM-Code des Zweittumors (M09)"
* #zweittumor-datum "Zweittumor Diagnosedatum"
    "Komponente: Diagnosedatum des Zweittumors (M10)"

// --- Wertcodes für Nachsorge-Art ---
* #aktiv "Aktive Nachsorge"
    "Patientin wurde persönlich untersucht oder befragt"
* #passiv "Passive Nachsorge"
    "Information aus Akten, Registern oder Drittquellen"
