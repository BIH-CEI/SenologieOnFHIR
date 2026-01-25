Alias: $ICD10GM = http://fhir.de/CodeSystem/bfarm/icd-10-gm

Profile: Senologie_Diagnose_Benigne
Parent: Condition
Id: senologie-diagnose-benigne
Title: "BIH PR Seno Diagnose Benigne"
Description: "Benigne Mamma-Diagnosen (D24, N60-N64) und entzündliche Erkrankungen. ISiK-kompatibel für Krankenhaus-Interoperabilität ohne Krebsregister-Anforderungen."

* insert PR_CS_VS_Version
* ^status = #draft

// === Required elements ===
* code 1..1 MS
* code ^short = "Benigne Mamma-Diagnose"
* code ^definition = "Diagnosestellung für benigne Mamma-Erkrankungen (nicht krebsregister-pflichtig)"

* subject 1..1 MS
* subject only Reference(Patient)

// === Code slicing (ISiK-compatible) ===
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open

// ICD-10-GM slice
* code.coding contains icd10gm 0..1 MS
* code.coding[icd10gm] ^short = "ICD-10-GM Code (D24, N60-N64)"
* code.coding[icd10gm].system 1..1
* code.coding[icd10gm].system = $ICD10GM
* code.coding[icd10gm].code 1..1

// SNOMED CT slice
* code.coding contains sct 0..1 MS
* code.coding[sct] ^short = "SNOMED CT Diagnose (benigne)"
* code.coding[sct].system 1..1
* code.coding[sct].system = $SCT
* code.coding[sct].code 1..1

// Senologie local codes (optional)
* code.coding contains senologie 0..1 MS
* code.coding[senologie] ^short = "Senologie-spezifischer Code"
* code.coding[senologie].system 1..1
* code.coding[senologie].system = "http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-diagnose-lokal"

// === Lateralität ===
* bodySite MS
* bodySite ^short = "Seite/Lateralität"
* bodySite.coding MS

// === Clinical/Verification status ===
* clinicalStatus MS
* clinicalStatus ^short = "Klinischer Status"

* verificationStatus MS
* verificationStatus ^short = "Diagnosestatus (bestätigt/vorläufig)"

// === Encounter reference (ISiK-compatible) ===
* encounter MS
* encounter ^short = "Zugehöriger Fall/Kontakt"

// === Onset (for inflammatory conditions) ===
* onset[x] MS
* onset[x] ^short = "Beginn der Erkrankung"

// === Recorded date ===
* recordedDate MS
* recordedDate ^short = "Dokumentationsdatum"

// Note: No staging required for benign conditions
// Note: No cancer registry (oBDS) Diagnosesicherung required
