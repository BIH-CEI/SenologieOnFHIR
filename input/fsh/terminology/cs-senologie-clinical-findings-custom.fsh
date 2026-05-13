// Custom Codes für klinische Befunde (Klinische Untersuchung + cross-form),
// die SNOMED CT nicht direkt abbildet. Hauptsächlich:
// - Regnault-Ptosis-Klassifikation (0/I/II/III)
// - Tumornachweis-Erstdiagnose-Marker (Mammakarzinom-Erstdiagnose im Verlauf)

CodeSystem: CS_Senologie_Clinical_Findings_Custom
Id: cs-senologie-clinical-findings-custom
Title: "CS Senologie Clinical Findings Custom"
Description: "Custom Codes für klinische Senologie-Befunde ohne direktes SNOMED-Mapping (Ptosis-Grad, Tumornachweis-Erstdiagnose-Mammakarzinom)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

// Regnault-Ptosis-Klassifikation
* #ptosis-0 "Ptosis Grad 0 — keine Ptosis"
* #ptosis-i "Ptosis Grad I — leichte Ptosis (Mamille auf Höhe Inframammarfalte)"
* #ptosis-ii "Ptosis Grad II — moderate Ptosis (Mamille 1-3 cm unter Inframammarfalte)"
* #ptosis-iii "Ptosis Grad III — schwere Ptosis (Mamille > 3 cm unter Inframammarfalte, kaudal-orientiert)"

// Tumornachweis-Statuskategorie: Erstdiagnose (Klinik-spezifisch, nicht in SCT als Recurrence-Pendant abbildbar)
* #tumornachweis-erstdiagnose-bc "Erstdiagnose Mammakarzinom (klinisch festgestellt)"
* #tumornachweis-gemischtes-ansprechen "Gemischtes Ansprechen (Mixed Response)"

// Kontrolltermin-Arten (Senologie-spezifische Visit-Typen)
* #kontrolle-6-monate "6-Monats-Kontrolle"
* #kontrolle-12-monate "12-Monats-Kontrolle"
* #kontrolle-ausserplan "Außerplanmäßige Kontrolle"
* #kontrolle-abschluss "Abschlusskontrolle"

// Tumorstatus-Pseudo-Code (für Verlauf wenn kein Anhalt für Tumor)
* #kein-anhalt-tumor "Kein Anhalt für Tumor"
