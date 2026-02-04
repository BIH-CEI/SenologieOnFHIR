Profile: Senologie_OP_Planung
Parent: ServiceRequest
Id: senologie-op-planung
Title: "BIH Senologie OP Planung"
Description: "ServiceRequest für OP Planung aus dotbase Questionnaire 'OP Planung ärztlich V1.0'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis-Mapping aus dotbase "OP Planung ärztlich V1.0"
* status MS
* status = #draft (exactly)
* status ^short = "Geplant/In Bearbeitung"

* intent MS
* intent = #plan (exactly)

* category MS
* category ^short = "OP Planung"

* code MS
* code.coding ^short = "Art der geplanten Operation"
* code ^comment = "Aus dotbase: 'Operation' - geplante OP Art (weibl. Geschlechtsorgane, Diagnose rechts/links, etc.)"

* subject MS
* subject only Reference(Patient)

// Lateralität aus dotbase "Seite"
* bodySite ^short = "Seite/Lateralität"
* bodySite ^comment = "Aus dotbase: Seite (Links/Rechts/Beidseits)"
* bodySite.coding MS

// OP Dauer aus dotbase
* extension contains EX_Senologie_OperationsDuration named operationsDuration 0..1
* extension[operationsDuration] ^short = "Geplante OP-Dauer"
* extension[operationsDuration] ^comment = "In Minuten aus dotbase 'OP Dauer'"

// Operateur
* performer ^short = "Geplanter Operateur"
* performer ^comment = "Aus dotbase: 'Operateur' als Text"

// Allgemeine Anmerkungen
* reasonCode ^short = "Intention/Grund für OP"
* reasonCode ^comment = "Aus dotbase: 'Intention' (diagnostisch/therapeutisch)"

* note ^short = "Planungsdetails"
* note ^comment = "Aus dotbase: 'Details' Freitext"

// CA-Behandlung / Tumor Conference
* extension contains EX_Senologie_TumorConferenceConsent named tumorConferenceConsent 0..1
* extension[tumorConferenceConsent] ^short = "CA-Behandlung/Tumorkonferenz-Zustimmung"
* extension[tumorConferenceConsent] ^comment = "Aus dotbase: 'CA-Behandlung' Ja/Nein"

// Pre-op Details: Markierungen, Blutabnahme, Antibiotika
* extension contains EX_Senologie_PreOpMarkierung named preOpMarkierung 0..1
* extension[preOpMarkierung] ^short = "Präoperative Markierung geplant"

* extension contains EX_Senologie_PreOpBlutabnahme named preOpBlutabnahme 0..1
* extension[preOpBlutabnahme] ^short = "Präoperative Blutabnahme geplant"

* extension contains EX_Senologie_PreOpAntibiotikatherapie named preOpAntibiotikatherapie 0..1
* extension[preOpAntibiotikatherapie] ^short = "Präoperative Antibiotikatherapie"
* extension[preOpAntibiotikatherapie] ^comment = "Aus dotbase: 'Präoperative Antibiotikatherapie' + optional Sonstiges"

// Lagerung / Positioning
* extension contains EX_Senologie_OperatingTableSetup named operatingTableSetup 0..1
* extension[operatingTableSetup] ^short = "OP-Lagerung/Tischanordnung"
* extension[operatingTableSetup] ^comment = "Aus dotbase: 'Lagerung', 'Fallwagen'"
