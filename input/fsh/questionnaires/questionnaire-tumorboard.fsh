// ============================================================
// Questionnaire: Tumorboard Empfehlung
// Quelle: dotbase Codebook Section
//   "Brustzentrum Protokoll der interdisziplinären Tumorkonferenz /
//    Empfehlung der interdisziplinären Tumorkonferenz"
// Ziel: Senologie_Tumorboard_Empfehlung (CarePlan)
// Extraction: SDC Template-based Extraction
//   Contained CarePlan (#careplan-template) mit templateExtractValue
//   FHIRPath-Ausdrücken auf primitiven Feldern
// ============================================================
// Mapping-Übersicht (Item → CarePlan-Pfad via templateExtractValue):
//   tumorboard-datum        → CarePlan.period.start
//   tumorboard-titel        → CarePlan.title
//   tumorboard-beschreibung → CarePlan.description
//   empfehlung-op           → CarePlan.activity[op].detail.description
//   empfehlung-strahlentherapie → CarePlan.activity[rt].detail.description
//   empfehlung-endokrin     → CarePlan.activity[endo].detail.description
//   empfehlung-chemotherapie → CarePlan.activity[chemo].detail.description
//   empfehlung-zielgerichtet → CarePlan.activity[targeted].detail.description
//   empfehlung-immuntherapie → CarePlan.activity[immuno].detail.description
//   empfehlung-diagnostik   → CarePlan.activity[diag].detail.description
//   empfehlung-studie       → CarePlan.activity[trial].detail.description
//   empfehlung-genetik      → CarePlan.activity[genetics].detail.description
//   empfehlung-nachsorge    → CarePlan.activity[followUp].detail.description
//   empfehlung-sonstiges    → CarePlan.note[0].text
// ============================================================

Instance: senologie-tumorboard
InstanceOf: Questionnaire
Title: "Fragebogen: Tumorboard Empfehlung"
Description: "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Template-based Extraction mit contained CarePlan und templateExtractValue-Annotationen."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
* name = "QuestTumorboard"
* title = "Fragebogen: Tumorboard Empfehlung"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- Contained CarePlan (Extraction Template) ----------
* contained = careplan-template

// ---------- SDC Extensions ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[template].valueReference = Reference(careplan-template)

// ---------- Items ----------

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

* item[+].linkId = "tumorboard-datum"
* item[=].text = "Datum des Tumorboards"
* item[=].type = #date
* item[=].required = true

* item[+].linkId = "tumorboard-titel"
* item[=].text = "Titel der Empfehlung"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "tumorboard-beschreibung"
* item[=].text = "Zusammenfassung der Empfehlung"
* item[=].type = #text
* item[=].required = false

* item[+].linkId = "empfehlung-op"
* item[=].text = "Operative Therapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-strahlentherapie"
* item[=].text = "Strahlentherapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-endokrin"
* item[=].text = "Endokrine Therapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-chemotherapie"
* item[=].text = "Chemotherapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-zielgerichtet"
* item[=].text = "Zielgerichtete Therapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-immuntherapie"
* item[=].text = "Immuntherapie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-diagnostik"
* item[=].text = "Weitere Diagnostik empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-studie"
* item[=].text = "Klinische Studie empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-genetik"
* item[=].text = "Genetische Untersuchung empfohlen"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-nachsorge"
* item[=].text = "Nachsorge-Empfehlung"
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "empfehlung-sonstiges"
* item[=].text = "Sonstige Anmerkungen"
* item[=].type = #text
* item[=].required = false
* item[=].repeats = true


// ============================================================
// Contained CarePlan: Template für Template-based Extraction
// ============================================================

Instance: careplan-template
InstanceOf: CarePlan
Usage: #inline

* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"
* status = #active
* intent = #plan

// addresses -> Bezugsdiagnose (Condition) aus SDC Choice Selection
* addresses.reference = "placeholder"
* addresses.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* addresses.reference.extension.valueString = "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

* title = "Tumorboard Empfehlung"
* title.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* title.extension.valueString = "item.where(linkId='tumorboard-titel').answer.valueString"

* description = "Zusammenfassung"
* description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* description.extension.valueString = "item.where(linkId='tumorboard-beschreibung').answer.valueString"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "'Patient/' + %patient.id"

* period.start = "2024-01-01"
* period.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* period.start.extension.valueString = "item.where(linkId='tumorboard-datum').answer.valueDate"

// --- Operative Therapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[=].detail.description = "Operative Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-op').answer.valueString"
* activity[=].detail.status = #not-started

// --- Strahlentherapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[=].detail.description = "Strahlentherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-strahlentherapie').answer.valueString"
* activity[=].detail.status = #not-started

// --- Endokrine Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[=].detail.description = "Endokrine Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-endokrin').answer.valueString"
* activity[=].detail.status = #not-started

// --- Chemotherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[=].detail.description = "Chemotherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-chemotherapie').answer.valueString"
* activity[=].detail.status = #not-started

// --- Zielgerichtete Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#416608005 "Drug therapy"
* activity[=].detail.description = "Zielgerichtete Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-zielgerichtet').answer.valueString"
* activity[=].detail.status = #not-started

// --- Immuntherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#76334006 "Immunotherapy (procedure)"
* activity[=].detail.description = "Immuntherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-immuntherapie').answer.valueString"
* activity[=].detail.status = #not-started

// --- Weitere Diagnostik ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#165197003 "Diagnostic assessment (procedure)"
* activity[=].detail.description = "Weitere Diagnostik"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-diagnostik').answer.valueString"
* activity[=].detail.status = #not-started

// --- Klinische Studie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#110465008 "Clinical trial (procedure)"
* activity[=].detail.description = "Klinische Studie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-studie').answer.valueString"
* activity[=].detail.status = #not-started

// --- Genetische Untersuchung ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#405825005 "Molecular genetic test"
* activity[=].detail.description = "Genetische Untersuchung"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-genetik').answer.valueString"
* activity[=].detail.status = #not-started

// --- Nachsorge ---
* activity[+].detail.kind = #Appointment
* activity[=].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[=].detail.description = "Nachsorge"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "item.where(linkId='empfehlung-nachsorge').answer.valueString"
* activity[=].detail.status = #not-started

// --- Sonstiges ---
* note.text = "Sonstige Anmerkungen"
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "item.where(linkId='empfehlung-sonstiges').answer.valueString"
