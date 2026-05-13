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

## Senologie Diagnose Flat View

- **View-ID:** `senologie-diagnose-flat`
- **Resource:** `Condition`
- **Profil:** [senologie-diagnose-maligne](https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne)
- **Beschreibung:** Flache Tabelle aller senologischen Diagnose-Conditions (eine Zeile pro Condition mit Patient, SCT/ICD-10/Seite/Datum/Status). Eignet sich für Quick-Auswertungen und CSV-Export.

| Spalte | Typ | Card. | Bedeutung | Code-System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `condition_id` | string |  | Technische Condition-ID (FHIR `Condition.id`). |  | `id` |
| `patient_id` | Reference |  | Patient-ID (Subject-Reference ohne `Patient/`-Präfix). |  | `subject.reference.replaceMatches('Patient/', '')` |
| `diagnose_sct` | code | 1.. | SNOMED-CT Code der Diagnose. Gebunden an VS senologie-diagnose-mamma (24 Mamma-spezifische Codes, klinisch sortiert). | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `diagnose_display` | string |  | Diagnose | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `diagnose_icd10` | code | 1.. | ICD-10-GM Dual-Code (optional). Aus ConceptMap cm-senologie-diagnose-sct-to-icd10 abgeleitet. | CS: ICD-10-GM | `code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code.fi…` |
| `diagnose_custom_code` | code | 1.. | Senologie-spezifischer Code (z.B. mamillensekretion, bc-recurrence) wenn kein passender SCT-Code existiert. | CS: Senologie Diagnose-Mamma-Custom | `code.coding.where(system='https://www.senologie.org/fhir/CodeSystem/diagnose-…` |
| `seite_sct` | code |  | Seitenlokalisation als SNOMED-CT (24028007=rechts, 7771000=links, 51440002=beidseits). | CS: SNOMED CT | `bodySite.coding.where(system='http://snomed.info/sct').code.first()` |
| `seite_onko` | code |  | Seitenlokalisation nach MII Onko (R/L/B/M/T/U). Für oBDS-Export. | CS: MII Onko Seitenlokalisation | `bodySite.coding.where(system='https://www.medizininformatik-initiative.de/fhi…` |
| `clinical_status` | code |  | Klinischer Status (active/recurrence/remission/resolved). `recurrence` = Rezidiv auf derselben Condition. |  | `clinicalStatus.coding.code.first()` |
| `verification_status` | code |  | FHIR Verification-Status (confirmed/unconfirmed/provisional/differential). | CS: condition-ver-status | `verificationStatus.coding.where(system='http://terminology.hl7.org/CodeSystem…` |
| `diagnosesicherung_obds` | code |  | oBDS Diagnosesicherung 1-9 (1=klinisch, 2=Bildgebung, 5=Zytologie, 7=Histo-Primärtumor, …). MII Onko CodeSystem. | CS: MII Onko Diagnosesicherung | `verificationStatus.coding.where(system='https://www.medizininformatik-initiat…` |
| `onset_date` | dateTime |  | Erstdiagnose-Datum (Onset). Wird bei Rezidiv NICHT überschrieben. |  | `onsetDateTime` |
| `asserted_date` | string |  | Feststellungsdatum (z.B. Rezidiv-Feststellung). Onko-konform via condition-assertedDate Extension. |  | `extension.where(url='http://hl7.org/fhir/StructureDefinition/condition-assert…` |
| `recorded_date` | dateTime |  | Datum der Erfassung im System (Dokumentationszeitpunkt). |  | `recordedDate` |

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
