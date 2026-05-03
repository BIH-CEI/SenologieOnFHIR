// Senologie Follow-Up Observation (OncoBox M01-M07, D27)
// Erweitert MII_PR_Onko_Verlauf um senologiespezifische Felder:
// Nachsorge-Art (method), Zweittumor (ja/nein).
// Doppelnutzung: D27 (Gesamtbeurteilung nach definitiver Therapie)
// und M06 (Follow-Up / Nachsorge). Unterscheidung ueber Zeitpunkt.
// Vitalstatus: Patient.deceasedBoolean/deceasedDateTime
// Zweittumor ICD/Datum: eigene Condition-Ressource

Alias: $CS_FU = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

Profile: Senologie_FollowUp
Parent: MII_PR_Onko_Verlauf
Id: senologie-follow-up
Title: "BIH Senologie Follow-Up (Verlaufsmeldung)"
Description: "Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert."

* insert PR_CS_VS_Version
* ^status = #draft

// Subject: Patientin
* subject MS

// Focus: Bezugsdiagnose (beurteilte Condition)
* focus MS
* focus only Reference(Senologie_Diagnose_Maligne)
* focus ^short = "Bezugsdiagnose (beurteilte Condition)"
* focus ^comment = "Referenz auf die beurteilte Condition (Mammakarzinom). Bei bilateralem Karzinom wird die jeweilige Seite referenziert."

// Gesamtbeurteilung (geerbt von MII Verlauf valueCodeableConcept)
* valueCodeableConcept MS
* valueCodeableConcept ^short = "Gesamtbeurteilung Tumorstatus (D27)"
* valueCodeableConcept ^comment = "Gesamtbeurteilung des Tumoransprechens: V=CR, T=PR, K=NC/SD, P=Progression, D=divergent, B=MR, R=CRr, Y=Rezidiv, U=unmoeglich, X=fehlend."

// M01: Meldedatum (effectiveDateTime geerbt von MII Verlauf)
* effectiveDateTime MS
* effectiveDateTime ^short = "Meldedatum / Untersuchungsdatum (M01)"
* effectiveDateTime ^comment = "Datum der Verlaufsuntersuchung oder Meldung. Entspricht OncoBox M01 und oBDS Untersuchungsdatum_Verlauf."

// M02: Melder (performer auf Practitioner oder Organization)
* performer MS
* performer only Reference(Practitioner or Organization)
* performer ^short = "Melder / Meldende Einrichtung (M02)"
* performer ^comment = "Person oder Einrichtung, die die Verlaufsmeldung erstellt. Entspricht OncoBox M02 und oBDS Melder_ID."

// M03: Art der Nachsorge (aktiv/passiv) — Erhebungsmethode
* method MS
* method from VS_Senologie_Nachsorge_Art (required)
* method ^short = "Art der Nachsorge (M03)"
* method ^comment = "Aktive Nachsorge = Patientin persoenlich untersucht. Passive Nachsorge = Information aus Akten/Registern."

// M05-M07: Tumorstatus lokal/LK/FM — geerbt von MII_PR_Onko_Verlauf
// (Gesamtbeurteilung als valueCodeableConcept, Einzelstatus als Komponenten)
* component[Tumor_Verlauf] MS
* component[Tumor_Verlauf] ^short = "Lokaler Tumorstatus (M05)"
* component[Lymphknoten_Verlauf] MS
* component[Lymphknoten_Verlauf] ^short = "Lymphknoten-Tumorstatus (M06)"
* component[Fernmetastasen_Verlauf] MS
* component[Fernmetastasen_Verlauf] ^short = "Fernmetastasen-Tumorstatus (M07)"

// M08: Zweittumor ja/nein/unbekannt
* component contains
    zweittumor 0..1 MS

* component[zweittumor].code.coding = $CS_FU#zweittumor
* component[zweittumor] ^short = "Zweittumor diagnostiziert (M08)"
* component[zweittumor] ^comment = "Wurde bei der Patientin ein zweiter Primaertumor (nicht Rezidiv/Metastase) diagnostiziert? Details (ICD, Datum) werden als eigene Condition dokumentiert."
* component[zweittumor].value[x] only CodeableConcept
* component[zweittumor].valueCodeableConcept from VS_Senologie_Zweittumor (required)
