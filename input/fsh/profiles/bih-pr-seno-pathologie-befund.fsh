Profile: Senologie_Pathologie_Befund
Parent: MII_PR_Patho_Report
Id: senologie-pathologie-befund
Title: "BIH Senologie Pathologie Befund"
Description: "DiagnosticReport für pathologische Befunde. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Bezugselement im Logischen Modell: Pathologie"

// Basis-Mapping
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
* effectiveDateTime ^comment = "'Datum Präparateentnahme'"
* effectiveDateTime ^mapping[+].identity = "lm"
* effectiveDateTime ^mapping[=].map = "Pathologie.DatumEntnahme"

* issued MS
* issued ^short = "Datum der Befunderstellung"
* issued ^mapping[+].identity = "lm"
* issued ^mapping[=].map = "Pathologie.Datum"

// Pathologisches Institut / Labor (replaces EX_Senologie_PathologyLab)
* performer MS
* performer ^short = "Pathologisches Institut / befundender Pathologe"
* performer ^comment = "Pathologisches Institut: (choice) — ersetzt ehemalige PathologyLab-Extension"
* performer ^mapping[+].identity = "lm"
* performer ^mapping[=].map = "Pathologie.PathologischesInstitut"

// Befundender Pathologe
* resultsInterpreter ^short = "Befundender Pathologe"

// Specimen — replaces 6 former extensions (SpecimenType, Localization, BodySide, ClockPosition, NippleDistance, CollectionTiming)
* specimen MS
* specimen ^short = "Pathologisches Präparat"
* specimen ^comment = "Soll Senologie_Pathologie_Praeparat referenzieren — enthält Art, Lokalisation, Seite, Uhrzeitposition, Mamillenabstand und Entnahme-Zeitpunkt"
* specimen ^mapping[+].identity = "lm"
* specimen ^mapping[=].map = "Pathologie.Praeparat"

// Detailed findings via Observations (replaces HistologyFindings + B3LesionDetails extensions)
* result MS
* result ^short = "Detaillierte Befund-Komponenten"
* result ^comment = "Erbt MII Patho Grouper-Slices (intraoperative, macroscopic, microscopic) — ER, PR, HER2, Ki-67, Histologie, B3-Läsion als Observations"
* result ^mapping[+].identity = "lm"
* result ^mapping[=].map = "Pathologie.BefundInvasiv | Pathologie.BefundDCIS (je nach Observation-Code)"

// Freitext-Befund
* conclusion ^short = "Gesamtbeurteilung des Pathologen"
* conclusion ^comment = "Details: (text)"
* conclusion ^mapping[+].identity = "lm"
* conclusion ^mapping[=].map = "Pathologie.Befundtext"

* presentedForm ^short = "Befund als Document/Text"
