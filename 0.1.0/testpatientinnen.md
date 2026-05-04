# Alle Testpatientinnen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Beispielfall**](beispielfall.md)
* **Alle Testpatientinnen**

## Alle Testpatientinnen

# Testpatientinnen

Diese Seite beschreibt 12 synthetische Testfälle, die den gesamten Versorgungspfad in der Senologie exemplarisch abbilden. Die Fälle decken alle Brustkrebs-Subtypen, Stadien 0–IV, benigne Befunde und eine B3-Läsion ab. Sie dienen dazu, die FHIR-Profile dieses Implementierungsleitfadens zu veranschaulichen, zu validieren und als Grundlage für CQL-Qualitätsindikatoren zu nutzen.

**Gesamtumfang**: 208 FHIR-Instanzen über 12 Fälle, geladen auf HAPI FHIR (localhost:8095).

### Übersicht

| | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Erika Neumann | 60 | Invasiv NST | HR+/HER2- | IA | BET | Oncotype DX, Letrozol |
| 2 | Lena Hoffmann | 44 | Invasiv NST | TNBC | IV | Mastektomie | Neoadj+Immun, Progression, MTB |
| 3 | Sabine Weber | 72 | Invasiv NST | HR+/HER2- | IIA | Mastektomie | N1, ältere Patientin |
| 4 | Julia Fischer | 38 | Invasiv NST | HER2+ | IIB | BET | Neoadj TCHP, pCR |
| 5 | Monika Braun | 55 | Invasiv NST | HR+/HER2+ | IIIA | BET | Doppelt positiv, neoadjuvant |
| 6 | Petra Schneider | 67 | **DCIS** | ER+ | 0 | BET | Kein invasiv, Screening |
| 7 | Kathrin Müller | 48 | Invasiv NST | TNBC | IIA | BET | Neoadj, pCR |
| 8 | **Klaus Hartmann** | 69 | Invasiv NST | HR+/HER2- | IIA | Mastektomie | **Männlich**, Tamoxifen |
| 9 | Andrea Wolf | 51 | Invasiv lobulär | HR+/HER2- | IIIC | BET | N3(12/18),**Komplikation Lymphödem** |
| 10 | Christina Becker | 43 | Invasiv NST | TNBC | IA | Mastektomie bilat. | **BRCA1**, prophylaktisch +**2 Implantate** |
| 11 | Hannah Klein | 34 | **Fibroadenom** | — | — | Keine | **Benigne**, BI-RADS 3 |
| 12 | Renate Vogel | 45 | **ADH (B3)** | — | — | Nachresektion | **B3-Läsion**, Vakuumbiopsie |

-------

## Fall 1: Erika Neumann — Frühes Mammakarzinom, kurativ

### Stammdaten

| | |
| :--- | :--- |
| Name | Erika Neumann |
| Geburtsdatum | 12.03.1966 (60 Jahre) |
| Menopausenstatus | Postmenopausal (seit 5 Jahren) |
| Begleiterkrankungen | Arterielle Hypertonie, Hypothyreose |
| Begleitmedikation | Metoprolol 47,5 mg 1-0-0, L-Thyroxin 75 µg 1-0-0 |
| Familienanamnese | Mutter mit Mammakarzinom mit 52 Jahren |

### Versorgungspfad

#### 1. Erstvorstellung (15.01.2025)

Selbsttastbefund links oben außen, Überweisung vom Gynäkologen. Klinische Untersuchung: derber, nicht verschieblicher Knoten ca. 2 cm, Lymphknoten axillär nicht tastbar.

**Profile:** [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md), [Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.md), [Familienanamnese](StructureDefinition-senologie-familienanamnese.md), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

#### 2. Bildgebung (15.01.2025)

Mammographie beidseits und Sonographie links. Mammographie: ACR B, BI-RADS 5 links oben außen. Sonographie: irreguläre Raumforderung 18 mm, kein pathologischer Lymphknoten axillär.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.md), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.md), [Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.md)

#### 3. Biopsie und Pathologie (20.01.2025)

Ultraschallgesteuerte Stanzbiopsie. Histologie: Invasives Karzinom NST (no special type), G2. Immunhistochemie: ER positiv (IRS 12), PR positiv (IRS 8), HER2 negativ (Score 1+), Ki-67 15%.

**Profile:** [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.md), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

#### 4. Staging (22.01.2025)

