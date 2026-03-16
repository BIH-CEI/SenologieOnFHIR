Profile: Senologie_Familienanamnese
Parent: FamilyMemberHistory
Id: senologie-familienanamnese
Title: "BIH Senologie Familienanamnese"
Description: "FamilyMemberHistory für familiäre Belastung mit Mamma- und Ovarialkarzinom aus dotbase Questionnaire 'Familienanamnese'"

* insert PR_CS_VS_Version
* ^status = #draft

* status MS

* patient MS
* patient only Reference(Patient)

* relationship MS
* relationship ^short = "Verwandtschaftsgrad"
* relationship ^comment = "Aus dotbase: Mutter, Schwester, Tante, Großmutter etc."

* age[x] MS
* age[x] ^short = "Alter des Familienmitglieds"

* condition MS
* condition ^short = "Erkrankung des Familienmitglieds"
* condition ^slicing.discriminator.type = #pattern
* condition ^slicing.discriminator.path = "code"
* condition ^slicing.rules = #open

* condition contains
    mammakarzinom 0..1 MS and
    ovarialkarzinom 0..1 MS

* condition[mammakarzinom].code = $SCT#254837009 "Malignant neoplasm of breast"
* condition[mammakarzinom] ^short = "Mammakarzinom in der Familie"
* condition[mammakarzinom].onset[x] MS
* condition[mammakarzinom].onset[x] ^short = "Erkrankungsalter"

* condition[ovarialkarzinom].code = $SCT#363443007 "Malignant tumor of ovary"
* condition[ovarialkarzinom] ^short = "Ovarialkarzinom in der Familie"
* condition[ovarialkarzinom].onset[x] MS
* condition[ovarialkarzinom].onset[x] ^short = "Erkrankungsalter"

* note ^short = "Weitere familiäre Belastung (Freitext)"
