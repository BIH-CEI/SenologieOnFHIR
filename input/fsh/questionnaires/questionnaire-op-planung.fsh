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
* status = #draft
* intent = #plan
* subject.reference = "placeholder"

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
* extension[=].valueReference = Reference(op-planung-template)

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Items
// ============================================================

// Art der Operation
* item[+].linkId = "op-art"
* item[=].text = "Art der geplanten Operation"
* item[=].type = #string
* item[=].required = true
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.code.text"

// Seite
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Seite"
* item[=].type = #choice
* item[=].required = true
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.bodySite"
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Intention / Grund der OP
* item[+].linkId = "intention"
* item[=].text = "Intention / Grund der OP"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.reasonCode.text"

// OP-Dauer (Minuten)
* item[+].linkId = "op-dauer-min"
* item[=].text = "Geplante OP-Dauer (Minuten)"
* item[=].type = #integer
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:operationsDuration.valueDuration.value"

// CA-Behandlung / Tumorkonferenz-Zustimmung
* item[+].linkId = "tumor-conference-consent"
* item[=].text = "CA-Behandlung / Tumorkonferenz-Zustimmung erteilt"
* item[=].type = #boolean
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:tumorConferenceConsent.valueCodeableConcept"

// Präoperative Markierung
* item[+].linkId = "pre-op-markierung"
* item[=].text = "Präoperative Markierung geplant"
* item[=].type = #choice
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpMarkierung.valueCodeableConcept"
* item[=].answerOption[+].valueCoding = $SCT#129125009 "Procedure with device"
* item[=].answerOption[+].valueCoding = $SCT#397956004 "Wire guided localization of breast lesion"
* item[=].answerOption[+].valueCoding = $SCT#77343006 "Angiography"
* item[=].answerOption[+].valueString = "Keine"

// Planungsdetails / Notes
* item[+].linkId = "notes"
* item[=].text = "Planungsdetails / Freitext"
* item[=].type = #text
* item[=].required = false
* item[=].repeats = true
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.note.text"

// Präoperative Blutabnahme
* item[+].linkId = "pre-op-blutabnahme"
* item[=].text = "Präoperative Blutabnahme geplant"
* item[=].type = #boolean
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpBlutabnahme.valueCodeableConcept"

// Präoperative Antibiotikatherapie
* item[+].linkId = "pre-op-antibiotika"
* item[=].text = "Präoperative Antibiotikatherapie"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-op-planung#ServiceRequest.extension:preOpAntibiotikatherapie.valueString"
