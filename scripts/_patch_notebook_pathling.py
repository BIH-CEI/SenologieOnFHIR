#!/usr/bin/env python3
"""One-shot helper: patches notebooks/senologie-analyse.ipynb to add
Pathling execution modes (docker server + python library) alongside the
existing custom FHIRPath evaluator.

Idempotent: running it twice is safe.
Usage:
    python3 scripts/_patch_notebook_pathling.py
"""
from __future__ import annotations
import json
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
NB_PATH = REPO / "notebooks" / "senologie-analyse.ipynb"


def as_source(text: str) -> list[str]:
    lines = text.split("\n")
    out: list[str] = []
    for i, ln in enumerate(lines):
        if i < len(lines) - 1:
            out.append(ln + "\n")
        else:
            if ln != "":
                out.append(ln)
    return out


def main() -> int:
    nb = json.loads(NB_PATH.read_text(encoding="utf-8"))

    def find_idx(cell_id: str) -> int:
        for i, c in enumerate(nb["cells"]):
            if c.get("id") == cell_id:
                return i
        raise KeyError(cell_id)

    def set_source(cell_id: str, text: str) -> None:
        nb["cells"][find_idx(cell_id)]["source"] = as_source(text)

    def ensure_cell_after(anchor_id: str, new_cell: dict) -> None:
        if any(c.get("id") == new_cell["id"] for c in nb["cells"]):
            # already present; update source in place so re-runs stay current
            nb["cells"][find_idx(new_cell["id"])]["source"] = new_cell["source"]
            return
        idx = find_idx(anchor_id)
        nb["cells"].insert(idx + 1, new_cell)

    def mkmd(cell_id: str, text: str) -> dict:
        return {
            "cell_type": "markdown",
            "id": cell_id,
            "metadata": {},
            "source": as_source(text),
        }

    def mkcode(cell_id: str, text: str) -> dict:
        return {
            "cell_type": "code",
            "execution_count": None,
            "id": cell_id,
            "metadata": {},
            "outputs": [],
            "source": as_source(text),
        }

    # 1) Title / intro: document the 3 execution modes.
    set_source(
        "title",
        """# Senologie-Kohortenanalyse (SQL on FHIR)

Dieses Notebook demonstriert die Auswertung der synthetischen Senologie-Kohorte (12 Patientinnen, 177 Ressourcen) \u00fcber die sechs **SQL-on-FHIR v2 `ViewDefinition`**-Artefakte des IG (`input/fsh/views/*.json`).

## Ausf\u00fchrungsmodi

Das Notebook unterst\u00fctzt drei austauschbare Ausf\u00fchrungsmodi f\u00fcr die ViewDefinitions. Der Modus wird in Zelle **`mode-selector`** (weiter unten) per Variable `EXECUTION_MODE` gew\u00e4hlt; alle folgenden Zellen arbeiten modusunabh\u00e4ngig identisch:

| Modus | `EXECUTION_MODE` | Engine | Voraussetzungen |
|---|---|---|---|
| **1 \u2014 Pathling Docker** *(empfohlen)* | `\"docker\"` | Pathling FHIR Server (`$run` auf `ViewDefinition`) | `docker compose -f docker-compose.pathling.yaml up -d` + `python3 scripts/load-to-pathling.py` |
| **2 \u2014 Pathling Python** | `\"python\"` | `pathling.PathlingContext` (lokales Spark) | `pip install pathling pandas` |
| **3 \u2014 Custom Evaluator** *(Fallback)* | `\"custom\"` | Im Notebook enthaltener Mini-FHIRPath-Runner | nur `pandas`, `requests` \u2014 kein Docker, kein Spark |

> [Pathling](https://pathling.csiro.au/) ist die quelloffene SQL-on-FHIR-Engine von CSIRO (Apache-2.0). Beide Pathling-Varianten f\u00fchren die 6 ViewDefinitions identisch aus; Modus 3 bleibt als leichtgewichtiger Fallback erhalten und nutzt den HAPI-Testserver auf `http://localhost:8095/fhir` bzw. direkt die JSON-Ressourcen aus `fsh-generated/resources/`.

Schritt-f\u00fcr-Schritt-Anleitung zu den drei Modi: siehe `notebooks/README.md`.""",
    )

    # 2) Add mode-selector cells right after imports.
    ensure_cell_after(
        "imports",
        mkmd(
            "mode-selector-header",
            """### 0a. Ausf\u00fchrungsmodus w\u00e4hlen

`EXECUTION_MODE` bestimmt, welche Engine die ViewDefinitions ausf\u00fchrt. Bei Problemen mit Docker oder Pathling einfach auf `\"custom\"` setzen \u2014 die Analysezellen weiter unten sind identisch.""",
        ),
    )
    ensure_cell_after(
        "mode-selector-header",
        mkcode(
            "mode-selector",
            """# === Ausf\u00fchrungsmodus ========================================================
# \"docker\"  -> Pathling FHIR Server (via docker-compose.pathling.yaml)
# \"python\"  -> Pathling Python-Bibliothek (lokales Spark, ben\u00f6tigt `pip install pathling`)
# \"custom\"  -> Im Notebook enthaltener FHIRPath-Mini-Runner (Fallback, kein Pathling)
EXECUTION_MODE = \"docker\"

# Endpunkte / Pfade je nach Modus -- bei Bedarf hier anpassen.
PATHLING_URL      = \"http://localhost:8090/fhir\"   # Mode 1 (docker)
HAPI_URL          = \"http://localhost:8095/fhir\"   # Mode 3 (custom, HAPI-Fallback)
RESOURCES_DIR     = Path(\"../fsh-generated/resources\")  # Mode 2 + Mode 3 (Datei-Fallback)

assert EXECUTION_MODE in {\"docker\", \"python\", \"custom\"}, EXECUTION_MODE
print(f\"EXECUTION_MODE = {EXECUTION_MODE!r}\")
if EXECUTION_MODE == \"docker\":
    print(f\"  Pathling server: {PATHLING_URL}\")
elif EXECUTION_MODE == \"python\":
    print(f\"  Pathling Python-Lib, Bundles aus: {RESOURCES_DIR.resolve()}\")
else:
    print(f\"  Custom Runner, Ressourcen aus: {HAPI_URL} (Fallback auf {RESOURCES_DIR.resolve()})\")""",
        ),
    )

    # 3) Replace fetch-code: mode-aware resource loading.
    set_source(
        "fetch-code",
        """# Ressourcen-Ladepolitik je Modus:
#   - \"docker\": Pathling hat die Ressourcen bereits per scripts/load-to-pathling.py
#     bekommen; hier wird nur die Erreichbarkeit gepr\u00fcft.
#   - \"python\": die Pathling-Bibliothek liest die Bundles direkt aus RESOURCES_DIR.
#   - \"custom\": Ressourcen werden hier in einen In-Memory-Cache geladen, wahlweise
#     vom HAPI-Testserver oder direkt aus den FSH-generated JSON-Dateien.

RESOURCE_CACHE: Dict[str, List[dict]] = {}
required_types = sorted({vd['resource'] for vd in VIEWS.values()})

def _load_from_files(resources_dir: Path) -> Dict[str, List[dict]]:
    cache: Dict[str, List[dict]] = {rt: [] for rt in required_types}
    for p in sorted(resources_dir.glob('*.json')):
        try:
            res = json.loads(p.read_text())
        except Exception:
            continue
        rt = res.get('resourceType')
        if rt in cache:
            cache[rt].append(res)
    return cache

def _load_from_hapi(base: str) -> Dict[str, List[dict]]:
    cache: Dict[str, List[dict]] = {}
    for rt in required_types:
        url = f'{base}/{rt}?_count=200'
        acc: List[dict] = []
        while url:
            r = requests.get(url, headers={'Accept': 'application/fhir+json'}, timeout=30)
            r.raise_for_status()
            bundle = r.json()
            for entry in bundle.get('entry', []) or []:
                res = entry.get('resource')
                if res:
                    acc.append(res)
            url = next((l['url'] for l in bundle.get('link', []) if l.get('relation') == 'next'), None)
        cache[rt] = acc
    return cache

if EXECUTION_MODE == 'docker':
    r = requests.get(f'{PATHLING_URL}/metadata', headers={'Accept': 'application/fhir+json'}, timeout=10)
    r.raise_for_status()
    print(f'Pathling erreichbar: {PATHLING_URL} (CapabilityStatement OK)')
elif EXECUTION_MODE == 'python':
    if not RESOURCES_DIR.is_dir():
        raise FileNotFoundError(f'RESOURCES_DIR nicht gefunden: {RESOURCES_DIR.resolve()}')
    print(f'Pathling Python-Lib wird Bundles aus {RESOURCES_DIR.resolve()} lesen.')
else:  # custom
    try:
        RESOURCE_CACHE = _load_from_hapi(HAPI_URL)
        src = f'HAPI ({HAPI_URL})'
    except Exception as err:
        print(f'HAPI nicht erreichbar ({err}); fallback auf Dateien.')
        RESOURCE_CACHE = _load_from_files(RESOURCES_DIR)
        src = f'Dateien ({RESOURCES_DIR.resolve()})'
    for rt in required_types:
        print(f'{rt:20s}  {len(RESOURCE_CACHE.get(rt, [])):4d} Ressourcen  [{src}]')""",
    )

    # 4) Replace materialize-code: dispatch per mode.
    set_source(
        "materialize-code",
        """# View-Materialisierung je Modus.
# Alle drei Zweige produzieren dasselbe: ein Dict `df` mit pandas-DataFrames
# pro ViewDefinition-Name. Die Analysezellen weiter unten arbeiten darauf.

df: Dict[str, pd.DataFrame] = {}

def _run_view_pathling_server(vd: dict) -> pd.DataFrame:
    '''Mode 1: Pathling FHIR Server -- POST /ViewDefinition/$run.'''
    params = {
        'resourceType': 'Parameters',
        'parameter': [{'name': 'viewResource', 'resource': vd}],
    }
    r = requests.post(
        f'{PATHLING_URL}/ViewDefinition/$run',
        json=params,
        headers={
            'Content-Type': 'application/fhir+json',
            'Accept': 'application/json',
        },
        timeout=120,
    )
    r.raise_for_status()
    # $run response handling -- Pathling returns JSON rows or a Parameters wrapper.
    try:
        body = r.json()
    except ValueError:
        rows = [json.loads(line) for line in r.text.splitlines() if line.strip()]
        return pd.DataFrame(rows)
    if isinstance(body, list):
        return pd.DataFrame(body)
    if body.get('resourceType') == 'Parameters':
        for p in body.get('parameter', []) or []:
            if p.get('name') in ('result', 'rows'):
                if 'resource' in p and p['resource'].get('resourceType') == 'Bundle':
                    rows = [e.get('resource') or {} for e in p['resource'].get('entry', []) or []]
                    return pd.DataFrame(rows)
                if 'valueString' in p:
                    rows = [json.loads(line) for line in p['valueString'].splitlines() if line.strip()]
                    return pd.DataFrame(rows)
    if body.get('resourceType') == 'Bundle':
        rows = [e.get('resource') or {} for e in body.get('entry', []) or []]
        return pd.DataFrame(rows)
    return pd.DataFrame([body])

def _run_views_pathling_python() -> Dict[str, pd.DataFrame]:
    '''Mode 2: pathling.PathlingContext -- lokales Spark.'''
    from pathling import PathlingContext  # lazy import
    pc = PathlingContext.create()
    data = pc.read.bundles(
        str(RESOURCES_DIR.resolve()),
        resource_types=sorted({vd['resource'] for vd in VIEWS.values()}),
    )
    out: Dict[str, pd.DataFrame] = {}
    for name, vd in VIEWS.items():
        spark_df = pc.view.execute(vd, data)
        out[name] = spark_df.toPandas() if hasattr(spark_df, 'toPandas') else pd.DataFrame(spark_df)
    return out

if EXECUTION_MODE == 'docker':
    for name, vd in VIEWS.items():
        df[name] = _run_view_pathling_server(vd)
        print(f\"{name:28s}  rows={len(df[name]):4d}  cols={len(df[name].columns)}  [pathling-docker]\")
elif EXECUTION_MODE == 'python':
    df = _run_views_pathling_python()
    for name in VIEWS:
        print(f\"{name:28s}  rows={len(df[name]):4d}  cols={len(df[name].columns)}  [pathling-python]\")
else:  # custom
    for name, vd in VIEWS.items():
        resources = RESOURCE_CACHE.get(vd['resource'], [])
        df[name] = run_view(vd, resources)
        print(f\"{name:28s}  rows={len(df[name]):4d}  cols={len(df[name].columns)}  [custom]\")

# Alle Engines liefern `patientId` mit/ohne 'Patient/'-Pr\u00e4fix -- hier normalisieren,
# damit die Analysezellen weiter unten mit allen Modi funktionieren.
for key in ('DiagnoseKohorte', 'OperationenKohorte', 'PathologieKohorte', 'SystemtherapieKohorte', 'TumorboardKohorte'):
    if key in df and 'patientId' in df[key].columns:
        df[key]['patientId'] = df[key]['patientId'].astype(str).str.replace(r'^Patient/', '', regex=True)""",
    )

    NB_PATH.write_text(json.dumps(nb, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"patched {NB_PATH}")
    print(f"cells: {len(nb['cells'])}")
    for i, c in enumerate(nb["cells"][:14]):
        print(f"  {i:2d} [{c['cell_type']:8s}] id={c.get('id')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
