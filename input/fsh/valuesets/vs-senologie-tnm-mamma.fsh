// Senologie-spezifische TNM-ValueSets (Mammakarzinom, TNM 8th Edition, S3-Leitlinie).
//
// Die MII-Onko-TNM-ValueSets enthalten alle Tumorentitäten und sind für die
// Brustkrebs-Erfassung zu breit (T1c1, Tis(LAMN), N2c, IA1, MX usw. sind in der
// S3-Leitlinie Mammakarzinom irrelevant). Diese ValueSets engen die Codes auf
// die nach S3 Mamma 2024 zulässigen Werte ein.
//
// Code-System bleibt UICC: https://www.uicc.org/resources/tnm

Alias: $UICC = https://www.uicc.org/resources/tnm

// ============================================================================
// cT / pT — Mammakarzinom
// ============================================================================
ValueSet: VS_Senologie_TNM_T_Kategorie_Mamma
Id: vs-senologie-tnm-t-kategorie-mamma
Title: "VS Senologie TNM T-Kategorie (Mamma)"
Description: "T-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). Schließt T1c1-T1c3, T1d, Tis(LAMN/LCIS/pu/pd) und andere nicht-mammarelevante Codes der MII-Onko-Liste aus. Tis(LCIS) wird in TNM 8 für Mamma nicht mehr als Tis kodiert."

* ^status = #draft
* insert PR_CS_VS_Version

* $UICC#TX        "TX — Primärtumor kann nicht beurteilt werden"
* $UICC#T0        "T0 — Kein Anhalt für Primärtumor"
* $UICC#Tis       "Tis — Carcinoma in situ"
* $UICC#Tis(DCIS) "Tis (DCIS) — Ductales Carcinoma in situ"
* $UICC#Tis(Paget) "Tis (Paget) — M. Paget der Mamille ohne nachweisbaren Tumor"
* $UICC#T1        "T1 — Tumor ≤ 2 cm"
* $UICC#T1mi      "T1mi — Mikroinvasion ≤ 0,1 cm"
* $UICC#T1a       "T1a — > 0,1 cm und ≤ 0,5 cm"
* $UICC#T1b       "T1b — > 0,5 cm und ≤ 1 cm"
* $UICC#T1c       "T1c — > 1 cm und ≤ 2 cm"
* $UICC#T2        "T2 — > 2 cm und ≤ 5 cm"
* $UICC#T3        "T3 — > 5 cm"
* $UICC#T4        "T4 — jede Größe mit Ausdehnung auf Brustwand/Haut"
* $UICC#T4a       "T4a — Ausdehnung auf Brustwand"
* $UICC#T4b       "T4b — Hautulzeration / -ödem / Satellitenmetastasen"
* $UICC#T4c       "T4c — T4a + T4b"
* $UICC#T4d       "T4d — Inflammatorisches Karzinom"

// ============================================================================
// cN / pN — Mammakarzinom
// ============================================================================
ValueSet: VS_Senologie_TNM_N_Kategorie_Mamma
Id: vs-senologie-tnm-n-kategorie-mamma
Title: "VS Senologie TNM N-Kategorie (Mamma)"
Description: "N-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). N2c ist beim Mamma-Ca nicht vorgesehen und wurde ausgeschlossen."

* ^status = #draft
* insert PR_CS_VS_Version

* $UICC#NX    "NX — Regionäre LK können nicht beurteilt werden"
* $UICC#N0    "N0 — Keine regionären LK-Metastasen"
* $UICC#N1    "N1 — Bewegliche ipsilaterale axilläre LK Level I/II"
* $UICC#N1mi  "N1 (mi) — Mikrometastasen (> 0,2 mm und/oder > 200 Zellen, aber ≤ 2 mm)"
* $UICC#N1a   "N1a — 1–3 axilläre LK"
* $UICC#N1b   "N1b — Mammaria-interna-LK ohne axilläre"
* $UICC#N1c   "N1c — N1a + N1b"
* $UICC#N2    "N2 — Fixierte/verbackene axilläre oder klinisch erkennbare A. mammaria interna"
* $UICC#N2a   "N2a — 4–9 axilläre LK"
* $UICC#N2b   "N2b — Klinisch erkennbare Mammaria-interna-LK ohne axilläre"
* $UICC#N3    "N3 — Infraklavikuläre / supraklavikuläre / Kombinationen"
* $UICC#N3a   "N3a — ≥ 10 axilläre LK oder infraklavikuläre LK"
* $UICC#N3b   "N3b — Klinisch erkennbare A. mammaria interna + axilläre LK"
* $UICC#N3c   "N3c — Supraklavikuläre LK"

// ============================================================================
// cM / pM — Mammakarzinom (TNM 8 hat kein MX mehr)
// ============================================================================
ValueSet: VS_Senologie_TNM_M_Kategorie_Mamma
Id: vs-senologie-tnm-m-kategorie-mamma
Title: "VS Senologie TNM M-Kategorie (Mamma)"
Description: "M-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). MX wurde mit TNM 8 abgeschafft, M1a/b/c/d sind keine Mamma-Differenzierung."

* ^status = #draft
* insert PR_CS_VS_Version

* $UICC#M0  "M0 — Keine Fernmetastasen"
* $UICC#M1  "M1 — Fernmetastasen vorhanden"

// ============================================================================
// UICC-Stadium — Mammakarzinom
// ============================================================================
ValueSet: VS_Senologie_UICC_Stadium_Mamma
Id: vs-senologie-uicc-stadium-mamma
Title: "VS Senologie UICC-Stadium (Mamma)"
Description: "UICC-Stadien für Mammakarzinom nach TNM 8 / AJCC 8. Substadien IA1/2/3, IIA1/2, IIB1/2 sind nicht Mamma-relevant und werden ausgeschlossen."

* ^status = #draft
* insert PR_CS_VS_Version

* $UICC#0     "Stadium 0 — Tis N0 M0"
* $UICC#IA    "Stadium IA — T1 N0 M0"
* $UICC#IB    "Stadium IB — T0/1 N1mi M0"
* $UICC#IIA   "Stadium IIA — T0/1 N1 M0 oder T2 N0 M0"
* $UICC#IIB   "Stadium IIB — T2 N1 M0 oder T3 N0 M0"
* $UICC#IIIA  "Stadium IIIA — T0–2 N2 M0 oder T3 N1/2 M0"
* $UICC#IIIB  "Stadium IIIB — T4 N0–2 M0"
* $UICC#IIIC  "Stadium IIIC — Jedes T N3 M0"
* $UICC#IV    "Stadium IV — Jedes T, jedes N, M1"
