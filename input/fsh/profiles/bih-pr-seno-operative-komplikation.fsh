Profile: Senologie_Operative_Komplikation
Parent: AdverseEvent
Id: senologie-operative-komplikation
Title: "BIH Senologie Operative Komplikation"
Description: "AdverseEvent für postoperative Komplikationen aus dotbase Questionnaire 'Operative Komplikation(en) V2.0'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* event MS
* event.coding ^short = "Art der Komplikation"
* event.coding ^comment = "Aus dotbase: 'Art der Komplikation' (SNOMED 116224001)"
* event.text ^comment = "Bezeichnung der Komplikation + optional Detail Text bei 'Sonstige Komplikation'"

* date MS
* date ^short = "Datum der Komplikation"
* date ^comment = "Aus dotbase: 'Datum der Komplikation'"

// Referenz zur OP - AdverseEvent.study allows only Reference(ResearchStudy)
// Verknüpfung zur Operation erfolgt über suspectEntity.instance oder referenceDocument
* suspectEntity ^short = "Vermutete Ursache (Operation)"
* suspectEntity ^comment = "Verknüpfung zur Procedure-Ressource über suspectEntity.instance"

// Severity / Clavien-Dindo
* severity MS
* severity ^short = "Schweregrad"
* severity ^comment = "Aus dotbase: 'Clavien-Dindo-Klassifikation' → mapped zu FHIR severity (mild/moderate/severe)"

* extension contains EX_Senologie_ClavienDindoGrade named claviendindoGrade 0..1
* extension[claviendindoGrade] ^short = "Clavien-Dindo-Klassifikation (detailliert)"
* extension[claviendindoGrade] ^comment = "Detaillierte Grade: Grade I, II, IIIa, IIIb, IVa, IVb, V aus dotbase"

// Zeitpunkt (intraoperativ vs. postoperativ)
* extension contains EX_Senologie_ComplicationTiming named complicationTiming 0..1
* extension[complicationTiming] ^short = "Zeitpunkt der Komplikation"
* extension[complicationTiming] ^comment = "Aus dotbase: 'Zeitpunkt der Komplikation' (intraop/postop/stationär/ambulant)"

// Konsequenzen
* outcome ^short = "Konsequenzen der Komplikation"
* outcome ^comment = "Aus dotbase: 'Konsequenz' (multiple-choice: zB. Revision, Reintubation, Transfusion, etc.)"

// Freitext für weitere Details
* resultingCondition ^short = "Resultierende Erkrankung/Zustand"
* resultingCondition ^comment = "Aus dotbase: 'Kommentar' Freitext"
