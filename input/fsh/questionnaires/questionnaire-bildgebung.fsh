// ============================================================
// Questionnaire: Bildgebung Mamma
// Ziele:
//   - DiagnosticReport (Gesamtbefund pro Modalität)
//   - Observation (BI-RADS, ACR-Dichte, Herdbefund)
//   - BodyStructure (Tumorlokalisation: Seite, Quadrant, Uhrzeitposition)
// Extraktion: SDC Template-based Extraction
// ============================================================

Alias: $BG_CUSTOM = https://www.senologie.org/fhir/CodeSystem/bildgebung-custom

// --- Contained template: DiagnosticReport ---
Instance: bildgebung-report-template
InstanceOf: DiagnosticReport
Usage: #inline
* id = "bildgebung-report-template"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

// code ← bildgebungsart (Modalität+Seite kombiniert, SCT)
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='untersuchung').item.where(linkId='bildgebungsart').answer.valueCoding"
* code.coding[=].system = $SCT

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// effectiveDateTime ← untersuchung-datum
* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%resource.item.where(linkId='untersuchung').item.where(linkId='untersuchung-datum').answer.valueDate"

// result → Observation (Befund) via stabile fullUrl-Variable
* result[+].reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* result[=].reference.extension.valueString = "%NewBildgebungObsId"

// conclusion ← gesamtbeurteilung
* conclusion.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* conclusion.extension.valueString = "%resource.item.where(linkId='zusammenfassung').item.where(linkId='gesamtbeurteilung').answer.valueString"

// --- Contained template: Observation (BI-RADS + Komponenten) ---
Instance: bildgebung-befund-template
InstanceOf: Observation
Usage: #inline
* id = "bildgebung-befund-template"
* status = #final
* code = $LOINC#72018-2 "Breast Imaging-Reporting and Data System"
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// focus[0] → Condition (via launchContext.diagnosis)
* focus[+].reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus[=].reference.extension.valueString = "%diagnosis.reference"

// focus[1] → BodyStructure (Tumor-Entität, gleicher Fragebogen erzeugt)
* focus[+].reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus[=].reference.extension.valueString = "%NewBildgebungBsId"

* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%resource.item.where(linkId='untersuchung').item.where(linkId='untersuchung-datum').answer.valueDate"

// value[x] = BI-RADS Kategorie
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='birads-kategorie').answer.valueCoding"
* valueCodeableConcept.coding[=].system = $SCT

// component[acr-brustdichte]
* component[+].code = $LOINC#89180-4 "Breast density"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='acr-brustdichte').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[mikrokalk]
* component[+].code = $SCT#27931000119107 "Microcalcification of breast on mammogram"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='mikrokalk').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $BG_CUSTOM

// component[lk-status]
* component[+].code = $SCT#82127004 "Axillary lymph node assessment"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='lk-status').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $BG_CUSTOM

// component[lk-anzahl-suspekt]
* component[+].code = $SCT#444024003 "Number of suspicious lymph nodes"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='lk-anzahl-suspekt').answer.valueInteger"

// component[us-degum]
* component[+].code = $BG_CUSTOM#us-degum-0  // placeholder code-system anchor; tatsächlicher Wert in value
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='us-degum').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $BG_CUSTOM

// component[beurteilbarkeit]
* component[+].code = $SCT#106233006 "Topographical modifier"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='beurteilbarkeit').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $BG_CUSTOM

// component[herdbefund-groesse] in mm
* component[+].code = $LOINC#33728-7 "Size of mass"
* component[=].valueQuantity.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueQuantity.extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='herdbefund-groesse').answer.valueInteger"
* component[=].valueQuantity.unit = "mm"
* component[=].valueQuantity.system = "http://unitsofmeasure.org"
* component[=].valueQuantity.code = #mm

// note ← herdbefund-beschreibung
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='befund').item.where(linkId='herdbefund-beschreibung').answer.valueString"

