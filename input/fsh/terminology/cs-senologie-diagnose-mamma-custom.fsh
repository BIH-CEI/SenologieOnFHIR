// Custom Codes für Mamma-Diagnose-Konzepte, die SNOMED CT nicht direkt abbildet.
// Codes übernommen aus dem konsentierten Senologie-Datensatz (bz-* Namespace).

CodeSystem: CS_Senologie_Diagnose_Mamma_Custom
Id: cs-senologie-diagnose-mamma-custom
Title: "CS Senologie Diagnose Mamma Custom"
Description: "Custom Codes für Mamma-Diagnose-Konzepte ohne passendes SNOMED-Mapping (Mammakarzinom Rezidiv, Mamillensekretion, kosmetische/funktionelle Anomalien, Befund unklarer Dignität, Sonstiges)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

* #bc-recurrence "Mammakarzinom Rezidiv"
    "Wiederauftreten eines bereits behandelten Mammakarzinoms (lokal, regional oder distant)."
* #mamillensekretion-blutig "Blutige Mamillensekretion"
    "Blutige Sekretion aus der Brustwarze (Symptomgruppe, ohne maligne Diagnose)."
* #mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
    "Nicht-blutige Sekretion aus der Brustwarze (Symptomgruppe, ohne maligne Diagnose)."
* #makromastie "Makromastie"
    "Übergroße Brust (kosmetisch/funktionell, keine Tumordiagnose)."
* #anisomastie "Anisomastie"
    "Größen- und Formunterschied zwischen den Brüsten (kosmetisch/funktionell)."
* #befund-unklarer-dignitaet "Befund unklarer Dignität"
    "Befund, dessen biologische Wertigkeit (benigne/maligne) noch nicht geklärt ist — Platzhalter bis Definitivdiagnose."
* #sonstiges "Sonstiges"
    "Sonstige Diagnose, nicht in der Hauptliste enthalten. Freitext-Details im Diagnose-Details-Item."
