### Senologie-Biomarker-Erweiterungen — Backport-Vorschlag für MII Onkologie

Diese Seite dokumentiert die Senologie-Erweiterungen am MII-Onkologie-Mamma-Rezeptorstatus/HER2-Status und schlägt diese als Rückführung in den MII-Onko-Kerndatensatz vor.

#### Hintergrund

Aus klinisch-ärztlicher Sicht reicht die binäre Klassifikation positiv/negativ (oBDS-Slice) nicht aus, um aktuelle therapeutische Subgruppen wie **ER-low** und **HER2-low** (DESTINY-Breast04) auswertbar zu dokumentieren. Internationale Daten zu diesen Subgruppen liegen aus den USA und Schweden vor; vergleichbare deutsche Analysen sind durch die oBDS-Granularität nicht möglich.

MII Onko hat das Problem teilweise erkannt und liefert bereits einen **Leitlinien-Slice** als zweite Codierungsdimension:

| Profil | oBDS-Slice | Leitlinien-Slice |
|---|---|---|
| `MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen` | positiv / negativ / unbekannt | positiv / **gering-positiv** / negativ |
| `MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron` | positiv / negativ / unbekannt | positiv / **gering-positiv** / negativ |
| `MII_PR_Onko_Mamma_Her2neu_Status` | P / N / U | positiv / **HER2-low** / **HER2-ultralow** / negativ / equivocal |

→ ER-low und HER2-low sind also **bereits in MII Onko abbildbar**, aber im oBDS-Slice nicht. Wir empfehlen, den Leitlinien-Slice als bevorzugt zu kennzeichnen (Must-Support in den Senologie-Profilen).

#### Senologie-Erweiterungen über MII Onko hinaus

Die folgenden Werte sind in MII Onko Rezeptorstatus aktuell nicht vorgesehen, klinisch aber relevant. Die Senologie-Profile fügen sie als zusätzliche `Observation.component`-Slices ein und schlagen diese als Backport vor:

| Component-Code (`CS_Senologie_Biomarker`) | Datentyp | Profil | Zweck |
|---|---|---|---|
| `irs-score` | Quantity (0–12, `{score}`) | ER, PR | Immunreaktiver Score nach Remmele-Stegner (DE-Standard) |
| `allred-score` | Quantity (0–8, `{score}`) | ER, PR | Allred Score (international, S3-Leitlinie) |

#### HER2-ISH-Reflextestung — bereits in MII MTB abgebildet

Die quantitative ISH-Reflextestung (FISH/CISH/DISH) gehört konzeptuell zum HER2-Status, aber FHIR-technisch zum **MII Modul MTB**, nicht Onko. MII MTB hat bereits ein dediziertes Profil:

`MII_PR_MTB_INSITUHYBRIDIZATION_HER2` (basiert auf LOINC Panel 74885-5):
- `value[x]:valueRatio` → HER2/CEP17 Ratio
- `component:target-signals` → ERBB2-Signale/Zellkern
- `component:reference-signals` → CEP17-Signale/Zellkern
- `component:cells-counted` → Anzahl gezählter Zellkerne
- `component:gene-studied` → HGNC HER2/ERBB2

→ Senologie definiert hier **kein** eigenes Profil — der HER2-IHC-Befund (`Senologie_HER2_Status`) verweist via `Observation.hasMember` auf die MII-MTB-ISH-Observation, wenn bei IHC 2+ eine Reflextestung erfolgt ist.

#### Resultierende Senologie-Profile

- `Senologie_ER_Status` ← erbt `MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen` (+ IRS, Allred)
- `Senologie_PR_Status` ← erbt `MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron` (+ IRS, Allred)
- `Senologie_HER2_Status` ← erbt `MII_PR_Onko_Mamma_Her2neu_Status` (IHC-Anteil; verweist via `hasMember` auf MII MTB ISH bei Reflextestung)

#### Backport-Empfehlung an MII Onko

1. **`AnteilPositiveZellen`-Component verpflichtend machen** bei Verwendung des Leitlinien-Slice (sonst ist ER-low nicht ableitbar).
2. **`IRS`- und `Allred`-Component** in MII Onko Rezeptorstatus-Profile aufnehmen (analog zu den Senologie-Component-Slices).
3. **Leitlinien-Slice MS-markieren** und in der Profil-Doku als bevorzugt empfehlen.
4. **Verknüpfung zu MII MTB ISH** in der MII Onko HER2-Profil-Doku dokumentieren (Workflow: IHC 0/1+/3+ → fertig; IHC 2+ → ISH-Reflex via MII MTB).

Diese Vorschläge wurden ärztlich angeregt und sind durch klinische Use Cases (HER2-low T-DXd-Therapie, ER-low-Studien) belegt.
