Profile: Senologie_Studienteilnahme
Parent: ResearchSubject
Id: senologie-studienteilnahme
Title: "BIH Senologie Studienteilnahme"
Description: "ResearchSubject für klinische Studienteilnahme in der Senologie aus dotbase Questionnaire 'Studien'. Bildet Studienname, Screeningstatus, Studienscreening, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab."

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
* study ^comment = "Enthält den Studiennamen als display oder Referenz auf eine ResearchStudy-Ressource. Für OncoBox 2.0 K02: Studienname aus Auswahlliste via study.display oder ResearchStudy.title"

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

// Studienscreening (K03)
* extension contains EX_Senologie_Studienscreening named Studienscreening 0..1
* extension[Studienscreening] ^short = "Screening zur Studienteilnahme (K03)"
* extension[Studienscreening] ^comment = "OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Mapping auf Stud_Screening (0=nein, 1=ja)"

// Studienname kodiert (K02)
* extension contains EX_Senologie_StudiennameCode named StudiennameCode 0..1
* extension[StudiennameCode] ^short = "Studienname aus Auswahlliste (K02)"
* extension[StudiennameCode] ^comment = "OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt study.display um einen strukturierten Code."

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

Extension: EX_Senologie_Studienscreening
Id: ex-senologie-studienscreening
Title: "Screening zur Studienteilnahme"
Description: "OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus)."
* value[x] only boolean

Extension: EX_Senologie_StudiennameCode
Id: ex-senologie-studienname-code
Title: "Studienname (kodiert)"
Description: "OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt die study-Referenz um einen strukturierten Code für die OncoBox-Meldung."
* value[x] only CodeableConcept
* value[x] from VS_Senologie_Studienname (example)

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
// ValueSets for Studienteilnahme
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


ValueSet: VS_Senologie_Studienname
Id: vs-senologie-studienname
Title: "VS Senologie Studienname"
Description: "Auswahlliste klinischer Studien am Brustzentrum (OncoBox 2.0 K02). Enthält häufige Mammakarzinom-Studien. Die Liste ist erweiterbar (extensible Binding)."
* ^status = #draft
* insert PR_CS_VS_Version
* include codes from system CS_Senologie_Studienname


// ============================================================
// CodeSystem for Studienname (K02)
// ============================================================

CodeSystem: CS_Senologie_Studienname
Id: cs-senologie-studienname
Title: "CS Senologie Studienname"
Description: "Auswahlliste klinischer Studien am Brustzentrum für die OncoBox 2.0 Meldung (K02). Enthält häufige interventionelle und nicht-interventionelle Mammakarzinom-Studien."
* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete
* #keynote-522 "KEYNOTE-522"
    "Pembrolizumab + Chemotherapie neoadjuvant/adjuvant bei TNBC (Merck)"
* #monarche "monarchE"
    "Abemaciclib adjuvant bei HR+/HER2- Hochrisiko-Mammakarzinom (Lilly)"
* #natalee "NATALEE"
    "Ribociclib adjuvant bei HR+/HER2- Mammakarzinom (Novartis)"
* #destiny-breast "DESTINY-Breast"
    "Trastuzumab-Deruxtecan bei HER2+ oder HER2-low Mammakarzinom (Daiichi Sankyo/AstraZeneca)"
* #olympia "OlympiA"
    "Olaparib adjuvant bei gBRCA1/2-mutiertem HER2- Mammakarzinom (AstraZeneca)"
* #katherine "KATHERINE"
    "T-DM1 adjuvant bei HER2+ nach Non-pCR (Roche)"
* #compassher2-rd "COMPASSHer2-RD"
    "T-DXd vs. T-DM1 bei HER2+ nach Non-pCR (Register)"
* #tropion-breast "TROPION-Breast"
    "Datopotamab-Deruxtecan bei HR+/HER2- Mammakarzinom (Daiichi Sankyo/AstraZeneca)"
* #sonstige "Sonstige Studie"
    "Weitere Studien (Freitext in study.display)"