// --- Contained template: BodyStructure (Tumor-Lokalisation) ---
// Nutzt die offizielle HL7-R5-Backport-Extension
// http://hl7.org/fhir/5.0/StructureDefinition/extension-BodyStructure.includedStructure
// um R5-Felder (laterality, bodyLandmarkOrientation, qualifier) auf R4 zu
// nutzen. Forward-kompatibel zu R5 ohne Datenverlust.
Instance: bildgebung-bodystructure-template
InstanceOf: BodyStructure
Usage: #inline
* id = "bildgebung-bodystructure-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation"
* active = true

// Stabile Tumor-Entitäts-Identifier
* identifier[+].system = "https://www.senologie.org/fhir/sid/tumor-entity"
* identifier[=].value.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* identifier[=].value.extension.valueString = "iif(%NewBildgebungBsId.exists(), %NewBildgebungBsId.substring(9), '')"

* patient.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.reference.extension.valueString = "%resource.subject.reference"

// location = Brust (R4-Pflichtfeld, dient als Index-Anchor)
* location = $SCT#76752008 "Breast structure"

// R5-Backport: includedStructure mit allen Subfeldern
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-BodyStructure.includedStructure"
//   structure = Brust (SCT 76752008)
* extension[=].extension[+].url = "structure"
* extension[=].extension[=].valueCodeableConcept = $SCT#76752008 "Breast structure"

//   laterality ← Rechts/Links/Beidseits
* extension[=].extension[+].url = "laterality"
* extension[=].extension[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].extension[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-seite').answer.valueCoding"
* extension[=].extension[=].valueCodeableConcept.coding[=].system = $SCT

//   qualifier ← Quadrant (Oberer-aussen/Unterer-innen/Mamille/etc.)
* extension[=].extension[+].url = "qualifier"
* extension[=].extension[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].extension[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-quadrant').answer.valueCoding"
* extension[=].extension[=].valueCodeableConcept.coding[=].system = $SCT

//   bodyLandmarkOrientation (verschachtelt)
* extension[=].extension[+].url = "bodyLandmarkOrientation"
//     landmarkDescription = Mamille (SCT 244091003)
* extension[=].extension[=].extension[+].url = "landmarkDescription"
* extension[=].extension[=].extension[=].valueCodeableConcept = $SCT#244091003 "Nipple structure"

//     clockFacePosition ← Uhrzeit als SNOMED-Coding direkt (1-Uhr=260318004 ... 12-Uhr=260326007)
* extension[=].extension[=].extension[+].url = "clockFacePosition"
* extension[=].extension[=].extension[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].extension[=].extension[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-uhrzeit').answer.valueCoding"
* extension[=].extension[=].extension[=].valueCodeableConcept.coding[=].system = $SCT

//     distanceFromLandmark.value ← Mamillenabstand als Quantity in mm
* extension[=].extension[=].extension[+].url = "distanceFromLandmark"
* extension[=].extension[=].extension[=].extension[+].url = "value"
* extension[=].extension[=].extension[=].extension[=].valueQuantity.value.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].extension[=].extension[=].extension[=].valueQuantity.value.extension.valueString = "%resource.item.where(linkId='lokalisation').item.where(linkId='lokalisation-mamillenabstand').answer.valueInteger"
* extension[=].extension[=].extension[=].extension[=].valueQuantity.unit = "mm"
* extension[=].extension[=].extension[=].extension[=].valueQuantity.system = "http://unitsofmeasure.org"
* extension[=].extension[=].extension[=].extension[=].valueQuantity.code = #mm

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

// Cross-template fullUrl-Variablen
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "NewBildgebungReportId"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'urn:uuid:' + uuid()"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "NewBildgebungObsId"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'urn:uuid:' + uuid()"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "NewBildgebungBsId"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'urn:uuid:' + uuid()"

// Launch Context: Patient
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
* item[=].extension[=].extension[+].url = "fullUrl"
* item[=].extension[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].extension[=].valueExpression.expression = "%NewBildgebungReportId"

// Untersuchungsdatum
* item[=].item[+].linkId = "untersuchung-datum"
* item[=].item[=].text = "Untersuchungsdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Bildgebungsart (dotbase-aligned mit kombinierten Modalität+Seite-Codes)
* item[=].item[+].linkId = "bildgebungsart"
* item[=].item[=].text = "Bildgebungsart"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-bildgebung-modalitaet"

// Standort der Untersuchung (intern/extern)
* item[=].item[+].linkId = "untersuchung-standort"
* item[=].item[=].text = "Standort"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-standort"

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
// Per Default neue BS (Erst-Detektion); bei Re-Imaging picked der User
// die bestehende BS via lokalisation-tumor-entitaet (optional, s.u.)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(bildgebung-bodystructure-template)
* item[=].extension[=].extension[+].url = "fullUrl"
* item[=].extension[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].extension[=].valueExpression.expression = "%NewBildgebungBsId"

// Tumor-Entität — optional, für Re-Imaging bekannter Läsionen
// Wenn gepickt: Observation.focus zeigt auf existierende BS (zusätzlich zur
// neuen BS) → Continuity-Link zur ursprünglichen Tumor-Entität.
// Wenn leer: nur die neue BS wird referenziert (= Erst-Detektion).
* item[=].item[+].linkId = "lokalisation-tumor-entitaet-bekannt"
* item[=].item[=].text = "Existierende Tumor-Entität (für Re-Imaging)"
* item[=].item[=].type = #reference
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "BodyStructure?patient={{%patient.id}}&active=true"

// Seite (korrigierte SCT-Codes für Brust-Seitenlokalisation)
* item[=].item[+].linkId = "lokalisation-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Quadrant
* item[=].item[+].linkId = "lokalisation-quadrant"
* item[=].item[=].text = "Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-quadrant-mamma"

// Uhrzeitposition (SNOMED CT 12-Uhr-Schema)
* item[=].item[+].linkId = "lokalisation-uhrzeit"
* item[=].item[=].text = "Uhrzeitposition"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-clockface-position"

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
* item[=].extension[=].extension[+].url = "fullUrl"
* item[=].extension[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].extension[=].valueExpression.expression = "%NewBildgebungObsId"

// BI-RADS Kategorie
* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].text = "BI-RADS Kategorie"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#72018-2 "BI-RADS"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-birads"

// ACR Brustdichte (SCT-codiert; nur bei Mammographie/Tomosynthese sinnvoll)
* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].text = "ACR Brustdichte"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#89180-4 "Breast density"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-acr-brustdichte"

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

