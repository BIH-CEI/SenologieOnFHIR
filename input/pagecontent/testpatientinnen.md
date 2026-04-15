# Testpatientinnen

Diese Seite beschreibt zwei synthetische Testpatientinnen, die den gesamten Versorgungspfad in der Senologie exemplarisch abbilden. Die Fälle sind klinisch realistisch und dienen dazu, die FHIR-Profile dieses Implementierungsleitfadens im Kontext typischer Behandlungsverläufe zu veranschaulichen und zu validieren.

- **Fall 1 (Erika Neumann)** repräsentiert ein frühes, hormonrezeptorpositives Mammakarzinom mit kurativem Therapieansatz.
- **Fall 2 (Lena Hoffmann)** repräsentiert ein lokal fortgeschrittenes, triple-negatives Mammakarzinom mit primärer Metastasierung und palliativem Verlauf.

---

## Fall 1: Erika Neumann — Frühes Mammakarzinom, kurativ

### Stammdaten

| Merkmal | Wert |
|---|---|
| Name | Erika Neumann |
| Geburtsdatum | 12.03.1966 (60 Jahre) |
| Menopausenstatus | Postmenopausal (seit 5 Jahren) |
| Begleiterkrankungen | Arterielle Hypertonie, Hypothyreose |
| Begleitmedikation | Metoprolol 47,5 mg 1-0-0, L-Thyroxin 75 µg 1-0-0 |
| Familienanamnese | Mutter mit Mammakarzinom mit 52 Jahren |

### Versorgungspfad

#### 1. Erstvorstellung (15.01.2025)

Selbsttastbefund links oben außen, Überweisung vom Gynäkologen. Klinische Untersuchung: derber, nicht verschieblicher Knoten ca. 2 cm, Lymphknoten axillär nicht tastbar.

**Profile:** [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.html), [Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.html), [Familienanamnese](StructureDefinition-senologie-familienanamnese.html), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.html)

#### 2. Bildgebung (15.01.2025)

Mammographie beidseits und Sonographie links. Mammographie: ACR B, BI-RADS 5 links oben außen. Sonographie: irreguläre Raumforderung 18 mm, kein pathologischer Lymphknoten axillär.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.html), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.html), [Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.html)

#### 3. Biopsie und Pathologie (20.01.2025)

Ultraschallgesteuerte Stanzbiopsie. Histologie: Invasives Karzinom NST (no special type), G2. Immunhistochemie: ER positiv (IRS 12), PR positiv (IRS 8), HER2 negativ (Score 1+), Ki-67 15%.

**Profile:** [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.html), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.html)

#### 4. Staging (22.01.2025)

Skelettszintigraphie: kein Hinweis auf ossäre Metastasen. Sonographie Leber: unauffällig. Röntgen Thorax: unauffällig. Staging-Ergebnis: cT1c cN0 cM0, UICC Stadium IA.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html)

#### 5. Genexpressionstest

Oncotype DX Recurrence Score 18 — niedriges Risiko. Leitlinienempfehlung: kein Chemotherapie-Benefit bei postmenopausaler Patientin mit RS ≤25 (TAILORx).

**Profile:** [Genexpressionstest](StructureDefinition-senologie-genexpressionstest.html), [Genexpressions-Score](StructureDefinition-senologie-genexpressions-score.html)

#### 6. Tumorkonferenz (28.01.2025)

Empfehlung: Brusterhaltende Therapie (BET) mit Sentinel-Lymphknoten-Biopsie (SLNB), adjuvante Strahlentherapie, endokrine Therapie mit Aromataseinhibitor. Keine Chemotherapie.

**Profile:** [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.html)

#### 7. Operation (05.02.2025)

BET links mit SLNB. Histologie: Invasives Karzinom NST, 17 mm, G2. Sentinel-Lymphknoten: 0/2 befallen. Pathologisches Staging: pT1c pN0(sn)(0/2) cM0 R0 L0 V0 Pn0, UICC Stadium IA. Keine Komplikationen.

**Profile:** [OP-Planung](StructureDefinition-senologie-op-planung.html), [Operation](StructureDefinition-senologie-operation.html), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.html)

#### 8. Strahlentherapie (10.03.–18.04.2025)

Ganzbrustbestrahlung links 50 Gy in 25 Fraktionen mit sequentiellem Boost auf das Tumorbett 10 Gy in 5 Fraktionen. Nebenwirkung: Radiodermatitis CTCAE Grad 1.

**Profile:** [Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html)

#### 9. Endokrine Therapie (ab 01.03.2025)

Letrozol 2,5 mg/d, geplant für 5 Jahre. Begleitmedikation: Calcium und Vitamin D zur Osteoporose-Prophylaxe.

