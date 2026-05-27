Profile: Senologie_Tumorboard_Empfehlung
Parent: CarePlan
Id: senologie-tumorboard-empfehlung
Title: "BIH Senologie Tumorboard Empfehlung"
Description: "CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard)"

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Bezugselement im Logischen Modell: Tumorkonferenz"

// Basis-Mapping
* status = #active (exactly)
* status ^short = "Aktiver Care Plan"

* intent MS
* intent = #plan (exactly)
* intent ^short = "Tumorboard-Empfehlung als Planungsplan"

* title MS
* title ^short = "Tumorboard Empfehlung"

* description MS
* description ^short = "Empfehlungen der interdisziplinären Tumorkonferenz"

* subject MS
* subject only Reference(Patient)
* subject ^short = "Patient für den das Tumorboard stattfindet"

* period MS
* period.start MS
* period.start ^short = "Datum des Tumorboard"
* period.start ^comment = "'Datum'"

// Art der Tumorkonferenz (praeth/postop/postth/ther) — gleiches VS wie MII Onko Tumorkonferenz
* category MS
* category 1..1
* category from https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-therapieplanung-typ (required)
* category ^short = "Art der Tumorkonferenz / Therapieplanung"
* category ^comment = "Codiert nach MII Onko therapieplanung-typ (1:1 wiederverwendet — praeth/postop/postth/ther)"

* careTeam ^short = "Beteiligte Fachgruppen"
* careTeam ^comment = "References zu CareTeam mit verschiedenen Fachdisziplinen (Chirurgie, Onkologie, Radiologie, Pathologie, etc.)"

// Diagnose/Condition als Grund des Tumorboards
* addresses MS
* addresses only Reference(Condition)
* addresses ^short = "Grund des Tumorboards (Diagnose)"

// Therapie-Empfehlungen als Activities
* activity MS
* activity ^short = "Empfohlene Maßnahmen"
* activity ^slicing.discriminator.type = #pattern
* activity ^slicing.discriminator.path = "detail.code"
* activity ^slicing.rules = #open
* activity ^slicing.description = "Slicing nach Art der empfohlenen Maßnahme (über detail.code Pattern)"

* activity contains
    operativeTherapy 0..1 and
    chemotherapy 0..1 and
    radiotherapy 0..1 and
    endocrineTherapy 0..1 and
    targetedTherapy 0..1 and
    immunotherapy 0..1 and
    antiresorptiveTherapy 0..1 and
    furtherDiagnostics 0..1 and
    furtherIntervention 0..1 and
    genetics 0..1 and
    clinicalTrial 0..1 and
    followUp 0..1

// Operative Therapie
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code ^short = "Empfohlene operative Therapie"
* activity[operativeTherapy].detail.code ^comment = "Operative Therapie: (choice)"
* activity[operativeTherapy].detail.kind = #ServiceRequest

// Chemotherapie
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code ^short = "Empfohlene Chemotherapie"
* activity[chemotherapy].detail.code ^comment = "Chemotherapie: (choice)"
* activity[chemotherapy].detail.kind = #MedicationRequest

// Radiotherapie/Strahlentherapie
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code ^short = "Empfohlene Strahlentherapie"
* activity[radiotherapy].detail.code ^comment = "Strahlentherapie: (choice)"
* activity[radiotherapy].detail.kind = #ServiceRequest

// Endokrine Therapie
* activity[endocrineTherapy].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[endocrineTherapy].detail.code ^short = "Empfohlene endokrine Therapie"
* activity[endocrineTherapy].detail.code ^comment = "Endokrine Therapie: (choice)"
* activity[endocrineTherapy].detail.kind = #MedicationRequest

// Zielgerichtete Therapie
* activity[targetedTherapy].detail.code = $SCT#416608005 "Drug therapy"
* activity[targetedTherapy].detail.code ^short = "Empfohlene zielgerichtete Therapie"
* activity[targetedTherapy].detail.code ^comment = "Zielgerichtete Therapie: (choice)"
* activity[targetedTherapy].detail.kind = #MedicationRequest

// Immuntherapie
* activity[immunotherapy].detail.code = $SCT#76334006 "Immunotherapy (procedure)"
* activity[immunotherapy].detail.code ^short = "Empfohlene Immuntherapie"
* activity[immunotherapy].detail.code ^comment = "Immuntherapie: (choice)"
* activity[immunotherapy].detail.kind = #MedicationRequest

// Antiresorptive Therapie
* activity[antiresorptiveTherapy].detail.code = $SCT#870370003 "Antiresorptive therapy (procedure)"
* activity[antiresorptiveTherapy].detail.code ^short = "Empfohlene antiresorptive Therapie"
* activity[antiresorptiveTherapy].detail.code ^comment = "Antiresorptive Therapie: (choice, z.B. Bisphosphonate)"
* activity[antiresorptiveTherapy].detail.kind = #MedicationRequest

// Weitere Diagnostik
* activity[furtherDiagnostics].detail.code = $SCT#165197003 "Diagnostic assessment (procedure)"
* activity[furtherDiagnostics].detail.code ^short = "Empfohlene weitere Diagnostik"
* activity[furtherDiagnostics].detail.code ^comment = "Weitere Diagnostik: (choice)"
* activity[furtherDiagnostics].detail.kind = #ServiceRequest

// Weitere Intervention
* activity[furtherIntervention].detail.code = $SCT#71388002 "Procedure (procedure)"
* activity[furtherIntervention].detail.code ^short = "Empfohlene weitere Intervention"
* activity[furtherIntervention].detail.code ^comment = "Weitere Intervention: (choice)"
* activity[furtherIntervention].detail.kind = #ServiceRequest

// Genetische Untersuchung
* activity[genetics].detail.code = $SCT#405825005 "Molecular genetic test"
* activity[genetics].detail.code ^short = "Empfohlene genetische Untersuchung"
* activity[genetics].detail.code ^comment = "Genetische Untersuchung: (choice, z.B. BRCA)"
* activity[genetics].detail.kind = #ServiceRequest

// Klinische Studie
* activity[clinicalTrial].detail.code = $SCT#110465008 "Clinical trial (procedure)"
* activity[clinicalTrial].detail.code ^short = "Empfohlene klinische Studie"
* activity[clinicalTrial].detail.code ^comment = "Studie: (choice)"
* activity[clinicalTrial].detail.description ^comment = "Optional 'Sonstige Studie' (Freitext)"
* activity[clinicalTrial].detail.kind = #ServiceRequest

// Follow-up / Nachsorge
* activity[followUp].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[followUp].detail.code ^short = "Follow-up / Nachsorge Plan"
* activity[followUp].detail.code ^comment = "'Vorsorge/Nachsorge', 'Wiedervorstellung'"
* activity[followUp].detail.kind = #Appointment
* activity[followUp].detail.scheduledTiming ^short = "Zeitplan für Nachsorge/Wiedervorstellung"

// Allgemeine Notizen
* note ^short = "Allgemeine Anmerkungen des Tumorboards"
* note ^comment = "Sonstiges: (choice)"

// Beteiligte
* contributor ^short = "Ärzte/Spezialisten des Tumorboards"