// Mikrokalkifikationen (3-Choice statt boolean — Ja suspekt / Ja nicht-suspekt / Nein)
* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].text = "Mikrokalkifikationen"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-mikrokalk-triage"

// Mikrokalk Beschreibung (conditional)
* item[=].item[+].linkId = "mikrokalk-beschreibung"
* item[=].item[=].text = "Mikrokalkifikationen Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "mikrokalk"
* item[=].item[=].enableWhen[=].operator = #!=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/bildgebung-custom#mikrokalk-nein

// LK-Status (axilläre Lymphknoten in der Bildgebung)
* item[=].item[+].linkId = "lk-status"
* item[=].item[=].text = "Axilläre Lymphknoten"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-lk-status-bildgebung"

// Anzahl suspekter LK (bei LK-Status=suspekt)
* item[=].item[+].linkId = "lk-anzahl-suspekt"
* item[=].item[=].text = "Anzahl suspekter Lymphknoten"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "lk-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/bildgebung-custom#lk-suspekt

// US-DEGUM (nur bei Sonographie sinnvoll — enableWhen auf bildgebungsart)
* item[=].item[+].linkId = "us-degum"
* item[=].item[=].text = "US-DEGUM Klassifikation"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-us-degum"

// Beurteilbarkeit (typisch Sonographie)
* item[=].item[+].linkId = "beurteilbarkeit"
* item[=].item[=].text = "Beurteilbarkeit"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-beurteilbarkeit"

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
