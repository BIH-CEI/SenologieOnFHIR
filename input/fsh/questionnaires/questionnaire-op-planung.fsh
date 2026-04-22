// ============================================================
// Questionnaire: OP Planung
// Quelle: dotbase Codebook Section "OP Planung ärztlich"
// Ziel: Senologie_OP_Planung (ServiceRequest) über Definition-based Extraction
// ============================================================

Instance: QuestOPPlanung
InstanceOf: Questionnaire
Title: "Fragebogen: OP Planung"
Description: "Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Definition-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung"
* name = "QuestOPPlanung"
* title = "Fragebogen: OP Planung"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Extraction Context ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "ServiceRequest"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------

// Art der Operation (Freitext — in der Praxis aus Dropdown)
* item[+].linkId = "op-art"
* item[=].text = "Art der geplanten Operation"
* item[=].type = #string
* item[=].required = true

// Seite
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Seite"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Intention / Grund der OP
* item[+].linkId = "intention"
* item[=].text = "Intention / Grund der OP"
* item[=].type = #string
* item[=].required = false

// OP-Dauer (Minuten)
* item[+].linkId = "op-dauer-min"
* item[=].text = "Geplante OP-Dauer (Minuten)"
* item[=].type = #integer
* item[=].required = false

// CA-Behandlung / Tumorkonferenz-Zustimmung
* item[+].linkId = "tumor-conference-consent"
* item[=].text = "CA-Behandlung / Tumorkonferenz-Zustimmung erteilt"
* item[=].type = #boolean
* item[=].required = false

// Präoperative Markierung
* item[+].linkId = "pre-op-markierung"
* item[=].text = "Präoperative Markierung geplant"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[+].valueString = "Drahtmarkierung"
* item[=].answerOption[+].valueString = "Clip-Markierung"
* item[=].answerOption[+].valueString = "Magnetsonde"
* item[=].answerOption[+].valueString = "Keine"

// Planungsdetails / Notes
* item[+].linkId = "notes"
* item[=].text = "Planungsdetails / Freitext"
* item[=].type = #text
* item[=].required = false
* item[=].repeats = true

// Präoperative Blutabnahme
* item[+].linkId = "pre-op-blutabnahme"
* item[=].text = "Präoperative Blutabnahme geplant"
* item[=].type = #boolean
* item[=].required = false

// Präoperative Antibiotikatherapie
* item[+].linkId = "pre-op-antibiotika"
* item[=].text = "Präoperative Antibiotikatherapie"
* item[=].type = #string
* item[=].required = false
