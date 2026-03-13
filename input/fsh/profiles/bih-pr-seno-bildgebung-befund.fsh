Profile: Senologie_Bildgebung_Befund
Parent: DiagnosticReport
Id: senologie-bildgebung-befund
Title: "BIH Senologie Bildgebung Befund"
Description: "DiagnosticReport für Befunde bildgebender Verfahren (Mammographie, Sonographie, MRT, Tomosynthese, etc.) aus dotbase Questionnaire 'Bildgebung Mamma V1.0'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
* status = #final (exactly)
* status ^short = "Abschlossener Befundbericht"

* category MS
* category ^short = "Diagnostik / Bildgebung"
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code MS
* code.coding ^short = "Art der Bildgebung"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    mammography 0..1 and
    ultrasound 0..1 and
    mri 0..1 and
    tomosynthesis 0..1
* code.coding[mammography].system = "http://loinc.org" (exactly)
* code.coding[mammography].code = #18781-5 (exactly)
* code.coding[mammography].display = "Mammography of bilateral breasts" (exactly)
* code.coding[ultrasound].system = "http://loinc.org" (exactly)
* code.coding[ultrasound].code = #18740-1 (exactly)
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts" (exactly)
* code.coding[mri].system = "http://loinc.org" (exactly)
* code.coding[mri].code = #36581-3 (exactly)
* code.coding[mri].display = "MRI of breast" (exactly)
* code.coding[tomosynthesis].system = "http://radlex.org" (exactly)
* code.coding[tomosynthesis].code = #RID40755 (exactly)
* code.coding[tomosynthesis].display = "Digital breast tomosynthesis" (exactly)
* code ^comment = "Aus dotbase: 'Modalität' (Mammographie, Sonographie, MRT, Tomosynthese) mit LOINC/RADLEX Codes"

* subject MS
* subject only Reference(Patient)

// Zeitpunkt der Untersuchung
* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Untersuchung"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum' pro Modalität"

// Durchgeführt von/Befunder
* resultsInterpreter ^short = "Befundender Arzt"

// Referenz zur ImagingStudy (falls vorhanden)
* basedOn ^short = "Veranlasste ImagingStudy"

// Einzel-Befunde pro Seite als Observations
* result ^short = "Einzel-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status)"
* result only Reference(Observation)
* result ^comment = "References zu einzelnen Observation-Ressourcen für Herdbefund, Mikrokalk, LK-Status, BI-RADS, ACR pro Seite"

// Gesamtfeststellung/Zusammenfassung
* conclusion ^short = "Gesamtzusammenfassung des Befundes"
* conclusion ^comment = "Aus dotbase: 'Details (ausführlich)' Freitext"

* presentedForm ^short = "Befund als Document/Text"

// Standort der Untersuchung
* extension contains EX_Senologie_ExaminationLocation named examinationLocation 0..1
* extension[examinationLocation] ^short = "Standort der bildgebenden Untersuchung"
