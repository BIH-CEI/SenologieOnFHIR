// Metastasierungsstatus — vorher zusammen mit cs-senologie-diagnose-lokal
// in cs-senologie-diagnose.fsh, jetzt in eigene Datei extrahiert.

CodeSystem: CS_Senologie_Metastasierung
Id: cs-senologie-metastasierung
Title: "CS Senologie Metastasierung"
Description: "Metastasierungsstatus fuer Senologie (M0 / primaer / sekundaer metastasiert)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

* #nicht-metastasiert "Nicht metastasiert"
    "M0 - keine Fernmetastasen nachweisbar."
* #primaer-metastasiert "Primaer metastasiert"
    "M1 - Fernmetastasen bei Erstdiagnose."
* #sekundaer-metastasiert "Sekundaer metastasiert"
    "M1 - Fernmetastasen im Verlauf entwickelt."
