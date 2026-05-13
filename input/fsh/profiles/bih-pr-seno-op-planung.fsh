Profile: Senologie_OP_Planung
Parent: ServiceRequest
Id: senologie-op-planung
Title: "BIH Senologie OP Planung"
Description: "ServiceRequest für OP Planung"

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Bezugselement im Logischen Modell: Operationsplanung"

// Basis-Mapping
// Status-Lebenszyklus:
//   draft     — während Plan-Bearbeitung (vor Form-Submission)
//   active    — Plan beschlossen, OP wartet auf Durchführung (Default nach Submission)
//   revoked   — Plan vor Durchführung abgebrochen
//   completed — der Plan selbst ist abgearbeitet (parallele Procedure existiert)
* status MS
* status ^short = "Status der Planung (draft | active | revoked | completed)"

* intent MS
* intent = #plan (exactly)

* category MS
* category ^short = "OP Planung"

* code MS
* code.coding ^short = "Art der geplanten Operation"
* code ^comment = "Operation: - geplante OP Art (weibl. Geschlechtsorgane, Diagnose rechts/links, etc.)"

* subject MS
* subject only Reference(Patient)

// Lateralität aus dotbase "Seite"
* bodySite ^short = "Seite/Lateralität"
* bodySite ^comment = "Seite (Links/Rechts/Beidseits)"
* bodySite.coding MS

// OP Dauer aus dotbase
* extension contains EX_Senologie_OperationsDuration named operationsDuration 0..1
* extension[operationsDuration] ^short = "Geplante OP-Dauer"
* extension[operationsDuration] ^comment = "In Minuten 'OP Dauer'"

// Operateur
* performer ^short = "Geplanter Operateur"
* performer ^comment = "Operateur: als Text"

// Allgemeine Anmerkungen
* reasonCode ^short = "Intention/Grund für OP"
* reasonCode ^comment = "Intention: (diagnostisch/therapeutisch)"

* note ^short = "Planungsdetails"
* note ^comment = "Details: Freitext"

// CA-Behandlung / Tumor Conference
* extension contains EX_Senologie_TumorConferenceConsent named tumorConferenceConsent 0..1
* extension[tumorConferenceConsent] ^short = "CA-Behandlung/Tumorkonferenz-Zustimmung"
* extension[tumorConferenceConsent] ^comment = "CA-Behandlung: Ja/Nein"

// Pre-op Details: Markierungen, Blutabnahme, Antibiotika
* extension contains EX_Senologie_PreOpMarkierung named preOpMarkierung 0..1
* extension[preOpMarkierung] ^short = "Präoperative Markierung geplant"

* extension contains EX_Senologie_PreOpBlutabnahme named preOpBlutabnahme 0..1
* extension[preOpBlutabnahme] ^short = "Präoperative Blutabnahme geplant"

* extension contains EX_Senologie_PreOpAntibiotikatherapie named preOpAntibiotikatherapie 0..1
* extension[preOpAntibiotikatherapie] ^short = "Präoperative Antibiotikatherapie"
* extension[preOpAntibiotikatherapie] ^comment = "Präoperative Antibiotikatherapie: + optional Sonstiges"

// Lagerung / Positioning
* extension contains EX_Senologie_OperatingTableSetup named operatingTableSetup 0..1
* extension[operatingTableSetup] ^short = "OP-Lagerung/Tischanordnung"
* extension[operatingTableSetup] ^comment = "'Lagerung', 'Fallwagen'"
