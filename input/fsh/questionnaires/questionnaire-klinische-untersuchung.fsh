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

// ---------- SDC Template-based Extraction ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------
// Mapping-Übersicht (Item → Observation-Pfad):
//   untersuchung-datum   → Observation.effectiveDateTime
//   seitenlokalisation   → Observation.bodySite
//   palpationsbefund     → Observation.component[palpationsbefund].valueString
//   hautveraenderungen   → Observation.component[hautveraenderungen].valueString
//   mamillenbefund       → Observation.component[mamillenbefund].valueString
//   lymphknotenstatus    → Observation.component[lymphknotenstatus].valueString

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
