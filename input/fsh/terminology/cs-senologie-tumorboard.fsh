// CodeSystem für Tumorboard-Empfehlungs-Status.
//
// Wird in vs-senologie-tumorboard-empfehlung-status verwendet, um pro
// Therapie-Empfehlung den Beschlusszustand des Tumorboards zu kodieren.

CodeSystem: CS_Senologie_Tumorboard_Empfehlung
Id: cs-senologie-tumorboard-empfehlung
Title: "CS Senologie Tumorboard Empfehlung"
Description: "Beschlusszustand pro Therapie-Empfehlung im Tumorboard."

* ^url = "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

* #empfohlen "Empfohlen"
    "Tumorboard empfiehlt die Therapie/Massnahme."
* #bedingt-empfohlen "Bedingt empfohlen"
    "Tumorboard empfiehlt unter Bedingungen (z.B. nach weiterer Diagnostik, bei bestimmten Subgruppen)."
* #nicht-empfohlen "Nicht empfohlen"
    "Tumorboard hat die Therapie/Massnahme aktiv abgelehnt."
* #nicht-diskutiert "Nicht diskutiert"
    "Therapie/Massnahme wurde im Tumorboard nicht thematisiert."