Skelettszintigraphie: kein Hinweis auf ossäre Metastasen. Sonographie Leber: unauffällig. Röntgen Thorax: unauffällig. Staging-Ergebnis: cT1c cN0 cM0, UICC Stadium IA.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

#### 5. Genexpressionstest

Oncotype DX Recurrence Score 18 — niedriges Risiko. Leitlinienempfehlung: kein Chemotherapie-Benefit bei postmenopausaler Patientin mit RS ≤25 (TAILORx).

**Profile:** [Genexpressionstest](StructureDefinition-senologie-genexpressionstest.md), [Genexpressions-Score](StructureDefinition-senologie-genexpressions-score.md)

#### 6. Tumorkonferenz (28.01.2025)

Empfehlung: Brusterhaltende Therapie (BET) mit Sentinel-Lymphknoten-Biopsie (SLNB), adjuvante Strahlentherapie, endokrine Therapie mit Aromataseinhibitor. Keine Chemotherapie.

**Profile:** [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

#### 7. Operation (05.02.2025)

BET links mit SLNB. Histologie: Invasives Karzinom NST, 17 mm, G2. Sentinel-Lymphknoten: 0/2 befallen. Pathologisches Staging: pT1c pN0(sn)(0/2) cM0 R0 L0 V0 Pn0, UICC Stadium IA. Keine Komplikationen.

**Profile:** [OP-Planung](StructureDefinition-senologie-op-planung.md), [Operation](StructureDefinition-senologie-operation.md), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.md), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md)

#### 8. Strahlentherapie (10.03.–18.04.2025)

Ganzbrustbestrahlung links 50 Gy in 25 Fraktionen mit sequentiellem Boost auf das Tumorbett 10 Gy in 5 Fraktionen. Nebenwirkung: Radiodermatitis CTCAE Grad 1.

**Profile:** [Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

#### 9. Endokrine Therapie (ab 01.03.2025)

Letrozol 2,5 mg/d, geplant für 5 Jahre. Begleitmedikation: Calcium und Vitamin D zur Osteoporose-Prophylaxe.

**Profile:** [Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.md), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.md), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

#### 10. Nachsorge (15.08.2025)

Mammographie und Sonographie beidseits: kein Rezidivhinweis, BI-RADS 2. Klinische Untersuchung unauffällig. EQ-5D-5L: keine Einschränkungen.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.md), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.md), [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md)

-------

## Fall 2: Lena Hoffmann — Lokal fortgeschritten/metastasiert, palliativ

### Stammdaten

| | |
| :--- | :--- |
| Name | Lena Hoffmann |
| Geburtsdatum | 28.09.1980 (44 Jahre) |
| Menopausenstatus | Prämenopausal |
| Begleiterkrankungen | Keine |
| Familienanamnese | Unauffällig |

### Versorgungspfad

#### 1. Erstvorstellung (03.03.2025)

Tastbefund rechte Brust seit 4 Wochen, zunehmend. Vergrößerte axilläre Lymphknoten rechts tastbar. Klinische Untersuchung: derber Tumor ca. 5 cm rechts zentral, mehrere vergrößerte Lymphknoten axillär rechts fixiert.

**Profile:** [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md), [Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.md)

#### 2. Bildgebung (03.03.2025)

Mammographie, Sonographie und MRT Mamma. Mammographie: ACR C, BI-RADS 5 rechts zentral. Sonographie: irreguläre Raumforderung 52 mm, 3 pathologische axilläre Lymphknoten. MRT: Bestätigung, kein kontralateraler Befund.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.md), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.md), [Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.md)

#### 3. Biopsie und Pathologie (07.03.2025)

Stanzbiopsie Tumor und Lymphknoten-Punktion. Histologie: Invasives Karzinom NST, G3. Immunhistochemie: ER negativ, PR negativ, HER2 negativ (FISH nicht amplifiziert) — **Triple-negatives Mammakarzinom (TNBC)**. Ki-67 70%.

**Profile:** [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.md), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

#### 4. Staging (10.03.2025)

CT Thorax/Abdomen: kein Fernmetastasenhinweis. Skelettszintigraphie: solitäre Mehranreicherung BWK 12. MRT Wirbelsäule: **ossäre Metastase BWK 12** bestätigt. Staging-Ergebnis: cT3 cN2a cM1(OSS), UICC Stadium IV.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

#### 5. Tumorkonferenz (14.03.2025)

