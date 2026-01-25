CodeSystem: CS_Senologie_Diagnose_Lokal
Id: cs-senologie-diagnose-lokal
Title: "CS Senologie Diagnose Lokal"
Description: "Lokale Codes für Mamma-Diagnosen ohne SNOMED CT Mapping (basierend auf Dotbase)"

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #bz-diagnose-bc-recurrence "Mammakarzinom Rezidiv"
    "Rezidiv eines Mammakarzinoms - verwende clinicalStatus=recurrence mit SNOMED 254837009"
* #bz-diagnose-sonstiges "Sonstiges"
    "Sonstige Diagnose, nicht anderweitig klassifiziert"
* #bz-makromastie "Makromastie"
    "Makromastie (Mammahypertrophie)"
* #bz-mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
    "Sekretion aus der Brustwarze, nicht blutig"
* #bz-mamillensekretion-blutig "Blutige Mamillensekretion"
    "Sekretion aus der Brustwarze, blutig"
* #bz-befund-unklarer-dignitaet "Befund unklarer Dignität"
    "Mammabefund unklarer Dignität"
* #bz-anisomastie "Anisomastie"
    "Asymmetrie der Brüste"
* #bz-kapselfibrose "Kapselfibrose"
    "Kapselkontraktur nach Brustimplantat"


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
