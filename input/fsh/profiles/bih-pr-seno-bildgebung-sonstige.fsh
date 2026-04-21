Profile: Senologie_Bildgebung_Sonstige
Parent: DiagnosticReport
Id: senologie-bildgebung-sonstige
Title: "BIH Senologie Bildgebung Sonstige"
Description: "DiagnosticReport für nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (z.B. Skelettszintigraphie, CT, PET-CT, Röntgen Thorax, Lebersonographie)."

* insert PR_CS_VS_Version
* ^status = #draft

// Status
* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossener Befundbericht"

// Kategorie Radiologie
* category MS
* category ^short = "Diagnostik / Bildgebung"
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

// Modalität — offen kodiert, keine Einschränkung auf Mamma-Bildgebung
* code MS
* code ^short = "Art der Bildgebung (Modalität)"
* code ^comment = "Kodierung der Bildgebungsmodalität über LOINC oder SNOMED CT. Im Gegensatz zum Mamma-Bildgebungsprofil sind hier keine festen Slices definiert — die konkreten Modalitäten werden durch das Formular gesteuert."
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 0..1 MS and
    snomed 0..1 MS
* code.coding[loinc] ^patternCoding.system = "http://loinc.org"
* code.coding[loinc] ^short = "LOINC-Code der Bildgebungsmodalität"
* code.coding[snomed] ^patternCoding.system = "http://snomed.info/sct"
* code.coding[snomed] ^short = "SNOMED-CT-Code der Bildgebungsmodalität"

// Patientenbezug
* subject MS
* subject 1..1
* subject only Reference(Patient)

// Zeitpunkt der Untersuchung
* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Untersuchung"

// Befunder
* resultsInterpreter MS
* resultsInterpreter ^short = "Befundender Arzt"

// Ergebnis/Befund
* conclusion MS
* conclusion ^short = "Befundtext / Zusammenfassung"

* conclusionCode MS
* conclusionCode ^short = "Kodierte Befundaussage"
* conclusionCode ^comment = "z.B. Metastasenverdacht ja/nein, Befundkategorie"

// Einzelbefunde als Observations (optional)
* result MS
* result ^short = "Detailbefunde als Observations"
* result only Reference(Observation)

// Standort der Untersuchung
* extension contains EX_Senologie_ExaminationLocation named examinationLocation 0..1
* extension[examinationLocation] ^short = "Standort der bildgebenden Untersuchung"
