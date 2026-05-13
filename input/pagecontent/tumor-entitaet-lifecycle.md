### Tumor-Entitäts-Lifecycle (BodyStructure-Anker)

Die Senologie-IG nutzt `BodyStructure`-Ressourcen als **stabile Anker für
Tumor-Entitäten** über die gesamte Krankheits-Trajektorie. Damit lassen sich
Befund, Biopsie, OP, Therapie-Ansprechen und Follow-up jeweils einer
**konkreten Läsion** zuordnen — und nicht nur einer generischen Diagnose oder
einer "Seite".

#### Warum eine eigene Resource pro Tumor?

```
Patient
  │
  ├ Condition (Mammakarzinom)              ← Krankheits-Entität
  │
  ├ BodyStructure #1 (Tumor rechts UAQ)    ← Tumor-Entität 1
  │   │ identifier = senologie/tumor-entity|uuid-1
  │   │ active     = true
  │   ├ ← Observation (Bildgebung BI-RADS-Befund)
  │   ├ ← Specimen (Stanzbiopsie)
  │   ├ ← Procedure (Operation)
  │   └ ← Observation (Verlauf: Response Assessment)
  │
  └ BodyStructure #2 (Lebermetastase)      ← Tumor-Entität 2
      ...
```

Vorteile:
- **RECIST-1.1-konformes Per-Läsion-Tracking** (jeder Tumor hat seine eigene
  Größen-Trajectory und sein eigenes Response-Assessment)
- **Reference-Stabilität**: alle Folge-Resources zeigen auf die gleiche BS,
  auch wenn die Tumor-Lage detaillierter beschrieben wird
- **Multi-Tumor-Konsistenz**: bei multifokalen oder bilateralen Karzinomen
  bleibt die Datenmodellierung sauber
- **Forward-Kompatibilität R5**: Die R4-`BodyStructure` mit
  R5-Backport-Extension (`extension-BodyStructure.includedStructure`) lässt
  sich nahtlos auf das R5-Native-Modell mit `includedStructure`,
  `bodyLandmarkOrientation` und `clockFacePosition` migrieren.

#### Wann entsteht eine BodyStructure?

| Trigger-Event | BodyStructure-Aktion |
|---|---|
| **Bildgebung detektiert Herdbefund** | **NEW** — Bildgebung-Form erzeugt BS mit Lokalisation (Seite + Quadrant + Uhrzeit + Mamillenabstand) |
| **Stanzbiopsie / Vakuumbiopsie** | bleibt unverändert (`active=true`) — Stanze ist nur Probe, Tumor bleibt erhalten |
| **OP-Resektion R0** | `PUT active=false` — Tumor komplett entfernt |
| **OP-Resektion R1 / R2** | bleibt `active=true` — Rest-Tumor mikroskopisch (R1) oder makroskopisch (R2) verblieben |
| **OP-Resektion RX** | bleibt `active=true` (Status unbestimmt, vorsichtshalber aktiv) |
| **ypT0** (komplette pathologische Remission nach neoadjuvanter Therapie) | `PUT active=false` — pathologisch kein Tumor mehr nachweisbar |
| **Lokalrezidiv am alten Ort** | **NEW** mit `partOf` → alte BS — biologisch neuer Tumor (Klon-Selektion), eigene Trajectory |
| **Detektion einer Metastase** | **NEW** — eigene anatomische Lokalisation, eigener Anker |

#### Persistenz-Mechanismen

```
identifier[tumor-entity]   = stabile, opake ID — bleibt auch bei active=false
_history                   = FHIR-native Resource-Versionierung — alle Zustands-
                             wechsel (active=true → false → true bei späterem
                             Update) bleiben auditierbar abrufbar
partOf / derivedFrom       = explizite Lineage bei Rezidiv-Modellierung
                             (neue BS verweist auf die ursprüngliche)
```

#### Rezidiv-Modellierung — `replaces`

```
BodyStructure-1            BodyStructure-2 (Lokalrezidiv 2026)
  identifier  uuid-1         identifier  uuid-2 (neu)
  active      false  ◄────── replaces    Reference(BodyStructure/uuid-1)
  (resected 2024)            active      true
```

Eine **neue BodyStructure** für das Rezidiv, mit `replaces`-Referenz (als
Extension auf der R4-BodyStructure) auf die ursprüngliche. Das Rezidiv ist
**biologisch eine neue Entität** (Klon-Selektion), die das alte Tumor-Konzept
im klinischen Management ablöst — daher `replaces` und nicht `partOf` oder
`derivedFrom`.

Vorteile:
- Aussage "Wie viele Lokalrezidive an dieser Seite?" via `replaces`-Kettenlänge
- Eigene Trajectory für das Rezidiv (Größe, Response, etc.)
- Pause-Phase zwischen R0 und Rezidiv (BS-1 `active=false`) bleibt sichtbar

Alternative `_history`-Reaktivierung (BS-1 wieder auf `active=true`) **wird
nicht empfohlen**, weil sie diese Eigenschaften verliert.

#### R1/R2 + Nachresektat — Specimen-Sequenz, gleiche BS

