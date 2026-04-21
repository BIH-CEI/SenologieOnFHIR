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
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code MS
* code.coding ^short = "Art der Bildgebung"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    mammography 0..1 and
    ultrasound 0..1 and
    mri 0..1 and
    tomosynthesis 0..1
* code.coding[mammography] ^patternCoding.system = "http://loinc.org"
* code.coding[mammography] ^patternCoding.code = #18781-5
* code.coding[mammography] ^short = "Mammography of bilateral breasts"
* code.coding[ultrasound] ^patternCoding.system = "http://loinc.org"
* code.coding[ultrasound] ^patternCoding.code = #18740-1
* code.coding[ultrasound] ^short = "Ultrasound of bilateral breasts"
* code.coding[mri] ^patternCoding.system = "http://loinc.org"
* code.coding[mri] ^patternCoding.code = #36581-3
* code.coding[mri] ^short = "MRI of breast"
* code.coding[tomosynthesis] ^patternCoding.system = "http://radlex.org"
* code.coding[tomosynthesis] ^patternCoding.code = #RID40755
* code.coding[tomosynthesis] ^short = "Digital breast tomosynthesis"
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
