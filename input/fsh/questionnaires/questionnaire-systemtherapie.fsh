// ============================================================
// Questionnaire: Systemtherapie
// Quelle: dotbase Codebook Section "Systemtherapie"
// Ziel: Senologie_Systemtherapie_Procedure (Procedure)
// Extraction: SDC Template-based Extraction
//   Template: input/resources/Questionnaire-senologie-systemtherapie-template.json
//   Contained Procedure mit templateExtractValue FHIRPath-Ausdrücken
// ============================================================

Instance: senologie-systemtherapie
InstanceOf: Questionnaire
Title: "Fragebogen: Systemtherapie"
Description: "Fragebogen zur strukturierten Dokumentation einer Systemtherapie in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_Systemtherapie_Procedure-Profil (Procedure) als Ziel. Das Extraction-Template liegt unter input/resources/Questionnaire-senologie-systemtherapie-template.json."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* name = "QuestSystemtherapie"
* title = "Fragebogen: Systemtherapie"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Template-based Extraction ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------
// Mapping-Übersicht (Item → Procedure-Pfad):
//   syst-intention       → Procedure.extension[Intention].valueCodeableConcept
//   syst-stellung        → Procedure.extension[StellungZurOp].valueCodeableConcept
//   syst-therapieart     → Procedure.code
//   syst-protokoll       → Procedure.usedCode
//   syst-beginn          → Procedure.performedPeriod.start
//   syst-ende            → Procedure.performedPeriod.end
//   syst-substanz        → Procedure.note (Substanzangabe)
//   syst-status          → Procedure.outcome
//   syst-anmerkungen     → Procedure.note

// Therapieart
* item[+].linkId = "syst-therapieart"
* item[=].text = "Therapieart"
* item[=].type = #choice
* item[=].required = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.code"
* item[=].answerOption[+].valueCoding = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* item[=].answerOption[+].valueCoding = $SCT#169413002 "Hormone therapy (procedure)"
* item[=].answerOption[+].valueCoding = $SCT#416608005 "Drug therapy"
* item[=].answerOption[+].valueCoding = $SCT#76334006 "Immunotherapy (procedure)"
* item[=].answerOption[+].valueCoding = $SCT#870370003 "Antiresorptive therapy (procedure)"

// Therapieintention
* item[+].linkId = "syst-intention"
* item[=].text = "Therapieintention"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = $SCT#373808002 "Curative - procedure intent (qualifier value)"
* item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliative - procedure intent (qualifier value)"
* item[=].answerOption[+].valueCoding = $SCT#262202000 "Supportive - procedure intent (qualifier value)"

// Stellung zur OP
* item[+].linkId = "syst-stellung"
* item[=].text = "Stellung zur Operation"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[+].valueCoding = $SCT#421974008 "Neoadjuvant - Loss of Function (qualifier value)"
* item[=].answerOption[+].valueCoding = $SCT#352241000119100 "Adjuvant chemotherapy (procedure)"
* item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliative - procedure intent (qualifier value)"

// Therapieprotokoll
* item[+].linkId = "syst-protokoll"
* item[=].text = "Therapieprotokoll / Schema"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.usedCode.text"

// Substanz(en)
* item[+].linkId = "syst-substanz"
* item[=].text = "Substanz(en)"
* item[=].type = #string
* item[=].required = false
* item[=].repeats = true

// Beginn
* item[+].linkId = "syst-beginn"
* item[=].text = "Therapiebeginn"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.performedPeriod.start"

// Ende
* item[+].linkId = "syst-ende"
* item[=].text = "Therapieende"
* item[=].type = #date
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.performedPeriod.end"

// Therapiestatus / Outcome
* item[+].linkId = "syst-status"
* item[=].text = "Therapie-Status"
* item[=].type = #choice
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.outcome"
* item[=].answerOption[+].valueCoding = $SCT#385669000 "Completed (qualifier value)"
* item[=].answerOption[+].valueCoding = $SCT#385655000 "Suspended (qualifier value)"
* item[=].answerOption[+].valueCoding = $SCT#7058009 "Discontinued (qualifier value)"

// Anmerkungen
* item[+].linkId = "syst-anmerkungen"
* item[=].text = "Anmerkungen"
* item[=].type = #text
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.note.text"
