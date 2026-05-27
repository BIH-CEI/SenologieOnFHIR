// Konsolidiertes CodeSystem fuer Senologie-Diagnose-Codes ohne passendes
// SNOMED-CT-Mapping. Loest die historische Aufteilung in zwei separate
// CodeSystems auf:
//   - cs-senologie-diagnose-lokal (Jan 2026, bz-*-Praefix)
//   - cs-senologie-diagnose-mamma-custom (Mai 2026, ohne Praefix)
//
// Ueberlappten in 2/3 Codes (mamillensekretion-nicht-blutig, anisomastie,
// sonstiges) → konsolidiert auf neutrale Code-IDs ohne bz-Praefix.

CodeSystem: CS_Senologie_Diagnose_Custom
Id: cs-senologie-diagnose-custom
Title: "CS Senologie Diagnose Custom"
Description: "Senologie-spezifische Diagnose-Codes fuer Mamma-Konzepte ohne eindeutiges SNOMED-CT-Mapping (Rezidiv, Mamillensekretion, kosmetische/funktionelle Anomalien, Befund unklarer Dignitaet, Sonstiges)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

* #bc-recurrence "Mammakarzinom Rezidiv"
    "Wiederauftreten eines bereits behandelten Mammakarzinoms (lokal, regional oder distant). Wo moeglich ueber Condition.clinicalStatus=recurrence auf der bestehenden Diagnose abbilden — dieser Code nur wenn separate Condition gepflegt wird."
* #mamillensekretion-blutig "Blutige Mamillensekretion"
    "Blutige Sekretion aus der Brustwarze (Symptom, ohne automatische maligne Implikation)."
* #mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
    "Nicht-blutige Sekretion aus der Brustwarze. SNOMED 54302000 'Discharge from nipple' ist zu unspezifisch fuer die klinische Unterscheidung."
* #makromastie "Makromastie"
    "Uebergrosse Brust (kosmetisch/funktionell, keine Tumordiagnose)."
* #anisomastie "Anisomastie"
    "Asymmetrie/Groessenunterschied zwischen den Bruesten (kosmetisch/funktionell). Kein eindeutiges SNOMED-Aequivalent als Diagnose."
* #befund-unklarer-dignitaet "Befund unklarer Dignitaet"
    "Befund, dessen biologische Wertigkeit (benigne/maligne) noch nicht geklaert ist — Platzhalter bis Definitivdiagnose."
* #sonstiges "Sonstiges"
    "Sonstige Diagnose, nicht in der Hauptliste enthalten. Freitext-Details im Diagnose-Details-Item."
