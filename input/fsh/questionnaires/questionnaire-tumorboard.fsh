// ============================================================
// Questionnaire: Tumorboard Empfehlung
// Quelle: dotbase Codebook Section
//   "Brustzentrum Protokoll der interdisziplinären Tumorkonferenz /
//    Empfehlung der interdisziplinären Tumorkonferenz"
// Ziel: Senologie_Tumorboard_Empfehlung (CarePlan)
// Extraction: SDC Template-based Extraction
//   Template: input/resources/Questionnaire-senologie-tumorboard-template.json
//   Contained CarePlan mit templateExtractValue FHIRPath-Ausdrücken
// ============================================================

Instance: senologie-tumorboard
InstanceOf: Questionnaire
Title: "Fragebogen: Tumorboard Empfehlung"
Description: "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Template-based Extraction mit dem Senologie_Tumorboard_Empfehlung-Profil (CarePlan) als Ziel. Das Extraction-Template mit contained CarePlan und templateExtractValue-Annotationen liegt unter input/resources/Questionnaire-senologie-tumorboard-template.json."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
* name = "QuestTumorboard"
* title = "Fragebogen: Tumorboard Empfehlung"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Template-based Extraction ----------
// Die templateExtract-Extension referenziert einen contained CarePlan (#careplan-template).
// FHIRPath-Ausdrücke auf den primitiven Feldern des Templates (via _element-Extensions)
// können in FSH nicht ausgedrückt werden — das vollständige Template liegt als JSON-Datei vor.

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------
// Mapping-Übersicht (Item → CarePlan-Pfad):
//   tumorboard-datum       → CarePlan.period.start
//   tumorboard-titel       → CarePlan.title
//   tumorboard-beschreibung → CarePlan.description
//   empfehlung-op          → CarePlan.activity[operativeTherapy].detail.description
//   empfehlung-strahlentherapie → CarePlan.activity[radiotherapy].detail.description
//   empfehlung-endokrin    → CarePlan.activity[endocrineTherapy].detail.description
//   empfehlung-chemotherapie → CarePlan.activity[chemotherapy].detail.description
//   empfehlung-zielgerichtet → CarePlan.activity[targetedTherapy].detail.description
//   empfehlung-immuntherapie → CarePlan.activity[immunotherapy].detail.description
//   empfehlung-diagnostik  → CarePlan.activity[furtherDiagnostics].detail.description
//   empfehlung-studie      → CarePlan.activity[clinicalTrial].detail.description
//   empfehlung-genetik     → CarePlan.activity[genetics].detail.description
//   empfehlung-nachsorge   → CarePlan.activity[followUp].detail.description
//   empfehlung-sonstiges   → CarePlan.note[0].text

// Datum des Tumorboards
* item[+].linkId = "tumorboard-datum"
* item[=].text = "Datum des Tumorboards"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.period.start"

// Titel
* item[+].linkId = "tumorboard-titel"
* item[=].text = "Titel der Empfehlung"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.title"

// Zusammenfassung / Beschreibung
* item[+].linkId = "tumorboard-beschreibung"
* item[=].text = "Zusammenfassung der Empfehlung"
* item[=].type = #text
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.description"

// ---------- Therapieempfehlungen ----------

// Operative Therapie
* item[+].linkId = "empfehlung-op"
* item[=].text = "Operative Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Strahlentherapie
* item[+].linkId = "empfehlung-strahlentherapie"
* item[=].text = "Strahlentherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Endokrine Therapie
* item[+].linkId = "empfehlung-endokrin"
* item[=].text = "Endokrine Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Chemotherapie
* item[+].linkId = "empfehlung-chemotherapie"
* item[=].text = "Chemotherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Zielgerichtete Therapie
* item[+].linkId = "empfehlung-zielgerichtet"
* item[=].text = "Zielgerichtete Therapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Immuntherapie
* item[+].linkId = "empfehlung-immuntherapie"
* item[=].text = "Immuntherapie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Weitere Diagnostik
* item[+].linkId = "empfehlung-diagnostik"
* item[=].text = "Weitere Diagnostik empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Klinische Studie
* item[+].linkId = "empfehlung-studie"
* item[=].text = "Klinische Studie empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Genetische Untersuchung
* item[+].linkId = "empfehlung-genetik"
* item[=].text = "Genetische Untersuchung empfohlen"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Nachsorge
* item[+].linkId = "empfehlung-nachsorge"
* item[=].text = "Nachsorge-Empfehlung"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.activity.detail.description"

// Sonstiges
* item[+].linkId = "empfehlung-sonstiges"
* item[=].text = "Sonstige Anmerkungen"
* item[=].type = #text
* item[=].required = false
* item[=].repeats = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/CarePlan#CarePlan.note.text"
