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
* followUp[drainage].coding MS
* followUp[verband].coding MS
* followUp[antibiotika].coding MS
* followUp[mobilisation].coding MS
* followUp[laborkontrolle].coding MS

// usedCode — inherited slicing from MII Mamma Operation (pattern:$this)
// Inherited: IntraoperativesImaging, PraeoperativeMarkierung
* usedCode MS
* usedCode ^short = "Verwendete Codes"
* usedCode ^definition = "Verwendete Codes für die Operation — erbt IntraoperativesImaging und PraeoperativeMarkierung von MII Mamma"
