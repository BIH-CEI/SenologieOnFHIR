// ============================================================
// Questionnaire: Bildgebung Mamma
// Quelle: dotbase Codebook Section "Bildgebung Mamma"
// Ziele:
//   - Senologie_Bildgebung_Befund (DiagnosticReport)
//   - Senologie_Bildgebung_Observation (Observation)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-bildgebung
InstanceOf: Questionnaire
Title: "Fragebogen: Bildgebung Mamma"
Description: "Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Definition-based Extraction mit DiagnosticReport und Observation als Ziele."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung"
* name = "QuestBildgebung"
* title = "Fragebogen: Bildgebung Mamma"
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
// Group 1: Untersuchung (DiagnosticReport)
// ============================================================
* item[+].linkId = "untersuchung"
* item[=].text = "Untersuchung"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "DiagnosticReport"

// Untersuchungsdatum
* item[=].item[+].linkId = "untersuchung-datum"
* item[=].item[=].text = "Untersuchungsdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Bildgebungsart
* item[=].item[+].linkId = "bildgebungsart"
* item[=].item[=].text = "Bildgebungsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24606-6 "MG Breast Screening"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24601-7 "US Breast"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#30794-2 "MR Breast"
* item[=].item[=].answerOption[+].valueString = "Tomosynthese"

// Seite
* item[=].item[+].linkId = "seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Befundender Arzt
* item[=].item[+].linkId = "befundender-arzt"
* item[=].item[=].text = "Befundender Arzt"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Befund (Observation)
// ============================================================
* item[+].linkId = "befund"
* item[=].text = "Befund"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// BI-RADS Kategorie
* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].text = "BI-RADS Kategorie"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#241736003 "Breast imaging-reporting and data system"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397138000 "Mammography assessment (Category 0) - Need additional imaging evaluation"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397140005 "Mammography assessment (Category 1) - Negative"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397141009 "Mammography assessment (Category 2) - Benign finding"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397143007 "Mammography assessment (Category 3) - Probably benign finding, short interval follow-up"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397144001 "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#6111000179101 "Mammography assessment (Category 6) - known biopsy, proven malignancy"

// ACR Brustdichte
* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].text = "ACR Brustdichte"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "A – fast vollständig fetthaltig"
* item[=].item[=].answerOption[+].valueString = "B – verstreute fibroglanduläre Verdichtungen"
* item[=].item[=].answerOption[+].valueString = "C – heterogen dicht"
* item[=].item[=].answerOption[+].valueString = "D – extrem dicht"

// Herdbefund Beschreibung
* item[=].item[+].linkId = "herdbefund-beschreibung"
* item[=].item[=].text = "Herdbefund Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// Mikrokalkifikationen
* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].text = "Mikrokalkifikationen vorhanden"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Mikrokalkifikationen Beschreibung (conditional)
* item[=].item[+].linkId = "mikrokalk-beschreibung"
* item[=].item[=].text = "Mikrokalkifikationen Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "mikrokalk"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// Lymphknoten auffällig
* item[=].item[+].linkId = "lymphknoten-auffaellig"
* item[=].item[=].text = "Lymphknoten auffällig"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// ============================================================
// Group 3: Zusammenfassung
// ============================================================
* item[+].linkId = "zusammenfassung"
* item[=].text = "Zusammenfassung"
* item[=].type = #group
* item[=].required = false

// Gesamtbeurteilung
* item[=].item[+].linkId = "gesamtbeurteilung"
* item[=].item[=].text = "Gesamtbeurteilung"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// Empfehlung
* item[=].item[+].linkId = "empfehlung"
* item[=].item[=].text = "Empfehlung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
