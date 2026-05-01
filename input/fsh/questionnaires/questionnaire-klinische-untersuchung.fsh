// ============================================================
// Questionnaire: Klinische Untersuchung
// Quelle: dotbase Codebook Section "Klinische Untersuchung Charité Brustzentrum"
// Ziel: Senologie_Klinische_Untersuchung (Observation)
// Extraction: SDC Template-based Extraction
//   Template: input/resources/Questionnaire-senologie-klinische-untersuchung-template.json
//   Contained Observation mit templateExtractValue FHIRPath-Ausdrücken
// ============================================================

Instance: senologie-klinische-untersuchung
InstanceOf: Questionnaire
Title: "Fragebogen: Klinische Untersuchung Mamma"
Description: "Fragebogen zur strukturierten Dokumentation der klinischen Brustuntersuchung. Nutzt SDC Template-based Extraction mit dem Senologie_Klinische_Untersuchung-Profil (Observation) als Ziel. Das Extraction-Template liegt unter input/resources/Questionnaire-senologie-klinische-untersuchung-template.json."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung"
* name = "QuestKlinischeUntersuchung"
* title = "Fragebogen: Klinische Untersuchung Mamma"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- Contained Observation (Extraction Template) ----------
* contained = observation-template

// ---------- SDC Extensions ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].valueReference = Reference(observation-template)

// ---------- Items ----------
// Mapping-Übersicht (Item → Observation-Pfad):
//   bezugsdiagnose       → Observation.focus (Condition-Referenz)
//   untersuchung-datum   → Observation.effectiveDateTime
//   seitenlokalisation   → Observation.bodySite
//   palpationsbefund     → Observation.component[palpationsbefund].valueString
//   hautveraenderungen   → Observation.component[hautveraenderungen].valueString
//   mamillenbefund       → Observation.component[mamillenbefund].valueString
//   lymphknotenstatus    → Observation.component[lymphknotenstatus].valueString

// Bezugsdiagnose: SDC Condition-Auswahl (bei bilateralem Karzinom)
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose (Seite)"
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&code=254837009&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "ICD-10"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

// Datum
* item[+].linkId = "untersuchung-datum"
* item[=].text = "Untersuchungsdatum"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"

// Seite
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Untersuchte Seite"
* item[=].type = #choice
* item[=].required = true
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.bodySite"
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Palpationsbefund
* item[+].linkId = "palpationsbefund"
* item[=].text = "Palpationsbefund"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#118242002 "Finding by palpation"
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"

// Hautveränderungen
* item[+].linkId = "hautveraenderungen"
* item[=].text = "Hautveränderungen"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#115951000119105 "Breast symptom of change in skin"
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"

// Mamillenbefund
* item[+].linkId = "mamillenbefund"
* item[=].text = "Mamillenbefund (Retraktion, Sekretion, Ekzem)"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#248819006 "Nipple finding"
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"

// Lymphknotenstatus
* item[+].linkId = "lymphknotenstatus"
* item[=].text = "Klinischer Lymphknotenstatus (axillär)"
* item[=].type = #text
* item[=].required = false
* item[=].code[+] = $SCT#284429001 "Examination of axillary lymph nodes"
* item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"


// ============================================================
// Contained Observation: Template für Template-based Extraction
// ============================================================

Instance: observation-template
InstanceOf: Observation
Usage: #inline

* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung"
* status = #final
* code = $LOINC#32422-8 "Physical findings of Breast"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "'Patient/' + %patient.id"

// focus -> Bezugsdiagnose (Condition) aus SDC Choice Selection
* focus.reference = "placeholder"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

* effectiveDateTime = "2024-01-01"
* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "item.where(linkId='untersuchung-datum').answer.valueDate"

* bodySite.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding.code.extension.valueString = "item.where(linkId='seitenlokalisation').answer.valueCoding.code"
* bodySite.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding.system.extension.valueString = "item.where(linkId='seitenlokalisation').answer.valueCoding.system"
* bodySite.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding.display.extension.valueString = "item.where(linkId='seitenlokalisation').answer.valueCoding.display"

// --- Palpationsbefund ---
* component[+].code = $SCT#118242002 "Finding by palpation"
* component[=].valueString = "Palpationsbefund"
* component[=].valueString.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueString.extension.valueString = "item.where(linkId='palpationsbefund').answer.valueString"

// --- Hautveränderungen ---
* component[+].code = $SCT#115951000119105 "Breast symptom of change in skin"
* component[=].valueString = "Hautveränderungen"
* component[=].valueString.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueString.extension.valueString = "item.where(linkId='hautveraenderungen').answer.valueString"

// --- Mamillenbefund ---
* component[+].code = $SCT#248819006 "Nipple finding"
* component[=].valueString = "Mamillenbefund"
* component[=].valueString.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueString.extension.valueString = "item.where(linkId='mamillenbefund').answer.valueString"

// --- Lymphknotenstatus ---
* component[+].code = $SCT#301782006 "Finding of lymph node of axillary region"
* component[=].valueString = "Lymphknotenstatus"
* component[=].valueString.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueString.extension.valueString = "item.where(linkId='lymphknotenstatus').answer.valueString"
