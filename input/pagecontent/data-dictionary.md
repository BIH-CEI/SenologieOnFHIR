# Data Dictionary

Diese Seite dokumentiert die flachen Tabellen, die aus den Senologie-Profilen via SQL-on-FHIR ViewDefinitions extrahiert werden.
Jede Tabelle entspricht einer ViewDefinition unter `validation/views/`. Spalten werden über FHIRPath aus den profilierten Resourcen gewonnen.

## Ausleitungswege

Drei Wege, die hier dokumentierten Tabellen zu erzeugen:

1. **SQL-on-FHIR runner** (z.B. Pathling, Aidbox `$run` auf ViewDefinition):
   - `./scripts/export-views-csv.sh exports/` exportiert alle Views als CSV gegen die laufende Aidbox.
2. **Aidbox direkt-SQL** über `/$sql` (Postgres JSONB) — pragmatisch für Ad-hoc-Queries, ohne ViewDefinition-Runner:
   ```sql
   SELECT id AS condition_id,
          resource->'subject'->>'reference' AS patient_ref,
          jsonb_path_query_first(resource, '$.code.coding[*] ? (@.system == "http://snomed.info/sct").code')->>0 AS diagnose_sct
     FROM condition
    WHERE resource->'code'->'coding' @> '[{"system":"http://snomed.info/sct"}]';
   ```
3. **Pathling / DuckDB** gegen den NDJSON-Export — für offline-Auswertungen.

Spalten-Semantik (Bedeutung, Code-System, Binding) ist in allen drei Wegen identisch.

_Auto-generiert mit `scripts/generate-data-dictionary.py` aus ViewDefinitions + StructureDefinitions. Nicht von Hand editieren — Quellen sind `validation/views/*.json` und die Profile in `fsh-generated/resources/StructureDefinition-*.json`._

## Senologie Biomarker Flat View

- **View-ID:** `senologie-biomarker-flat`
- **Resource:** `Observation`
- **Beschreibung:** Alle IHC-Biomarker-Observations (ER/PR/HER2/Ki67/PD-L1) als flache Tabelle. Filter auf die fuenf relevanten LOINC-Codes. Components mit Prozent/Score/Intensitaet werden als separate Spalten aufgeloest.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `biomarker_loinc` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `biomarker_name` | string |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').display.first()` |
| `interpretation` | code |  | Hauptinterpretation als SCT-Code (positiv/negativ/low/equivocal). | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `interpretation_display` | string |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').display.fi…` |
| `her2_gesamt` | code |  | HER2-Leitlinien-Gesamtstatus (positiv/low/ultralow/negativ/equivocal). | CS: cs-senologie-biomarker | `valueCodeableConcept.coding.where(system='https://www.senologie.org/fhir/Code…` |
| `value_prozent` | string |  | Prozent positive Zellen (TPS bei PD-L1, %-positiv bei ER/PR/Ki67). |  | `component.where(code.coding.where(code='1234803000' or code='85318-4' or code…` |
| `value_irs` | string |  |  |  | `component.where(code.coding.code='irs-score').valueQuantity.value.first()` |
| `value_allred` | string |  |  |  | `component.where(code.coding.code='allred-score').valueQuantity.value.first()` |
| `intensitaet` | code |  | Faerbeintensitaet (negative/weak/moderate/strong). |  | `component.where(code.coding.where(code='1236874005' or code='1237278006').exi…` |
| `ish_methode` | code |  |  |  | `component.where(code.coding.code='ish-methode').valueCodeableConcept.coding.c…` |
| `her2_ratio` | string |  |  |  | `component.where(code.coding.code='her2-ratio').valueQuantity.value.first()` |
| `status` | string |  |  |  | `status` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |

## Senologie BodyStructure Flat View

