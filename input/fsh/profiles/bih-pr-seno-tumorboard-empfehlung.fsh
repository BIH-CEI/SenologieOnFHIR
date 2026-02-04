Profile: Senologie_Tumorboard_Empfehlung
Parent: CarePlan
Id: senologie-tumorboard-empfehlung
Title: "BIH Senologie Tumorboard Empfehlung"
Description: "CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard) aus dotbase Questionnaire 'Empfehlung der interdisziplinären Tumorkonferenz V2.0'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
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
* period.start ^comment = "Aus dotbase: 'Datum'"

* careTeam ^short = "Beteiligte Fachgruppen"
* careTeam ^comment = "References zu CareTeam mit verschiedenen Fachdisziplinen (Chirurgie, Onkologie, Radiologie, Pathologie, etc.)"

// Diagnose/Condition als Grund des Tumorboards
* addresses MS
* addresses only Reference(Condition)
* addresses ^short = "Grund des Tumorboards (Diagnose)"

// Therapie-Empfehlungen als Activities
* activity MS
* activity ^short = "Empfohlene Maßnahmen"
* activity ^slicing.discriminator.type = #value
* activity ^slicing.discriminator.path = "detail.kind"
* activity ^slicing.rules = #open
* activity ^slicing.description = "Slicing nach Art der empfohlenen Maßnahme"

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
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code ^short = "Empfohlene operative Therapie"
* activity[operativeTherapy].detail.code ^comment = "Aus dotbase: 'Operative Therapie' (choice)"
* activity[operativeTherapy].reference only Reference(ServiceRequest)

// Chemotherapie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code ^short = "Empfohlene Chemotherapie"
* activity[chemotherapy].detail.code ^comment = "Aus dotbase: 'Chemotherapie' (choice)"
* activity[chemotherapy].reference only Reference(MedicationRequest)

// Radiotherapie/Strahlentherapie
* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code ^short = "Empfohlene Strahlentherapie"
* activity[radiotherapy].detail.code ^comment = "Aus dotbase: 'Strahlentherapie' (choice)"
* activity[radiotherapy].reference only Reference(ServiceRequest)

// Endokrine Therapie
* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code ^short = "Empfohlene endokrine Therapie"
* activity[endocrineTherapy].detail.code ^comment = "Aus dotbase: 'Endokrine Therapie' (choice)"
* activity[endocrineTherapy].reference only Reference(MedicationRequest)

// Zielgerichtete Therapie
* activity[targetedTherapy].detail.kind = #MedicationRequest
* activity[targetedTherapy].detail.code ^short = "Empfohlene zielgerichtete Therapie"
* activity[targetedTherapy].detail.code ^comment = "Aus dotbase: 'Zielgerichtete Therapie' (choice)"
* activity[targetedTherapy].reference only Reference(MedicationRequest)

// Immuntherapie
* activity[immunotherapy].detail.kind = #MedicationRequest
* activity[immunotherapy].detail.code ^short = "Empfohlene Immuntherapie"
* activity[immunotherapy].detail.code ^comment = "Aus dotbase: 'Immuntherapie' (choice)"
* activity[immunotherapy].reference only Reference(MedicationRequest)

// Antiresorptive Therapie
* activity[antiresorptiveTherapy].detail.kind = #MedicationRequest
* activity[antiresorptiveTherapy].detail.code ^short = "Empfohlene antiresorptive Therapie"
* activity[antiresorptiveTherapy].detail.code ^comment = "Aus dotbase: 'Antiresorptive Therapie' (choice, z.B. Bisphosphonate)"
* activity[antiresorptiveTherapy].reference only Reference(MedicationRequest)

// Weitere Diagnostik
* activity[furtherDiagnostics].detail.kind = #ServiceRequest
* activity[furtherDiagnostics].detail.code ^short = "Empfohlene weitere Diagnostik"
* activity[furtherDiagnostics].detail.code ^comment = "Aus dotbase: 'Weitere Diagnostik' (choice)"
* activity[furtherDiagnostics].reference only Reference(ServiceRequest)

// Weitere Intervention
* activity[furtherIntervention].detail.kind = #ServiceRequest
* activity[furtherIntervention].detail.code ^short = "Empfohlene weitere Intervention"
* activity[furtherIntervention].detail.code ^comment = "Aus dotbase: 'Weitere Intervention' (choice)"
* activity[furtherIntervention].reference only Reference(ServiceRequest)

// Genetische Untersuchung
* activity[genetics].detail.kind = #ServiceRequest
* activity[genetics].detail.code ^short = "Empfohlene genetische Untersuchung"
* activity[genetics].detail.code ^comment = "Aus dotbase: 'Genetische Untersuchung' (choice, z.B. BRCA)"
* activity[genetics].reference only Reference(ServiceRequest)

// Klinische Studie
* activity[clinicalTrial].detail.kind = #ServiceRequest
* activity[clinicalTrial].detail.code ^short = "Empfohlene klinische Studie"
* activity[clinicalTrial].detail.code ^comment = "Aus dotbase: 'Studie' (choice)"
* activity[clinicalTrial].detail.description ^comment = "Optional 'Sonstige Studie' (Freitext)"

// Follow-up / Nachsorge
* activity[followUp].detail.kind = #Appointment
* activity[followUp].detail.code ^short = "Follow-up / Nachsorge Plan"
* activity[followUp].detail.code ^comment = "Aus dotbase: 'Vorsorge/Nachsorge', 'Wiedervorstellung'"
* activity[followUp].detail.scheduledTiming ^short = "Zeitplan für Nachsorge/Wiedervorstellung"

// Allgemeine Notizen
* note ^short = "Allgemeine Anmerkungen des Tumorboards"
* note ^comment = "Aus dotbase: 'Sonstiges' (choice)"

// Beteiligte
* contributor ^short = "Ärzte/Spezialisten des Tumorboards"
