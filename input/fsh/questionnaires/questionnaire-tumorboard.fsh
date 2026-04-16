// ============================================================
// Questionnaire: Tumorboard Empfehlung
// Quelle: dotbase Codebook Section
//   "Brustzentrum Protokoll der interdisziplinären Tumorkonferenz /
//    Empfehlung der interdisziplinären Tumorkonferenz"
// Ziel: Senologie_Tumorboard_Empfehlung (CarePlan)
// ============================================================

Instance: QuestTumorboard
InstanceOf: Questionnaire
Title: "Fragebogen: Tumorboard Empfehlung"
Description: "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Definition-based Extraction mit dem Senologie_Tumorboard_Empfehlung-Profil (CarePlan) als Ziel."
Usage: #definition

* url = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-tumorboard"
* name = "QuestTumorboard"
* title = "Fragebogen: Tumorboard Empfehlung"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Extraction Context ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "CarePlan"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------

// Datum des Tumorboards
* item[+].linkId = "tumorboard-datum"
* item[=].text = "Datum des Tumorboards"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.period.start"

// Titel
* item[+].linkId = "tumorboard-titel"
* item[=].text = "Titel der Empfehlung"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.title"

// Zusammenfassung / Beschreibung
* item[+].linkId = "tumorboard-beschreibung"
* item[=].text = "Zusammenfassung der Empfehlung"
* item[=].type = #text
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.description"

// ---------- Therapieempfehlungen ----------

// Operative Therapie
* item[+].linkId = "empfehlung-op"
* item[=].text = "Operative Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:operativeTherapy.detail.code.text"

// Strahlentherapie
* item[+].linkId = "empfehlung-strahlentherapie"
* item[=].text = "Strahlentherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:radiotherapy.detail.code.text"

// Endokrine Therapie
* item[+].linkId = "empfehlung-endokrin"
* item[=].text = "Endokrine Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:endocrineTherapy.detail.code.text"

// Chemotherapie
* item[+].linkId = "empfehlung-chemotherapie"
* item[=].text = "Chemotherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:chemotherapy.detail.code.text"

// Zielgerichtete Therapie
* item[+].linkId = "empfehlung-zielgerichtet"
* item[=].text = "Zielgerichtete Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:targetedTherapy.detail.code.text"

// Immuntherapie
* item[+].linkId = "empfehlung-immuntherapie"
* item[=].text = "Immuntherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:immunotherapy.detail.code.text"

// Weitere Diagnostik
* item[+].linkId = "empfehlung-diagnostik"
* item[=].text = "Weitere Diagnostik empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:furtherDiagnostics.detail.code.text"

// Klinische Studie
* item[+].linkId = "empfehlung-studie"
* item[=].text = "Klinische Studie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:clinicalTrial.detail.code.text"

// Genetische Untersuchung
* item[+].linkId = "empfehlung-genetik"
* item[=].text = "Genetische Untersuchung empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:genetics.detail.code.text"

// Nachsorge
* item[+].linkId = "empfehlung-nachsorge"
* item[=].text = "Nachsorge-Empfehlung"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.activity:followUp.detail.code.text"

// Sonstiges
* item[+].linkId = "empfehlung-sonstiges"
* item[=].text = "Sonstige Anmerkungen"
* item[=].type = #text
* item[=].required = false
* item[=].repeats = true
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung#CarePlan.note.text"
