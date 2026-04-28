Profile: Senologie_Studienteilnahme
Parent: ResearchSubject
Id: senologie-studienteilnahme
Title: "BIH Senologie Studienteilnahme"
Description: "ResearchSubject für klinische Studienteilnahme in der Senologie aus dotbase Questionnaire 'Studien'. Bildet Studienname, Screeningstatus, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab."

* insert PR_CS_VS_Version
* ^status = #draft

// --- Teilnahmestatus → ResearchSubject.status ---
* status MS
* status ^short = "Teilnahmestatus"
* status ^comment = "Aus dotbase: Teilnahmestatus der Patientin. Mapping auf ResearchSubject.status (candidate | screening | eligible | on-study | on-study-intervention | on-study-observation | withdrawn | follow-up | off-study | not-registered)"

// --- Studie (ResearchStudy-Referenz) ---
* study MS
* study only Reference(ResearchStudy)
* study ^short = "Referenz auf die klinische Studie"
* study ^comment = "Enthält den Studiennamen als display oder Referenz auf eine ResearchStudy-Ressource"

// --- Patientin ---
* individual MS
* individual only Reference(Patient)
* individual ^short = "Patientin"

// --- Teilnahmezeitraum ---
* period MS
* period ^short = "Teilnahmezeitraum"

// --- Studienarm → assignedArm ---
* assignedArm MS
* assignedArm ^short = "Studienarm"
* assignedArm ^comment = "Aus dotbase: Studienarm der Patientin"

// --- Einwilligung ---
* consent MS
* consent only Reference(Consent)
* consent ^short = "Einwilligung / Aufklärung"

// --- Senologie-spezifische Extensions ---

// Screeningstatus
* extension contains EX_Senologie_Screeningstatus named Screeningstatus 0..1
* extension[Screeningstatus] ^short = "Screeningstatus"
* extension[Screeningstatus] ^comment = "Aus dotbase: Screeningstatus der Studienteilnahme"

// Kontaktperson für die Studie
* extension contains EX_Senologie_Studienkontakt named Kontakt 0..1
* extension[Kontakt] ^short = "Kontaktperson für die Studie"
* extension[Kontakt] ^comment = "Aus dotbase: Kontakt"

// Aufklärungsdatum
* extension contains EX_Senologie_Aufklaerungsdatum named Aufklaerungsdatum 0..1
* extension[Aufklaerungsdatum] ^short = "Aufklärungsdatum"
* extension[Aufklaerungsdatum] ^comment = "Datum der Aufklärung der Patientin über die Studie"


// ============================================================
// Extensions for Studienteilnahme
// ============================================================

Extension: EX_Senologie_Screeningstatus
Id: ex-senologie-screeningstatus
Title: "Screeningstatus"
Description: "Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject"
* value[x] only CodeableConcept
* value[x] from VS_Senologie_Screeningstatus (example)

Extension: EX_Senologie_Studienkontakt
Id: ex-senologie-studienkontakt
Title: "Kontaktperson Studie"
Description: "Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject"
* value[x] only string

Extension: EX_Senologie_Aufklaerungsdatum
Id: ex-senologie-aufklaerungsdatum
Title: "Aufklärungsdatum"
Description: "Datum der Aufklärung der Patientin über die Studie"
* value[x] only date


// ============================================================
// ValueSet for Screeningstatus
// ============================================================

ValueSet: VS_Senologie_Screeningstatus
Id: vs-senologie-screeningstatus
Title: "VS Senologie Screeningstatus"
Description: "Screeningstatus einer klinischen Studienteilnahme"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#385432009 "Not applicable (qualifier value)"
* $SCT#709491003 "Assessed (qualifier value)"
* $SCT#1304144001 "Eligible for clinical trial"
* $SCT#385646003 "Not eligible (qualifier value)"
* $SCT#260385009 "Negative (qualifier value)"
