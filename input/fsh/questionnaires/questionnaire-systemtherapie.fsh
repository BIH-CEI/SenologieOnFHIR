// ============================================================
// Questionnaire: Systemische Therapie
// Quelle: dotbase Codebook Section "Systemische Therapie"
// Ziele:
//   - Procedure (Therapie-Rahmen)
//   - MedicationStatement (Medikamentengabe, repeating)
//   - Observation (Therapieergebnis)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-systemtherapie
InstanceOf: Questionnaire
Title: "Fragebogen: Systemische Therapie"
Description: "Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Procedure, MedicationStatement, Observation)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* name = "QuestSystemtherapie"
* title = "Fragebogen: Systemische Therapie"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// ---------- Contained Procedure (Extraction Template) ----------
* contained = postop-procedure-template

// ---------- SDC Extensions ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(postop-procedure-template)

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
* item[=].item[+].linkId = "therapieart"
* item[=].item[=].text = "Therapieart"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#385786002 "Chemotherapy care"
* item[=].item[=].answerOption[+].valueCoding = $SCT#169413002 "Endocrine therapy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#432105003 "Targeted therapy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76334006 "Immunotherapy"

// Intention
* item[=].item[+].linkId = "intention"
* item[=].item[=].text = "Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#373847000 "Neoadjuvant intent"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373846009 "Adjuvant - intent"
* item[=].item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliative intent"

// Protokoll/Schema
* item[=].item[+].linkId = "protokoll"
* item[=].item[=].text = "Protokoll/Schema (z.B. \"EC → Paclitaxel\", \"TCbHP\")"
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

// Durchgefuehrte Zyklen
* item[=].item[+].linkId = "durchgefuehrte-zyklen"
* item[=].item[=].text = "Durchgeführte Zyklen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Abbruchgrund
* item[=].item[+].linkId = "abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// ============================================================
// Group 2: Medikamentengabe (MedicationStatement, repeating)
// ============================================================
* item[+].linkId = "medikamentengabe"
* item[=].text = "Medikamentengabe"
* item[=].type = #group
* item[=].required = false
* item[=].repeats = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "MedicationStatement"

// Substanz
* item[=].item[+].linkId = "substanz"
* item[=].item[=].text = "Substanz"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
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

// Zyklus-Nummer
* item[=].item[+].linkId = "zyklus-nummer"
* item[=].item[=].text = "Zyklus-Nummer"
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
// Group 3: Therapieergebnis (Observation)
// ============================================================
* item[+].linkId = "therapieergebnis"
* item[=].text = "Therapieergebnis"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// Ansprechen
* item[=].item[+].linkId = "ansprechen"
* item[=].item[=].text = "Ansprechen"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "Complete Response"
* item[=].item[=].answerOption[+].valueString = "Partial Response"
* item[=].item[=].answerOption[+].valueString = "Stable Disease"
* item[=].item[=].answerOption[+].valueString = "Progressive Disease"

// Anmerkungen
* item[+].linkId = "syst-anmerkungen"
* item[=].text = "Anmerkungen"
* item[=].type = #text
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.note.text"


// =====================================================