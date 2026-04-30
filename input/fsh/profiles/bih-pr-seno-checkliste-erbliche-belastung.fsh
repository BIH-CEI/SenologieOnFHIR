Profile: Senologie_Checkliste_Erbliche_Belastung
Parent: Observation
Id: senologie-checkliste-erbliche-belastung
Title: "BIH Senologie Checkliste Erbliche Belastung"
Description: "Observation für die DKG-Checkliste zur Identifikation erblicher Tumorbelastung (D24/D25). Erfasst ob die Checkliste durchgeführt wurde und ggf. den Score."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)

* code MS
* code = $SCT#445039002 "Assessment using risk assessment tool"
* code ^short = "Checkliste erbliche Belastung"
* code ^comment = "DKG D24/D25: Checkliste zur Identifikation erblicher Tumorbelastung (z.B. nach S3-Leitlinie/AGO)"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Durchführung"

* value[x] only boolean
* valueBoolean MS
* valueBoolean ^short = "Checkliste durchgeführt (D24)"
* valueBoolean ^comment = "true = Checkliste durchgeführt, false = nicht durchgeführt"

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open

* component contains score 0..1 MS
* component[score].code = $SCT#246514001 "Score"
* component[score].code ^short = "Score der Checkliste (D25)"
* component[score].value[x] only integer
* component[score].valueInteger MS
* component[score].valueInteger ^short = "Score-Wert"

* focus MS
* focus only Reference(FamilyMemberHistory)
* focus ^short = "Verweis auf Familienanamnese"
