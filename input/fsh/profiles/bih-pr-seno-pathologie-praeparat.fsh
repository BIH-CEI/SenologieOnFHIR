Profile: Senologie_Pathologie_Praeparat
Parent: MII_PR_Patho_Specimen
Id: senologie-pathologie-praeparat
Title: "BIH Senologie Pathologisches Präparat"
Description: "Specimen für pathologische Präparate aus dotbase (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details"

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Pathologie.Praeparat"
* ^mapping[=].name = "LM-Element: Pathologie.Praeparat"

// Art des Präparats (Biopsie, Resektat, etc.)
* type MS
* type ^short = "Art des Präparats"
* type ^comment = "Aus dotbase: 'Art des Präparats' (z.B. Biopsie, Resektat)"
* type ^mapping[+].identity = "lm"
* type ^mapping[=].map = "Pathologie.Praeparat.Art"

// Entnahme-Details
* collection MS

// Lokalisation der Entnahme (mit inherited lateralityQualifier + locationQualifier)
* collection.bodySite MS
* collection.bodySite ^short = "Lokalisation der Entnahme"
* collection.bodySite ^comment = "Lokalisation inkl. Seite und Lagequalifikatoren via MII Patho extensions"
* collection.bodySite ^mapping[+].identity = "lm"
* collection.bodySite ^mapping[=].map = "Pathologie.Praeparat.Lokalisation | Pathologie.Praeparat.Seite"

// Entnahme-Methode (trägt Kontext: intraoperativ/präoperativ)
* collection.method MS
* collection.method ^short = "Entnahme-Methode / Timing"
* collection.method ^comment = "Aus dotbase: 'Zeitpunkt Präparatentnahme' (intraop, präop, etc.) als Methoden-Kontext"
* collection.method ^mapping[+].identity = "lm"
* collection.method ^mapping[=].map = "Pathologie.Praeparat.Entnahmemethode"

// Zeitpunkt der Entnahme
* collection.collected[x] MS
* collection.collected[x] ^short = "Datum der Präparateentnahme"
* collection.collected[x] ^comment = "Aus dotbase: 'Datum Präparateentnahme'"
* collection.collected[x] ^mapping[+].identity = "lm"
* collection.collected[x] ^mapping[=].map = "Pathologie.DatumEntnahme | Pathologie.ZeitpunktEntnahme"

// Patient
* subject only Reference(Patient)
