# Walkthrough: Tumorformel und IHC

Diese Seite zeigt an einem konkreten Beispiel — der **TNM-Klassifikation mit immunhistochemischem Rezeptorstatus (IHC)** — wie die Daten durch alle Ebenen des Kerndatensatzes fließen: vom klinischen Formular bis zu den verschiedenen Meldewegen.

Als Beispiel nutzen wir Fall 1 (Erika Neumann): invasives Karzinom NST links, G2, pT1c pN0(sn) cM0, UICC IA, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%.

---

## 1. Klinische Datenpunkte

Für einen kompletten senologischen Tumorbefund sind folgende Kategorien erforderlich:

### TNM-Klassifikation

| Kategorie | Wert | Bedeutung |
|---|---|---|
| T-Kategorie | pT1c | Tumor 1,0–2,0 cm (pathologisch) |
| N-Kategorie | pN0(sn) | Keine LK-Metastasen (Sentinel) |
| M-Kategorie | cM0 | Keine Fernmetastasen (klinisch) |
| y-Symbol | — | Nicht nach neoadjuvanter Therapie |
| r-Symbol | — | Keine Rezidiv-Klassifikation |
| L-Kategorie | L0 | Keine Lymphgefäßinvasion |
| V-Kategorie | V0 | Keine Veneninvasion |
| Pn-Kategorie | Pn0 | Keine Perineuralscheideninvasion |
| UICC-Stadium | IA | Stadium IA (pT1 pN0 M0) |
| Grading | G2 | Mäßig differenziert |

### Immunhistochemie (Modul Mamma)

| Parameter | Wert | Kodierung |
|---|---|---|
| Östrogenrezeptor (ER) | positiv, IRS 12, Anteil 95%, Intensität 3 | LOINC 85337-4 |
| Progesteronrezeptor (PR) | positiv, IRS 8, Anteil 80%, Intensität 2 | LOINC 85339-0 |
| HER2/neu (IHC) | Score 1+ (negativ) | LOINC 85319-2 |
| Ki-67 | 15% | LOINC 85319-2-like, % positive cells |

---

## 2. Erfassung im Questionnaire (SDC)

Der Kliniker erfasst diese Daten über einen strukturierten Fragebogen (Ausschnitt):

```
┌─────────────────────────────────────────────────────────────┐
│ Pathologiebefund — TNM und Rezeptorstatus                    │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│ TNM-Klassifikation                                           │
│                                                              │
│ Präfix T:    ◉ c (klinisch)  ◯ p (pathologisch)  ◯ yp  ◯ rp │
│ T-Kategorie: [pT1c ▼]                                        │
│                                                              │
│ Präfix N:    ◯ c             ◉ p                  ◯ yp      │
│ N-Kategorie: [pN0(sn) ▼]                                     │
│                                                              │
│ Präfix M:    ◉ c             ◯ p                             │
│ M-Kategorie: [cM0 ▼]                                         │
│                                                              │
│ L-Kategorie:  ◉ L0  ◯ L1  ◯ LX                               │
│ V-Kategorie:  ◉ V0  ◯ V1  ◯ VX                               │
│ Pn-Kategorie: ◉ Pn0 ◯ Pn1 ◯ PnX                              │
│                                                              │
│ UICC-Stadium: [IA ▼]                                         │
│ Grading:      [G2 ▼]                                         │
│                                                              │
├─────────────────────────────────────────────────────────────┤
│ Immunhistochemie (IHC)                                       │
│                                                              │
│ Östrogenrezeptor:                                            │
│   Status:      ◉ positiv  ◯ negativ  ◯ unbekannt             │
│   IRS:         [12]                                          │
│   Anteil (%):  [95]                                          │
│   Intensität:  ◯ 0  ◯ 1  ◯ 2  ◉ 3                            │
│                                                              │
│ Progesteronrezeptor:                                         │
│   Status:      ◉ positiv  ◯ negativ  ◯ unbekannt             │
│   IRS:         [8]                                           │
│   ...                                                        │
│                                                              │
│ HER2/neu (IHC):                                              │
│   Score:       ◯ 0  ◉ 1+  ◯ 2+  ◯ 3+                         │
│   Ergebnis:    ◉ negativ  ◯ positiv (ISH-Bestätigung bei 2+)│
│                                                              │
│ Ki-67 (%):     [15]                                          │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

**FSH-Ausschnitt (vereinfacht):**

```
* item[+]
  * linkId = "tnm-t-praefix"
  * text = "Präfix T"
  * type = #choice
  * answerOption[+].valueCoding = #c "klinisch"
  * answerOption[+].valueCoding = #p "pathologisch"
  * code = http://loinc.org#21905-5  // T-Kategorie
