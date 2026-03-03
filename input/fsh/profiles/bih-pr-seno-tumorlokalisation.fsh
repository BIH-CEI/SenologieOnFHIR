Profile: Senologie_Tumorlokalisation
Parent: MII_PR_Bildgebung_Koerperstruktur
Id: senologie-tumorlokalisation
Title: "BIH Senologie Tumorlokalisation"
Description: "BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand)"

* insert PR_CS_VS_Version
* ^status = #draft

// Lokalisation: Brust
* location MS
* location ^short = "Brust (SNOMED)"
* location ^comment = "SNOMED-Code für Brust als Lokalisation"

// Seitenlokalisation, Quadrant, Uhrzeitposition
* locationQualifier MS
* locationQualifier ^slicing.discriminator.type = #pattern
* locationQualifier ^slicing.discriminator.path = "$this"
* locationQualifier ^slicing.rules = #open
* locationQualifier contains
    seitenlokalisation 0..1 and
    quadrant 0..1 and
    uhrzeitposition 0..1

* locationQualifier[seitenlokalisation] ^short = "Seite (Links/Rechts/Beidseits)"
* locationQualifier[seitenlokalisation] ^comment = "Aus dotbase: 'Seite' (Links/Rechts/Beidseits)"

* locationQualifier[quadrant] ^short = "Quadrant der Brust"
* locationQualifier[quadrant] ^comment = "Quadrant (z.B. oben-aussen, oben-innen, etc.)"

* locationQualifier[uhrzeitposition] ^short = "Uhrzeitposition (12-Uhr-Einteilung)"
* locationQualifier[uhrzeitposition] ^comment = "Uhrzeitposition im Drüsenquadranten (12-Uhr-Position)"

// Freitext mit z.B. Mamillenabstand
* description MS
* description ^short = "Freitext-Beschreibung inkl. Mamillenabstand"
* description ^comment = "Kann Mamillenabstand in mm oder andere beschreibende Details enthalten"

// Patient
* patient MS
* patient only Reference(Patient)
