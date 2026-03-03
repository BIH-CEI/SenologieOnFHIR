Profile: Senologie_Pathologie_Praeparat
Parent: MII_PR_Patho_Specimen
Id: senologie-pathologie-praeparat
Title: "BIH Senologie Pathologisches Präparat"
Description: "Specimen für pathologische Präparate aus dotbase (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details"

* insert PR_CS_VS_Version
* ^status = #draft

// Art des Präparats (Biopsie, Resektat, etc.)
* type MS
* type ^short = "Art des Präparats"
* type ^comment = "Aus dotbase: 'Art des Präparats' (z.B. Biopsie, Resektat)"

// Entnahme-Details
* collection MS

// Lokalisation der Entnahme (mit inherited lateralityQualifier + locationQualifier)
* collection.bodySite MS
* collection.bodySite ^short = "Lokalisation der Entnahme"
* collection.bodySite ^comment = "Lokalisation inkl. Seite und Lagequalifikatoren via MII Patho extensions"

// Entnahme-Methode (trägt Kontext: intraoperativ/präoperativ)
* collection.method MS
* collection.method ^short = "Entnahme-Methode / Timing"
* collection.method ^comment = "Aus dotbase: 'Zeitpunkt Präparatentnahme' (intraop, präop, etc.) als Methoden-Kontext"

// Zeitpunkt der Entnahme
* collection.collected[x] MS
* collection.collected[x] ^short = "Datum der Präparateentnahme"
* collection.collected[x] ^comment = "Aus dotbase: 'Datum Präparateentnahme'"

// Patient
* subject only Reference(Patient)