TNBC, lokal fortgeschritten, solitäre ossäre Metastase. Empfehlung: Neoadjuvante Chemotherapie mit Immuntherapie (KEYNOTE-522 Schema: Carboplatin/Paclitaxel + Pembrolizumab), anschließend Mastektomie mit Axilladissektion, adjuvant Pembrolizumab-Erhaltung, Strahlentherapie Thoraxwand. Überweisung ans **Molekulare Tumorboard (MTB)** für Genomprofiling. Bisphosphonat (Zoledronat).

**Profile:** [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)

#### 6. Studienteilnahme

Screening für KEYNOTE-522-Studie, Aufklärung am 17.03.2025, Einschluss in den Interventionsarm.

**Profile:** [Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md)

#### 7. Neoadjuvante Systemtherapie (24.03.–15.08.2025)

* **Phase 1 (Zyklen 1–4):** Carboplatin AUC 5 d1 + Paclitaxel 80 mg/m² d1,8,15 + Pembrolizumab 200 mg d1, q3w
* **Phase 2 (Zyklen 5–8):** Doxorubicin 60 mg/m² + Cyclophosphamid 600 mg/m² + Pembrolizumab 200 mg d1, q3w
* Nebenwirkungen: Übelkeit CTCAE Grad 2, Neutropenie CTCAE Grad 3 (Dosisreduktion in Zyklus 6), Fatigue Grad 2

**Profile:** [Systemtherapie Procedure](StructureDefinition-senologie-systemtherapie-procedure.md), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.md), [Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.md)

#### 8. Re-Staging (20.08.2025)

Sonographie und MRT: deutliche Regression Tumor (12 mm residuell), Lymphknoten axillär nicht mehr pathologisch. Skelettszintigraphie: Rückgang der Anreicherung BWK 12. Beurteilung: Gutes Ansprechen, OP empfohlen.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.md), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.md), [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)

#### 9. Operation (01.09.2025)

Mastektomie rechts mit Axilladissektion Level I–II. Histologie: ypT1a ypN0(0/14) — pathologische Komplettremission (pCR) der Lymphknoten. Residualtumor 8 mm (near-pCR). R0 L0 V0 Pn0. Komplikation: Serom axillär, Clavien-Dindo Grad I (Punktion).

**Profile:** [OP-Planung](StructureDefinition-senologie-op-planung.md), [Operation](StructureDefinition-senologie-operation.md), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.md), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md), [Operative Komplikation](StructureDefinition-senologie-operative-komplikation.md)

#### 10. Adjuvante Systemtherapie (ab 01.10.2025)

Pembrolizumab 200 mg q3w Erhaltung für 9 Zyklen. Zoledronat 4 mg i.v. q4w.

**Profile:** [Systemtherapie Procedure](StructureDefinition-senologie-systemtherapie-procedure.md), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.md), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

#### 11. Strahlentherapie (06.10.–14.11.2025)

Thoraxwand rechts und supraklavikulärer Lymphabfluss 50 Gy in 25 Fraktionen. Keine relevanten Nebenwirkungen.

