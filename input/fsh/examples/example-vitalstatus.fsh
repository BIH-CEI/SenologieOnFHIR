// ============================================================
// Vitalstatus-Beispiele (OncoBox M05 / MII Person-Modul)
// Nutzt MII-Profile direkt — kein eigenes Senologie-Profil nötig.
//
// Fall 1 (Erika Neumann): Vitalstatus lebend
// Fall 2 (Lena Hoffmann): Vitalstatus verstorben + Todesursache +
//   Onko-Tod (tumorbedingt) + Patient.deceasedDateTime
// ============================================================

// ============================================================
// Fall 1: Vitalstatus — Patientin lebt (MII_PR_Person_Vitalstatus)
// ============================================================

Instance: Fall1-Vitalstatus-Lebend
InstanceOf: Observation
Title: "Fall 1: Vitalstatus — lebend"
Description: "Vitalstatus-Observation gemäß MII Person-Modul: Patientin Erika Neumann lebt zum Zeitpunkt der 6-Monats-Nachsorge."
Usage: #example

* meta.profile = $MII_PR_Person_Vitalstatus
* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#survey
* code.coding = $LOINC#67162-8 "Patient Disposition"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-08-15"
* valueCodeableConcept.coding = $MII_CS_Person_Vitalstatus#L "Patient lebt"

// ============================================================
// Fall 2: Tod-Szenario — Patientin verstorben
// Lena Hoffmann verstirbt an hepatischen Metastasen (C78.7)
// nach progredienter Erkrankung (triple-negatives MaCa).
// ============================================================

// --- Vitalstatus: verstorben (MII_PR_Person_Vitalstatus) ---

Instance: Fall2-Vitalstatus-Verstorben
InstanceOf: Observation
Title: "Fall 2: Vitalstatus — verstorben"
Description: "Vitalstatus-Observation gemäß MII Person-Modul: Patientin Lena Hoffmann ist am Tumorleiden verstorben."
Usage: #example

* meta.profile = $MII_PR_Person_Vitalstatus
* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#survey
* code.coding = $LOINC#67162-8 "Patient Disposition"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann-Verstorben)
* effectiveDateTime = "2026-09-20"
* valueCodeableConcept.coding = $MII_CS_Person_Vitalstatus#T "Patient verstorben"

// --- Patient mit deceasedDateTime ---

Instance: Fall2-Patient-Lena-Hoffmann-Verstorben
InstanceOf: Patient
Title: "Fall 2: Patientin Lena Hoffmann (verstorben)"
Description: "Variante der Testpatientin Lena Hoffmann mit deceasedDateTime — Tod durch hepatische Metastasen bei triple-negativem Mammakarzinom."
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-002"
* name.family = "Hoffmann"
* name.given = "Lena"
* gender = #female
* birthDate = "1980-09-28"
* address.city = "Berlin"
* address.country = "DE"
* deceasedDateTime = "2026-09-18"

// --- Todesursache (MII_PR_Person_Todesursache) ---

Instance: Fall2-Todesursache
InstanceOf: Condition
Title: "Fall 2: Todesursache — sekundäre Leberkarzinose"
Description: "Todesursache gemäß MII Person-Modul: sekundäre bösartige Neubildung der Leber (ICD-10-GM C78.7) bei metastasiertem triple-negativen Mammakarzinom."
Usage: #example

* meta.profile = $MII_PR_Person_Todesursache
* category.coding[+] = $SCT#16100001
* category.coding[+] = $LOINC#79378-6
* code.coding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding.version = "2025"
* code.coding.code = #C78.7
* code.coding.display = "Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann-Verstorben)

// --- Tod tumorbedingt (MII_PR_Onko_Tod) ---

Instance: Fall2-Tod-Tumorbedingt
InstanceOf: Observation
Title: "Fall 2: Tod tumorbedingt"
Description: "Onko-Tod-Observation gemäß MII Onko-Modul: Patientin ist an Tumorerkrankung (Mammakarzinom mit Lebermetastasen) verstorben. Todesursache C78.7."
Usage: #example

* meta.profile = $MII_PR_Onko_Tod
* status = #final
* code.coding = $SCT#184305005
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann-Verstorben)
* effectiveDateTime = "2026-09-18"
* valueCodeableConcept.coding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* valueCodeableConcept.coding.version = "2025"
* valueCodeableConcept.coding.code = #C78.7
* valueCodeableConcept.coding.display = "Sekundäre bösartige Neubildung der Leber und der intrahepatischen Gallengänge"
* interpretation.coding = $MII_CS_Onko_Tod#J "Ja, die Person ist an einer Tumorerkrankung oder Folge einer Tumorerkrankung (einschließlich Behandlungskomplikation) verstorben."

// --- Verlauf bei Tod (Senologie_FollowUp mit Vitalstatus=verstorben) ---

Instance: Fall2-Verlauf-Tod
InstanceOf: Senologie_FollowUp
Title: "Fall 2: Verlaufsmeldung bei Tod"
Description: "Abschließende Verlaufsmeldung für Lena Hoffmann: Patientin verstorben an hepatischen Metastasen. Passive Nachsorge (Totenschein/Register)."
Usage: #example

* status = #final

* code.coding = $SCT#396432002 "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann-Verstorben)
* focus = Reference(Condition/Fall2-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-09-20"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: P = Progression
* valueCodeableConcept.coding = $MII_CS_Onko_Verlauf_Gesamt#P "Progression"

// M05: Lokaler Tumorstatus
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding = $MII_CS_Onko_Verlauf_Primaertumor#K "kein Tumor nachweisbar"

// M06: Lymphknoten-Status
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding = $MII_CS_Onko_Verlauf_Lymphknoten#K "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen — progredient
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding = $MII_CS_Onko_Verlauf_Fernmetastasen#P "Progression"

// M03: Art der Nachsorge — passiv (method, Totenschein)
* method.coding[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up"
* method.coding[=].code = #passiv
* method.coding[=].display = "Passive Nachsorge"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up"
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding = $SCT#373067005 "No (qualifier value)"
