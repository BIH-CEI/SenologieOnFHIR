Profile: Senologie_Operative_Komplikation
Parent: Observation
Id: senologie-operative-komplikation
Title: "BIH Senologie Operative Komplikation"
Description: "Observation für postoperative Komplikationen mit Clavien-Dindo-Klassifikation aus dotbase Questionnaire 'Operative Komplikation(en) V2.0'. Folgt dem MII Prostata Clavien-Dindo Muster (Observation statt AdverseEvent)."

* insert PR_CS_VS_Version
* ^status = #draft

// Status
* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossene Komplikationsbewertung"

// Code: Clavien-Dindo classification
* code MS
* code.coding MS
* code.coding = $SCT#789279006 "Clavien-Dindo classification of surgical complications"
* code.coding ^short = "Clavien-Dindo-Klassifikation"

// Wert: Clavien-Dindo Grade
* valueCodeableConcept MS
* valueCodeableConcept ^short = "Clavien-Dindo Grad"
* valueCodeableConcept ^comment = "Grade I–V (SNOMED 1367519000–1367527009)"

* subject MS
* subject only Reference(Patient)

// Datum der Komplikation
* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Komplikation"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum der Komplikation'"

// Zeitpunkt der Komplikation (replaces EX_Senologie_ComplicationTiming)
* method MS
* method ^short = "Zeitpunkt der Komplikation"
* method ^comment = "Aus dotbase: 'Zeitpunkt der Komplikation' (intraoperativ, postoperativ, stationär, ambulant) — ersetzt ehemalige ComplicationTiming-Extension"

// Bezug zur verursachenden Operation (replaces AdverseEvent.suspectEntity)
* focus MS
* focus only Reference(Procedure)
* focus ^short = "Verursachende Operation"
* focus ^comment = "Reference zur Procedure-Ressource der auslösenden OP"

// Komplikationsart als component
* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains komplikationsart 0..1

* component[komplikationsart].code = $SCT#116224001 "Complication of procedure"
* component[komplikationsart].code ^short = "Art der Komplikation"
* component[komplikationsart].valueCodeableConcept MS
* component[komplikationsart].valueCodeableConcept ^short = "Art der Komplikation"
* component[komplikationsart].valueCodeableConcept ^comment = "Aus dotbase: 'Art der Komplikation' (SNOMED-kodiert)"

// Konsequenzen
* note ^short = "Konsequenzen / Kommentar"
* note ^comment = "Aus dotbase: 'Konsequenz' + 'Kommentar' Freitext"
