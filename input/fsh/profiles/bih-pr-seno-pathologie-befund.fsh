Profile: Senologie_Pathologie_Befund
Parent: MII_PR_Patho_Report
Id: senologie-pathologie-befund
Title: "BIH Senologie Pathologie Befund"
Description: "DiagnosticReport für pathologische Befunde aus dotbase Questionnaire 'Pathologie'. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert."

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossener Pathologie-Bericht"

* category MS
* category ^short = "Pathologie / Histopathologie"

* code MS
* code.coding ^short = "Art der pathologischen Untersuchung"
* code.text = "Pathologischer Befund"

* subject MS

// Zeitpunkt der Präparateentnahme
* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Präparateentnahme"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum Präparateentnahme'"

* issued MS
* issued ^short = "Datum der Befunderstellung"

// Pathologisches Institut / Labor (replaces EX_Senologie_PathologyLab)
* performer MS
* performer ^short = "Pathologisches Institut / befundender Pathologe"
* performer ^comment = "Aus dotbase: 'Pathologisches Institut' (choice) — ersetzt ehemalige PathologyLab-Extension"

// Befundender Pathologe
* resultsInterpreter ^short = "Befundender Pathologe"

// Specimen — replaces 6 former extensions (SpecimenType, Localization, BodySide, ClockPosition, NippleDistance, CollectionTiming)
* specimen MS
* specimen ^short = "Pathologisches Präparat"
* specimen ^comment = "Soll Senologie_Pathologie_Praeparat referenzieren — enthält Art, Lokalisation, Seite, Uhrzeitposition, Mamillenabstand und Entnahme-Zeitpunkt"

// Detailed findings via Observations (replaces HistologyFindings + B3LesionDetails extensions)
* result MS
* result ^short = "Detaillierte Befund-Komponenten"
* result only Reference(Observation)
* result ^comment = "References zu Observation-Ressourcen für ER, PR, HER2, Ki-67, Histologie, B3-Läsion, etc."

// Freitext-Befund
* conclusion ^short = "Gesamtbeurteilung des Pathologen"
* conclusion ^comment = "Aus dotbase: 'Details' (text)"

* presentedForm ^short = "Befund als Document/Text"