**Profile:** [Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.html), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.html), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.html)

#### 10. Nachsorge (15.08.2025)

Mammographie und Sonographie beidseits: kein Rezidivhinweis, BI-RADS 2. Klinische Untersuchung unauffällig. EQ-5D-5L: keine Einschränkungen.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.html), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.html), [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.html)

---

## Fall 2: Lena Hoffmann — Lokal fortgeschritten/metastasiert, palliativ

### Stammdaten

| Merkmal | Wert |
|---|---|
| Name | Lena Hoffmann |
| Geburtsdatum | 28.09.1980 (44 Jahre) |
| Menopausenstatus | Prämenopausal |
| Begleiterkrankungen | Keine |
| Familienanamnese | Unauffällig |

### Versorgungspfad

#### 1. Erstvorstellung (03.03.2025)

Tastbefund rechte Brust seit 4 Wochen, zunehmend. Vergrößerte axilläre Lymphknoten rechts tastbar. Klinische Untersuchung: derber Tumor ca. 5 cm rechts zentral, mehrere vergrößerte Lymphknoten axillär rechts fixiert.

**Profile:** [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.html), [Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.html)

#### 2. Bildgebung (03.03.2025)

Mammographie, Sonographie und MRT Mamma. Mammographie: ACR C, BI-RADS 5 rechts zentral. Sonographie: irreguläre Raumforderung 52 mm, 3 pathologische axilläre Lymphknoten. MRT: Bestätigung, kein kontralateraler Befund.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.html), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.html), [Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.html)

#### 3. Biopsie und Pathologie (07.03.2025)

Stanzbiopsie Tumor und Lymphknoten-Punktion. Histologie: Invasives Karzinom NST, G3. Immunhistochemie: ER negativ, PR negativ, HER2 negativ (FISH nicht amplifiziert) — **Triple-negatives Mammakarzinom (TNBC)**. Ki-67 70%.

**Profile:** [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.html), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.html)

#### 4. Staging (10.03.2025)

CT Thorax/Abdomen: kein Fernmetastasenhinweis. Skelettszintigraphie: solitäre Mehranreicherung BWK 12. MRT Wirbelsäule: **ossäre Metastase BWK 12** bestätigt. Staging-Ergebnis: cT3 cN2a cM1(OSS), UICC Stadium IV.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html)

#### 5. Tumorkonferenz (14.03.2025)

TNBC, lokal fortgeschritten, solitäre ossäre Metastase. Empfehlung: Neoadjuvante Chemotherapie mit Immuntherapie (KEYNOTE-522 Schema: Carboplatin/Paclitaxel + Pembrolizumab), anschließend Mastektomie mit Axilladissektion, adjuvant Pembrolizumab-Erhaltung, Strahlentherapie Thoraxwand. Überweisung ans **Molekulare Tumorboard (MTB)** für Genomprofiling. Bisphosphonat (Zoledronat).

**Profile:** [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.html)

#### 6. Studienteilnahme

Screening für KEYNOTE-522-Studie, Aufklärung am 17.03.2025, Einschluss in den Interventionsarm.

**Profile:** [Studienteilnahme](StructureDefinition-senologie-studienteilnahme.html)

#### 7. Neoadjuvante Systemtherapie (24.03.–15.08.2025)

- **Phase 1 (Zyklen 1–4):** Carboplatin AUC 5 d1 + Paclitaxel 80 mg/m² d1,8,15 + Pembrolizumab 200 mg d1, q3w
- **Phase 2 (Zyklen 5–8):** Doxorubicin 60 mg/m² + Cyclophosphamid 600 mg/m² + Pembrolizumab 200 mg d1, q3w
- Nebenwirkungen: Übelkeit CTCAE Grad 2, Neutropenie CTCAE Grad 3 (Dosisreduktion in Zyklus 6), Fatigue Grad 2

**Profile:** [Systemtherapie Procedure](StructureDefinition-senologie-systemtherapie-procedure.html), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.html), [Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.html)

#### 8. Re-Staging (20.08.2025)

Sonographie und MRT: deutliche Regression Tumor (12 mm residuell), Lymphknoten axillär nicht mehr pathologisch. Skelettszintigraphie: Rückgang der Anreicherung BWK 12. Beurteilung: Gutes Ansprechen, OP empfohlen.

**Profile:** [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.html), [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.html), [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html)

#### 9. Operation (01.09.2025)

Mastektomie rechts mit Axilladissektion Level I–II. Histologie: ypT1a ypN0(0/14) — pathologische Komplettremission (pCR) der Lymphknoten. Residualtumor 8 mm (near-pCR). R0 L0 V0 Pn0. Komplikation: Serom axillär, Clavien-Dindo Grad I (Punktion).

