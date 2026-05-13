// Custom Codes für Bildgebungs-Befunde im konsentierten Senologie-Datensatz.
// Für Konzepte wo SNOMED keinen direkten Code hat (LK-Status, Standort, Beurteilbarkeit, US-DEGUM).

CodeSystem: CS_Senologie_Bildgebung_Custom
Id: cs-senologie-bildgebung-custom
Title: "CS Senologie Bildgebung Custom"
Description: "Custom Codes für radiologische Befunde der Senologie (LK-Status, Standort, Beurteilbarkeit, US-DEGUM) ohne passendes SNOMED-Mapping."

* ^url = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

// LK-Status (axilläre Lymphknoten in der Bildgebung)
* #lk-unauffaellig "LK unauffällig"
* #lk-unklar "LK unklar"
* #lk-suspekt "LK suspekt"
* #lk-kein-abgebildet "kein LK abgebildet"

// Standort der Bildgebung
* #standort-intern "intern (eigene Klinik)"
* #standort-extern "extern (externe Praxis/Klinik)"

// Beurteilbarkeit (typisch Sonographie)
* #beurteilbarkeit-gut "gut beurteilbar"
* #beurteilbarkeit-eingeschraenkt "eingeschränkt beurteilbar"

// US-DEGUM Klassifikation (DEGUM Sonographie-Beurteilung, 0-6)
* #us-degum-0 "DEGUM 0 — unklare Beurteilung"
* #us-degum-1 "DEGUM 1 — wahrscheinlich kein malignes Korrelat"
* #us-degum-2 "DEGUM 2 — eindeutig benigne"
* #us-degum-3 "DEGUM 3 — wahrscheinlich benigne"
* #us-degum-4 "DEGUM 4 — abklärungsbedürftig / suspekt"
* #us-degum-5 "DEGUM 5 — hochsuspekt auf Malignität"
* #us-degum-6 "DEGUM 6 — histologisch gesichert maligne"

// Mikrokalk-Triage (auf der Bildgebung — strukturierter als bool)
* #mikrokalk-ja-suspekt "Ja, suspekt"
* #mikrokalk-ja-nicht-suspekt "Ja, nicht suspekt"
* #mikrokalk-nein "Nein"

// Herdbefund (auf der Bildgebung)
* #herdbefund-ja "Ja"
* #herdbefund-nein "Nein"

// Axilla suspekt (auf der Bildgebung)
* #axilla-suspekt-ja "Axilla suspekt: Ja"
* #axilla-suspekt-nein "Axilla suspekt: Nein"
