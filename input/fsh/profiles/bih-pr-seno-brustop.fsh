Profile: Senologie_Operation
Parent: MII_PR_Onko_Mamma_Operation
Id: senologie-operation
Title: "BIH LM Senologie Brustwand-Operation"
Description: "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation."

* insert PR_CS_VS_Version
* ^status = #draft

// Inherited from MII Onko Mamma Operation (via MII Onko Operation):
// - extension:Intention (OP-Intention)
// - usedCode:PraeoperativeMarkierung
// - usedCode:IntraoperativesImaging
// - code with OPS + SCT coding slices
// - complication with compl_obds + compl_icd10 slices (pattern:$this discriminator)

* category MS
* category from vs-senologie-operation-art
* category ^short = "Art der Operation"
* category ^definition = "Art der Operation Brust, Axillär, Lateralität"

* code MS
* performed[x] MS
* performedDateTime MS
* subject MS
* subject only Reference(Patient)
* bodySite

// Komplikationen — inherited slicing from MII Onko Operation (pattern:$this)
* complication MS
* complication ^short = "Komplikation (oBDS / ICD-10)"
* complication ^comment = "Verwendet geerbte Slices compl_obds und compl_icd10 vom MII Onko Operation Parent"

* outcome MS
* outcome ^short = "Outcome der Operation, v.a. bei Revision"

* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"

// Follow-up — no parent slicing, so our own is fine
* followUp MS
* followUp ^slicing.discriminator.type = #pattern
* followUp ^slicing.discriminator.path = "$this"
* followUp ^slicing.rules = #open
* followUp contains drainage 0..* and verband 0..* and antibiotika 0..* and mobilisation 0..* and laborkontrolle 0..*
* followUp[drainage] = $SCT#122462000 "Drainage procedure"
* followUp[drainage].coding MS
* followUp[verband] = $SCT#182531007 "Dressing of wound"
* followUp[verband].coding MS
* followUp[antibiotika] = $SCT#281789004 "Antibiotic therapy (procedure)"
* followUp[antibiotika].coding MS
* followUp[mobilisation] = $SCT#183040004 "Mobilization (procedure)"
* followUp[mobilisation].coding MS
* followUp[laborkontrolle] = $SCT#15220000 "Laboratory test (procedure)"
* followUp[laborkontrolle].coding MS

// Performer — Erst-/Zweitoperateur (DKG G08-G09)
* performer MS
* performer ^slicing.discriminator.type = #pattern
* performer ^slicing.discriminator.path = "function"
* performer ^slicing.rules = #open
* performer contains erstoperateur 0..1 MS and zweitoperateur 0..1 MS
* performer[erstoperateur].function = $SCT#304292004 "Surgeon (occupation)"
* performer[erstoperateur].function ^short = "Erstoperateur (G08)"
* performer[erstoperateur].actor only Reference(Practitioner or PractitionerRole)
* performer[erstoperateur].actor MS
* performer[zweitoperateur].function = $SCT#309388001 "Surgical assistant (occupation)"
* performer[zweitoperateur].function ^short = "Zweitoperateur (G09)"
* performer[zweitoperateur].actor only Reference(Practitioner or PractitionerRole)
* performer[zweitoperateur].actor MS

// usedCode — inherited slicing from MII Mamma Operation (pattern:$this)
// Inherited: IntraoperativesImaging, PraeoperativeMarkierung
* usedCode MS
* usedCode ^short = "Verwendete Codes"
* usedCode ^definition = "Verwendete Codes für die Operation — erbt IntraoperativesImaging und PraeoperativeMarkierung von MII Mamma"
