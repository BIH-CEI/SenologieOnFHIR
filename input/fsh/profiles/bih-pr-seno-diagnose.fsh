Profile: Senologie_Diagnose
Parent: MII_PR_Onko_Diagnose_Primaertumor
Id: senologie-diagnose
Title: "BIH PR Seno Diagnose"
Description: "Diagnose im Rahmen der BIH-Spezifikation des Moduls Senologie (Mamma-Erkrankungen). Basiert auf MII PR Onko Diagnose Primärtumor."

* insert PR_CS_VS_Version
* ^status = #draft

// --- Inherited from MII_PR_Onko_Diagnose_Primaertumor: ---
// extension[Feststellungsdatum] MS  → DatumErstdiagnose
// verificationStatus.coding MS      → Diagnosesicherung (mii-vs-onko-primaertumor-diagnosesicherung)
// bodySite.coding MS                → Seite/Lateralität
// evidence.detail MS                → Evidenz für Erstdiagnose

// --- Senologie-specific additions: ---

// Diagnosekode - use inherited slices
* code MS
* code ^short = "Diagnose"
* code ^definition = "Diagnosestellung für Mamma-Erkrankungen"

// SNOMED slice - bind to Senologie ValueSet (24 Hauptdiagnosen)
* code.coding[sct] MS
* code.coding[sct] ^short = "SNOMED CT Diagnose"
// TODO: * code.coding[sct] from http://fhir.bih-charite.de/kds-senologie/ValueSet/vs-senologie-diagnose-sct (required)

// Senologie-specific slice for non-SNOMED codes
* code.coding contains senologie 0..1 MS
* code.coding[senologie] ^short = "Senologie-spezifischer Code"
* code.coding[senologie].system = "http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-diagnose"
// TODO: * code.coding[senologie] from http://fhir.bih-charite.de/kds-senologie/ValueSet/vs-senologie-diagnose-lokal (required)

// Grad der Mammaerkrankung
* stage MS
* stage ^short = "Grad/Stadium der Mammaerkrankung"
* stage.summary MS
* stage.summary ^short = "Grad"

// Metastasierungsstadium - slice for M-stage
* stage ^slicing.discriminator.type = #value
* stage ^slicing.discriminator.path = "type"
* stage ^slicing.rules = #open
* stage contains metastasis 0..1 MS
* stage[metastasis].type = $SCT#385349001 "Metastasis stage finding"
* stage[metastasis].summary MS
* stage[metastasis].summary ^short = "Metastasierungsstadium"
