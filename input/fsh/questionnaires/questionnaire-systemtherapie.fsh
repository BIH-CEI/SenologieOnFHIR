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
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// code.coding ← therapieart (Chemo / Endokrin / Antikoerper / Immun / Targeted)
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='therapieart').answer.valueCoding"

// performedPeriod ← startdatum / enddatum (Placeholder fuer per-1)
* performedPeriod.start = "1900-01-01"
* performedPeriod.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.start.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='startdatum').answer.valueDate"
* performedPeriod.end = "1900-01-01"
* performedPeriod.end.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.end.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='enddatum').answer.valueDate"

// note.text ← protokoll (Therapie-Protokoll als Freitext)
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='protokoll').answer.valueString"

// statusReason ← therapiestatus (laufend/abgeschlossen/abgebrochen)
* statusReason.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* statusReason.coding.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='therapiestatus').answer.valueCoding"

// --- Contained template: MedicationStatement ---
Instance: syst-medikation-template
InstanceOf: MedicationStatement
Usage: #inline
* id = "syst-medikation-template"
* status = #active
* medicationCodeableConcept.text = "Substanz"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// medicationCodeableConcept.coding ← substanz (ATC oder SCT je nach VS)
* medicationCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* medicationCodeableConcept.coding[=].extension.valueString = "%context.item.where(linkId='substanz').answer.valueCoding"

// effectiveDateTime ← gabe-datum
* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%context.item.where(linkId='gabe-datum').answer.valueDate"

// dosage[0].doseAndRate.doseQuantity ← dosis + dosis-einheit
* dosage[+].doseAndRate.doseQuantity.value.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].doseAndRate.doseQuantity.value.extension.valueString = "%context.item.where(linkId='dosis').answer.valueDecimal"
* dosage[=].doseAndRate.doseQuantity.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].doseAndRate.doseQuantity.code.extension.valueString = "%context.item.where(linkId='dosis-einheit').answer.valueCoding.code"
* dosage[=].doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
// dosage.route ← applikationsart (i.v./s.c./oral/i.m.)
* dosage[=].route.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].route.coding.extension.valueString = "%context.item.where(linkId='applikationsart').answer.valueCoding"

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
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-art"

// Intention
* item[=].item[+].linkId = "intention"
* item[=].item[=].text = "Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-intention"

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
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-status"

// Abbruchgrund (conditional — enableWhen prueft Status-Code "abgebrochen")
* item[=].item[+].linkId = "abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding.code = #abgebrochen

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
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-dosis-einheit"

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
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-applikationsart"

// ============================================================
// Anmerkungen
// ============================================================
* item[+].linkId = "syst-anmerkungen"
* item[=].text = "Anmerkungen"
* item[=].type = #text
* item[=].required = false