* item[+]
  * linkId = "tnm-t-kategorie"
  * text = "T-Kategorie"
  * type = #choice
  * answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-tnm-t-kategorie"
```

---

## 3. Abbildung im FHIR-Datenmodell

Die QuestionnaireResponse wird über SDC `$extract` in mehrere FHIR-Ressourcen transformiert. Die TNM + IHC-Daten werden als **separate Observations** gespeichert (MII Onkologie Pattern):

### TNM-Klassifikation (MII Onko Profile)

```
Observation (mii-pr-onko-tnm-klassifikation)
├── code: LOINC 21908-9 "Stage group.cancer Clinical Cancer"
├── effectiveDateTime: 2025-02-05
├── subject → Patient/Fall1-Patient-Erika-Neumann
├── focus → Condition/Fall1-Diagnose-Mammakarzinom
├── method: UICC 8
├── valueCodeableConcept: IA                     ← UICC Stadium
├── hasMember → Observation/Fall1-TNM-T          ← pT1c
├── hasMember → Observation/Fall1-TNM-N          ← pN0(sn)
├── hasMember → Observation/Fall1-TNM-M          ← cM0
├── hasMember → Observation/Fall1-TNM-L          ← L0
├── hasMember → Observation/Fall1-TNM-V          ← V0
└── hasMember → Observation/Fall1-TNM-Pn         ← Pn0
```

Jede Sub-Observation (T/N/M/L/V/Pn) nutzt ein eigenes MII-Profil:
- `mii-pr-onko-tnm-t-kategorie`
- `mii-pr-onko-tnm-n-kategorie`
- `mii-pr-onko-tnm-m-kategorie`
- `mii-pr-onko-tnm-l-kategorie`
- `mii-pr-onko-tnm-v-kategorie`
- `mii-pr-onko-tnm-pn-kategorie`

Mit cpu-Präfix als Extension:
```
Observation.code.extension[mii-ex-onko-tnm-cp-praefix]
  .valueCoding = SCT#373808000 "clinical"  (für c)
  oder SCT#373809008 "pathological" (für p)
```

### Immunhistochemie (MII Onko Mamma-Profile)

```
Observation (mii-pr-onko-mamma-rezeptorstatus-estrogen)
├── code: LOINC 85337-4 "Estrogen receptor [Interpretation]"
├── valueCodeableConcept: SCT#10828004 "Positive"
├── component[+]
│   ├── code: SCT#1234804006 "Anteil positive Zellen"
│   └── valueQuantity: 95 %
└── component[+]
    ├── code: SCT#1236874005 "Färbeintensität"
    └── valueCodeableConcept: SCT#258453006 "Strong staining"

Observation (mii-pr-onko-mamma-rezeptorstatus-progesteron)
└── (analog, LOINC 85339-0, IRS 8, 80%, Intensität 2)

Observation (mii-pr-onko-mamma-her2neu-status)
├── code: LOINC 85319-2
├── valueCodeableConcept: SCT#260385009 "Negative"
└── component[+]
    ├── code: "HER2-Score"
    └── valueCodeableConcept: "1+"

Observation (Ki-67)
└── valueQuantity: 15 %
```

---

## 4. Ausspielung oBDS-XML (Krebsregistermeldung)

Die [StructureMaps](meldung-obds.html) transformieren die FHIR-Observations in oBDS v3.0.5:

### oBDS TNM-Block

```xml
<TNM ID="fall1-tnm-op">
  <Datum>2025-02-05</Datum>
  <Version>8</Version>
  <c_p_u_Praefix_T>p</c_p_u_Praefix_T>
  <T>1c</T>
  <c_p_u_Praefix_N>p</c_p_u_Praefix_N>
  <N>0 (sn)</N>
  <c_p_u_Praefix_M>c</c_p_u_Praefix_M>
  <M>0</M>
  <L>L0</L>
  <V>V0</V>
  <Pn>Pn0</Pn>
  <UICC_Stadium>IA</UICC_Stadium>
</TNM>
```

### oBDS Modul_Mamma

```xml
<Modul_Mamma>
  <HormonrezeptorStatus_Oestrogen>P</HormonrezeptorStatus_Oestrogen>
  <HormonrezeptorStatus_Progesteron>P</HormonrezeptorStatus_Progesteron>
  <Her2neuStatus>N</Her2neuStatus>
