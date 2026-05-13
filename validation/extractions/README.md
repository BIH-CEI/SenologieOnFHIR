# Extraction Snapshot Tests

Regression-Tests für die Ausleitungen aus der Senologie-IG in externe Standard-Datensätze:

| Ziel | StructureMap (Top-Level) | Status |
|---|---|---|
| **oBDS** (Onkologischer Basisdatensatz) | `SenologieToObdsMeldung` | aktiv |
| **OncoBox Brust** (DKG) | `SenologieToOncoBoxBrust` | geplant |
| **IQTIG QS 18.1** | `SenologieToIqtigMammachirurgie181` | geplant |
| **IRegG** (Implantatregister) | `SenologieToIRegMeldung` | geplant |

## Funktionsweise

1. Pro Fall ein Test-Bundle in `input/fall<N>.json` (Sammlung aller FHIR-Ressourcen aus Fall<N>)
2. Matchbox transformiert das Bundle via `StructureMap/$transform`
3. Output wird normalisiert (sortierte Keys, ohne volatile Metadaten) und mit `expected/<target>/fall<N>.json` verglichen
4. Bei Diff: Test schlägt fehl, Diff wird hochgeladen

## Lokal ausführen

```bash
# Einmalig: Matchbox + IG-Maps laden
docker compose -f docker-compose.matchbox.yaml up -d
./scripts/matchbox/load-ig.sh

# Test-Bundle aus Fall 1 bauen
python3 scripts/extractions/build-test-bundle.py 1

# oBDS-Test laufen lassen
./scripts/extractions/test-obds-snapshot.sh

# Snapshot neu schreiben (z.B. nach gewolltem Mapping-Update)
UPDATE_SNAPSHOTS=1 ./scripts/extractions/test-obds-snapshot.sh fall1
```

## Verzeichnisstruktur

```
validation/extractions/
├── input/                 ← Test-Bundles (Eingaben)
│   └── fall1.json
├── expected/              ← Geprüfte Snapshots
│   ├── obds/fall1.json
│   ├── oncobox/...
│   ├── iqtig/...
│   └── iregg/...
└── actual/                ← Letzter Test-Output (gitignored)
    └── obds/fall1.json
```

Snapshots werden mit jeder Mapping- oder LM-Änderung neu geprüft — Drift wird in PR sichtbar.
