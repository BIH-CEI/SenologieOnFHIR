// ============================================================
// Questionnaire: Klinische Untersuchung
// Quelle: dotbase Codebook Section "Klinische Untersuchung Charité Brustzentrum"
// Ziel: Senologie_Klinische_Untersuchung (Observation)
// ============================================================

Instance: QuestKlinischeUntersuchung
InstanceOf: Questionnaire
Title: "Fragebogen: Klinische Untersuchung Mamma"
Description: "Fragebogen zur strukturierten Dokumentation der klinischen Brustuntersuchung. Nutzt SDC Definition-based Extraction mit dem Senologie_Klinische_Untersuchung-Profil (Observation) als Ziel."
Usage: #definition

* url = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-klinische-untersuchung"
* name = "QuestKlinischeUntersuchung"
* title = "Fragebogen: Klinische Untersuchung Mamma"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "Observation"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------

// Datum
* item[+].linkId = "untersuchung-datum"
* item[=].text = "Untersuchungsdatum"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.effectiveDateTime"

// Seite
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Untersuchte Seite"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Breast structure"
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.bodySite.coding"

// Palpationsbefund
* item[+].linkId = "palpationsbefund"
* item[=].text = "Palpationsbefund"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#118242002 "Finding by palpation"
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.component:palpationsbefund.valueString"

// Hautveränderungen
* item[+].linkId = "hautveraenderungen"
* item[=].text = "Hautveränderungen"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#115951000119105 "Breast symptom of change in skin"
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.component:hautveraenderungen.valueString"

// Mamillenbefund
* item[+].linkId = "mamillenbefund"
* item[=].text = "Mamillenbefund (Retraktion, Sekretion, Ekzem)"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#248819006 "Nipple finding"
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.component:mamillenbefund.valueString"

// Lymphknotenstatus
* item[+].linkId = "lymphknotenstatus"
* item[=].text = "Klinischer Lymphknotenstatus (axillär)"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#248858001 "Axillary lymph node abnormality"
* item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-klinische-untersuchung#Observation.component:lymphknotenstatus.valueString"