</Modul_Mamma>
```

**Mapping in FSH/FML (Ausschnitt):**
- LOINC 85337-4 + SNOMED 10828004 "Positive" → oBDS `HormonrezeptorStatus_Oestrogen = P`
- LOINC 85319-2 + SNOMED 260385009 "Negative" → oBDS `Her2neuStatus = N`

Die Transformation nutzt die [Reverse ConceptMaps](terminologie-uebersicht.html) für die Code-Übersetzung.

---

## 5. Ausspielung IQTIG QS-Datensatz 18.1

Die [IQTIG-StructureMap](meldung-iqtig.html) transformiert in den QS-Datensatz:

```
Teildatensatz Operation (O)
  O:PT          = p1c
  O:PN          = p0(sn)
  O:PM          = c0
  O:UICCPATHO   = IA
  O:GRADING     = G2
  O:ERSTATUS    = P
  O:PRSTATUS    = P
  O:HER2STATUS  = N
```

**Besonderheit IQTIG:** Die Teildatensätze werden als separate Datenzeilen geführt, UICC wird im OP-Block wiederholt, weil er der Bezugspunkt der QS-Messung ist.

---

## 6. Ausspielung OncoBox Brust (DKG-Zertifizierung)

Die [OncoBox-StructureMap](meldung-oncobox.html) transformiert in das OncoBox-XML:

```
<Primärfall>
  <Diagnose>
    <PT>p1c</PT>
    <PN>p0(sn)</PN>
    <PM>c0</PM>
    <UICC>IA</UICC>
    <Grading>G2</Grading>
    <ERStatus>positiv</ERStatus>
    <ERIRS>12</ERIRS>
    <PRStatus>positiv</PRStatus>
    <PRIRS>8</PRIRS>
    <HER2IHC>1</HER2IHC>
    <HER2Ergebnis>negativ</HER2Ergebnis>
    <Ki67>15</Ki67>
  </Diagnose>
</Primärfall>
```

**Besonderheit OncoBox:** Die Kennzahl **KB-15 (BET bei pT1)** nutzt direkt das pT-Feld. Der IRS-Wert wird numerisch übertragen, nicht nur als Positiv/Negativ wie im oBDS.

---

## Zusammenfassung der Transformation

| Datenpunkt | FHIR-Feld | oBDS | IQTIG | OncoBox |
|---|---|---|---|---|
| pT | Observation(TNM-T).value | `<T>` + `<c_p_u_Praefix_T>` | O:PT | Diagnose/PT |
| pN | Observation(TNM-N).value | `<N>` | O:PN | Diagnose/PN |
| cM | Observation(TNM-M).value | `<M>` | O:PM | Diagnose/PM |
| UICC | Observation(TNM-Klass).value | `<UICC_Stadium>` | O:UICCPATHO | Diagnose/UICC |
| Grading | Observation(Grading).value | `<Grading>` | O:GRADING | Diagnose/Grading |
| ER-Status | Observation(ER).value | Modul_Mamma/`<HormonrezeptorStatus_Oestrogen>` = P/N/U | O:ERSTATUS = P/N/U | Diagnose/ERStatus (+ IRS) |
| PR-Status | Observation(PR).value | Modul_Mamma/`<HormonrezeptorStatus_Progesteron>` | O:PRSTATUS | Diagnose/PRStatus (+ IRS) |
| HER2/neu | Observation(HER2).value | Modul_Mamma/`<Her2neuStatus>` | O:HER2STATUS | Diagnose/HER2IHC + HER2Ergebnis |

### Wo die Meldewege unterscheiden

- **oBDS** reduziert die IHC-Details auf P/N/U (Status), die detaillierten IRS-Werte gehen verloren.
- **IQTIG** ist noch gröber, erwartet nur Status.
- **OncoBox** behält die feingranularen IHC-Werte (IRS, Anteil, Intensität, HER2-Score).

Das heißt: Die **klinische Erfassung** muss die höchste Granularität abbilden (OncoBox-Niveau), die Reduktion zu oBDS/IQTIG erfolgt in der StructureMap.

---

## Design-Prinzip

Dieser Walkthrough illustriert das zentrale Design-Prinzip des Kerndatensatzes:

> **Einmal fein erfassen, mehrfach grob ausleiten.**

Der Kliniker erfasst die Daten in der höchsten klinisch relevanten Granularität (über SDC-Questionnaire). FHIR speichert die strukturierte Repräsentation. Die StructureMaps reduzieren diese Daten auf das jeweilige Meldeformat. Verluste (z.B. IRS → nur P/N/U bei oBDS) sind dokumentiert und akzeptiert — sie sind eine Eigenschaft der Zielformate, nicht des Kerndatensatzes.
