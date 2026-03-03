Profile: Senologie_Operation
Parent: MII_PR_Onko_Mamma_Operation
Id: senologie-operation
Title: "BIH LM Senologie Brustwand-Operation"
Description: "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation."

* insert PR_CS_VS_Version
* ^status = #draft

// Inherited from MII Onko Mamma Operation (via MII Onko Operation):
// - extension:Intention (replaces inline extension.url from line 14)
// - usedCode:PraeoperativeMarkierung
// - usedCode:IntraoperativesImaging
// - code with OPS + SCT coding slices
// - complication with oBDS + ICD-10 slices

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

* complication MS
* complication ^short = "Komplikation nach oBDS"
* complication ^slicing.discriminator.type = #value
* complication ^slicing.discriminator.path = "system"
* complication ^slicing.rules = #open
* complication ^slicing.description = "Slicing der Angabe nach Komplikation nach oBDS, IQTIQ oder andere"
* complication ^slicing.ordered = false
* complication contains oBDS 0..* and IQTIQ 0..*
* complication[oBDS].coding MS
* complication[IQTIQ].coding MS

* outcome MS
* outcome ^short = "Outcome der Operation, v.a. bei Revision"

* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"

* followUp MS
* followUp ^slicing.discriminator.type = #value
* followUp ^slicing.discriminator.path = "system"
* followUp ^slicing.rules = #open
* followUp ^slicing.description = "Slicing of followUp by system"
* followUp ^slicing.ordered = false
* followUp contains drainage 0..* and verband 0..* and antibiotika 0..* and mobilisation 0..* and laborkontrolle 0..*
* followUp[drainage].coding MS
* followUp[verband].coding MS
* followUp[antibiotika].coding MS
* followUp[mobilisation].coding MS
* followUp[laborkontrolle].coding MS

* usedCode MS
* usedCode ^slicing.discriminator.type = #value
* usedCode ^slicing.discriminator.path = "system"
* usedCode ^slicing.rules = #open
* usedCode contains drainage 0..1 and drainageGekuerzt 0..1
* usedCode ^short = "Verwendete Codes"
* usedCode ^definition = "Verwendete Codes für die Operation, z.B. Drainage-Typ"
