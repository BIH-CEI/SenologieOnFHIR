// ============================================================
// Komorbiditäten vor Diagnose (C02)
// Standard-FHIR Conditions mit ICD-10-GM und SNOMED-Kategorie
// ============================================================

// --- Fall 1: Erika Neumann — Hypertonie + Hypothyreose ---

Instance: Fall1-Komorbiditaet-Hypertonie
InstanceOf: Condition
Title: "Fall 1: Komorbidität — Arterielle Hypertonie"
Description: "Vorbestehende arterielle Hypertonie unter Metoprolol-Therapie"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = $SCT#398192003 "Co-morbid conditions"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].version = "2025"
* code.coding[=].code = #I10
* code.coding[=].display = "Essentielle (primäre) Hypertonie"
* code.coding[+] = $SCT#38341003 "Hypertensive disorder"
* code.text = "Arterielle Hypertonie"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* onsetDateTime = "2020-03-01"
* recordedDate = "2025-01-15"


Instance: Fall1-Komorbiditaet-Hypothyreose
InstanceOf: Condition
Title: "Fall 1: Komorbidität — Hypothyreose"
Description: "Vorbestehende Hypothyreose unter L-Thyroxin-Substitution"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = $SCT#398192003 "Co-morbid conditions"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].version = "2025"
* code.coding[=].code = #E03.9
* code.coding[=].display = "Hypothyreose, nicht näher bezeichnet"
* code.coding[+] = $SCT#40930008 "Hypothyroidism"
* code.text = "Hypothyreose"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* onsetDateTime = "2018-06-01"
* recordedDate = "2025-01-15"


// --- Fall 5: Monika Braun — Diabetes mellitus Typ 2 ---

Instance: Fall5-Komorbiditaet-Diabetes
InstanceOf: Condition
Title: "Fall 5: Komorbidität — Diabetes mellitus Typ 2"
Description: "Vorbestehender Diabetes mellitus Typ 2, diätetisch eingestellt"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = $SCT#398192003 "Co-morbid conditions"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].version = "2025"
* code.coding[=].code = #E11.90
* code.coding[=].display = "Diabetes mellitus, Typ 2: Ohne Komplikationen: Nicht als entgleist bezeichnet"
* code.coding[+] = $SCT#44054006 "Diabetes mellitus type 2"
* code.text = "Diabetes mellitus Typ 2"
* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* onsetDateTime = "2019-05-01"
* recordedDate = "2025-01-20"


// --- Fall 9: Andrea Wolf — COPD + Adipositas ---

Instance: Fall9-Komorbiditaet-COPD
InstanceOf: Condition
Title: "Fall 9: Komorbidität — COPD"
Description: "Chronisch obstruktive Lungenerkrankung GOLD II"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = $SCT#398192003 "Co-morbid conditions"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].version = "2025"
* code.coding[=].code = #J44.1
* code.coding[=].display = "Chronische obstruktive Lungenkrankheit mit akuter Exazerbation, nicht näher bezeichnet"
* code.coding[+] = $SCT#13645005 "Chronic obstructive lung disease"
* code.text = "COPD GOLD II"
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* onsetDateTime = "2017-01-01"
* recordedDate = "2025-03-01"


Instance: Fall9-Komorbiditaet-Adipositas
InstanceOf: Condition
Title: "Fall 9: Komorbidität — Adipositas"
Description: "Adipositas Grad I (BMI 32)"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category = $SCT#398192003 "Co-morbid conditions"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].version = "2025"
* code.coding[=].code = #E66.00
* code.coding[=].display = "Adipositas durch übermäßige Kalorienzufuhr: Body-Mass-Index [BMI] von 30 bis unter 35"
* code.coding[+] = $SCT#414916001 "Obesity"
* code.text = "Adipositas Grad I (BMI 32)"
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* recordedDate = "2025-03-01"
