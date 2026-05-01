Profile: Senologie_Diagnose_Maligne
Parent: MII_PR_Onko_Diagnose_Primaertumor
Id: senologie-diagnose-maligne
Title: "BIH PR Seno Diagnose Maligne"
Description: "Maligne Mamma-Diagnosen (C50, D05) für Krebsregister-Meldung. Basiert auf MII PR Onko Diagnose Primärtumor mit oBDS-konformer Diagnosesicherung und Staging."

* insert PR_CS_VS_Version
* ^status = #draft

// --- Inherited from MII_PR_Onko_Diagnose_Primaertumor: ---
// extension[Feststellungsdatum] MS  → DatumErstdiagnose
// verificationStatus.coding MS      → Diagnosesicherung (mii-vs-onko-primaertumor-diagnosesicherung)
// bodySite.coding MS                → Seite/Lateralität
// evidence.detail MS                → Evidenz für Erstdiagnose

// --- Senologie-specific additions: ---

// Tumormanifestation (D02) — Mehrfachauswahl über category
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains tumormanifestation 0..* MS
* category[tumormanifestation] from https://www.senologie.org/fhir/ValueSet/vs-senologie-tumormanifestation (required)
* category[tumormanifestation] ^short = "Tumormanifestation (Primärtumor/Rezidiv/LK/FM)"
* category[tumormanifestation] ^definition = "Klassifikation der Tumormanifestation bei Diagnosestellung. Mehrfachauswahl möglich, z.B. Primärtumor + regionäre Lymphknotenmetastasen."

// Diagnosekode - use inherited slices
* code MS
* code ^short = "Diagnose"
* code ^definition = "Diagnosestellung für Mamma-Erkrankungen"

// SNOMED slice - bind to Senologie ValueSet (24 Hauptdiagnosen)
* code.coding[sct] MS
* code.coding[sct] ^short = "SNOMED CT Diagnose"
* code.coding[sct] from https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-sct (required)

// ICD-11 slice (Dual-Coding, Zukunftsvorsorge)
* code.coding contains icd11 0..1 MS
* code.coding[icd11] ^patternCoding.system = $ICD11
* code.coding[icd11] ^short = "ICD-11 Code (optional, Dual-Coding)"
* code.coding[icd11].system 1..1
* code.coding[icd11].code 1..1

// Senologie-specific slice for non-SNOMED codes
* code.coding contains senologie 0..1 MS
* code.coding[senologie] ^short = "Senologie-spezifischer Code"
* code.coding[senologie].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose"
* code.coding[senologie] from https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-lokal (required)

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
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"
* stage[metastasis].summary MS
* stage[metastasis].summary ^short = "Metastasierungsstadium"
