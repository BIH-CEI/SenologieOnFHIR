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

// ---------- Contained Procedure (Extraction Template) ----------
* contained = procedure-template

// ---------- SDC Extensions ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].valueReference = Reference(procedure-template)

// ---------- Items ----------
// Mapping-Übersicht (Item → Procedure-Pfad):
//   bezugsdiagnose       → Procedure.reasonReference (Condition-Referenz)
//   syst-intention       → Procedure.extension[Intention].valueCodeableConcept
//   syst-stellung        → Procedure.extension[StellungZurOp].valueCodeableConcept
//   syst-therapieart     → Procedure.code
//   syst-protokoll       → Procedure.usedCode
//   syst-beginn          → Procedure.performedPeriod.start
//   syst-ende            → Procedure.performedPeriod.end
//   syst-substanz        → Procedure.note (Substanzangabe)
//   syst-status          → Procedure.outcome
//   syst-anmerkungen     → Procedure.note

// Bezugsdiagnose: SDC Condition-Auswahl (bei bilateralem Karzinom)
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose (Seite)"
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&code=254837009&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "ICD-10"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

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


// ============================================================
// Contained Procedure: Template für Template-based Extraction
// ============================================================

Instance: procedure-template
InstanceOf: Procedure
Usage: #inline

* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure"
* status = #completed
* category = $SCT#18629005 "Administration of medication"

// reasonReference -> Bezugsdiagnose (Condition) aus SDC Choice Selection
* reasonReference.reference = "placeholder"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

* code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.code.extension.valueString = "item.where(linkId='syst-therapieart').answer.valueCoding.code"
* code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.system.extension.valueString = "item.where(linkId='syst-therapieart').answer.valueCoding.system"
* code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.display.extension.valueString = "item.where(linkId='syst-therapieart').answer.valueCoding.display"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "'Patient/' + %patient.id"

* performedPeriod.start = "2024-01-01"
* performedPeriod.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.start.extension.valueString = "item.where(linkId='syst-beginn').answer.valueDate"
* performedPeriod.end = "2024-12-31"
* performedPeriod.end.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.end.extension.valueString = "item.where(linkId='syst-ende').answer.valueDate"

* outcome.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* outcome.coding.code.extension.valueString = "item.where(linkId='syst-status').answer.valueCoding.code"
* outcome.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* outcome.coding.system.extension.valueString = "item.where(linkId='syst-status').answer.valueCoding.system"
* outcome.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* outcome.coding.display.extension.valueString = "item.where(linkId='syst-status').answer.valueCoding.display"

* usedCode.text = "Therapieprotokoll"
* usedCode.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* usedCode.text.extension.valueString = "item.where(linkId='syst-protokoll').answer.valueString"

* note.text = "Anmerkungen"
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "item.where(linkId='syst-anmerkungen').answer.valueString"

// --- Intention (MII Onko Extension) ---
* extension[+].url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-intention"
* extension[=].valueCodeableConcept.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.code.extension.valueString = "item.where(linkId='syst-intention').answer.valueCoding.code"
* extension[=].valueCodeableConcept.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.system.extension.valueString = "item.where(linkId='syst-intention').answer.valueCoding.system"
* extension[=].valueCodeableConcept.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.display.extension.valueString = "item.where(linkId='syst-intention').answer.valueCoding.display"

// --- Stellung zur OP (MII Onko Extension) ---
* extension[+].url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-therapie-stellungzurop"
* extension[=].valueCodeableConcept.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.code.extension.valueString = "item.where(linkId='syst-stellung').answer.valueCoding.code"
* extension[=].valueCodeableConcept.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.system.extension.valueString = "item.where(linkId='syst-stellung').answer.valueCoding.system"
* extension[=].valueCodeableConcept.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.display.extension.valueString = "item.where(linkId='syst-stellung').answer.valueCoding.display"
