// ============================================================
// Questionnaire: Strahlentherapie
// Quelle: dotbase Codebook Section "Strahlentherapie"
// Ziel: Procedure (Strahlentherapie) via Definition-based Extraction
// ============================================================

Instance: senologie-strahlentherapie-quest
InstanceOf: Questionnaire
Title: "Fragebogen: Strahlentherapie"
Description: "Fragebogen zur strukturierten Dokumentation der Strahlentherapie in der Senologie. Nutzt SDC Definition-based Extraction mit Procedure als Ziel."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie"
* name = "QuestStrahlentherapie"
* title = "Fragebogen: Strahlentherapie"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Therapie-Rahmen (Procedure)
// ============================================================
* item[+].linkId = "therapie-rahmen"
* item[=].text = "Therapie-Rahmen"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Procedure"

// Intention
* item[=].item[+].linkId = "rt-intention"
* item[=].item[=].text = "Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#373846009 "Adjuvant - intent"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373847000 "Neoadjuvant intent"
* item[=].item[=].answerOption[+].valueCoding = $SCT#363676003 "Palliative intent"

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

// Bezogene Operation
* item[=].item[+].linkId = "rt-bezogene-op"
* item[=].item[=].text = "Bezogene Operation (Referenz auf vorherige OP)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Bestrahlungsplan
// ============================================================
* item[+].linkId = "bestrahlungsplan"
* item[=].text = "Bestrahlungsplan"
* item[=].type = #group
* item[=].required = false

// Zielvolumen
* item[=].item[+].linkId = "rt-zielvolumen"
* item[=].item[=].text = "Zielvolumen"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].repeats = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#76752008 "Breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#78904004 "Chest wall structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#68171009 "Axillary lymph node structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#16051009 "Structure of apical axillary lymph node"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76838003 "Structure of supraclavicular lymph node"
* item[=].item[=].answerOption[+].valueCoding = $SCT#245282001 "Internal mammary lymph node group"

// Applikationsart
* item[=].item[+].linkId = "rt-applikationsart"
* item[=].item[=].text = "Applikationsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#1163834000 "3D conformal radiation therapy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1163833006 "Intensity modulated radiation therapy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#152198000 "Brachytherapy"

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

// Boost durchgefuehrt
* item[=].item[+].linkId = "rt-boost"
* item[=].item[=].text = "Boost durchgeführt"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Boost-Dosis
* item[=].item[+].linkId = "rt-boost-dosis"
* item[=].item[=].text = "Boost-Dosis (Gy)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-boost"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].extension[=].valueCoding = http://unitsofmeasure.org#Gy "Gy"

// Boost-Fraktionen
* item[=].item[+].linkId = "rt-boost-fraktionen"
* item[=].item[=].text = "Boost-Fraktionen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-boost"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// Boost-Technik
* item[=].item[+].linkId = "rt-boost-technik"
* item[=].item[=].text = "Boost-Technik"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-boost"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].answerOption[+].valueString = "Elektronen"
* item[=].item[=].answerOption[+].valueString = "Photonen"
* item[=].item[=].answerOption[+].valueString = "Brachytherapie"

// ============================================================
// Group 4: Ergebnis
// ============================================================
* item[+].linkId = "ergebnis"
* item[=].text = "Ergebnis"
* item[=].type = #group
* item[=].required = false

// Akute Nebenwirkungen
* item[=].item[+].linkId = "rt-nebenwirkungen"
* item[=].item[=].text = "Akute Nebenwirkungen (Radiodermatitis, Fatigue, etc.)"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// Therapiestatus
* item[=].item[+].linkId = "rt-therapiestatus"
* item[=].item[=].text = "Therapiestatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "Abgeschlossen"
* item[=].item[=].answerOption[+].valueString = "Abgebrochen"
* item[=].item[=].answerOption[+].valueString = "Laufend"

// Abbruchgrund
* item[=].item[+].linkId = "rt-abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "rt-therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "Abgebrochen"
