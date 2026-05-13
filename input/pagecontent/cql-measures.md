### Qualitätsindikatoren via CQL & FHIR Measure

Strukturdaten (Diagnose, OP, Biomarker, Verlauf) werden über StructureMaps in oBDS/OncoBox/IQTIG/IRegG ausgeleitet. **Qualitätsindikatoren und Kennzahlen** sind dagegen *Population-Aggregate* — sie werden mit **CQL** (Clinical Quality Language) und **FHIR Measure / MeasureReport** berechnet.

#### Architektur

```
FHIR Resources (Conditions, Procedures, Observations, …)
      │
      ▼
  ┌────────────────────────────────────────────┐
  │  Library (FHIR Resource)                   │
  │   content[].data = base64(CQL-Source)      │
  │   context Patient                          │
  │   define "HasMammaCa": exists([Condition]) │
  │   define "HasBET":     exists([Procedure]) │
  └─────────────┬──────────────────────────────┘
                │ referenced via .library
                ▼
  ┌────────────────────────────────────────────┐
  │  Measure (FHIR Resource)                   │
  │   group:                                   │
  │     initial-population: HasMammaCa         │
  │     denominator:        HasMammaCa         │
  │     numerator:          HasBET             │
  └─────────────┬──────────────────────────────┘
                │ POST /Measure/.../$evaluate-measure
                ▼
  ┌────────────────────────────────────────────┐
  │  MeasureReport                             │
  │   group.population.count                   │
  │   group.measureScore = numerator/denom     │
  └────────────────────────────────────────────┘
```

#### CQL-Libraries in diesem IG

| Library | Inhalt | Quelle |
|---|---|---|
| `QualitaetsindikatorenLeitlinie` | 17 QIs der S3-Leitlinie Mammakarzinom v5.0, Kapitel 8 | wissenschaftlich begründete Qualitätsindikatoren |
| `OncoBoxBrustKennzahlen` | KB-1 … KB-20 | OncoBox-Brust-2.0-Spec (Auditjahr 2026), DKG-Brustzentrums-Zertifizierung |
| `MinimalMeasureLib` | Trivial-Defines (immer `true`) + zwei reale Beispiele (`HasMammaCa`, `HasBET`) | Debug-Einstiegspunkt |

KB-Kennzahlen wiederverwenden wo möglich S3-QI-Defines (`include … called S3`).

#### Context: warum `Patient`?

Die CQL nutzt `context Patient`. Damit werden alle `[Condition]`/`[Procedure]`-Queries automatisch auf den jeweils evaluierten Patienten gefiltert, und die Measure-Engine kann pro Patient eine Boolean-Antwort ermitteln (in / nicht in der Population).

**FHIR-Alternativen:**

| Context | Anwendung | Status DE |
|---|---|---|
| `Patient` | pro Patientin eine Auswertung | aktuell genutzt ← |
| `EpisodeOfCare` | pro Erkrankungsepisode separate Auswertung (z.B. Primärtumor vs. Rezidiv) | semantisch sauberer, **aber noch keine normative EpisodeOfCare-Spezifikation in DE** (in Arbeit) |
| `Encounter` | pro Aufenthalt | wenig praktikabel bei chronischen Erkrankungen; **insbesondere ambulant aus HL7-v2-ADT-Strömen nicht zuverlässig ableitbar** (Patient-Encounter-Beziehungen werden in vielen KIS nur stationär/teilstationär konsistent geführt) |

Sobald ein deutscher Standard für `EpisodeOfCare` festgelegt ist, sollte die CQL auf `context EpisodeOfCare` umgestellt werden. Das ermöglicht, mehrere Episoden derselben Patientin (Primärerkrankung 2020, Lokalrezidiv 2025) getrennt auszuwerten — anstatt sie patient-weit zu kombinieren.

#### `$evaluate-measure` ausführen

Voraussetzungen:
- HAPI FHIR Server mit Clinical Reasoning (`hapi.fhir.cr_enabled=true`) — siehe `docker-compose.hapi.yaml`
- Library, Measure und Patient/Condition/Procedure-Resourcen geladen

```bash
# Population-weite Auswertung über alle Patientinnen
curl "http://localhost:8095/fhir/Measure/senologie-measure-minimal/\$evaluate-measure?\
periodStart=2025-01-01&periodEnd=2025-12-31&reportType=subject-list"

# Beispiel-Output (gekürzt):
#   group bet-bei-mamma-ca:
#     initial-population: 9   (Patientinnen mit Mamma-Ca)
#     denominator:        9
#     numerator:          4   (davon mit BET)
#     score:              0.44 (= 44 %)
```

> **Hinweis:** Bei `reportType=population` liefert HAPI's CR-Engine derzeit
> einen `count` von 1 statt der echten Population-Größe. Workaround:
> `reportType=subject-list` nutzen und die Anzahl der Einträge in der
> referenzierten `List` zählen.

#### Lessons Learned

- **`context Patient` ist zwingend** — sonst filtert die Engine nicht auf den aktuellen Patienten und alle Defines liefern global.
- **Define-Namen ohne Leerzeichen / deutsche Schlüsselwörter** (z.B. nicht `Has Invasive oder DCIS`, sondern `HasInvasiveOrDCIS`) — URL-Encoding und CQL-Parser sind dann robust.
- **Library-Version bei jeder CQL-Änderung bumpen** — sonst cached der Server die alte kompilierte ELM-Repräsentation.
- **HAPI ohne Volume = In-Memory** — Restart leert alle Daten, Library/Measure/Patient müssen erneut geladen werden. Für produktive Auswertung Volume-mounten oder Aidbox/Cosmos verwenden.
