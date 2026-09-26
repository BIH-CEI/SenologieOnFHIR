# Walkthrough: Tumour Formula and IHC

This page illustrates — using a concrete example, the **TNM classification with immunohistochemical receptor status (IHC)** — how data flows through all layers of the core dataset: from the clinical form to the various reporting channels.

The example uses Case 1 (Erika Neumann): invasive carcinoma NST left, G2, pT1c pN0(sn) cM0, UICC IA, ER+ IRS 12, PR+ IRS 8, HER2− Score 1+, Ki-67 15%.

---

## 1. Clinical Data Points

The following categories are required for a complete senological tumour finding (Tumorbefund):

### TNM Classification

| Category | Value | Meaning |
|---|---|---|
| T category | pT1c | Tumour 1.0–2.0 cm (pathological) |
| N category | pN0(sn) | No lymph node metastases (sentinel) |
| M category | cM0 | No distant metastases (clinical) |
| y symbol | — | Not after neoadjuvant therapy |
| r symbol | — | No recurrence classification |
| L category | L0 | No lymphovascular invasion |
| V category | V0 | No venous invasion |
| Pn category | Pn0 | No perineural invasion |
| UICC stage | IA | Stage IA (pT1 pN0 M0) |
| Grading | G2 | Moderately differentiated |

### Immunohistochemistry (Modul Mamma)

| Parameter | Value | Coding |
|---|---|---|
| Oestrogen receptor (ER) | positive, IRS 12, proportion 95%, intensity 3 | LOINC 85337-4 |
| Progesterone receptor (PR) | positive, IRS 8, proportion 80%, intensity 2 | LOINC 85339-0 |
| HER2/neu (IHC) | Score 1+ (negative) | LOINC 85319-2 |
| Ki-67 | 15% | LOINC 85319-2-like, % positive cells |

---

## 2. Data Entry in the Questionnaire (SDC)

The clinician records these data via a structured questionnaire (excerpt):

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

**FSH excerpt (simplified):**

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

## 3. Representation in the FHIR Data Model

The QuestionnaireResponse is transformed via SDC `$extract` into multiple FHIR resources. The TNM and IHC data are stored as **separate Observations** (MII Oncology pattern):

### TNM Classification (MII Onko Profiles)

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

Each sub-Observation (T/N/M/L/V/Pn) uses its own MII profile:
- `mii-pr-onko-tnm-t-kategorie`
- `mii-pr-onko-tnm-n-kategorie`
- `mii-pr-onko-tnm-m-kategorie`
- `mii-pr-onko-tnm-l-kategorie`
- `mii-pr-onko-tnm-v-kategorie`
- `mii-pr-onko-tnm-pn-kategorie`

With the cpu prefix as an extension (Präfix):
```
Observation.code.extension[mii-ex-onko-tnm-cp-praefix]
  .valueCoding = SCT#373808000 "clinical"  (für c)
  oder SCT#373809008 "pathological" (für p)
```

### Immunohistochemistry (MII Onko Mamma Profiles)

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

## 4. Output to oBDS XML (Cancer Registry Report)

The [StructureMaps](meldung-obds.html) transform the FHIR Observations into oBDS v3.0.5:

### oBDS TNM Block

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

**Mapping in FSH/FML (excerpt):**
- LOINC 85337-4 + SNOMED 10828004 "Positive" → oBDS `HormonrezeptorStatus_Oestrogen = P`
- LOINC 85319-2 + SNOMED 260385009 "Negative" → oBDS `Her2neuStatus = N`

The transformation uses the [Reverse ConceptMaps](terminologie-uebersicht.html) for code translation.

---

## 5. Output to IQTIG QS Dataset 18.1

The [IQTIG StructureMap](meldung-iqtig.html) transforms into the quality assurance dataset:

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

**IQTIG specifics:** The partial datasets (Teildatensätze) are maintained as separate data rows; UICC is repeated in the surgical (OP) block because it is the reference point for quality measurement.

---

## 6. Output to OncoBox Breast (DKG Certification)

The [OncoBox StructureMap](meldung-oncobox.html) transforms into the OncoBox XML format:

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

**OncoBox specifics:** The indicator **KB-15 (breast-conserving surgery at pT1)** uses the pT field directly. The IRS value is transmitted numerically, not merely as positive/negative as in oBDS.

---

## Summary of the Transformation

| Data point | FHIR field | oBDS | IQTIG | OncoBox |
|---|---|---|---|---|
| pT | Observation(TNM-T).value | `<T>` + `<c_p_u_Praefix_T>` | O:PT | Diagnose/PT |
| pN | Observation(TNM-N).value | `<N>` | O:PN | Diagnose/PN |
| cM | Observation(TNM-M).value | `<M>` | O:PM | Diagnose/PM |
| UICC | Observation(TNM-Klass).value | `<UICC_Stadium>` | O:UICCPATHO | Diagnose/UICC |
| Grading | Observation(Grading).value | `<Grading>` | O:GRADING | Diagnose/Grading |
| ER status | Observation(ER).value | Modul_Mamma/`<HormonrezeptorStatus_Oestrogen>` = P/N/U | O:ERSTATUS = P/N/U | Diagnose/ERStatus (+ IRS) |
| PR status | Observation(PR).value | Modul_Mamma/`<HormonrezeptorStatus_Progesteron>` | O:PRSTATUS | Diagnose/PRStatus (+ IRS) |
| HER2/neu | Observation(HER2).value | Modul_Mamma/`<Her2neuStatus>` | O:HER2STATUS | Diagnose/HER2IHC + HER2Ergebnis |

### Where the reporting channels diverge

- **oBDS** reduces IHC details to P/N/U (status only); the detailed IRS values are not retained.
- **IQTIG** is even more coarse-grained, expecting status only.
- **OncoBox** retains the fine-grained IHC values (IRS, proportion, intensity, HER2 score).

This means: **clinical data capture** must represent the highest level of granularity (OncoBox level); reduction to oBDS/IQTIG takes place in the StructureMap.

---

## Design Principle

This walkthrough illustrates the central design principle of the core dataset:

> **Capture once at high granularity — report out multiple times at lower granularity.**

The clinician records data at the highest clinically relevant granularity (via SDC Questionnaire). FHIR stores the structured representation. The StructureMaps reduce these data to the respective reporting format. Losses (e.g. IRS → P/N/U only in oBDS) are documented and accepted — they are a property of the target formats, not of the core dataset.
