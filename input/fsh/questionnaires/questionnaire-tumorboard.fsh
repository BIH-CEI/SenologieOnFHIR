// ============================================================
// Questionnaire: Tumorboard Empfehlung
// Quelle: dotbase Codebook Section
//   "Brustzentrum Protokoll der interdisziplinaeren Tumorkonferenz /
//    Empfehlung der interdisziplinaeren Tumorkonferenz"
// Ziel: Senologie_Tumorboard_Empfehlung (CarePlan)
// Extraction: SDC Template-based Extraction
//
// Pro Therapie-Empfehlung wird ein Status (empfohlen / bedingt / nicht /
// nicht-diskutiert) erhoben + optionale Begruendung. Beides landet auf
// CarePlan.activity[X]:
//   - status (code) -> activity.detail.statusReason (CodeableConcept)
//   - begruendung   -> activity.detail.description (string)
// ============================================================

Instance: senologie-tumorboard
InstanceOf: Questionnaire
Title: "Fragebogen: Tumorboard Empfehlung"
Description: "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinaeren Tumorkonferenz. Pro Therapie-Empfehlung mit Beschluss-Status (empfohlen/bedingt/nicht/nicht diskutiert) und Begruendung. SDC Template-based Extraction zu CarePlan."
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

// Launch Context: Diagnose (Condition als Anker fuer Pre-Population)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #diagnosis
* extension[=].extension[=].valueCoding.display = "Diagnose (Anker-Condition)"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Condition

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(careplan-template)

// ---------- Items ----------

// Bezugsdiagnose
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

// --- Therapie-Empfehlungen: pro Bereich Status + Begruendung ---
// RuleSet-aehnliches Macro waere schoener, aber FSH unterstuetzt Inline-Groups gut

* item[+].linkId = "empfehlung-op-group"
* item[=].text = "Operative Therapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-op-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-op-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-strahlentherapie-group"
* item[=].text = "Strahlentherapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-strahlentherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-strahlentherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-endokrin-group"
* item[=].text = "Endokrine Therapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-endokrin-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-endokrin-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-chemotherapie-group"
* item[=].text = "Chemotherapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-chemotherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-chemotherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-zielgerichtet-group"
* item[=].text = "Zielgerichtete Therapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-zielgerichtet-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-zielgerichtet-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-immuntherapie-group"
* item[=].text = "Immuntherapie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-immuntherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-immuntherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-diagnostik-group"
* item[=].text = "Weitere Diagnostik"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-diagnostik-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-diagnostik-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-studie-group"
* item[=].text = "Klinische Studie"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-studie-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-studie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-genetik-group"
* item[=].text = "Genetische Untersuchung"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-genetik-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-genetik-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-nachsorge-group"
* item[=].text = "Nachsorge"
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-nachsorge-status"
* item[=].item[=].text = "Status der Empfehlung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-nachsorge-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-sonstiges"
* item[=].text = "Sonstige Anmerkungen"
* item[=].type = #text
* item[=].required = false


// ============================================================
// Contained CarePlan: Template fuer Template-based Extraction
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
* addresses.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

* title = "Tumorboard Empfehlung"
* title.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* title.extension.valueString = "%resource.item.where(linkId='tumorboard-titel').answer.valueString"

* description = "Zusammenfassung"
* description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* description.extension.valueString = "%resource.item.where(linkId='tumorboard-beschreibung').answer.valueString"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

* period.start = "2024-01-01"
* period.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* period.start.extension.valueString = "%resource.item.where(linkId='tumorboard-datum').answer.valueDate"

// --- Operative Therapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-status').answer.valueCoding.code"
* activity[=].detail.description = "Operative Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Strahlentherapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-status').answer.valueCoding.code"
* activity[=].detail.description = "Strahlentherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Endokrine Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-status').answer.valueCoding.code"
* activity[=].detail.description = "Endokrine Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Chemotherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-status').answer.valueCoding.code"
* activity[=].detail.description = "Chemotherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Zielgerichtete Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#416608005 "Drug therapy"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-status').answer.valueCoding.code"
* activity[=].detail.description = "Zielgerichtete Therapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Immuntherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#76334006 "Immunotherapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-status').answer.valueCoding.code"
* activity[=].detail.description = "Immuntherapie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Weitere Diagnostik ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#165197003 "Diagnostic assessment (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-status').answer.valueCoding.code"
* activity[=].detail.description = "Weitere Diagnostik"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Klinische Studie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#110465008 "Clinical trial (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-status').answer.valueCoding.code"
* activity[=].detail.description = "Klinische Studie"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Genetische Untersuchung ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#405825005 "Molecular genetic test"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-status').answer.valueCoding.code"
* activity[=].detail.description = "Genetische Untersuchung"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Nachsorge ---
* activity[+].detail.kind = #Appointment
* activity[=].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-status').answer.valueCoding.code"
* activity[=].detail.description = "Nachsorge"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Sonstiges ---
* note.text = "Sonstige Anmerkungen"
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='empfehlung-sonstiges').answer.valueString"