**Profile:** [Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

#### 12. Verlauf / Progression (15.03.2026)

Kontroll-CT: neue Leberläsionen, Verdacht auf hepatische Metastasen. Biopsie bestätigt Metastase (TNBC). Erneute Tumorkonferenz: Umstellung auf palliatives Therapiekonzept, Überweisung Palliativmedizin.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.md), [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

-------

## Fall 3–12: Kurzprofile

### Fall 3: Sabine Weber — HR+/HER2-, N1, ältere Patientin

72 Jahre, postmenopausal. Invasives Karzinom NST rechts, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%. pT2 pN1a(2/12) cM0, UICC IIA. Mastektomie rechts + Axilladissektion → R0. Adjuvant RT Thoraxwand 50 Gy. Endokrin: Anastrozol. Keine Chemotherapie (postmenopausal, niedriges Risikoprofil trotz N1).

### Fall 4: Julia Fischer — HER2+, neoadjuvant, pCR

38 Jahre, prämenopausal. Invasives Karzinom NST links, G3, ER- PR- HER2+ (FISH amplifiziert), Ki-67 45%. cT2 cN1 cM0, UICC IIB. Neoadjuvant TCHP (Docetaxel + Carboplatin + Trastuzumab + Pertuzumab). BET links + SLNB → ypT0 ypN0 = **pCR**, R0. Adjuvant Trastuzumab + Pertuzumab 1 Jahr, RT.

### Fall 5: Monika Braun — HR+/HER2+, doppelt positiv

55 Jahre, perimenopausal. Invasives Karzinom NST rechts, G2, ER+ IRS 8, PR+ IRS 4, HER2+ (Score 3+), Ki-67 30%. cT3 cN1 cM0, UICC IIIA. Neoadjuvant EC → Docetaxel + Trastuzumab. BET rechts + SLNB → ypT1a ypN0, R0. Adjuvant Trastuzumab 1 Jahr + RT + Letrozol.

### Fall 6: Petra Schneider — DCIS (Stadium 0)

67 Jahre, postmenopausal. **Duktales Carcinoma in situ (DCIS)**, G2, ER+. Screening-Mammographie → BI-RADS 4 (Mikrokalzifikationen). Vakuumbiopsie → DCIS bestätigt. BET links → R0. Adjuvant RT 50 Gy (kein Boost). Keine Systemtherapie, kein Staging. Kein axillärer Eingriff (QI-4 konform).

### Fall 7: Kathrin Müller — TNBC, kurativ, pCR

48 Jahre, prämenopausal. Invasives Karzinom NST rechts, G3, ER- PR- HER2-, Ki-67 65%. cT2 cN0 cM0, UICC IIA. Neoadjuvant Carboplatin + Paclitaxel wöchentlich, dann EC. BET rechts + SLNB → ypT0 ypN0 = **pCR**, R0. Adjuvant RT 50 Gy + Boost 16 Gy. Keine endokrine Therapie (triple-negativ).

### Fall 8: Klaus Hartmann — Männliches Mammakarzinom

69 Jahre, **männlich**. Invasives Karzinom NST rechts, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%. pT2 pN0(sn)(0/3) cM0, UICC IIA. Mastektomie rechts + SLNB → R0. Adjuvant RT Thoraxwand. Endokrin: **Tamoxifen** 20 mg/d (Standard bei Männern, kein Aromataseinhibitor). Keine gynäkologische Anamnese.

### Fall 9: Andrea Wolf — N3, Komplikation Lymphödem

51 Jahre, prämenopausal. Invasives lobuläres Karzinom links, G2, ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20%. pT2 pN3a(12/18) cM0, UICC IIIC. Adjuvant EC × 4 → Paclitaxel × 12. BET links + Axilladissektion Level I–III → R0. **Komplikation: Lymphödem Arm links, Clavien-Dindo Grad II**. RT 50 Gy + Boost + Lymphabfluss. Endokrin: Tamoxifen.

### Fall 10: Christina Becker — BRCA1, bilateral, Implantate

43 Jahre, prämenopausal. Invasives Karzinom NST rechts, G3, ER- PR- HER2-, Ki-67 55%. **BRCA1-Mutation**. cT1c cN0 cM0, UICC IA. Familienanamnese: Mutter Mammakarzinom 41 J., Schwester Ovarialkarzinom 39 J. **Bilaterale Mastektomie** (therapeutisch rechts + prophylaktisch links) + **Sofortrekonstruktion beidseits mit Silikonimplantaten**. SLNB nur rechts (therapeutische Seite) — pN0(sn)(0/2). Links keine LK-Diagnostik, da prophylaktische OP ohne Tumorverdacht (kein pN-Staging links). Adjuvant Carboplatin + Paclitaxel. RT Thoraxwand rechts.

### Fall 11: Hannah Klein — Fibroadenom (benigne)

34 Jahre, prämenopausal. Tastbefund links oben außen, 15 mm, glatt begrenzt. Mammographie BI-RADS 3. Sonographie: echoarmer Knoten. Stanzbiopsie: **Fibroadenom**, keine Atypie. Diagnose: **Senologie_Diagnose_Benigne** (ICD-10 D24, SNOMED 254845004). Keine OP, keine Therapie — Verlaufskontrolle in 6 Monaten.

### Fall 12: Renate Vogel — B3-Läsion (ADH)

45 Jahre, prämenopausal. Screening-Mammographie → BI-RADS 4a (Mikrokalzifikationen). Vakuumbiopsie: **Atypische duktale Hyperplasie (ADH)**, B3-Kategorie. Tumorkonferenz: Nachresektion empfohlen. Offene Biopsie/Nachresektion links → kein Upgrade, R0. Keine weitere Therapie, engmaschige Nachsorge.

### Fall 13: Margarete Schreiber — Synchrones bilaterales Mammakarzinom

64 Jahre, postmenopausal. Synchrone bilaterale Diagnose: **Links**: C50.4, invasives Karzinom NST, pT1c pN0(sn) cM0, ER+/PR+/HER2-, G2 → BET + SLNB, R0. **Rechts**: C50.2, invasives Karzinom NST, pT2 pN1a cM0, ER+/PR-/HER2+, G3 → SSM + ALND Level I-II, R0. Adjuvante Chemotherapie EC-Pac-H (primär HER2+ rechts, wirkt auf beide Seiten). Demonstriert: Zwei separate Conditions mit seitenspezifischer Procedure-Zuordnung über `reasonReference` und SDC Choice Selection Pattern für Bezugsdiagnose-Auswahl bei bilateralem Karzinom.

-------

## Profilabdeckung

| | | | | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Diagnose Maligne | x | x | x | x | x | x | x | x | x | x |   |   |
| Diagnose Benigne |   |   |   |   |   |   |   |   |   |   | x |   |
| Bildgebung Befund | x | x | x | x | x | x | x | x | x | x | x | x |
| Bildgebung Observation | x | x | x | x | x | x | x | x | x | x | x | x |
| Bildgebung Sonstige | x | x |   |   |   |   |   |   |   |   |   |   |
| Pathologie Befund | x | x | x | x | x | x | x | x | x | x | x | x |
| Pathologie Präparat | x | x | x | x | x | x | x | x | x | x | x | x |
| Klinische Untersuchung | x | x |   |   |   |   |   |   |   |   | x |   |
| Gynäkologische Anamnese | x | x |   |   |   |   |   |   |   |   |   |   |
| Familienanamnese | x |   |   |   |   |   |   |   |   | x |   |   |
| Genexpressionstest | x |   |   |   |   |   |   |   |   |   |   |   |
| Genexpressions-Score | x |   |   |   |   |   |   |   |   |   |   |   |
| Tumorboard | x | x |   | x | x |   | x |   | x |   |   | x |
| OP-Planung | x |   |   |   |   |   |   |   |   |   |   |   |
| Operation | x | x | x | x | x | x | x | x | x | x |   | x |
| Operative Komplikation |   | x |   |   |   |   |   |   | x |   |   |   |
| Implantat |   |   |   |   |   |   |   |   |   | x |   |   |
| Strahlentherapie | x | x | x | x | x | x | x | x | x | x |   |   |
| Systemtherapie Procedure |   | x |   | x | x |   | x |   | x | x |   |   |
| Systemtherapie Medikation |   | x |   | x | x |   | x |   | x | x |   |   |
| Begleitmedikation | x | x | x |   | x |   |   | x | x |   |   |   |
| Studienteilnahme |   | x |   |   |   |   |   |   |   |   |   |   |

Legende: 1=Neumann, 2=Hoffmann, 3=Weber, 4=Fischer, 5=Braun, 6=Schneider, 7=Müller, 8=Hartmann, 9=Wolf, 10=Becker, 11=Klein, 12=Vogel

-------

## Verknüpfung mit Patient-Reported Outcomes (PROMs)

Beide Testpatientinnen werden an definierten Zeitpunkten im Versorgungspfad mittels standardisierter PRO-Instrumente befragt. Die folgende Übersicht zeigt die geplanten Erhebungszeitpunkte:

| | | | |
| :--- | :--- | :--- | :--- |
| **EQ-5D-5L** | Baseline, post-OP, 6 Monate, 12 Monate | ✓ | ✓ |
| **EORTC QLQ-C30** | Baseline, Nachsorge | ✓ | ✓ |
| **EORTC QLQ-BR45** | Post-OP, Nachsorge | ✓ | ✓ |
| **PROMIS-29 + Cognitive Function 4a** | Erstvorstellung | ✓ | ✓ |
| **PRO-CTCAE** | Während Systemtherapie |   | ✓ |

**Hinweis:** Diese Instrumente werden im [MII PRO-Modul](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Patient_Reported_Outcomes/IGMIIKDSModulPatientReportedOutcomesPRO.html) profiliert und sind nicht Bestandteil dieses Implementierungsleitfadens. Die Senologie-IG referenziert das PRO-Modul für die strukturierte Erfassung patientenberichteter Endpunkte.

