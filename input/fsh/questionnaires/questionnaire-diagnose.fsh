// ============================================================
// Questionnaire: Diagnose Mamma
// Quelle: konsentierter Senologie-Datensatz (24 Diagnose-Choices,
// inkl. bz-* Custom-Codes wo SNOMED nicht passt).
// Bewusst schlank: Staging/Grading/TNM-Details kommen aus
// Bildgebung (cTNM klinisch), Pathologie (pTNM, Grading) und
// Verlauf (Restaging).
// ============================================================

Alias: $DIAG_CUSTOM = https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom

// --- Contained template: Condition (klinische Anker-Diagnose) ---
Instance: diagnose-condition-template
InstanceOf: Condition
Usage: #inline
* id = "diagnose-condition-template"

// clinicalStatus: 'recurrence' wenn Diagnose = bc-recurrence, sonst 'active'
// Konvention: status + assertedDate gehören gemeinsam kuratiert
* clinicalStatus.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* clinicalStatus.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.code = 'bc-recurrence', 'recurrence', 'active')"
* clinicalStatus.coding[=].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"

// subject ← QR.subject.reference (Patient-Picker via launchContext)
// Workaround für Aidbox FormBox: Extension auf primitive .reference statt
// auf das Reference-Objekt — sonst dropt FormBox die Reference-Struktur und
// schreibt nur einen String in subject. Primitive _reference.extension hält
// die Reference-Hülle aufrecht.
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// verificationStatus ← diagnose-sicherheit (FHIR ver-status CS)
* verificationStatus.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* verificationStatus.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sicherheit').answer.valueCoding"
* verificationStatus.coding[=].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"

// code.coding ← diagnose-sct (SNOMED + bz-* custom mit korrektem System)
// Wir machen 2 Slices: einen SCT, einen Custom — der NICHT-passende bleibt leer
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.where(system='http://snomed.info/sct')"
* code.coding[=].system = "http://snomed.info/sct"

* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding.where(system='https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom')"
* code.coding[=].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"

// ICD-10-GM Slice — auskommentiert weil FormBox kein FHIRPath translate() unterstützt.
// Stattdessen: Mapping via ConceptMap-Lookup server-seitig (Subscription/Webhook)
// oder bei oBDS-Export (Map konvertiert SCT→ICD-10).
// * code.coding[+].code.extension.url = "...templateExtractValue"
// * code.coding[=].code.extension.valueString = "...translate(...)"
// * code.coding[=].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"

// bodySite ← diagnose-seite — DOPPEL-Coding für MII Onko Slicing-Konformität:
//   Slice snomed-ct                  → SCT-Code (24028007/7771000/51440002)
//   Slice primaertumorSeitenlokalisation → MII Onko R/L/B (Mapping via iif)
* bodySite.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].extension.valueString = "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding"
* bodySite.coding[=].system = $SCT

* bodySite.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding.code = '24028007', 'R', iif(%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding.code = '7771000', 'L', 'B'))"
* bodySite.coding[=].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation"

// Konvention (ePA/IPS-kompatibel + MII-Onko-konform):
//   onsetDateTime   = Erstdiagnose-Datum (immutable, "wann fing die Krankheit an")
//   assertedDate    = klinisches Diagnose-Erfassungs-Datum (kann bei Update aktualisiert werden)
//   status (clinicalStatus) wird gemeinsam mit assertedDate kuratiert
//
// Erste Submission: beide Werte = diagnose-datum.
// Folge-Submissions (Rezidiv/Restaging) gehen über Verlauf-Form als
// separate Observation, NICHT überschreibend.
* onsetDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* onsetDateTime.extension.valueString = "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-datum').answer.valueDate"

// assertedDate (MII-Onko-Extension) ← gleicher Wert für die initiale Erfassung
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
* extension[=].valueDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueDateTime.extension.valueString = "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-datum').answer.valueDate"

// note (Freitext "Details") ← diagnose-details
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-details').answer.valueString"


// --- Questionnaire ---
Instance: senologie-diagnose
InstanceOf: Questionnaire
Title: "Fragebogen: Diagnose Mamma"
Description: "Klinische Anker-Diagnose der Senologie (Mammakarzinom, in-situ, B3-Läsion, benigne Befunde, kosmetische/funktionelle Anomalien). Bewusst schlank: TNM, Grading und detailliertes Staging werden in den Folge-Formularen Bildgebung, Pathologie und Verlauf erhoben."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose"
* name = "QuestDiagnose"
* title = "Fragebogen: Diagnose Mamma"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained template
* contained[+] = diagnose-condition-template

// Launch Context: Patient
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// SDC templateExtract → Condition
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(diagnose-condition-template)

// ============================================================
// Hidden: Patient-Referenz (vorbefüllt aus Launch-Context)
// ============================================================
* item[+].linkId = "patient-ref"
* item[=].text = "Patient"
* item[=].type = #reference
* item[=].required = true
* item[=].readOnly = true
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].extension[=].valueBoolean = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%patient"

// ============================================================
// Group 1: Diagnose
// ============================================================
* item[+].linkId = "diagnose-gruppe"
* item[=].text = "Diagnose Mamma"
* item[=].type = #group
* item[=].required = true

// Diagnose: 24 Choices, sortiert nach klinischer Häufigkeit im Brustzentrum
// (Maligne/Prämaligne zuerst, dann häufige benigne, dann seltene/Spezialfälle)
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].text = "Diagnose"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24"

// Details B3-Läsion (enableWhen Diagnose = B3-Läsion)
* item[=].item[+].linkId = "diagnose-b3-detail"
* item[=].item[=].text = "Details B3-Läsion"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "diagnose-sct"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#269497004
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-b3-subtypen"

// Diagnostische Sicherheit (Werte des konsentierten Datensatzes)
* item[=].item[+].linkId = "diagnose-sicherheit"
* item[=].item[=].text = "Diagnostische Sicherheit"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-sicherheit"

// Details (Freitext)
* item[=].item[+].linkId = "diagnose-details"
* item[=].item[=].text = "Details"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// ============================================================
// Group 2: Lokalisation & Zeitpunkt
// ============================================================
* item[+].linkId = "lokalisation-zeit"
* item[=].text = "Lokalisation & Zeitpunkt"
* item[=].type = #group
* item[=].required = true

// Seite
* item[=].item[+].linkId = "diagnose-seite"
* item[=].item[=].text = "Seitenlokalisation"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Diagnosedatum (bei Erstdiagnose: Datum der Erstdiagnose;
// bei Rezidiv-Diagnose: Datum der Rezidiv-Feststellung)
* item[=].item[+].linkId = "diagnose-datum"
* item[=].item[=].text = "Datum"
* item[=].item[=].type = #date
* item[=].item[=].required = true
