// ============================================================
// Questionnaire: OP Planung
// Quelle: dotbase Codebook Section "OP Planung ärztlich"
// Ziel: Senologie_OP_Planung (ServiceRequest)
// Extraktion: SDC Template-based Extraction mit contained
//   ServiceRequest-Template (senologie-op-planung Profil).
// ============================================================

// --- Contained template resource ---
Instance: op-planung-template
InstanceOf: ServiceRequest
Usage: #inline

* id = "op-planung-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung"
* status = #active
* intent = #plan

// subject ← QR.subject.reference (Patient via launchContext)
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// reasonReference -> Bezugsdiagnose (Condition) aus SDC Choice Selection
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// --- Questionnaire ---
Instance: senologie-op-planung
InstanceOf: Questionnaire
Title: "Fragebogen: OP Planung"
Description: "Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung"
* name = "QuestOPPlanung"
* title = "Fragebogen: OP Planung"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Contained template
* contained[+] = op-planung-template

// SDC templateExtract -> contained ServiceRequest template
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(op-planung-template)

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient


// Launch Context: Diagnose (Condition als Anker für Pre-Population)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #diagnosis
* extension[=].extension[=].valueCoding.display = "Diagnose (Anker-Condition)"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Condition
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Anker-Diagnose (Condition) für Pre-Population. Vom Frontend nach Diagnose-Choice gesetzt."
// ============================================================
// Items
// ============================================================

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

// Art der Operation
* item[+].linkId = "op-art"
* item[=].text = "Art der geplanten Operation"
* item[=].type = #string
* item[=].required = true

// Seite (korrigierte SCT-Codes)
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Seite"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Tumor-Entität(en) — User picked die zu operierenden BodyStructures
* item[+].linkId = "op-tumor-entitaet"
* item[=].text = "Zu operierende Tumor-Entität(en)"
* item[=].type = #reference
* item[=].repeats = true
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "BodyStructure?patient={{%patient.id}}&active=true"

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
* item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-preop-markierung"

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
