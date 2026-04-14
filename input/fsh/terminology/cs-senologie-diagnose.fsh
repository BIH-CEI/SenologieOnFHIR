CodeSystem: CS_Senologie_Diagnose_Lokal
Id: cs-senologie-diagnose-lokal
Title: "CS Senologie Diagnose Lokal"
Description: "Lokale Codes für Mamma-Diagnosen ohne SNOMED CT Mapping (basierend auf Dotbase)"

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #bz-diagnose-sonstiges "Sonstiges"
    "Sonstige Diagnose, nicht anderweitig klassifiziert"
* #bz-mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
    "Sekretion aus der Brustwarze, nicht blutig (SNOMED 54302000 deckt nur 'Discharge from nipple' ohne Spezifizierung)"
* #bz-anisomastie "Anisomastie"
    "Asymmetrie der Brüste (kein exaktes SNOMED-Äquivalent als Diagnose)"


CodeSystem: CS_Senologie_Metastasierung
Id: cs-senologie-metastasierung
Title: "CS Senologie Metastasierung"
Description: "Metastasierungsstatus für Senologie"

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #nicht-metastasiert "Nicht metastasiert"
    "M0 - keine Fernmetastasen nachweisbar"
* #primaer-metastasiert "Primär metastasiert"
    "M1 - Fernmetastasen bei Erstdiagnose"
* #sekundaer-metastasiert "Sekundär metastasiert"
    "M1 - Fernmetastasen im Verlauf entwickelt"
