Instance: Questionnaire-Senologie-Diagnose
InstanceOf: Questionnaire
Title: "Fragebogen: Senologie Diagnose"
Description: "Fragebogen zur Erfassung einer Mamma-Diagnose mit Definition-based Extraction"
Usage: #definition

* url = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-diagnose"
* version = "0.1.0"
* name = "QuestionnaireSenologieDiagnose"
* status = #draft
* subjectType = #Patient

// SDC Extensions for extraction
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension[=].valueCanonical = "http://fhir.bih-charite.de/kds-senologie/StructureMap/extract-diagnose"

// Launch context for population
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// === Diagnose Group ===
* item[+].linkId = "diagnose"
* item[=].text = "Diagnose"
* item[=].type = #group

// Diagnosekode SNOMED
* item[=].item[+].linkId = "diagnose.code"
* item[=].item[=].text = "Diagnose (SNOMED CT)"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "http://fhir.bih-charite.de/kds-senologie/ValueSet/vs-senologie-diagnose-sct"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%resource.code.coding.where(system='http://snomed.info/sct').first()"
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.code.coding:sct"

// ICD-10-GM
* item[=].item[+].linkId = "diagnose.icd10"
* item[=].item[=].text = "ICD-10-GM Code"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.code.coding:icd10-gm"

// Seite/Lateralität
* item[=].item[+].linkId = "diagnose.seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Links"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Rechts"
* item[=].item[=].answerOption[+].valueCoding = $SCT#51440002 "Beidseits"
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.bodySite"

// Datum Erstdiagnose
* item[=].item[+].linkId = "diagnose.datum"
* item[=].item[=].text = "Datum der Erstdiagnose"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.extension:Feststellungsdatum"

// Diagnosesicherung
* item[=].item[+].linkId = "diagnose.sicherung"
* item[=].item[=].text = "Diagnosesicherung"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-primaertumor-diagnosesicherung"
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.verificationStatus.coding"

// Rezidiv?
* item[=].item[+].linkId = "diagnose.rezidiv"
* item[=].item[=].text = "Handelt es sich um ein Rezidiv?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

// Frühere Diagnose (conditional)
* item[=].item[+].linkId = "diagnose.fruehereDiagnose"
* item[=].item[=].text = "Referenz auf frühere Diagnose"
* item[=].item[=].type = #reference
* item[=].item[=].enableWhen[+].question = "diagnose.rezidiv"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.extension:occurredFollowing"

// Stadium/Grad
* item[=].item[+].linkId = "diagnose.stadium"
* item[=].item[=].text = "Stadium"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[+].valueCoding = $SCT#258228008 "Stadium 0"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258215001 "Stadium I"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258219007 "Stadium II"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258224005 "Stadium III"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258228008 "Stadium IV"
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.stage.summary"

// Metastasierung
* item[=].item[+].linkId = "diagnose.metastasen"
* item[=].item[=].text = "Fernmetastasen"
* item[=].item[=].type = #choice
* item[=].item[=].answerOption[+].valueCoding = $SCT#1229901006 "M0"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1229903009 "M1"
* item[=].item[=].definition = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-diagnose#Condition.stage:metastasis.summary"
