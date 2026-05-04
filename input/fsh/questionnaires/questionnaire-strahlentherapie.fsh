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
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

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
* item[=].item[=].answerOption[+].valueCoding = $SCT#373846009 "Adjuvant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373847000 "Neoadjuvant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliativ"

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

// Seite
* item[=].item[+].linkId = "rt-seite"
* item[=].item[=].text = "Bestrahlte Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Links"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Rechts"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Beidseits"

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
* item[=].item[=].answerOption[+].valueCoding = $SCT#76752008 "Ganze Brust"
* item[=].item[=].answerOption[+].valueCoding = $SCT#78904004 "Brustwand"
* item[=].item[=].answerOption[+].valueCoding = $SCT#68171009 "Axilläre Lymphknoten"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76838003 "Supraklavikuläre Lymphknoten"
* item[=].item[=].answerOption[+].valueCoding = $SCT#245282001 "Parasternale Lymphknoten"

// Applikationsart
* item[=].item[+].linkId = "rt-applikationsart"
* item[=].item[=].text = "Applikationsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#1163834000 "3D-konformale Bestrahlung"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1163833006 "IMRT (intensitätsmoduliert)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#152198000 "Brachytherapie"

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
* item[=].item[=].answerOption[+].valueString = "Abgeschlossen"
* item[=].item[=].answerOption[+].valueString = "Abgebrochen"
* item[=].item[=].answerOption[+].valueString = "Laufend"

* item[=].item[+].linkId = "rt-abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "Abgebrochen"