Jeder Eingriff erzeugt ein **eigenes `Specimen`** mit eigenem Datum und
Procedure-Kontext. Die `BodyStructure` bleibt dabei dieselbe Tumor-Entität,
die durch mehrere Specimens bemustert wird:

```
BodyStructure-1 (Tumor links UAQ)                ← 1 Tumor-Entität
   ▲   ▲   ▲   (collection.bodySite.extension → BS-1)
   │   │   │
Specimen-1 (Stanze 03/2024)                       ← Specimen-Sequenz, N:1 zu BS
Specimen-2 (BET-Resektat 05/2024) → R1            ← BS bleibt active=true
Specimen-3 (Nachresektat 06/2024) → R0            ← BS wird dann active=false
```

**Konsequenzen:**
- **R-Status** wird pro **Specimen** dokumentiert (Patho-Observation `Senologie_Resektionsstatus` oder als Procedure.outcome an der OP)
- **BS-`active`-Flipping** passiert nicht beim R1-Befund selbst, sondern erst
  beim **letzten Specimen das R0 ergibt** (oder dauerhaft `true`, falls
  Nachresektion klinisch nicht durchgeführt wurde / R2 oder palliativ
  belassen wurde)
- **Keine Sub-BodyStructure für Residualtumor** — die Tumor-Entität ist eine
  Identität, nicht ein anatomischer Volumen-Bereich

Ein Nachresektat referenziert dieselbe `BodyStructure` wie das primäre
Resektat. Die BS-Description kann nach dem R1-Befund optional erweitert
werden ("…Residualtumor im superioren Rand…"), ist aber für die FHIR-Logik
nicht zwingend.

#### Multi-Läsion-Updates in einem Eingriff

Beim Form-Submission (z.B. nach OP mit Resektion mehrerer Foci) wird ein
einziges Transaction-Bundle posted, das mehrere BS-PUT-Updates und die neue
Procedure atomar einspielt:

```json
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    { "request": {"method": "PUT", "url": "BodyStructure/uuid-1"},
      "resource": {"resourceType": "BodyStructure", "active": false, ...}},
    { "request": {"method": "PUT", "url": "BodyStructure/uuid-2"},
      "resource": {"resourceType": "BodyStructure", "active": false, ...}},
    { "request": {"method": "POST", "url": "Procedure"},
      "resource": {"resourceType": "Procedure", "...": "..."}}
  ]
}
```

#### Workflow im IG

**1. Erst-Detektion** (Bildgebung-Form):
- Form erzeugt neue `BodyStructure` per detektierter Läsion
- `identifier[tumor-entity]` = generierte UUID
- Lokalisation (Seite + Quadrant + Uhrzeit + Mamillenabstand) via R5-Backport
- `active = true`

**2. Biopsie / Patho** (Pathologie-Form):
- User picked existierende BodyStructure(s) via `candidateExpression`
  (`BodyStructure?patient={{%patient.id}}&active=true`)
- Specimen.collection.bodySite.extension verweist auf BS
- BS bleibt `active=true`

**3. Operation** (OP-Planung + Postop-Form):
- User picked die zu operierenden BS
- Procedure entsteht, referenziert via `focalDevice` oder eigener Extension
- Postop-Form fragt R-Status pro BS ab
- Template erzeugt PUT-Update auf jede BS:
  - R0 → `active = false`
  - R1 / R2 / RX → `active = true`

**4. Verlauf / Restaging** (Verlauf-Form):
- User picked Tumor(e), die aktuell beurteilt werden — `candidateExpression`
  filtert auf `active=true` (also die noch vorhandenen Tumoren)
- Per BS eine Verlaufs-Observation mit Response-Status (CR/PR/SD/PD/Mixed)

**5. Rezidiv-Detektion** (Bildgebung-Form, erneut):
- User detektiert neue Läsion am alten Ort
- Form erzeugt **neue BodyStructure**, setzt `partOf` auf die alte (deren `active=false`)
- Damit beginnt ein neuer Rezidiv-Zyklus

#### Konsequenzen für die externen Meldewege

| Spec | Implikation |
|---|---|
| **oBDS Modul-Mamma** | Tumor-Position aus aktuell-aktiver BS auslesen; bei Rezidiv-Meldung über `partOf` zur Original-Diagnose-BS aufrollen |
| **OncoBox Brust 2.0** | Pro `Histologie`-Eintrag eine BS-Referenz; mehrere Histologien = mehrere BS |
| **IRegG (Implantatregister)** | Implantate sind eigene `Device`-Resources, **nicht** BodyStructure — separates Lifecycle-Modell |
| **IQTIG Modul 18n1** | LK-Status pro BS aggregierbar; Quadranten-Verteilung aus locationQualifier/Backport |

#### Reference-Integrität

Wenn eine BS auf `active=false` gesetzt wird, **bleiben alle alten Resource-
Referenzen valide** — Observations, Specimen, Procedures aus der Vergangenheit
zeigen weiter auf diese BS (in dem Zustand wie sie damals war, via
`_history`).

Neue Resource-Erfassung sollte die deaktivierte BS nicht mehr referenzieren —
außer für Update-Operationen wie das Setzen einer `derivedFrom` aus einer
neuen Rezidiv-BS.
