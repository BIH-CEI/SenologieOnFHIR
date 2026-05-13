// ============================================================================
// Fall 14: OncoBox-Testpatient (re-engineered)
//
// Quelle: input/data/oncobox-brust-2.0/examples/26_1_example_brust_patient_data.xml
//   → Patienten/Patient[1]/Fall[1]
//
// Patient: Männlich, geboren 1946 (~79J), gesetzlich versichert, lebend.
// Diagnose: Mammakarzinom links (C50.3), Erstdiagnose 2025-01-15.
//   Klinisch:    cT2 cN0 cM0
//   Pathologisch: pT4b pN1a (Sentinel 1/1)
//   Histologie: invasiv-lobulär (ICD-O 8520/3), G2, ER+ IRS 12, PR+ IRS 9,
//               HER2 IHC 2+, Ki-67 10 %
//   Behandlung: BET + SLNB → adjuvante RT 40 Gy / 2.5 Gy Einzeldosis →
//               adjuvante endokrine Therapie ab 02-24
//   Verlauf: PR nach 2 Monaten, kein Zweittumor
//
// Dient als technisches Maximalbeispiel — befüllt möglichst viele OncoBox-2.0-
// Felder über die FHIR-Pipeline. NICHT zur klinischen Plausibilitäts-Prüfung.
// ============================================================================

Instance: Fall14-Patient-OncoBox-Beispiel
InstanceOf: Patient
Title: "Fall 14: OncoBox-Beispielpatient (re-engineered)"
Description: "Synthetischer Testpatient aus dem offiziellen OncoBox-Brust-2.0-Beispieldatensatz, re-engineered nach FHIR. Mann, 79J, Mamma-Ca links."
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "Fall14-Patient-1"
* active = true
* name.family = "Test"
* name.given = "Patient"
* gender = #male
* birthDate = "1946"


// --- Diagnose: Mammakarzinom links C50.3 ---
Instance: Fall14-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 14: Mammakarzinom links C50.3, cT2 cN0 cM0 → pT4b pN1a"
Description: "Invasives Mammakarzinom NST der linken Brust"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category.coding = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* category.coding[+].system = "http://snomed.info/sct"
* category.coding[=].code = #386661006
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[=].code = #C50.3
* code.coding[=].display = "Bösartige Neubildung der unteren inneren Quadranten der Brustdrüse"
* code.coding[=].version = "2025"
* bodySite.coding = http://snomed.info/sct#7771000 "Links"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* recordedDate = "2025-01-15"
* extension[Feststellungsdatum].valueDateTime = "2025-01-15"


// --- ER-Status: positiv, 90 %, IRS 12 ---
Instance: Fall14-ER-Status
InstanceOf: Senologie_ER_Status
Title: "Fall 14: ER positiv, IRS 12, 90 %"
Usage: #example

* status = #final
* code = $LOINC#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6576-8 "Positive"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#positiv "positiv"
* component[AnteilPositiveZellen].valueQuantity.value = 90
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[Faerbeintensitaet].valueCodeableConcept = $LOINC#LA13035-3 "Strong"
* component[irsScore].valueQuantity.value = 12
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}


// --- PR-Status: positiv, 73 %, IRS 9 ---
Instance: Fall14-PR-Status
InstanceOf: Senologie_PR_Status
Title: "Fall 14: PR positiv, IRS 9, 73 %"
Usage: #example

* status = #final
* code = $LOINC#85339-0 "Progesterone receptor [Interpretation] in Tissue by Immune stain"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6576-8 "Positive"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#positiv "positiv"
* component[AnteilPositiveZellen].valueQuantity.value = 73
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[Faerbeintensitaet].valueCodeableConcept = $LOINC#LA13034-6 "Moderate"
* component[irsScore].valueQuantity.value = 9
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}


// --- HER2: IHC 2+ (equivocal — Reflex-ISH üblich, hier nicht im Beispiel) ---
Instance: Fall14-HER2-Status
InstanceOf: Senologie_HER2_Status
Title: "Fall 14: HER2 IHC 2+ (equivocal)"
Usage: #example

* status = #final
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie#low "HER2-low"
* valueCodeableConcept.coding[DefinitionOBDS] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds#N "negativ"
* component[IHCScore].valueCodeableConcept = $LOINC#LA11841-6 "2+"


// --- Ki-67 ---
Instance: Fall14-Ki67
InstanceOf: Senologie_Ki67_Proliferationsindex
Title: "Fall 14: Ki-67 10 %"
Usage: #example

* status = #final
* code.coding = $LOINC#29593-1 "Cells.Ki-67 nuclear Ag/cells in Tissue by Immune stain"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueQuantity.value = 10
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%


// --- Grading G2 ---
Instance: Fall14-Grading
InstanceOf: MII_PR_Onko_Grading
Title: "Fall 14: Grading G2"
Usage: #example

* status = #final
* code = $LOINC#33732-9 "Histology grade [Identifier] in Cancer specimen"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding.system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading"
* valueCodeableConcept.coding.code = #2
* valueCodeableConcept.coding.display = "Maeßig differenziert (G2)"


// TODO: Operation, Strahlentherapie, Systemtherapie, Tumorboards — Profile-
// spezifische Pflichtfelder benoetigen sorgfaeltigere Befuellung (OPS-Codes
// aus restricted VS, MII-Intention-Pattern, Tumorboard-Slicing). Fuer das
// Maximalbeispiel zunaechst weggelassen, Fokus auf Anamnese/Diagnose/
// Biomarker, die in Fall 1 auch schon abgedeckt sind.


// --- Anamnese: Raucher N, BRCA NU ---
Instance: Fall14-Raucherstatus
InstanceOf: Observation
Title: "Fall 14: Nie-Raucher"
Usage: #example

* meta.profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"
* status = #final
* code = $LOINC#72166-2 "Tobacco smoking status"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding = $LOINC#LA18978-9 "Never smoker"


// --- Follow-up: 2025-03-17, PR, Vitalstatus L ---
Instance: Fall14-FollowUp
InstanceOf: Senologie_FollowUp
Title: "Fall 14: Follow-Up nach Therapie — PR"
Usage: #example

* status = #final
* code.coding = http://snomed.info/sct#396432002 "Status of regression of tumor (observable entity)"
* subject = Reference(Fall14-Patient-OncoBox-Beispiel)
* focus = Reference(Fall14-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-03-17"
* issued = "2025-03-17T12:00:00+01:00"
* method.coding.system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-nachsorge-art"
* method.coding.code = #A
* method.coding.display = "Aktive Nachsorge"
* valueCodeableConcept.coding.system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung"
* valueCodeableConcept.coding.code = #P
* valueCodeableConcept.coding.display = "Progression"
