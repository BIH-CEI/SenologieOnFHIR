// ============================================================
// Questionnaire: Systemische Therapie
// Ziele:
//   - Procedure (Therapie-Rahmen)
//   - MedicationStatement (Medikamentengabe, repeating)
// Extraktion: SDC Template-based Extraction
// ============================================================

// --- Contained template: Procedure (Systemtherapie) ---
Instance: syst-procedure-template
InstanceOf: Procedure
Usage: #inline
* id = "syst-procedure-template"
* status = #completed
* code = $SCT#367336001 "Chemotherapy"
* code.text = "Systemtherapie"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// code.coding ← therapieart (Chemo / Endokrin / Antikoerper / Immun / Targeted)
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='therapieart').answer.valueCoding"

// performedPeriod ← startdatum / enddatum (Placeholder fuer per-1)
* performedPeriod.start = "1900-01-01"
* performedPeriod.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.start.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='startdatum').answer.valueDate"
* performedPeriod.end = "1900-01-01"
* performedPeriod.end.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* performedPeriod.end.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='enddatum').answer.valueDate"

// note.text ← protokoll (Therapie-Protokoll als Freitext)
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='protokoll').answer.valueString"

// statusReason ← therapiestatus (laufend/abgeschlossen/abgebrochen)
* statusReason.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* statusReason.coding.extension.valueString = "%resource.item.where(linkId='systemtherapie').item.where(linkId='therapiestatus').answer.valueCoding"

// --- Contained template: MedicationStatement ---
Instance: syst-medikation-template
InstanceOf: MedicationStatement
Usage: #inline
* id = "syst-medikation-template"
* status = #active
* medicationCodeableConcept.text = "Substanz"
* insert Translation(medicationCodeableConcept.text, en, [[Substance]])
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// reasonReference ← bezugsdiagnose (Condition-Referenz aus dem QR)
* reasonReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonReference.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// medicationCodeableConcept.coding ← substanz (SCT aus VS Medikation)
* medicationCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* medicationCodeableConcept.coding[=].extension.valueString = "%context.item.where(linkId='substanz').answer.valueCoding"

// effectiveDateTime ← gabe-datum
* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%context.item.where(linkId='gabe-datum').answer.valueDate"

// extension[therapyCycle] ← zyklus-nummer (EX_Senologie_TherapyCycle)
* extension[+].url = "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-cycle"
* extension[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueInteger.extension.valueString = "%context.item.where(linkId='zyklus-nummer').answer.valueInteger"

// extension[dayInCycle] ← tag-im-zyklus (EX_Senologie_DayInCycle)
* extension[+].url = "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle"
* extension[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueInteger.extension.valueString = "%context.item.where(linkId='tag-im-zyklus').answer.valueInteger"

// dosage[0].doseAndRate.doseQuantity ← dosis + dosis-einheit
* dosage[+].doseAndRate.doseQuantity.value.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].doseAndRate.doseQuantity.value.extension.valueString = "%context.item.where(linkId='dosis').answer.valueDecimal"
* dosage[=].doseAndRate.doseQuantity.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].doseAndRate.doseQuantity.code.extension.valueString = "%context.item.where(linkId='dosis-einheit').answer.valueCoding.code"
* dosage[=].doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
// dosage.route ← applikationsart (i.v./s.c./oral/i.m.)
* dosage[=].route.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].route.coding.extension.valueString = "%context.item.where(linkId='applikationsart').answer.valueCoding"

// --- Questionnaire ---
Instance: senologie-systemtherapie
InstanceOf: Questionnaire
Title: "Fragebogen: Systemische Therapie"
Description: "Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Template-based Extraction mit contained Templates für Procedure und MedicationStatement."
Usage: #definition
* insert SenoCRMIQuestionnaire

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* name = "QuestSystemtherapie"
* title = "Fragebogen: Systemische Therapie"
* insert Translation(title, en, [[Form: Systemic Therapy]])
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
* contained[+] = syst-procedure-template
* contained[+] = syst-medikation-template

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

// Launch Context: Bestehende Procedure (optional — für Pre-Population aus Fremdtherapie)
// Wenn mitgegeben: befüllt Therapie-Rahmen-Felder aus der bestehenden Procedure.
// Medikamentengabe-Gruppe bleibt leer (keine MedicationStatement-Daten von extern erwartet).
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #procedure
* extension[=].extension[=].valueCoding.display = "Bestehende Systemtherapie-Procedure"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Procedure
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Optional: Extern/bereits dokumentierte Systemtherapie für Prepopulation (z.B. Fremdtherapie bei Erstvorstellung)."

// Launch Context: Tumorboard-CarePlan (optional — Pre-Population aus TB-Beschluss)
// Wenn mitgegeben: befüllt Therapie-Rahmen aus der CarePlan-Aktivität (geplante Therapie).
// Vorteil: Formular öffnen direkt nach TB, Intention/Protokoll/Planung schon vorausgefüllt.
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #carePlan
* extension[=].extension[=].valueCoding.display = "Tumorboard CarePlan"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #CarePlan
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Optional: TB-Beschluss (CarePlan) für Pre-Population bei Therapieanlage (Protokoll, Intention, geplanter Zeitraum)."

// ============================================================
// Bezugsdiagnose
// ============================================================
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose"
* insert Translation(item[=].text, en, [[Reference Diagnosis]])
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

// ============================================================
// Group 1: Therapie-Rahmen → Procedure
// ============================================================
* item[+].linkId = "therapie-rahmen"
* item[=].text = "Therapie-Rahmen"
* insert Translation(item[=].text, en, [[Treatment Framework]])
* item[=].type = #group
* item[=].required = true

