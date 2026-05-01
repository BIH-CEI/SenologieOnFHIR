// ============================================================
// Questionnaire: Verlaufsdokumentation / Nachsorge
// Quelle: dotbase Codebook Section "Verlaufsdokumentation / Nachsorge"
// Ziele:
//   - Observation (Klinischer Status)
//   - Senologie_FollowUp / Observation (Tumorstatus, M01-M10)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-verlauf
InstanceOf: Questionnaire
Title: "Fragebogen: Verlaufsdokumentation / Nachsorge"
Description: "Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Definition-based Extraction mit Observation als Ziel fuer klinischen Status und Tumorstatus (Senologie_FollowUp)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf"
* name = "QuestVerlauf"
* title = "Fragebogen: Verlaufsdokumentation / Nachsorge"
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
// Group 1: Kontrolltermin
// Administrativ — kein eigener Extraction Context.
// kontrolltermin-datum liefert effectiveDateTime fuer die
// FollowUp-Observation (Group 3).
// ============================================================
* item[+].linkId = "kontrolltermin"
* item[=].text = "Kontrolltermin"
* item[=].type = #group
* item[=].required = true

// Datum Vorstellung
* item[=].item[+].linkId = "kontrolltermin-datum"
* item[=].item[=].text = "Datum Vorstellung"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Art der Kontrolle
* item[=].item[+].linkId = "kontrolltermin-art"
* item[=].item[=].text = "Art der Kontrolle"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueString = "6-Monats-Kontrolle"
* item[=].item[=].answerOption[+].valueString = "12-Monats-Kontrolle"
* item[=].item[=].answerOption[+].valueString = "Ausserplanmaessig"
* item[=].item[=].answerOption[+].valueString = "Abschlusskontrolle"

// Monate seit Erstdiagnose
* item[=].item[+].linkId = "kontrolltermin-monate-seit-ed"
* item[=].item[=].text = "Monate seit Erstdiagnose"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 2: Klinischer Status (Observation)
// Extraction: Eine Observation pro Verlaufsbesuch mit klinischen
// Befundkomponenten. Items mit code werden als Observation.component
// extrahiert.
// ============================================================
* item[+].linkId = "klinischer-status"
* item[=].text = "Klinischer Status"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// Allgemeinzustand
* item[=].item[+].linkId = "klinisch-allgemeinzustand"
* item[=].item[=].text = "Allgemeinzustand"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#365275006 "Finding of general well-being"
* item[=].item[=].answerOption[+].valueString = "Gut"
* item[=].item[=].answerOption[+].valueString = "Eingeschraenkt"
* item[=].item[=].answerOption[+].valueString = "Schlecht"

// Lokalbefund Brust
* item[=].item[+].linkId = "klinisch-lokalbefund"
* item[=].item[=].text = "Lokalbefund Brust"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#290069002 "Finding of breast"
* item[=].item[=].answerOption[+].valueString = "Unauffaellig"
* item[=].item[=].answerOption[+].valueString = "Auffaellig"

// Lokalbefund Beschreibung (enableWhen Lokalbefund = Auffaellig)
* item[=].item[+].linkId = "klinisch-lokalbefund-beschreibung"
* item[=].item[=].text = "Lokalbefund Beschreibung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.note.text"
* item[=].item[=].enableWhen[+].question = "klinisch-lokalbefund"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "Auffaellig"

// Lymphoedem
* item[=].item[+].linkId = "klinisch-lymphoedem"
* item[=].item[=].text = "Lymphoedem"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#449620005 "Lymphedema"
* item[=].item[=].answerOption[+].valueString = "Kein"
* item[=].item[=].answerOption[+].valueString = "Grad I"
* item[=].item[=].answerOption[+].valueString = "Grad II"
* item[=].item[=].answerOption[+].valueString = "Grad III"

// Armumfangsdifferenz in cm
* item[=].item[+].linkId = "klinisch-armumfangsdifferenz"
* item[=].item[=].text = "Armumfangsdifferenz (cm)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#301712009 "Arm circumference"

// Schmerzen
* item[=].item[+].linkId = "klinisch-schmerzen"
* item[=].item[=].text = "Schmerzen"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#22253000 "Pain"

// =====================================================// ============================================================
* item[+].linkId = "tumorstatus"
* item[=].text = "Tumorstatus"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation?_profile=https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up"

// Gesamtbeurteilung Verlauf → Observation.valueCodeableConcept
* item[=].item[+].linkId = "tumorstatus-gesamtbeurteilung"
* item[=].item[=].text = "Gesamtbeurteilung Verlauf"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.value[x]"
* item[=].item[=].answerOption[+].valueCoding = $SCT#103338009 "Complete remission"
* item[=].item[=].answerOption[+].valueCoding = $SCT#268910001 "Partial remission"
* item[=].item[=].answerOption[+].valueCoding = $SCT#58158008 "Stable disease"
* item[=].item[=].answerOption[+].valueCoding = $SCT#271299001 "Tumor progression"
* item[=].item[=].answerOption[+].valueString = "Kein Anhalt fuer Tumor"

// Lokalrezidiv → Observation.component (Tumorstatus lokal)
* item[=].item[+].linkId = "tumorstatus-lokalrezidiv"
* item[=].item[=].text = "Lokalrezidiv"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#363346000 "Malignant neoplastic disease: local recurrence"

// Datum Rezidiv (enableWhen Lokalrezidiv = true)
* item[=].item[+].linkId = "tumorstatus-rezidiv-datum"
* item[=].item[=].text = "Datum Rezidiv"
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#432213005 "Date of recurrence"
* item[=].item[=].enableWhen[+].question = "tumorstatus-lokalrezidiv"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true

// Fernmetastasen → Observation.component (Tumorstatus FM)
* item[=].item[+].linkId = "tumorstatus-fernmetastasen"
* item[=].item[=].text = "Fernmetastasen"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#399409002 "Distant metastasis present"

// Metastasenlokalisation (enableWhen Fernmetastasen = true, repeats)
* item[=].item[+].linkId = "tumorstatus-metastasen-lokalisation"
* item[=].item[=].text = "Metastasenlokalisation"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].repeats = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#385421009 "Site of distant metastasis"
* item[=].item[=].enableWhen[+].question = "tumorstatus-fernmetastasen"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].answerOption[+].valueString = "Lunge"
* item[=].item[=].answerOption[+].valueString = "Leber"
* item[=].item[=].answerOption[+].valueString = "Knochen"
* item[=].item[=].answerOption[+].valueString = "Hirn"
* item[=].item[=].answerOption[+].valueString = "Sonstige"

// ============================================================
// Group 4: Vitalstatus (MII_PR_Person_Vitalstatus Observation)
// Extraction: Eine MII Vitalstatus-Observation (LOINC 67162-8)
// mit Wert aus mii-cs-person-vitalstatus.
// =====================================================// ============================================================
* item[+].linkId = "weiteres-vorgehen"
* item[=].text = "Weiteres Vorgehen"
* item[=].type = #group
* item[=].required = false

// Naechster Kontrolltermin
* item[=].item[+].linkId = "vorgehen-naechster-termin"
* item[=].item[=].text = "Naechster Kontrolltermin"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Empfehlung
* item[=].item[+].linkId = "vorgehen-empfehlung"
* item[=].item[=].text = "Empfehlung"
* item[=].item[=].type = #text
* item[=].item[=].required = false
