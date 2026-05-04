// ============================================================
// Questionnaire: Systemische Therapie
// Ziele:
//   - Procedure (Therapie-Rahmen)
//   - MedicationStatement (Medikamentengabe, repeating)
// Extraktion: SDC Template-based Extraction
// ============================================================

// --- Contained template: Procedure (Systemtherapie) ---
Instance: syst-procedure-template
InstanceOf: Procedure
Usage: #inline
* id = "syst-procedure-template"
* status = #completed
* code = $SCT#367336001 "Chemotherapy"
* code.text = "Systemtherapie"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// --- Contained template: MedicationStatement ---
Instance: syst-medikation-template
InstanceOf: MedicationStatement
Usage: #inline
* id = "syst-medikation-template"
* status = #active
* medicationCodeableConcept.text = "Substanz"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Questionnaire ---
Instance: senologie-systemtherapie
InstanceOf: Questionnaire
Title: "Fragebogen: Systemische Therapie"
Description: "Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Template-based Extraction mit contained Templates für Procedure und MedicationStatement."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* name = "QuestSystemtherapie"
* title = "Fragebogen: Systemische Therapie"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
* contained[+] = syst-procedure-template
* contained[+] = syst-medikation-template

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Bezugsdiagnose
// ============================================================
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose"
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

// ============================================================
// Group 1: Therapie-Rahmen → Procedure
// ============================================================
* item[+].linkId = "therapie-rahmen"
* item[=].text = "Therapie-Rahmen"
* item[=].type = #group
* item[=].required = true

// SDC templateExtract → Procedure
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(syst-procedure-template)

// Therapieart
* item[=].item[+].linkId = "therapieart"
* item[=].item[=].text = "Therapieart"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#385786002 "Chemotherapie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#169413002 "Endokrine Therapie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#432105003 "Zielgerichtete Therapie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76334006 "Immuntherapie"

// Intention
* item[=].item[+].linkId = "intention"
* item[=].item[=].text = "Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#373847000 "Neoadjuvant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373846009 "Adjuvant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliativ"

// First-Line bei Metastasierung (conditional)
* item[=].item[+].linkId = "first-line"
* item[=].item[=].text = "First-Line-Therapie bei Metastasierung"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "intention"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#363676003

// Protokoll/Schema
* item[=].item[+].linkId = "protokoll"
* item[=].item[=].text = "Protokoll/Schema (z.B. EC-Pac, TCbHP)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Startdatum
* item[=].item[+].linkId = "startdatum"
* item[=].item[=].text = "Startdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Enddatum
* item[=].item[+].linkId = "enddatum"
* item[=].item[=].text = "Enddatum"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Geplante Zyklen
* item[=].item[+].linkId = "geplante-zyklen"
* item[=].item[=].text = "Geplante Zyklen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Durchgeführte Zyklen
* item[=].item[+].linkId = "durchgefuehrte-zyklen"
* item[=].item[=].text = "Durchgeführte Zyklen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Therapiestatus
* item[=].item[+].linkId = "therapiestatus"
* item[=].item[=].text = "Therapiestatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "Abgeschlossen"
* item[=].item[=].answerOption[+].valueString = "Abgebrochen"
* item[=].item[=].answerOption[+].valueString = "Laufend"

// Abbruchgrund (conditional)
* item[=].item[+].linkId = "abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "Abgebrochen"

// ============================================================
// Group 2: Medikamentengabe → MedicationStatement (repeating)
// ============================================================
* item[+].linkId = "medikamentengabe"
* item[=].text = "Medikamentengabe"
* item[=].type = #group
* item[=].required = false
* item[=].repeats = true

// SDC templateExtract → MedicationStatement
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(syst-medikation-template)

// Substanz
* item[=].item[+].linkId = "substanz"
* item[=].item[=].text = "Substanz"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"

// Dosis
* item[=].item[+].linkId = "dosis"
* item[=].item[=].text = "Dosis"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false

// Dosis-Einheit
* item[=].item[+].linkId = "dosis-einheit"
* item[=].item[=].text = "Dosis-Einheit"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "mg"
* item[=].item[=].answerOption[+].valueString = "mg/m²"
* item[=].item[=].answerOption[+].valueString = "mg/kg"

// Zyklus
* item[=].item[+].linkId = "zyklus-nummer"
* item[=].item[=].text = "Zyklus"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Tag im Zyklus
* item[=].item[+].linkId = "tag-im-zyklus"
* item[=].item[=].text = "Tag im Zyklus"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Gabe-Datum
* item[=].item[+].linkId = "gabe-datum"
* item[=].item[=].text = "Gabe-Datum"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Applikationsart
* item[=].item[+].linkId = "applikationsart"
* item[=].item[=].text = "Applikationsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "i.v."
* item[=].item[=].answerOption[+].valueString = "s.c."
* item[=].item[=].answerOption[+].valueString = "p.o."

// ============================================================
// Anmerkungen
// ============================================================
* item[+].linkId = "syst-anmerkungen"
* item[=].text = "Anmerkungen"
* item[=].type = #text
* item[=].required = false