// SDC templateExtract → Procedure
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(syst-procedure-template)

// Therapieart
* item[=].item[+].linkId = "therapieart"
* item[=].item[=].text = "Therapieart"
* insert Translation(item[=].item[=].text, en, [[Therapy Type]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%procedure.code.coding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-senologie-form-helper').first()"
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-art"

// Intention
* item[=].item[+].linkId = "intention"
* item[=].item[=].text = "Intention"
* insert Translation(item[=].item[=].text, en, [[Intention]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%procedure.extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention').valueCoding.first()"
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-intention"

// First-Line bei Metastasierung (conditional)
* item[=].item[+].linkId = "first-line"
* item[=].item[=].text = "First-Line-Therapie bei Metastasierung"
* insert Translation(item[=].item[=].text, en, [[First-Line Therapy for Metastatic Disease]])
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "intention"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#363676003
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%procedure.extension.where(url='https://www.senologie.org/fhir/StructureDefinition/ex-senologie-first-line-therapy').valueBoolean"

// Protokoll/Schema
* item[=].item[+].linkId = "protokoll"
* item[=].item[=].text = "Protokoll/Schema (z.B. EC-Pac, TCbHP)"
* insert Translation(item[=].item[=].text, en, [[Protocol/Regimen]])
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%procedure.exists(), %procedure.note.text.first(), %carePlan.activity.detail.code.text.first())"

// Startdatum
* item[=].item[+].linkId = "startdatum"
* item[=].item[=].text = "Startdatum"
* insert Translation(item[=].item[=].text, en, [[Start Date]])
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%procedure.exists(), %procedure.performedPeriod.start.substring(0,10), %carePlan.activity.detail.scheduledPeriod.start.first().substring(0,10))"

// Enddatum
* item[=].item[+].linkId = "enddatum"
* item[=].item[=].text = "Enddatum"
* insert Translation(item[=].item[=].text, en, [[End Date]])
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%procedure.exists(), %procedure.performedPeriod.end.substring(0,10), %carePlan.activity.detail.scheduledPeriod.end.first().substring(0,10))"

// Geplante Zyklen
* item[=].item[+].linkId = "geplante-zyklen"
* item[=].item[=].text = "Geplante Zyklen"
* insert Translation(item[=].item[=].text, en, [[Planned Cycles]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%carePlan.activity.detail.quantity.value"

// Durchgeführte Zyklen
* item[=].item[+].linkId = "durchgefuehrte-zyklen"
* item[=].item[=].text = "Durchgeführte Zyklen"
* insert Translation(item[=].item[=].text, en, [[Completed Cycles]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Therapiestatus
* item[=].item[+].linkId = "therapiestatus"
* item[=].item[=].text = "Therapiestatus"
* insert Translation(item[=].item[=].text, en, [[Treatment Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%procedure.statusReason.coding.first()"
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-status"

// Abbruchgrund (conditional — enableWhen prueft Status-Code "abgebrochen")
* item[=].item[+].linkId = "abbruchgrund"
* item[=].item[=].text = "Abbruchgrund"
* insert Translation(item[=].item[=].text, en, [[Reason for Discontinuation]])
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "therapiestatus"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding.code = #abgebrochen

// ============================================================
// Group 2: Medikamentengabe → MedicationStatement (repeating)
// ============================================================
* item[+].linkId = "medikamentengabe"
* item[=].text = "Medikamentengabe"
* insert Translation(item[=].text, en, [[Medication Administration]])
* item[=].type = #group
* item[=].required = false
* item[=].repeats = true

// SDC templateExtract → MedicationStatement
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(syst-medikation-template)

// Substanz
* item[=].item[+].linkId = "substanz"
* item[=].item[=].text = "Substanz"
* insert Translation(item[=].item[=].text, en, [[Substance]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"

// Dosis
* item[=].item[+].linkId = "dosis"
* item[=].item[=].text = "Dosis"
* insert Translation(item[=].item[=].text, en, [[Dose]])
* item[=].item[=].type = #decimal
* item[=].item[=].required = false

// Dosis-Einheit
* item[=].item[+].linkId = "dosis-einheit"
* item[=].item[=].text = "Dosis-Einheit"
* insert Translation(item[=].item[=].text, en, [[Dose Unit]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-dosis-einheit"

// Zyklus
* item[=].item[+].linkId = "zyklus-nummer"
* item[=].item[=].text = "Zyklus"
* insert Translation(item[=].item[=].text, en, [[Cycle]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Tag im Zyklus
* item[=].item[+].linkId = "tag-im-zyklus"
* item[=].item[=].text = "Tag im Zyklus"
* insert Translation(item[=].item[=].text, en, [[Day in Cycle]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Gabe-Datum
* item[=].item[+].linkId = "gabe-datum"
* item[=].item[=].text = "Gabe-Datum"
* insert Translation(item[=].item[=].text, en, [[Administration Date]])
* item[=].item[=].type = #date
* item[=].item[=].required = false

// Applikationsart
* item[=].item[+].linkId = "applikationsart"
* item[=].item[=].text = "Applikationsart"
* insert Translation(item[=].item[=].text, en, [[Application Method]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-applikationsart"

// ============================================================
// Anmerkungen
// ============================================================
* item[+].linkId = "syst-anmerkungen"
* item[=].text = "Anmerkungen"
* insert Translation(item[=].text, en, [[Remarks]])
* item[=].type = #text
* item[=].required = false
