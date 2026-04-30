Instance: Example-Checkliste-Erbliche-Belastung-Ja
InstanceOf: Senologie_Checkliste_Erbliche_Belastung
Usage: #example
Title: "Checkliste erbliche Belastung — durchgeführt (Score 3)"
Description: "Beispiel: Checkliste wurde durchgeführt mit Score 3"

* status = #final
* code = $SCT#445039002 "Assessment using risk assessment tool"
* subject = Reference(Fall1-Patient-Erika-Gabler)
* effectiveDateTime = "2024-03-10"
* valueBoolean = true
* component[score].code = $SCT#246514001 "Score"
* component[score].valueInteger = 3

Instance: Example-Checkliste-Erbliche-Belastung-Nein
InstanceOf: Senologie_Checkliste_Erbliche_Belastung
Usage: #example
Title: "Checkliste erbliche Belastung — nicht durchgeführt"
Description: "Beispiel: Checkliste wurde nicht durchgeführt"

* status = #final
* code = $SCT#445039002 "Assessment using risk assessment tool"
* subject = Reference(Fall1-Patient-Erika-Gabler)
* effectiveDateTime = "2024-03-10"
* valueBoolean = false
