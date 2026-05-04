// ============================================================
// Questionnaire: Bildgebung Mamma
// Ziele:
//   - DiagnosticReport (Gesamtbefund pro Modalität)
//   - Observation (BI-RADS, ACR-Dichte, Herdbefund)
//   - BodyStructure (Tumorlokalisation: Seite, Quadrant, Uhrzeitposition)
// Extraktion: SDC Template-based Extraction
// ============================================================

// --- Contained template: DiagnosticReport ---
Instance: bildgebung-report-template
InstanceOf: DiagnosticReport
Usage: #inline
* id = "bildgebung-report-template"
* status = #final
* code = $LOINC#24606-6 "Breast Screening"
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: Observation (BI-RADS / Befund) ---
Instance: bildgebung-befund-template
InstanceOf: Observation
Usage: #inline
* id = "bildgebung-befund-template"
* status = #final
* code = $LOINC#72018-2 "Breast Imaging-Reporting and Data System"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: BodyStructure (Tumorlokalisation) ---
Instance: bildgebung-bodystructure-template
InstanceOf: BodyStructure
Usage: #inline
* id = "bildgebung-bodystructure-template"
* active = true
* patient.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.extension.valueString = "%patient"

// --- Questionnaire ---
Instance: senologie-bildgebung
InstanceOf: Questionnaire
Title: "Fragebogen: Bildgebung Mamma"
Description: "Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung"
* name = "QuestBildgebung"
* title = "Fragebogen: Bildgebung Mamma"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
* contained[+] = bildgebung-report-template
* contained[+] = bildgebung-befund-template
* contained[+] = bildgebung-bodystructure-template

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

// SDC templateExtract → DiagnosticReport
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(bildgebung-report-template)

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
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24606-6 "Mammographie"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24590-2 "Sonographie"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#24589-4 "MRT Mamma"
* item[=].item[=].answerOption[+].valueString = "Tomosynthese"

// Befundender Arzt
* item[=].item[+].linkId = "befundender-arzt"
* item[=].item[=].text = "Befundender Arzt"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Tumorlokalisation (BodyStructure)
// ============================================================
* item[+].linkId = "lokalisation"
* item[=].text = "Tumorlokalisation"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → BodyStructure
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(bildgebung-bodystructure-template)

// Seite
* item[=].item[+].linkId = "lokalisation-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Links"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Rechts"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Beidseits"

// Quadrant
* item[=].item[+].linkId = "lokalisation-quadrant"
* item[=].item[=].text = "Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#76365002 "Oberer äußerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#77831004 "Oberer innerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#33564002 "Unterer äußerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#19100000 "Unterer innerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#24142002 "Mamille"
* item[=].item[=].answerOption[+].valueCoding = $SCT#70925003 "Zentral"

// Uhrzeitposition
* item[=].item[+].linkId = "lokalisation-uhrzeit"
* item[=].item[=].text = "Uhrzeitposition"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "12 Uhr"
* item[=].item[=].answerOption[+].valueString = "1 Uhr"
* item[=].item[=].answerOption[+].valueString = "2 Uhr"
* item[=].item[=].answerOption[+].valueString = "3 Uhr"
* item[=].item[=].answerOption[+].valueString = "4 Uhr"
* item[=].item[=].answerOption[+].valueString = "5 Uhr"
* item[=].item[=].answerOption[+].valueString = "6 Uhr"
* item[=].item[=].answerOption[+].valueString = "7 Uhr"
* item[=].item[=].answerOption[+].valueString = "8 Uhr"
* item[=].item[=].answerOption[+].valueString = "9 Uhr"
* item[=].item[=].answerOption[+].valueString = "10 Uhr"
* item[=].item[=].answerOption[+].valueString = "11 Uhr"

// Abstand von Mamille (mm)
* item[=].item[+].linkId = "lokalisation-mamillenabstand"
* item[=].item[=].text = "Abstand von Mamille (mm)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 3: Befund (Observation)
// ============================================================
* item[+].linkId = "befund"
* item[=].text = "Befund"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(bildgebung-befund-template)

// BI-RADS Kategorie
* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].text = "BI-RADS Kategorie"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#72018-2 "BI-RADS"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397138000 "BI-RADS 0 — Zusätzliche Bildgebung erforderlich"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397140005 "BI-RADS 1 — Unauffällig"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397141009 "BI-RADS 2 — Gutartiger Befund"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397143007 "BI-RADS 3 — Wahrscheinlich gutartig"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397144001 "BI-RADS 4 — Suspekt"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397145000 "BI-RADS 5 — Hochverdächtig auf Malignität"
* item[=].item[=].answerOption[+].valueCoding = $SCT#6111000179101 "BI-RADS 6 — Histologisch gesichert maligne"

// ACR Brustdichte
* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].text = "ACR Brustdichte"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#89180-4 "Breast density"
* item[=].item[=].answerOption[+].valueString = "A — Fast vollständig fetthaltig"
* item[=].item[=].answerOption[+].valueString = "B — Verstreute fibroglanduläre Verdichtungen"
* item[=].item[=].answerOption[+].valueString = "C — Heterogen dicht"
* item[=].item[=].answerOption[+].valueString = "D — Extrem dicht"

// Herdbefund Größe (mm)
* item[=].item[+].linkId = "herdbefund-groesse"
* item[=].item[=].text = "Herdbefund Größe (mm)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Herdbefund Beschreibung
* item[=].item[+].linkId = "herdbefund-beschreibung"
* item[=].item[=].text = "Herdbefund Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// Mikrokalkifikationen
* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].text = "Mikrokalkifikationen"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Mikrokalk Beschreibung (conditional)
* item[=].item[+].linkId = "mikrokalk-beschreibung"
* item[=].item[=].text = "Mikrokalkifikationen Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "mikrokalk"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// Lymphknoten auffällig
* item[=].item[+].linkId = "lymphknoten-auffaellig"
* item[=].item[=].text = "Axilläre Lymphknoten auffällig"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// ============================================================
// Group 4: Zusammenfassung
// Keine Extraction — rein informativ.
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