- **View-ID:** `senologie-bodystructure-flat`
- **Resource:** `BodyStructure`
- **Beschreibung:** Tumor-Entitaeten als BodyStructures — der Senologie-Lifecycle-Anker. Eine Zeile pro BS mit Patient, Lokalisation, Morphologie (nach Histologie-Update), active-Flag. active=true=Tumor noch praesent; active=false=R0-reseziert oder geheilt.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `bs_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `patient.getReferenceKey(Patient)` |
| `active` | string |  |  |  | `active` |
| `tumor_entity_identifier` | string |  |  | CS: tumor-entity | `identifier.where(system='https://www.senologie.org/fhir/sid/tumor-entity').va…` |
| `location_sct` | code |  |  | CS: SNOMED CT | `location.coding.where(system='http://snomed.info/sct').code.first()` |
| `location_display` | string |  |  | CS: SNOMED CT | `location.coding.where(system='http://snomed.info/sct').display.first()` |
| `morphology_sct` | code |  | Wird durch Pathologie-Form mit Histo-Code (8500/3 etc.) ueberschrieben. | CS: SNOMED CT | `morphology.coding.where(system='http://snomed.info/sct').code.first()` |
| `morphology_icdo3` | code |  |  | CS: ICD-O-3 | `morphology.coding.where(system='http://terminology.hl7.org/CodeSystem/icd-o-3…` |
| `description` | string |  |  |  | `description` |

## Senologie Diagnose Flat View

- **View-ID:** `senologie-diagnose-flat`
- **Resource:** `Condition`
- **Profil:** [senologie-diagnose-maligne](https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne)
- **Beschreibung:** Flache Tabelle aller senologischen Diagnose-Conditions (eine Zeile pro Condition mit Patient, SCT/ICD-10/Seite/Datum/Status). Eignet sich für Quick-Auswertungen und CSV-Export.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `condition_id` | string |  | Technische Condition-ID (FHIR `Condition.id`). |  | `id` |
| `patient_id` | string |  | Patient-ID (SQL-on-FHIR `getReferenceKey`). Join-Key fuer andere Flat-Views. Aidbox speichert References als {id,resourceType} statt {reference}, daher klappt `subject.reference` nicht — `getReferenceKey` ist die SQL-on-FHIR-Standard-Funktion. |  | `subject.getReferenceKey(Patient)` |
| `diagnose_sct` | code | 1.. | SNOMED-CT Code der Diagnose. Gebunden an VS senologie-diagnose-mamma (24 Mamma-spezifische Codes, klinisch sortiert). | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `diagnose_display` | string |  | Diagnose | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `diagnose_icd10` | code | 1.. | ICD-10-GM Dual-Code (optional). Aus ConceptMap cm-senologie-diagnose-sct-to-icd10 abgeleitet. | CS: ICD-10-GM | `code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code.fi…` |
| `diagnose_icd11` | code | 1.. | ICD-11 Dual-Code (optional). WHO ICD-11 MMS. | CS: mms | `code.coding.where(system='http://id.who.int/icd11/mms').code.first()` |
| `tumormanifestation` | code | 0..* | Tumormanifestation (Primärtumor/Rezidiv/LK/FM) | VS: vs-senologie-tumormanifestation | `category.coding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-se…` |
| `diagnose_custom_code` | code | 1.. | Senologie-spezifischer Code (z.B. mamillensekretion, bc-recurrence) wenn kein passender SCT-Code existiert. | CS: Senologie Diagnose-Mamma-Custom | `code.coding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-senolo…` |
| `seite_sct` | code |  | Seitenlokalisation als SNOMED-CT (24028007=rechts, 7771000=links, 51440002=beidseits). | CS: SNOMED CT | `bodySite.coding.where(system='http://snomed.info/sct').code.first()` |
| `seite_onko` | code |  | Seitenlokalisation nach MII Onko (R/L/B/M/T/U). Für oBDS-Export. | CS: MII Onko Seitenlokalisation | `bodySite.coding.where(system='https://www.medizininformatik-initiative.de/fhi…` |
| `clinical_status` | code |  | Klinischer Status (active/recurrence/remission/resolved). `recurrence` = Rezidiv auf derselben Condition. |  | `clinicalStatus.coding.code.first()` |
| `verification_status` | code |  | FHIR Verification-Status (confirmed/unconfirmed/provisional/differential). | CS: condition-ver-status | `verificationStatus.coding.where(system='http://terminology.hl7.org/CodeSystem…` |
| `diagnosesicherung_obds` | code |  | oBDS Diagnosesicherung 1-9 (1=klinisch, 2=Bildgebung, 5=Zytologie, 7=Histo-Primärtumor, …). MII Onko CodeSystem. | CS: MII Onko Diagnosesicherung | `verificationStatus.coding.where(system='https://www.medizininformatik-initiat…` |
| `onset_date` | dateTime |  | Erstdiagnose-Datum (Onset). Wird bei Rezidiv NICHT überschrieben. |  | `onsetDateTime` |
| `asserted_date` | dateTime |  | Feststellungsdatum (z.B. Rezidiv-Feststellung). Onko-konform via condition-assertedDate Extension. |  | `extension.where(url='http://hl7.org/fhir/StructureDefinition/condition-assert…` |
| `recorded_date` | dateTime |  | Datum der Erfassung im System (Dokumentationszeitpunkt). |  | `recordedDate` |

## Senologie Familienanamnese Flat View

- **View-ID:** `senologie-familienanamnese-flat`
- **Resource:** `FamilyMemberHistory`
- **Beschreibung:** FamilyMemberHistory-Eintraege fuer erbliche Belastung. Eine Zeile pro Familienmitglied mit Verwandtschaftsgrad + Erkrankung + Alter bei Diagnose.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `fmh_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `patient.getReferenceKey(Patient)` |
| `relationship_code` | code |  |  |  | `relationship.coding.code.first()` |
| `relationship_display` | string |  |  |  | `relationship.coding.display.first()` |
| `sex_code` | code |  |  |  | `sex.coding.code.first()` |
| `status` | string |  |  |  | `status` |
| `deceased_boolean` | string |  |  |  | `deceasedBoolean` |
| `condition_code_sct` | code |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `condition_display` | string |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `onset_age_value` | string |  |  |  | `onsetAge.value` |
| `onset_string` | string |  |  |  | `onsetString` |

## Senologie Pathologie-Befund Flat View

- **View-ID:** `senologie-pathologie-report-flat`
- **Resource:** `DiagnosticReport`
- **Beschreibung:** Pathologie-Hauptberichte (DiagnosticReport) als flache Tabelle. Verbindung zwischen Specimen + Histologie + IHC + Befundtext.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `report_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `report_code` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `status` | string |  |  |  | `status` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `issued` | instant |  |  |  | `issued` |
| `specimen_id` | string |  |  |  | `specimen.first().id` |
| `conclusion` | string |  |  |  | `conclusion` |

## Senologie Patient Flat View

- **View-ID:** `senologie-patient-flat`
- **Resource:** `Patient`
- **Beschreibung:** Flache Tabelle aller Patient:innen mit Stammdaten (Name, Geschlecht, Geburts-/Sterbedatum, KVID, lokale Patient-ID). Basis für patient-bezogene Auswertungen und Joins über patient_id.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `patient_id` | string |  | Technische Patient-ID (FHIR `Patient.id`). Join-Key für alle anderen Flat-Views (`*.patient_id`). |  | `id` |
| `kvid` | string |  | GKV-KVID-10 (Versichertennummer). System: http://fhir.de/sid/gkv/kvid-10. | CS: kvid-10 | `identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value.first()` |
| `local_id` | string |  | Lokale Patient-ID (BIH/Charité). Optional, einrichtungsspezifisch. | CS: patient-id | `identifier.where(system='http://fhir.bih-charite.de/sid/patient-id').value.fi…` |
| `family` | string |  | Nachname (use=official). |  | `name.where(use='official').family.first()` |
| `given` | string |  | Vorname (use=official, erster Given-Name). |  | `name.where(use='official').given.first()` |
| `maiden_name` | string |  | Geburtsname (use=maiden), optional. |  | `name.where(use='maiden').family.first()` |
| `gender` | string |  | Administratives Geschlecht (FHIR AdministrativeGender: male/female/other/unknown). |  | `gender` |
| `birth_date` | string |  | Geburtsdatum (ISO-8601, Tagesgenauigkeit). |  | `birthDate` |
| `deceased_date` | string |  | Sterbedatum, sofern dokumentiert. Leer wenn Patient:in lebt. |  | `deceasedDateTime` |
| `city` | string |  | Wohnort (erste Adresse). |  | `address.city.first()` |
| `postal_code` | string |  | PLZ (erste Adresse). |  | `address.postalCode.first()` |
| `country` | string |  | Land (ISO 3166). |  | `address.country.first()` |

## Senologie Procedure Flat View

- **View-ID:** `senologie-procedure-flat`
- **Resource:** `Procedure`
- **Beschreibung:** Alle Senologie-Prozeduren (Operation, Strahlentherapie, Systemtherapie) als flache Tabelle. Eine Zeile pro Procedure mit Patient, Diagnose-Bezug, Code (SCT + OPS-Subprozeduren als zweites coding), Datum, Status, R-Status, Intention. Subprozeduren mit partOf.exists()=true sind enthalten — fuer OP-Meldungs-Aggregation siehe SQL nachgelagert.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `procedure_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `reasonReference.first().id` |
| `part_of_id` | string |  | Wenn gesetzt = Subprozedur, sonst Hauptprozedur. |  | `partOf.first().id` |
| `code_sct` | code |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `code_sct_display` | string |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `code_ops` | code |  |  | CS: ops | `code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').code.first()` |
| `code_text` | string |  |  |  | `code.text` |
| `status` | string |  |  |  | `status` |
| `performed_date` | dateTime |  |  |  | `performedDateTime` |
| `performed_start` | string |  |  |  | `performedPeriod.start` |
| `performed_end` | string |  |  |  | `performedPeriod.end` |
| `outcome` | code |  | R-Status oder anderer Outcome-Code (R0/R1/R2/RX). |  | `outcome.coding.code.first()` |
| `intention` | code |  |  |  | `extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/mod…` |
| `category` | code |  |  |  | `category.coding.code.first()` |
| `profile` | string |  | Welches Senologie-Profil (operation/strahlentherapie/systemtherapie-procedure). |  | `meta.profile.first()` |

## Senologie TNM Flat View

- **View-ID:** `senologie-tnm-flat`
- **Resource:** `Observation`
- **Beschreibung:** TNM-Klassifikations-Observations (klinisch c/pathologisch p) als flache Tabelle. Eine Zeile pro TNM-Observation mit allen Komponenten T/N/M/L/V/Pn/G und UICC-Stage. Auf MII-Onko-TNM-Klassifikation-Profil gestuetzt.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `tnm_typ` | code |  | 21908-9=cTNM, 21902-2=pTNM. | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `t_kategorie` | code |  |  |  | `component.where(code.coding.code='21905-5').valueCodeableConcept.coding.code.…` |
| `n_kategorie` | code |  |  |  | `component.where(code.coding.code='21906-3').valueCodeableConcept.coding.code.…` |
| `m_kategorie` | code |  |  |  | `component.where(code.coding.code='21907-1').valueCodeableConcept.coding.code.…` |
| `l_kategorie` | code |  |  |  | `component.where(code.coding.code='33739-4').valueCodeableConcept.coding.code.…` |
| `v_kategorie` | code |  |  |  | `component.where(code.coding.code='33740-2').valueCodeableConcept.coding.code.…` |
| `pn_kategorie` | code |  |  |  | `component.where(code.coding.code='92837-4').valueCodeableConcept.coding.code.…` |
| `r_symbol` | code |  |  |  | `component.where(code.coding.code='33742-8' or code.coding.code='r-symbol').va…` |
| `uicc_stage` | code |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `status` | string |  |  |  | `status` |

## Senologie Tumorboard Flat View

- **View-ID:** `senologie-tumorboard-flat`
- **Resource:** `CarePlan`
- **Beschreibung:** Tumorboard-Empfehlungen (CarePlan) als flache Tabelle. Pro CarePlan ist je activity eine eigene Zeile zu joinen — diese View ist die Header-Tabelle; Detail-Auswertung via SQL JOIN auf forEach activity.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `careplan_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `addresses.first().id` |
| `status` | string |  |  |  | `status` |
| `intent` | string |  |  |  | `intent` |
| `period_start` | string |  |  |  | `period.start` |
| `title` | string |  |  |  | `title` |
| `description` | string |  |  |  | `description` |
| `note_text` | string |  |  |  | `note.text.first()` |
| `activity_kind` | string |  |  |  | `detail.kind` |
| `activity_code_sct` | code |  |  | CS: SNOMED CT | `detail.code.coding.where(system='http://snomed.info/sct').code.first()` |
| `activity_code_display` | string |  |  | CS: SNOMED CT | `detail.code.coding.where(system='http://snomed.info/sct').display.first()` |
| `activity_status` | string |  |  |  | `detail.status` |
| `activity_empfehlung_status` | code |  | Empfohlen / bedingt-empfohlen / nicht-empfohlen / nicht-diskutiert. | CS: tumorboard-empfehlung | `detail.statusReason.coding.where(system='https://www.senologie.org/fhir/CodeS…` |
| `activity_description` | string |  | Begruendung des Tumorboards. |  | `detail.description` |

## Senologie Verlauf/Follow-Up Flat View

- **View-ID:** `senologie-verlauf-flat`
- **Resource:** `Observation`
- **Beschreibung:** Verlaufs-Observations (LOINC 88040-1 Response to cancer treatment) als flache Tabelle. RECIST-Response + Tumornachweis-Status + Lymphoedem-Grad + Allgemeinzustand pro Kontrolltermin.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `code_loinc` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `response_sct` | code |  | RECIST-Response (CR/PR/SD/PD). | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `response_display` | string |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').display.fi…` |
| `lokoregionaer_recurrence` | code |  |  |  | `component.where(code.coding.code='395709001').valueCodeableConcept.coding.cod…` |
| `metastasen_status` | code |  |  |  | `component.where(code.coding.code='373572006').valueCodeableConcept.coding.cod…` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `status` | string |  |  |  | `status` |
