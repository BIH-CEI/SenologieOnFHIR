<<<<<<< HEAD
// Senologie Follow-Up Observation (OncoBox M01-M10, D27)
// Erweitert MII_PR_Onko_Verlauf um senologiespezifische Felder:
// Nachsorge-Art (aktiv/passiv), Vitalstatus, Zweittumor.
// Doppelnutzung: D27 (Gesamtbeurteilung nach definitiver Therapie)
// und M06 (Follow-Up / Nachsorge). Unterscheidung ueber Zeitpunkt.
=======
// Senologie Follow-Up Observation (OncoBox M01-M10)
// Erweitert MII_PR_Onko_Verlauf um senologiespezifische Felder:
// Nachsorge-Art (aktiv/passiv), Vitalstatus, Zweittumor
>>>>>>> polecat-3/se-yir-revisionsop-sm

Alias: $CS_FU = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

Profile: Senologie_FollowUp
Parent: MII_PR_Onko_Verlauf
Id: senologie-follow-up
Title: "BIH Senologie Follow-Up (Verlaufsmeldung)"
<<<<<<< HEAD
Description: "Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art (M03), Vitalstatus (M04), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor (M08-M10). Erweitert MII_PR_Onko_Verlauf um OncoBox-2.0-spezifische Felder. Wird sowohl fuer Gesamtbeurteilung nach definitiver Therapie (D27) als auch fuer Nachsorge-Follow-Up (M06) verwendet — Unterscheidung ueber effectiveDateTime."
=======
Description: "Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art (M03), Vitalstatus (M04), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor (M08-M10). Erweitert MII_PR_Onko_Verlauf um OncoBox-2.0-spezifische Felder."
>>>>>>> polecat-3/se-yir-revisionsop-sm

* insert PR_CS_VS_Version
* ^status = #draft

<<<<<<< HEAD
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

=======
>>>>>>> polecat-3/se-yir-revisionsop-sm
// M01: Meldedatum (effectiveDateTime geerbt von MII Verlauf)
* effectiveDateTime MS
* effectiveDateTime ^short = "Meldedatum / Untersuchungsdatum (M01)"
* effectiveDateTime ^comment = "Datum der Verlaufsuntersuchung oder Meldung. Entspricht OncoBox M01 und oBDS Untersuchungsdatum_Verlauf."

// M02: Melder (performer auf Practitioner oder Organization)
* performer MS
* performer only Reference(Practitioner or Organization)
* performer ^short = "Melder / Meldende Einrichtung (M02)"
* performer ^comment = "Person oder Einrichtung, die die Verlaufsmeldung erstellt. Entspricht OncoBox M02 und oBDS Melder_ID."

// M05-M07: Tumorstatus lokal/LK/FM — geerbt von MII_PR_Onko_Verlauf
// (Gesamtbeurteilung als valueCodeableConcept, Einzelstatus als Komponenten)
<<<<<<< HEAD
* component[Tumor_Verlauf] MS
* component[Tumor_Verlauf] ^short = "Lokaler Tumorstatus (M05)"
* component[Lymphknoten_Verlauf] MS
* component[Lymphknoten_Verlauf] ^short = "Lymphknoten-Tumorstatus (M06)"
* component[Fernmetastasen_Verlauf] MS
* component[Fernmetastasen_Verlauf] ^short = "Fernmetastasen-Tumorstatus (M07)"
=======
>>>>>>> polecat-3/se-yir-revisionsop-sm

// Senologie-spezifische Zusatzkomponenten M03, M04, M08-M10
* component contains
    nachsorgeArt 0..1 MS and
    vitalstatus 0..1 MS and
    zweittumor 0..1 MS and
    zweittumorIcd 0..1 MS and
    zweittumorDatum 0..1 MS

// M03: Art der Nachsorge (aktiv/passiv)
* component[nachsorgeArt].code = $CS_FU#nachsorge-art
* component[nachsorgeArt] ^short = "Art der Nachsorge (M03)"
* component[nachsorgeArt] ^comment = "Aktive Nachsorge = Patientin persönlich untersucht. Passive Nachsorge = Information aus Akten/Registern."
* component[nachsorgeArt].value[x] only CodeableConcept
* component[nachsorgeArt].valueCodeableConcept from VS_Senologie_Nachsorge_Art (required)

// M04: Vitalstatus
* component[vitalstatus].code = $CS_FU#vitalstatus
* component[vitalstatus] ^short = "Vitalstatus der Patientin (M04)"
* component[vitalstatus] ^comment = "Vitalstatus zum Meldezeitpunkt: lebend, verstorben oder unbekannt."
* component[vitalstatus].value[x] only CodeableConcept
* component[vitalstatus].valueCodeableConcept from VS_Senologie_Vitalstatus (required)

// M08: Zweittumor ja/nein/unbekannt
* component[zweittumor].code = $CS_FU#zweittumor
* component[zweittumor] ^short = "Zweittumor diagnostiziert (M08)"
* component[zweittumor] ^comment = "Wurde bei der Patientin ein zweiter Primärtumor (nicht Rezidiv/Metastase) diagnostiziert?"
* component[zweittumor].value[x] only CodeableConcept
* component[zweittumor].valueCodeableConcept from VS_Senologie_Zweittumor (required)

// M09: Zweittumor ICD-10-GM Diagnose
* component[zweittumorIcd].code = $CS_FU#zweittumor-icd
* component[zweittumorIcd] ^short = "ICD-10-GM Diagnose des Zweittumors (M09)"
* component[zweittumorIcd] ^comment = "ICD-10-GM-Code der Zweittumor-Diagnose, nur wenn Zweittumor = ja."
* component[zweittumorIcd].value[x] only CodeableConcept

// M10: Zweittumor Diagnosedatum
* component[zweittumorDatum].code = $CS_FU#zweittumor-datum
* component[zweittumorDatum] ^short = "Diagnosedatum des Zweittumors (M10)"
* component[zweittumorDatum] ^comment = "Datum der Erstdiagnose des Zweittumors, nur wenn Zweittumor = ja."
* component[zweittumorDatum].value[x] only dateTime
