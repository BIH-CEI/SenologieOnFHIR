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

Die folgenden Werte sind in MII Onko aktuell nicht vorgesehen, klinisch aber relevant. Die Senologie-Profile fügen sie als zusätzliche `Observation.component`-Slices ein und schlagen diese als Backport vor:

| Component-Code (`CS_Senologie_Biomarker`) | Datentyp | Profil | Zweck |
|---|---|---|---|
| `irs-score` | Quantity (0–12, `{score}`) | ER, PR | Immunreaktiver Score nach Remmele-Stegner (DE-Standard) |
| `allred-score` | Quantity (0–8, `{score}`) | ER, PR | Allred Score (international, S3-Leitlinie) |
| `her2-cen17-ratio` | Quantity (dimensionslos) | HER2 | HER2/CEN17-Ratio bei In-Situ-Hybridisierung; Cutoff ≥ 2.0 |
| `her2-copy-number` | Quantity | HER2 | Mittlere HER2-Gen-Kopienzahl pro Tumorzelle; Cutoff ≥ 6 |

#### Resultierende Senologie-Profile

- `Senologie_ER_Status` ← erbt `MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen`
- `Senologie_PR_Status` ← erbt `MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron`
- `Senologie_HER2_Status` ← erbt `MII_PR_Onko_Mamma_Her2neu_Status`

Implementierer, die nur MII Onko nutzen, können die Senologie-Components ignorieren oder als unstrukturierte Zusatzinformation behandeln. Wer ER-low / HER2-low quantitativ auswerten will, sollte die Senologie-Profile verwenden.

#### Backport-Empfehlung an MII Onko

1. **`AnteilPositiveZellen`-Component verpflichtend machen** bei Verwendung des Leitlinien-Slice (sonst ist ER-low nicht ableitbar).
2. **`IRS`- und `Allred`-Component** in MII Onko Rezeptorstatus-Profile aufnehmen (analog zu den Senologie-Component-Slices).
3. **`HER2/CEN17-Ratio`- und `Kopienzahl`-Component** in MII Onko HER2-Status aufnehmen.
4. **Leitlinien-Slice MS-markieren** und in der Profil-Doku als bevorzugt empfehlen.

Diese Vorschläge wurden ärztlich angeregt und sind durch klinische Use Cases (HER2-low T-DXd-Therapie, ER-low-Studien) belegt.
