// CodeSystem für Senologie Follow-Up / Verlaufsmeldung (OncoBox M01-M10)
// Lokale Codes für Konzepte ohne SNOMED CT Mapping

Alias: $CS_FOLLOWUP = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

CodeSystem: CS_Senologie_FollowUp
Id: cs-senologie-follow-up
Title: "CS Senologie Follow-Up"
Description: "Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Codes für Observation.method (Nachsorge-Art), Zweittumor-Komponentencode und Wertcodes."

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

// --- Komponentencode (Slicing-Diskriminator) ---
* #zweittumor "Zweittumor"
    "Komponente: Zweittumor ja/nein/unbekannt (M08)"

// --- Wertcodes für Nachsorge-Art (Observation.method, M03) ---
* #aktiv "Aktive Nachsorge"
    "Patientin wurde persoenlich untersucht oder befragt"
* #passiv "Passive Nachsorge"
    "Information aus Akten, Registern oder Drittquellen"
