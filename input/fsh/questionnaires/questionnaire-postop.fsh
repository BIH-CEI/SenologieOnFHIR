// ============================================================
// Questionnaire: Postoperative Dokumentation
// Quellen (dotbase Codebook Sections):
//   - "Operative Therapie Brustzentrum Charité"
//   - "Operative Komplikation(en)"
//   - "Postoperative Anordnungen"
// Ziele:
//   - Senologie_Operation (Procedure)
//   - Senologie_Operative_Komplikation (Observation)
// Extraktion: SDC Template-based Extraction mit contained
//   Procedure- und Observation-Templates. Items verwenden
//   definition-URLs auf die jeweiligen Senologie-Profile.
// ============================================================

// --- Contained template: Procedure (Senologie_Operation) ---
Instance: postop-procedure-template
InstanceOf: Procedure
Usage: #inline

* id = "postop-procedure-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-operation"
* status = #completed

// subject ← QR.subject.reference (Patient via launchContext)
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// reasonReference -> Bezugsdiagnose (Condition) aus SDC Choice Selection
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// code.coding[sct] ← op-kategorie (SCT-Code aus vs-senologie-operation-art)
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-kategorie').answer.valueCoding"

// code.text ← op-code-text (klinische Freitext-Beschreibung)
* code.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.text.extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-code-text').answer.valueString"

// performedDateTime ← op-datum
* performedDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedDateTime.extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-datum').answer.valueDate"

// bodySite.coding[sct] ← op-seite (SCT 24028007 / 7771000 / 51440002)
* bodySite.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-seite').answer.valueCoding"

// bodySite.coding[onko] ← MII Onko R/L/B (Mapping aus op-seite via iif)
* bodySite.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='operation').item.where(linkId='op-seite').answer.valueCoding.code = '24028007', 'R', iif(%resource.item.where(linkId='operation').item.where(linkId='op-seite').answer.valueCoding.code = '7771000', 'L', 'B'))"
* bodySite.coding[=].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation"

// extension[Intention] ← op-intention (MII Onko)
* extension[+].url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention"
* extension[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-intention').answer.valueCoding"

// outcome ← op-r-status (R0/R1/R2/RX als SCT)
* outcome.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* outcome.coding.extension.valueString = "%resource.item.where(linkId='operation').item.where(linkId='op-r-status').answer.valueCoding"

// --- Contained template: OPS-Subprozedur (partOf Hauptprozedur) ---
// Pattern aus MII Onko: SNOMED-Hauptprozedur traegt die klinische Semantik,
// OPS-Subprozeduren haengen via partOf darunter. Mehrere Subprozeduren pro
// OP-Sitzung moeglich (BET + SLNB + Markierung etc.).
// Quelle: typischerweise KIS / Kodierfachkraft, asynchron — Form akzeptiert
// 0..n Subprozeduren, leer-default ist OK.
Instance: postop-ops-subprocedure-template
InstanceOf: Procedure
Usage: #inline

* id = "postop-ops-subprocedure-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-operation"
* status = #completed

// Patient ← QR.subject
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// partOf ← Hauptprozedur (via SDC fullUrl-Pattern; aufgeloest in Extract-Bundle)
* partOf.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* partOf.reference.extension.valueString = "Procedure/postop-procedure-template"

// code.coding = OPS aus dem Subprozedur-Item
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].code.extension.valueString = "%context.item.where(linkId='ops-code').answer.valueString"

// Freitext-Beschreibung optional
* code.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.text.extension.valueString = "%context.item.where(linkId='ops-beschreibung').answer.valueString"

// --- Contained template: Observation (Senologie_Operative_Komplikation) ---
Instance: postop-komplikation-template
InstanceOf: Observation
Usage: #inline

* id = "postop-komplikation-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation"
* status = #final
* code.coding = $SCT#789279006 "Clavien-Dindo classification grade"

// subject ← QR.subject.reference (Patient via launchContext)
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// --- Questionnaire ---
Instance: senologie-postop
InstanceOf: Questionnaire
Title: "Fragebogen: Postoperative Dokumentation"
Description: "Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Template-based Extraction mit zwei contained Templates: Procedure (Senologie_Operation) und Observation (Senologie_Operative_Komplikation)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-postop"
* name = "QuestPostOPDokumentation"
* title = "Fragebogen: Postoperative Dokumentation"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Contained templates
* contained[+] = postop-procedure-template
* contained[+] = postop-ops-subprocedure-template
* contained[+] = postop-komplikation-template

// Launch Context
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
// Bezugsdiagnose: SDC Condition-Auswahl (bei bilateralem Karzinom)
// candidateExpression liefert aktive Mamma-Conditions,
// choiceColumn zeigt ICD-10 + Seite zur Unterscheidung
// ============================================================
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose (Seite)"
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "code.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Diagnose"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

// ============================================================
// Group 1: Operative Therapie (Procedure)
// ============================================================
* item[+].linkId = "operation"
* item[=].text = "Operative Therapie"
* item[=].type = #group
* item[=].required = true

// SDC templateExtract -> contained Procedure template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(postop-procedure-template)