**Profile:** [OP-Planung](StructureDefinition-senologie-op-planung.html), [Operation](StructureDefinition-senologie-operation.html), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html), [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.html), [Operative Komplikation](StructureDefinition-senologie-operative-komplikation.html)

#### 10. Adjuvante Systemtherapie (ab 01.10.2025)

Pembrolizumab 200 mg q3w Erhaltung für 9 Zyklen. Zoledronat 4 mg i.v. q4w.

**Profile:** [Systemtherapie Procedure](StructureDefinition-senologie-systemtherapie-procedure.html), [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.html), [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.html)

#### 11. Strahlentherapie (06.10.–14.11.2025)

Thoraxwand rechts und supraklavikulärer Lymphabfluss 50 Gy in 25 Fraktionen. Keine relevanten Nebenwirkungen.

**Profile:** [Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html)

#### 12. Verlauf / Progression (15.03.2026)

Kontroll-CT: neue Leberläsionen, Verdacht auf hepatische Metastasen. Biopsie bestätigt Metastase (TNBC). Erneute Tumorkonferenz: Umstellung auf palliatives Therapiekonzept, Überweisung Palliativmedizin.

**Profile:** [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html), [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html), [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.html), [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.html)

---

## Profilabdeckung

Die folgende Tabelle zeigt, welche Profile durch die beiden Testfälle abgedeckt werden.

| Profil | Fall 1 (Neumann) | Fall 2 (Hoffmann) |
|---|:---:|:---:|
| [Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.html) | &#10003; | &#10003; |
| [Bildgebungsbefund](StructureDefinition-senologie-bildgebung-befund.html) | &#10003; | &#10003; |
| [Bildgebungs-Observation](StructureDefinition-senologie-bildgebung-observation.html) | &#10003; | &#10003; |
| [Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html) | &#10003; | &#10003; |
| [Pathologiebefund](StructureDefinition-senologie-pathologie-befund.html) | &#10003; | &#10003; |
| [Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.html) | &#10003; | &#10003; |
| [Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.html) | &#10003; | &#10003; |
| [Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.html) | &#10003; | &#10003; |
| [Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.html) | &#10003; | &#10003; |
| [Familienanamnese](StructureDefinition-senologie-familienanamnese.html) | &#10003; | |
| [Genexpressionstest](StructureDefinition-senologie-genexpressionstest.html) | &#10003; | |
| [Genexpressions-Score](StructureDefinition-senologie-genexpressions-score.html) | &#10003; | |
| [Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.html) | &#10003; | &#10003; |
| [OP-Planung](StructureDefinition-senologie-op-planung.html) | &#10003; | &#10003; |
| [Operation](StructureDefinition-senologie-operation.html) | &#10003; | &#10003; |
| [Operative Komplikation](StructureDefinition-senologie-operative-komplikation.html) | | &#10003; |
| [Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html) | &#10003; | &#10003; |
| [Systemtherapie Procedure](StructureDefinition-senologie-systemtherapie-procedure.html) | | &#10003; |
| [Systemtherapie Medikation](StructureDefinition-senologie-systemtherapie-medikation.html) | &#10003; | &#10003; |
| [Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.html) | &#10003; | &#10003; |
| [Begleitmedikation](StructureDefinition-senologie-begleitmedikation.html) | &#10003; | &#10003; |
| [Studienteilnahme](StructureDefinition-senologie-studienteilnahme.html) | | &#10003; |

---

## Verknüpfung mit Patient-Reported Outcomes (PROMs)

Beide Testpatientinnen werden an definierten Zeitpunkten im Versorgungspfad mittels standardisierter PRO-Instrumente befragt. Die folgende Übersicht zeigt die geplanten Erhebungszeitpunkte:

| Instrument | Zeitpunkte | Fall 1 | Fall 2 |
|---|---|:---:|:---:|
| **EQ-5D-5L** | Baseline, post-OP, 6 Monate, 12 Monate | &#10003; | &#10003; |
| **EORTC QLQ-C30** | Baseline, Nachsorge | &#10003; | &#10003; |
| **EORTC QLQ-BR42** | Post-OP | &#10003; | &#10003; |
| **PRO-CTCAE** | Während Systemtherapie | | &#10003; |

**Hinweis:** Diese Instrumente werden im [MII PRO-Modul](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Patient_Reported_Outcomes/IGMIIKDSModulPatientReportedOutcomesPRO.html) profiliert und sind nicht Bestandteil dieses Implementierungsleitfadens. Die Senologie-IG referenziert das PRO-Modul für die strukturierte Erfassung patientenberichteter Endpunkte.
