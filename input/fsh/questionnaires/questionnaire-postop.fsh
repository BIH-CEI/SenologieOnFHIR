// ============================================================
// Questionnaire: Postoperative Dokumentation
// Quellen (dotbase Codebook Sections):
//   - "Operative Therapie Brustzentrum Charité"
//   - "Operative Komplikation(en)"
//   - "Postoperative Anordnungen"
// Ziele:
//   - Senologie_Operation (Procedure)
//   - Senologie_Operative_Komplikation (Observation)
//   - Senologie_Implantat (Device, optional)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: QuestPostOPDokumentation
InstanceOf: Questionnaire
Title: "Fragebogen: Postoperative Dokumentation"
Description: "Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Procedure, Observation)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-postop"
* name = "QuestPostOPDokumentation"
* title = "Fragebogen: Postoperative Dokumentation"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Operative Therapie (Procedure)
// ============================================================
* item[+].linkId = "operation"
* item[=].text = "Operative Therapie"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Procedure"

// Art der Operation (Kategorie)
* item[=].item[+].linkId = "op-kategorie"
* item[=].item[=].text = "Art der Operation"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art"

// Seite
* item[=].item[+].linkId = "op-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Breast structure"

// Performed Date
* item[=].item[+].linkId = "op-datum"
* item[=].item[=].text = "OP-Datum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// OPS-Code (Freitext)
* item[=].item[+].linkId = "op-code-text"
* item[=].item[=].text = "Beschreibung der OP (Freitext, z.B. \"BET links, Sentinel-LK-Biopsie\")"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Intention
* item[=].item[+].linkId = "op-intention"
* item[=].item[=].text = "OP-Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#P "palliativ"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#D "diagnostisch"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#R "Revision"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#S "sonstiges"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#X "Fehlende Angabe"

// Outcome (R-Status / Freitext)
* item[=].item[+].linkId = "op-outcome"
* item[=].item[=].text = "OP-Outcome (z.B. R-Status, Sentinel)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Postoperative Anordnungen / Follow-up
// ============================================================
* item[+].linkId = "followup"
* item[=].text = "Postoperative Anordnungen"
* item[=].type = #group
* item[=].required = false

// Drainage
* item[=].item[+].linkId = "followup-drainage"
* item[=].item[=].text = "Drainage"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Verband
* item[=].item[+].linkId = "followup-verband"
* item[=].item[=].text = "Verband"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Antibiotika
* item[=].item[+].linkId = "followup-antibiotika"
* item[=].item[=].text = "Antibiotikatherapie"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Mobilisation
* item[=].item[+].linkId = "followup-mobilisation"
* item[=].item[=].text = "Mobilisation"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Laborkontrolle
* item[=].item[+].linkId = "followup-labor"
* item[=].item[=].text = "Laborkontrolle"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 3: Operative Komplikation (Observation, optional)
// ============================================================
* item[+].linkId = "komplikation"
* item[=].text = "Operative Komplikation"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// Clavien-Dindo Grad
* item[=].item[+].linkId = "clavien-dindo"
* item[=].item[=].text = "Clavien-Dindo-Grad"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#1367519000 "Clavien-Dindo complication grade I"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1367521005 "Clavien-Dindo complication grade II"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1367523008 "Clavien-Dindo complication grade III"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1367525001 "Clavien-Dindo complication grade IV"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1367527009 "Clavien-Dindo complication grade V"

// Datum der Komplikation
* item[=].item[+].linkId = "komplikation-datum"
* item[=].item[=].text = "Datum der Komplikation"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Zeitpunkt (method)
* item[=].item[+].linkId = "komplikation-zeitpunkt"
* item[=].item[=].text = "Zeitpunkt"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "Intraoperativ"
* item[=].item[=].answerOption[+].valueString = "Postoperativ"
* item[=].item[=].answerOption[+].valueString = "Stationär"
* item[=].item[=].answerOption[+].valueString = "Ambulant"

// Art der Komplikation (Freitext)
* item[=].item[+].linkId = "komplikation-art"
* item[=].item[=].text = "Art der Komplikation (Freitext)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Konsequenz / Kommentar
* item[=].item[+].linkId = "komplikation-kommentar"
* item[=].item[=].text = "Konsequenz / Kommentar"
* item[=].item[=].type = #text
* item[=].item[=].required = false
