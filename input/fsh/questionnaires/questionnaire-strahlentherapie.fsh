// ============================================================
// Questionnaire: Strahlentherapie
// Ziel: Procedure (Strahlentherapie) via Template-based Extraction
// ============================================================

// --- Contained template: Procedure (Strahlentherapie) ---
Instance: strahlentherapie-procedure-template
InstanceOf: Procedure
Usage: #inline
* id = "strahlentherapie-procedure-template"
* status = #completed
* code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy"
* code.text = "Strahlentherapie"
* category = $SCT#1287742003 "Radiotherapy"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// performedPeriod (Start + Ende) — Placeholder noetig fuer FHIR-Constraint per-1
* performedPeriod.start = "1900-01-01"
* performedPeriod.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.start.extension.valueString = "%resource.item.where(linkId='strahlentherapie').item.where(linkId='rt-startdatum').answer.valueDate"
* performedPeriod.end = "1900-01-01"
* performedPeriod.end.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.end.extension.valueString = "%resource.item.where(linkId='strahlentherapie').item.where(linkId='rt-enddatum').answer.valueDate"

// bodySite ← rt-seite (SCT)
* bodySite.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].extension.valueString = "%resource.item.where(linkId='strahlentherapie').item.where(linkId='rt-seite').answer.valueCoding"

// extension[Intention] ← rt-intention (MII Onko Strahlentherapie-Intention)
* extension[+].url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention"
* extension[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='strahlentherapie').item.where(linkId='rt-intention').answer.valueCoding"

// status (text-mapped — Code des therapie-status-VS landet als Procedure-Status)
* statusReason.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* statusReason.coding.extension.valueString = "%resource.item.where(linkId='strahlentherapie').item.where(linkId='rt-therapiestatus').answer.valueCoding"

// --- Questionnaire ---
Instance: senologie-strahlentherapie-quest
InstanceOf: Questionnaire
Title: "Fragebogen: Strahlentherapie"
Description: "Fragebogen zur strukturierten Dokumentation der Strahlentherapie. Nutzt SDC Template-based Extraction mit contained Procedure-Template."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie"
* name = "QuestStrahlentherapie"
* title = "Fragebogen: Strahlentherapie"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained template
* contained[+] = strahlentherapie-procedure-template

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
* item[=].extension[=].extension[=].valueReference = Reference(strahlentherapie-procedure-template)

// Intention
* item[=].item[+].linkId = "rt-intention"
* item[=].item[=].text = "Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-intention"

// Startdatum
* item[=].item[+].linkId = "rt-startdatum"
* item[=].item[=].text = "Startdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Enddatum
* item[=].item[+].linkId = "rt-enddatum"
* item[=].item[=].text = "Enddatum"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Seite (korrigierte SCT-Codes)
* item[=].item[+].linkId = "rt-seite"
* item[=].item[=].text = "Bestrahlte Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Tumor-Entität(en) — User picked die bestrahlten BodyStructures
* item[=].item[+].linkId = "rt-tumor-entitaet"
* item[=].item[=].text = "Bestrahlte Tumor-Entität(en)"
* item[=].item[=].type = #reference
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "BodyStructure?patient={{%patient.id}}&active=true"

// Simultane Radiochemotherapie
* item[=].item[+].linkId = "rt-simultane-rct"
* item[=].item[=].text = "Simultane Radiochemotherapie"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// ============================================================
// Group 2: Bestrahlungsplan
// ============================================================
* item[+].linkId = "bestrahlungsplan"
* item[=].text = "Bestrahlungsplan"
* item[=].type = #group
* item[=].required = false

// Zielvolumen (repeats)
* item[=].item[+].linkId = "rt-zielvolumen"
* item[=].item[=].text = "Zielvolumen"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-rt-zielvolumen"

// Applikationsart
* item[=].item[+].linkId = "rt-applikationsart"
* item[=].item[=].text = "Applikationsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-rt-applikationsart"

// Gesamtdosis
* item[=].item[+].linkId = "rt-gesamtdosis"
* item[=].item[=].text = "Gesamtdosis (Gy)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].extension[=].valueCoding = http://unitsofmeasure.org#Gy "Gy"

// Einzeldosis pro Fraktion
* item[=].item[+].linkId = "rt-einzeldosis"
* item[=].item[=].text = "Einzeldosis pro Fraktion (Gy)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].extension[=].valueCoding = http://unitsofmeasure.org#Gy "Gy"

// Anzahl Fraktionen
* item[=].item[+].linkId = "rt-fraktionen"
* item[=].item[=].text = "Anzahl Fraktionen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 3: Boost
// ============================================================
* item[+].linkId = "boost"
* item[=].text = "Boost"
* item[=].type = #group
* item[=].required = false

* item[=].item[+].linkId = "rt-boost"
* item[=].item[=].text = "Boost durchgeführt"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

* item[=].item[+].linkId = "rt-boost-dosis"
* item[=].item[=].text = "Boost-Dosis (Gy)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-boost"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].extension[=].valueCoding = http://unitsofmeasure.org#Gy "Gy"

* item[=].item[+].linkId = "rt-boost-fraktionen"
* item[=].item[=].text = "Boost-Fraktionen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-boost"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// ============================================================
// Group 4: Ergebnis
// ============================================================
* item[+].linkId = "ergebnis"
* item[=].text = "Ergebnis"
* item[=].type = #group
* item[=].required = false

* item[=].item[+].linkId = "rt-nebenwirkungen"
* item[=].item[=].text = "Akute Nebenwirkungen"
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[=].item[+].linkId = "rt-therapiestatus"
* item[=].item[=].text = "Therapiestatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-status"

* item[=].item[+].linkId = "rt-abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "Abgebrochen"
