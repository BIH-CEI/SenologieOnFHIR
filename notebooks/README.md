# Senologie Analyse-Notebook

Das Notebook [`senologie-analyse.ipynb`](./senologie-analyse.ipynb) führt die sechs
SQL-on-FHIR-v2-[ViewDefinitions](../input/fsh/views/) gegen die synthetische
12-Patientinnen-Kohorte (177 FHIR-Ressourcen) aus und zeigt sieben exemplarische
Kohortenauswertungen.

Es unterstützt drei austauschbare Ausführungsmodi, die oben in der Zelle
`mode-selector` über die Variable `EXECUTION_MODE` gewählt werden. Alle
Analysezellen weiter unten sind modusunabhängig identisch.

## Voraussetzungen (eine Option wählen)

### Option 1: Pathling via Docker (empfohlen)

Startet einen Pathling-FHIR-Server auf Port 8090 und lädt die
FSH-generierten Beispielressourcen dorthin.

```bash
# Einmalig: Pathling-Container starten
docker compose -f docker-compose.pathling.yaml up -d

# Einmalig: Beispielressourcen laden
python3 scripts/load-to-pathling.py

# Abhängigkeiten für das Notebook
pip install pandas matplotlib seaborn requests
```

Im Notebook:

```python
EXECUTION_MODE = "docker"
PATHLING_URL   = "http://localhost:8091/fhir"
```

### Option 2: Pathling als Python-Library

Kein Docker nötig — Pathling läuft als eingebettetes Spark lokal im
Kernel und liest die Bundles direkt aus `fsh-generated/resources/`.

```bash
pip install pathling pandas matplotlib seaborn requests
```

Im Notebook:

```python
EXECUTION_MODE = "python"
RESOURCES_DIR  = Path("../fsh-generated/resources")
```

> Hinweis: `pathling` benötigt eine lokale Java-Runtime (JDK 17 empfohlen).

### Option 3: Custom FHIRPath Evaluator (Fallback)

Kein Pathling, kein Spark, kein Docker — nutzt den im Notebook enthaltenen
Mini-FHIRPath-Runner. Ressourcen werden entweder vom HAPI-Testserver
(Port 8095) oder direkt aus `fsh-generated/resources/` gelesen.

```bash
pip install pandas matplotlib seaborn requests
```

Im Notebook:

```python
EXECUTION_MODE = "custom"
HAPI_URL       = "http://localhost:8095/fhir"   # optional
RESOURCES_DIR  = Path("../fsh-generated/resources")
```

## Notebook starten

```bash
jupyter notebook senologie-analyse.ipynb
# oder
jupyter lab
```

## Was das Notebook zeigt

Nach der Auswahl des Modus und Ausführung aller Zellen stehen sechs
`pandas.DataFrame`s zur Verfügung (`df['PatientKohorte']`, `df['DiagnoseKohorte']`,
...) sowie sieben Beispielauswertungen:

1. Fallzahl pro Subtyp (HR+/HER2-, HER2+, TNBC, DCIS)
2. BET-Rate (brusterhaltend vs. Mastektomie)
3. R0-Rate aus OP-Outcomes
4. Altersverteilung der Patientinnen (Boxplot)
5. Therapie-Mix pro Subtyp (Chemo / endokrin / zielgerichtet / Immun)
6. Time-to-Treatment (Diagnose → OP)
7. Crosstab Subtyp × OP-Art

## Mode-Selector in der Notebook-Zelle anpassen

Die Zelle `mode-selector` (direkt nach dem Setup) enthält:

```python
EXECUTION_MODE = "docker"   # "docker" | "python" | "custom"

PATHLING_URL   = "http://localhost:8091/fhir"
HAPI_URL       = "http://localhost:8095/fhir"
RESOURCES_DIR  = Path("../fsh-generated/resources")
```

Bei Fehlern — etwa wenn Pathling oder Docker nicht verfügbar sind — einfach
auf `"custom"` wechseln; das Notebook bleibt lauffähig.

## Einmalige Einrichtung: Pathling-Modus in Notebook aktivieren

Falls die drei Ausführungsmodi im vorhandenen Notebook noch nicht integriert
sind (z.B. nach einem Checkout einer älteren Version), einmal ausführen:

```bash
python3 scripts/_patch_notebook_pathling.py
```

Das Skript ist idempotent und erweitert `senologie-analyse.ipynb` um den
Mode-Selector sowie die Pathling-Zweige (Docker + Python). Die Analysezellen
bleiben unverändert.

## Verwandte Dateien

- [`../input/fsh/views/`](../input/fsh/views/) — die sechs ViewDefinitions
- [`../docker-compose.pathling.yaml`](../docker-compose.pathling.yaml) — Pathling-Server
- [`../scripts/load-to-pathling.py`](../scripts/load-to-pathling.py) — Datenimport-Skript
- [`../scripts/_patch_notebook_pathling.py`](../scripts/_patch_notebook_pathling.py) — fügt die drei Ausführungsmodi in das Notebook ein
- [`../input/pagecontent/anwendungsfaelle-auswertung.md`](../input/pagecontent/anwendungsfaelle-auswertung.md) — IG-Seite zur Auswertung
