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
// Extraction: Senologie_Bildgebung_Befund (DiagnosticReport)
// mit Datum, Modalitaet und Befunder.
// ============================================================
* item[+].linkId = "untersuchung"
* item[=].text = "Untersuchung"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "DiagnosticReport?_profile=https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-befund"

// Untersuchungsdatum → DiagnosticReport.effectiveDateTime
* item[=].item[+].linkId = "untersuchung-datum"
* item[=].item[=].text = "Untersuchungsdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.effective[x]"

// Bildgebungsart → DiagnosticReport.code
* item[=].item[+].linkId = "bildgebungsart"
* item[=].item[=].text = "Bildgebungsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.code"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24606-6 "Mammographie"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24604-1 "Sonographie"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24589-4 "MRT"
* item[=].item[=].answerOption[+].valueString = "Tomosynthese"

// Seite
* item[=].item[+].linkId = "seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#272741003 "Laterality"
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Befundender Arzt
* item[=].item[+].linkId = "befundender-arzt"
* item[=].item[=].text = "Befundender Arzt"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusion"

// ============================================================
// Group 2: Befund (Observation)
// Extraction: Senologie_Bildgebung_Observation mit BI-RADS als
// Hauptwert und ACR, Mikrokalk, LK-Status als Komponenten.
// ============================================================
* item[+].linkId = "befund"
* item[=].text = "Befund"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation?_profile=https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation"

// BI-RADS Kategorie → Observation.valueCodeableConcept
* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].text = "BI-RADS Kategorie"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.value[x]"
* item[=].item[=].code[+] = $SCT#241736003 "Breast imaging-reporting and data system"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397138000 "BI-RADS 0 – unvollständig"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397139008 "BI-RADS 1 – unauffällig"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397140005 "BI-RADS 2 – benigne"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397143007 "BI-RADS 3 – wahrscheinlich benigne"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397144001 "BI-RADS 4 – suspekt"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397145000 "BI-RADS 5 – hochgradig malignitätsverdächtig"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397146004 "BI-RADS 6 – histologisch gesichert"

// ACR Brustdichte → Observation.component
* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].text = "ACR Brustdichte"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#18794-8 "Mammography breast density"
* item[=].item[=].answerOption[+].valueString = "A – fast vollständig fetthaltig"
* item[=].item[=].answerOption[+].valueString = "B – verstreute fibroglanduläre Verdichtungen"
* item[=].item[=].answerOption[+].valueString = "C – heterogen dicht"
* item[=].item[=].answerOption[+].valueString = "D – extrem dicht"

// Herdbefund Beschreibung → Observation.note
* item[=].item[+].linkId = "herdbefund-beschreibung"
* item[=].item[=].text = "Herdbefund Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.note.text"
* item[=].item[=].code[+] = $SCT#300886002 "Mass of breast"

// Mikrokalkifikationen → Observation.component
* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].text = "Mikrokalkifikationen vorhanden"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#373945005 "Microcalcification"

// Mikrokalkifikationen Beschreibung (conditional)
* item[=].item[+].linkId = "mikrokalk-beschreibung"
* item[=].item[=].text = "Mikrokalkifikationen Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "mikrokalk"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// Lymphknoten auffällig → Observation.component
* item[=].item[+].linkId = "lymphknoten-auffaellig"
* item[=].item[=].text = "Lymphknoten auffällig"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#301782006 "Lymph node finding"

// ============================================================
// Group 3: Zusammenfassung
// Kein eigener Extraction Context — Items fuellen den top-level
// DiagnosticReport (conclusion).
// ============================================================
* item[+].linkId = "zusammenfassung"
* item[=].text = "Zusammenfassung"
* item[=].type = #group
* item[=].required = false

// Gesamtbeurteilung → DiagnosticReport.conclusion
* item[=].item[+].linkId = "gesamtbeurteilung"
* item[=].item[=].text = "Gesamtbeurteilung"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// Empfehlung
* item[=].item[+].linkId = "empfehlung"
* item[=].item[=].text = "Empfehlung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
