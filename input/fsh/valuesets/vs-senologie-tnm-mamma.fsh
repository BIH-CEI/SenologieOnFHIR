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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-tnm-t-kategorie-mamma-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 17
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #TX
* ^expansion.contains[=].display = "TX — Primärtumor kann nicht beurteilt werden"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T0
* ^expansion.contains[=].display = "T0 — Kein Anhalt für Primärtumor"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #Tis
* ^expansion.contains[=].display = "Tis — Carcinoma in situ"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #Tis(DCIS)
* ^expansion.contains[=].display = "Tis (DCIS) — Ductales Carcinoma in situ"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #Tis(Paget)
* ^expansion.contains[=].display = "Tis (Paget) — M. Paget der Mamille ohne nachweisbaren Tumor"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T1
* ^expansion.contains[=].display = "T1 — Tumor ≤ 2 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T1mi
* ^expansion.contains[=].display = "T1mi — Mikroinvasion ≤ 0,1 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T1a
* ^expansion.contains[=].display = "T1a — > 0,1 cm und ≤ 0,5 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T1b
* ^expansion.contains[=].display = "T1b — > 0,5 cm und ≤ 1 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T1c
* ^expansion.contains[=].display = "T1c — > 1 cm und ≤ 2 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T2
* ^expansion.contains[=].display = "T2 — > 2 cm und ≤ 5 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T3
* ^expansion.contains[=].display = "T3 — > 5 cm"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T4
* ^expansion.contains[=].display = "T4 — jede Größe mit Ausdehnung auf Brustwand/Haut"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T4a
* ^expansion.contains[=].display = "T4a — Ausdehnung auf Brustwand"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T4b
* ^expansion.contains[=].display = "T4b — Hautulzeration / -ödem / Satellitenmetastasen"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T4c
* ^expansion.contains[=].display = "T4c — T4a + T4b"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #T4d
* ^expansion.contains[=].display = "T4d — Inflammatorisches Karzinom"

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-tnm-n-kategorie-mamma-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 14
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #NX
* ^expansion.contains[=].display = "NX — Regionäre LK können nicht beurteilt werden"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N0
* ^expansion.contains[=].display = "N0 — Keine regionären LK-Metastasen"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N1
* ^expansion.contains[=].display = "N1 — Bewegliche ipsilaterale axilläre LK Level I/II"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N1mi
* ^expansion.contains[=].display = "N1 (mi) — Mikrometastasen (> 0,2 mm und/oder > 200 Zellen, aber ≤ 2 mm)"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N1a
* ^expansion.contains[=].display = "N1a — 1–3 axilläre LK"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N1b
* ^expansion.contains[=].display = "N1b — Mammaria-interna-LK ohne axilläre"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N1c
* ^expansion.contains[=].display = "N1c — N1a + N1b"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N2
* ^expansion.contains[=].display = "N2 — Fixierte/verbackene axilläre oder klinisch erkennbare A. mammaria interna"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N2a
* ^expansion.contains[=].display = "N2a — 4–9 axilläre LK"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N2b
* ^expansion.contains[=].display = "N2b — Klinisch erkennbare Mammaria-interna-LK ohne axilläre"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N3
* ^expansion.contains[=].display = "N3 — Infraklavikuläre / supraklavikuläre / Kombinationen"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N3a
* ^expansion.contains[=].display = "N3a — ≥ 10 axilläre LK oder infraklavikuläre LK"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N3b
* ^expansion.contains[=].display = "N3b — Klinisch erkennbare A. mammaria interna + axilläre LK"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #N3c
* ^expansion.contains[=].display = "N3c — Supraklavikuläre LK"

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-tnm-m-kategorie-mamma-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #M0
* ^expansion.contains[=].display = "M0 — Keine Fernmetastasen"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #M1
* ^expansion.contains[=].display = "M1 — Fernmetastasen vorhanden"

ValueSet: VS_Senologie_UICC_Stadium_Mamma
Id: vs-senologie-uicc-stadium-mamma
Title: "VS Senologie UICC-Stadium (Mamma)"
Description: "UICC-Stadien für Mammakarzinom nach TNM 8 / AJCC 8. Primärkodierung über https://www.uicc.org/resources/tnm (MII_CS_Onko_TNM_UICC, auf MII-OntoServer verfügbar); alternativ SCT-Qualifier-Values (HDB-866). Binding: extensible."

* ^status = #draft
* insert PR_CS_VS_Version

// Primär: MII UICC-CS (https://www.uicc.org/resources/tnm, OntoServer: MII_CS_Onko_TNM_UICC 2025.1.0)
* $UICC#0     "Stadium 0 — Tis N0 M0"
* $UICC#IA    "Stadium IA — T1 N0 M0"
* $UICC#IB    "Stadium IB — T0/1 N1mi M0"
* $UICC#IIA   "Stadium IIA — T0/1 N1 M0 oder T2 N0 M0"
* $UICC#IIB   "Stadium IIB — T2 N1 M0 oder T3 N0 M0"
* $UICC#IIIA  "Stadium IIIA — T0–2 N2 M0 oder T3 N1/2 M0"
* $UICC#IIIB  "Stadium IIIB — T4 N0–2 M0"
* $UICC#IIIC  "Stadium IIIC — Jedes T N3 M0"
* $UICC#IV    "Stadium IV — Jedes T, jedes N, M1"

// Alternativ: SCT UICC-Qualifier-Values (HDB-866, Haroske)
* $SCT#1352916008 "0 (UICC)"
* $SCT#1352843004 "IA (UICC)"
* $SCT#1352911003 "IB (UICC)"
* $SCT#1352856006 "IIA (UICC)"
* $SCT#1352861008 "IIB (UICC)"
* $SCT#1352915007 "IIIA (UICC)"
* $SCT#1352896008 "IIIB (UICC)"
* $SCT#1352848008 "IIIC (UICC)"
* $SCT#1352913000 "IV (UICC)"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-08
* ^expansion.identifier = "urn:uuid:vs-senologie-uicc-stadium-mamma-expansion"
* ^expansion.timestamp = "2026-10-08T00:00:00Z"
* ^expansion.total = 18
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #0
* ^expansion.contains[=].display = "Stadium 0 — Tis N0 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IA
* ^expansion.contains[=].display = "Stadium IA — T1 N0 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IB
* ^expansion.contains[=].display = "Stadium IB — T0/1 N1mi M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IIA
* ^expansion.contains[=].display = "Stadium IIA — T0/1 N1 M0 oder T2 N0 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IIB
* ^expansion.contains[=].display = "Stadium IIB — T2 N1 M0 oder T3 N0 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IIIA
* ^expansion.contains[=].display = "Stadium IIIA — T0–2 N2 M0 oder T3 N1/2 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IIIB
* ^expansion.contains[=].display = "Stadium IIIB — T4 N0–2 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IIIC
* ^expansion.contains[=].display = "Stadium IIIC — Jedes T N3 M0"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #IV
* ^expansion.contains[=].display = "Stadium IV — Jedes T, jedes N, M1"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352916008
* ^expansion.contains[=].display = "0 (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352843004
* ^expansion.contains[=].display = "IA (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352911003
* ^expansion.contains[=].display = "IB (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352856006
* ^expansion.contains[=].display = "IIA (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352861008
* ^expansion.contains[=].display = "IIB (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352915007
* ^expansion.contains[=].display = "IIIA (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352896008
* ^expansion.contains[=].display = "IIIB (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352848008
* ^expansion.contains[=].display = "IIIC (UICC)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1352913000
* ^expansion.contains[=].display = "IV (UICC)"
