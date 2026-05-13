### Spec-Versionierung der Ausleitungen

Jede StructureMap zielt auf eine **konkrete Version** einer externen Spec.
Spec-Updates ⇒ neue/parallele StructureMap.

#### Aktuelle Target-Spec-Versionen (Senologie-IG 0.9.0)

| StructureMap | Target-Spec | XSD-Datei im Repo |
|---|---|---|
| `SenologieToObdsMeldung` | **oBDS XML v3.0.5** (22.09.2025) — abwärtskompatibel zu v3.0.1 | `input/data/obds-testdaten/oBDS_v3.0.5.xsd` |
| `SenologieToOncoBoxBrust` | **OncoBox Brust 2.0 v2.1.1** (Auditjahr 2026) | `input/data/oncobox-brust-2.0/oncobox-brust-2.0.xsd` |
| `SenologieToIqtigMammachirurgie181` | **IQTIG QS-Basisspez Spez 2026 V06**, Modul 18n1 | `input/data/iqtig-schema/interface_LE/2026_lqs_iv_1.0_Export.xsd` |
| `SenologieToIRegMeldung` | **IRegG XML-Spez V4.1.1** | `input/data/iregg-schema-v4.1.1/IRD_XML_Spezifikation.xsd` |

Diese Versionen sind im Header jeder Map als `targetSpec:`-Kommentar dokumentiert.

#### Vorgehen bei Spec-Updates

**Minor-Update (additiv, keine Breaking Changes):**

1. Schema-Datei austauschen (`input/data/<target>/.../*.xsd`)
2. `targetSpec:`-Kommentar in Map aktualisieren
3. Snapshot regenerieren — wenn unverändert: OK
4. Bei neuen Feldern: Map entsprechend erweitern

**Major-Update (Breaking Changes wie OncoBox 1.0 → 2.0):**

1. **Alte Map archivieren** als `<Name>-v1.x.map` (oder als deprecated kommentieren)
2. **Neue Map** für die neue Version parallel anlegen
3. Beide werden im IG mit unterschiedlichen URL-Versionen veröffentlicht
4. **LM** ggf. ebenfalls parallel halten (`obds-meldung-v3` / `obds-meldung-v4`)
5. Snapshots werden je Version separat geführt

Beispiel-Naming-Konvention für Mehr-Versionen-Koexistenz:
```
SenologieToOncoBoxBrust            (immer aktuelle Default-Version)
SenologieToOncoBoxBrust-v1-n111    (Legacy 1.0/N1.1.1)
SenologieToOncoBoxBrust-v2-211     (aktuell)
```

#### FHIR-Versionierungs-Mechanik

| Resource | Version-Feld | Wer setzt |
|---|---|---|
| StructureMap | implizit über IG-`PR_CS_VS_Version`-RuleSet | gemeinsam mit Senologie-IG |
| ConceptMap | `^version` via Insert-Block | gemeinsam mit Senologie-IG |
| Library (CQL) | im `library X version 'Y'`-Statement | manuell pro CQL-Datei |
| Measure | `^version` | manuell |
| `translate()`-Calls | Standardmäßig loose (URL ohne Version) | bei Bedarf strict: `'url\|0.9.0'` |

**Konvention:** Innerhalb eines IG-Release werden alle Senologie-Artefakte gemeinsam unter der IG-Version (z.B. `0.9.0`) veröffentlicht. Drittnutzer importieren das gesamte IG-Bundle und bekommen damit eine konsistent versionierte Sammlung.

#### Externe Specs nachladen (gitignored)

Die proprietären Excel-Spec-Files (oBDS-PDF, OncoBox-XLSX, IQTIG-Spec-Bundle) sind über `.gitignore` ausgeschlossen — nur XSDs und XML-Testdaten liegen im Repo. Download-URLs siehe `input/data/README.md`.
