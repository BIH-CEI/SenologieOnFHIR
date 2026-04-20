Profile: Senologie_Bildgebung_Observation
Parent: Observation
Id: senologie-bildgebung-observation
Title: "BIH Senologie Bildgebung Observation"
Description: "Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) aus dotbase Questionnaire 'Bildgebung Mamma V1.0'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis
* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossene Beobachtung"

* code MS
* code.coding ^short = "Art des Befund-Elements"
* code.coding ^comment = "SNOMED CT codes für BI-RADS, ACR-Density, Herdbefund, Mikrokalk, Lymphknoten-Status, etc."

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Zeitpunkt der Beobachtung"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum' der Bildgebung"

* performer ^short = "Befundender Arzt"

// Bestrahlungsregion/Seite (Links/Rechts/Beidseits)
* bodySite MS
* bodySite ^short = "Seite/Region"
* bodySite ^comment = "Aus dotbase: Lateralität des Befunds (Links, Rechts, Beidseits)"

// Wert des Befunds - je nach Art unterschiedlich
* value[x] MS
* value[x] only CodeableConcept or Quantity or string
* value[x] ^short = "Befund-Wert"
* value[x] ^comment = "z.B. BI-RADS 3-5, ACR A-D, Herdbefund-Code, etc."

// Verknüpfung: DiagnosticReport referenziert diese Observation über DiagnosticReport.result
* partOf ^short = "Übergeordnete Untersuchung (falls relevant)"
* partOf ^comment = "Die Verknüpfung zum DiagnosticReport erfolgt über DiagnosticReport.result, nicht über partOf."

// Detaillierte Beschreibung
* note ^short = "Freitext-Kommentare zum Befund"
* note ^comment = "Aus dotbase: 'Details' Freitext pro Seite"

// Slicing für verschiedene Befund-Typ-Codes auf code.coding
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slicing nach Art des Bildgebungs-Befunds"

* code.coding contains
    biRadsLoinc 0..1 and
    biRadsSnomed 0..1 and
    acrDensityLoinc 0..1 and
    acrDensityRadlex 0..1 and
    herdbefundSnomed 0..1 and
    herdbefundRadlex 0..1 and
    mikrokalkSnomed 0..1 and
    mikrokalkRadlex 0..1 and
    lymphknotenSnomed 0..1 and
    lymphknotenRadlex 0..1

// BI-RADS Klassifikation (Breast Imaging-Reporting and Data System)
* code.coding[biRadsLoinc] ^short = "BI-RADS Kategorie (LOINC)"
* code.coding[biRadsLoinc] = http://loinc.org#72018-2

* code.coding[biRadsSnomed] ^short = "BI-RADS Kategorie (SNOMED)"
* code.coding[biRadsSnomed] = http://snomed.info/sct#241736003

* obeys biRads-value

// ACR Breast Density
* code.coding[acrDensityLoinc] ^short = "ACR Brustdichte (LOINC)"
* code.coding[acrDensityLoinc] = http://loinc.org#18794-8

* code.coding[acrDensityRadlex] ^short = "ACR Brustdichte (RadLex)"
* code.coding[acrDensityRadlex] = http://radlex.org#RID28536

// Herdbefund (Mass, Läsion, Tumor)
* code.coding[herdbefundSnomed] ^short = "Herdbefund/Läsion (SNOMED)"
* code.coding[herdbefundSnomed] = http://snomed.info/sct#300886002

* code.coding[herdbefundRadlex] ^short = "Herdbefund/Läsion (RadLex)"
* code.coding[herdbefundRadlex] = http://radlex.org#RID3933

// Mikrokalk
* code.coding[mikrokalkSnomed] ^short = "Mikrokalkifikation (SNOMED)"
* code.coding[mikrokalkSnomed] = http://snomed.info/sct#373945005

* code.coding[mikrokalkRadlex] ^short = "Mikrokalkifikation (RadLex)"
* code.coding[mikrokalkRadlex] = http://radlex.org#RID4002

// Lymphknoten Status
* code.coding[lymphknotenSnomed] ^short = "Lymphknoten-Status (SNOMED)"
* code.coding[lymphknotenSnomed] = http://snomed.info/sct#248858001

* code.coding[lymphknotenRadlex] ^short = "Lymphknoten-Status (RadLex)"
* code.coding[lymphknotenRadlex] = http://radlex.org#RID58844

// Invariante für BI-RADS Werte
Invariant: biRads-value
Description: "BI-RADS value muss aus BI-RADS ValueSet sein (0-6)"
Expression: "value.ofType(CodeableConcept).exists() implies value.ofType(CodeableConcept).coding.exists()"
Severity: #warning
