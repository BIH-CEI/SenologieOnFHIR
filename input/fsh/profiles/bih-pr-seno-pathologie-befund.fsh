Profile: Senologie_Pathologie_Befund
Parent: DiagnosticReport
Id: senologie-pathologie-befund
Title: "BIH Senologie Pathologie Befund"
Description: "DiagnosticReport für pathologische Befunde aus dotbase Questionnaire 'Pathologie'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossener Pathologie-Bericht"

* category MS
* category ^short = "Pathologie / Histopathologie"
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* code MS
* code.coding ^short = "Art der pathologischen Untersuchung"
* code.coding ^comment = "Aus dotbase: 'Art des Präparats' (z.B. Biopsie, Resektat, etc.)"
* code.text = "Pathologischer Befund"

* subject MS
* subject only Reference(Patient)

// Zeitpunkt der Präparateentnahme
* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Präparateentnahme"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum Präparateentnahme'"

* issued MS
* issued ^short = "Datum der Befunderstellung"

// Befundender Pathologe
* resultsInterpreter ^short = "Befundender Pathologe"

// Pathologisches Institut / Labor
* extension contains EX_Senologie_PathologyLab named pathologyLab 0..1
* extension[pathologyLab] ^short = "Pathologisches Institut"
* extension[pathologyLab] ^comment = "Aus dotbase: 'Pathologisches Institut' (choice)"

// Präparat-Details
* extension contains EX_Senologie_SpecimenType named specimenType 0..1
* extension[specimenType] ^short = "Art des Präparats"
* extension[specimenType] ^comment = "Aus dotbase: 'Art des Präparats'"

* extension contains EX_Senologie_Localization named localization 0..1
* extension[localization] ^short = "Lokalisation des Präparats"
* extension[localization] ^comment = "Aus dotbase: 'Lokalisation' + optional 'Details Sonstige Lokalisation'"

* extension contains EX_Senologie_BodySideOfSpecimen named bodySideOfSpecimen 0..1
* extension[bodySideOfSpecimen] ^short = "Seite des Präparats"
* extension[bodySideOfSpecimen] ^comment = "Aus dotbase: 'Seite' (Links/Rechts/Beidseits)"

* extension contains EX_Senologie_ClockPosition named clockPosition 0..1
* extension[clockPosition] ^short = "Uhrzeitposition des Befunds"
* extension[clockPosition] ^comment = "Aus dotbase: 'Uhrzeit' (12 Uhr Position im Drüsenquadranten)"

* extension contains EX_Senologie_NippleDistance named nippleDistance 0..1
* extension[nippleDistance] ^short = "Abstand zur Mamille in mm"
* extension[nippleDistance] ^comment = "Aus dotbase: 'Mamillenabstand' (integer)"

// Zeitpunkt der Präparateentnahme (intraoperativ vs. präoperativ)
* extension contains EX_Senologie_SpecimenCollectionTiming named specimenCollectionTiming 0..1
* extension[specimenCollectionTiming] ^short = "Zeitpunkt der Präparateentnahme"
* extension[specimenCollectionTiming] ^comment = "Aus dotbase: 'Zeitpunkt Präparatentnahme' (intraop, präop, etc.)"

// Histologischer Befund
* extension contains EX_Senologie_HistologyFindings named histologyFindings 0..1
* extension[histologyFindings] ^short = "Histologie allgemein"
* extension[histologyFindings] ^comment = "Aus dotbase: 'Histologie allgemein' (Diagnosekode)"

* extension contains EX_Senologie_B3LesionDetails named b3LesionDetails 0..1
* extension[b3LesionDetails] ^short = "Details B3 Läsion"
* extension[b3LesionDetails] ^comment = "Aus dotbase: 'Details B3 Läsion' (wenn Diagnose = B3)"

// Detailed findings via Observations
* result MS
* result ^short = "Detaillierte Befund-Komponenten"
* result only Reference(Observation)
* result ^comment = "References zu Observation-Ressourcen für ER, PR, HER2, Ki-67, etc."

// Freitext-Befund
* conclusion ^short = "Gesamtbeurteilung des Pathologen"
* conclusion ^comment = "Aus dotbase: 'Details' (text)"

* presentedForm ^short = "Befund als Document/Text"