// Art der Operation (Kategorie)
* item[=].item[+].linkId = "op-kategorie"
* item[=].item[=].text = "Art der Operation"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-operation-art"

// Seite (korrigierte SCT-Codes)
* item[=].item[+].linkId = "op-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Tumor-Entität(en) — User picked die operierten BodyStructures aus Bildgebung
// Bei R0-Resektion → BS später via BS-Lifecycle auf active=false setzen (TODO: PUT-Pfad im Template)
* item[=].item[+].linkId = "op-tumor-entitaet"
* item[=].item[=].text = "Operierte Tumor-Entität(en)"
* item[=].item[=].type = #reference
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "BodyStructure?patient={{%patient.id}}&active=true"

// Performed Date
* item[=].item[+].linkId = "op-datum"
* item[=].item[=].text = "OP-Datum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// OP-Beschreibung als Freitext (klinische Notiz)
* item[=].item[+].linkId = "op-code-text"
* item[=].item[=].text = "Beschreibung der OP (Freitext, z.B. \"BET links, Sentinel-LK-Biopsie\")"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// OPS-Subprozeduren (repeating) — eine OP-Sitzung hat oft mehrere OPS-Codes
// (BET 5-870.21 + SLNB 5-401.10 + Markierung 5-996.x). Quelle ist meist
// das KIS / Medizincontrolling, asynchron befuellt. Form akzeptiert 0..n,
// jede Subprozedur wird als eigene Procedure mit partOf=Hauptprozedur extrahiert.
* item[=].item[+].linkId = "ops-subprozeduren"
* item[=].item[=].text = "OPS-Subprozeduren (BfArM-Katalog, optional, vom Kodierer)"
* item[=].item[=].type = #group
* item[=].item[=].repeats = true
* item[=].item[=].required = false

// Per Subprozedur: eigene Procedure via templateExtract → partOf=Hauptprozedur
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].item[=].extension[=].extension[+].url = "template"
* item[=].item[=].extension[=].extension[=].valueReference = Reference(postop-ops-subprocedure-template)

* item[=].item[=].item[+].linkId = "ops-code"
* item[=].item[=].item[=].text = "OPS-Code (z.B. 5-870.21)"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "ops-beschreibung"
* item[=].item[=].item[=].text = "Beschreibung (optional, z.B. \"BET mit Drahtmarkierung\")"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].required = false

// Intention
* item[=].item[+].linkId = "op-intention"
* item[=].item[=].text = "OP-Intention"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-operation-intention"

// Outcome / R-Status (strukturiert mit SCT-Codes)
// R0 → BS-Lifecycle: BodyStructure.active wird auf false gesetzt (Tumor entfernt)
// R1/R2/RX → BS bleibt active=true (Rest verblieben)
* item[=].item[+].linkId = "op-r-status"
* item[=].item[=].text = "Resektionsstatus (R)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"

// Sentinel-LK-Status (separat, Freitext oder strukturiert)
* item[=].item[+].linkId = "op-sentinel-anzahl-befallen"
* item[=].item[=].text = "Sentinel-LK: Anzahl befallen (von Anzahl entnommen)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// --- Postoperative Anordnungen (als Procedure.note) ---
* item[=].item[+].linkId = "followup-drainage"
* item[=].item[=].text = "Drainage"
* item[=].item[=].type = #string
* item[=].item[=].required = false

* item[=].item[+].linkId = "followup-verband"
* item[=].item[=].text = "Verband"
* item[=].item[=].type = #string
* item[=].item[=].required = false

* item[=].item[+].linkId = "followup-antibiotika"
* item[=].item[=].text = "Antibiotikatherapie"
* item[=].item[=].type = #string
* item[=].item[=].required = false

* item[=].item[+].linkId = "followup-mobilisation"
* item[=].item[=].text = "Mobilisation"
* item[=].item[=].type = #string
* item[=].item[=].required = false

* item[=].item[+].linkId = "followup-labor"
* item[=].item[=].text = "Laborkontrolle"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Operative Komplikation (Observation, optional)
// ============================================================
* item[+].linkId = "komplikation"
* item[=].text = "Operative Komplikation"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract -> contained Observation template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(postop-komplikation-template)

// Clavien-Dindo Grad
* item[=].item[+].linkId = "clavien-dindo"
* item[=].item[=].text = "Clavien-Dindo-Grad"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-clavien-dindo"

// Datum der Komplikation
* item[=].item[+].linkId = "komplikation-datum"
* item[=].item[=].text = "Datum der Komplikation"
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Zeitpunkt (method)
* item[=].item[+].linkId = "komplikation-zeitpunkt"
* item[=].item[=].text = "Zeitpunkt"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-komplikation-zeitpunkt"

// Art der Komplikation (Freitext)
* item[=].item[+].linkId = "komplikation-art"
* item[=].item[=].text = "Art der Komplikation (Freitext)"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Konsequenz / Kommentar
* item[=].item[+].linkId = "komplikation-kommentar"
* item[=].item[=].text = "Konsequenz / Kommentar"
* item[=].item[=].type = #text
* item[=].item[=].required = false
