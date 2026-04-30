// ============================================================
// Questionnaire: Strahlentherapie
// Quelle: dotbase Codebook Section "Strahlentherapie ESP-PECS"
// Ziel: Senologie_Strahlentherapie (Procedure)
// Extraktion: SDC Template-based Extraction mit contained
//   Procedure-Template (senologie-strahlentherapie Profil).
//   Items verwenden definition-URLs auf das Senologie-Profil,
//   templateExtract verweist auf das contained Procedure-Skelett.
// ============================================================

// --- Contained template resource ---
Instance: strahlentherapie-template
InstanceOf: Procedure
Usage: #inline

* id = "strahlentherapie-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie"
* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"
* subject.reference = "placeholder"

// --- Questionnaire ---
Instance: senologie-strahlentherapie-quest
InstanceOf: Questionnaire
Title: "Fragebogen: Strahlentherapie"
Description: "Fragebogen zur Dokumentation der Strahlentherapie. Nutzt SDC Template-based Extraction mit dem Senologie_Strahlentherapie-Profil (Procedure) als Ziel."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie"
* name = "QuestStrahlentherapie"
* title = "Fragebogen: Strahlentherapie"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Contained template
* contained[+] = strahlentherapie-template

// SDC templateExtract -> contained Procedure template
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].valueReference = Reference(strahlentherapie-template)

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Items
// ============================================================

// --- Bestrahlungszeitraum ---
* item[+].linkId = "rt-beginn"
* item[=].text = "Beginn der Bestrahlung"
* item[=].type = #date
* item[=].required = true
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.performedPeriod.start"

* item[+].linkId = "rt-ende"
* item[=].text = "Ende der Bestrahlung"
* item[=].type = #date
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.performedPeriod.end"

// --- Bestrahlungsregion ---
* item[+].linkId = "rt-region"
* item[=].text = "Bestrahlungsregion"
* item[=].type = #choice
* item[=].required = true
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.bodySite"
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"
* item[=].answerOption[+].valueCoding = $SCT#91724009 "Lymph node structure of thorax"
* item[=].answerOption[+].valueCoding = $SCT#68171009 "Axillary lymph node structure"
* item[=].answerOption[+].valueCoding = $SCT#88911004 "Supraclavicular lymph node structure"
* item[=].answerOption[+].valueCoding = $SCT#127951006 "Chest wall structure"

// --- OPS-Code ---
* item[+].linkId = "rt-ops"
* item[=].text = "OPS-Code der Bestrahlung"
* item[=].type = #string
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.code.coding.code"

// --- Behandlungsintention ---
* item[+].linkId = "rt-intention"
* item[=].text = "Behandlungsintention"
* item[=].type = #choice
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.extension:Intention.valueCodeableConcept"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#P "palliativ"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#S "sonstiges"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#X "Fehlende Angabe"

// --- Gesamtdosis ---
* item[+].linkId = "rt-gesamtdosis"
* item[=].text = "Gesamtdosis (Gy)"
* item[=].type = #decimal
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.extension:Gesamtdosis.valueQuantity.value"

// --- Einzeldosis ---
* item[+].linkId = "rt-einzeldosis"
* item[=].text = "Einzeldosis pro Fraktion (Gy)"
* item[=].type = #decimal
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.extension:einzeldosis.valueQuantity.value"

// --- Anzahl Sitzungen ---
* item[+].linkId = "rt-sitzungen"
* item[=].text = "Anzahl Bestrahlungssitzungen (Fraktionen)"
* item[=].type = #integer
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.extension:sessionCount.valueQuantity.value"

// --- Boost ---
* item[+].linkId = "rt-boost"
* item[=].text = "Boost-Bestrahlung"
* item[=].type = #choice
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.extension:Boost.valueCodeableConcept"
* item[=].answerOption[+].valueCoding = $SCT#399300004 "Radiation boost"
* item[=].answerOption[+].valueCoding = $SCT#261665006 "Unknown"

// --- Seitenlokalisation ---
* item[+].linkId = "rt-seite"
* item[=].text = "Seitenlokalisation"
* item[=].type = #choice
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.bodySite.extension:Seitenlokalisation.valueCodeableConcept"
* item[=].answerOption[+].valueCoding = $SCT#24028007 "Right"
* item[=].answerOption[+].valueCoding = $SCT#7771000 "Left"
* item[=].answerOption[+].valueCoding = $SCT#51440002 "Right and left"

// --- Bezogene Diagnose ---
* item[+].linkId = "rt-diagnose"
* item[=].text = "Bezogene Diagnose"
* item[=].type = #reference
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.reasonReference"

// --- Anmerkungen ---
* item[+].linkId = "rt-note"
* item[=].text = "Anmerkungen / Besonderheiten"
* item[=].type = #text
* item[=].required = false
* item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie#Procedure.note.text"
