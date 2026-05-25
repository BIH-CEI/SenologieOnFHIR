# ValueSet Code Audit Report

Codes checked: **249** | Invalid: **10** | Critical mismatches: **76** | Translations: **69**

## ❌ INVALID — code does not exist in CodeSystem
| VS | System | Code | Claimed display |
|---|---|---|---|
| `vs-senologie-b-klassifikation` | SCT | `53076004` | B2 — Benigne |
| `vs-senologie-b-klassifikation` | SCT | `1145403004` | B4 — Malignitätsverdächtig |
| `vs-senologie-detektion-modus` | SCT | `129434009` | Selbstuntersuchung |
| `vs-senologie-histologie-typ` | SCT | `443451005` | Invasives lobuläres Karzinom |
| `vs-senologie-menopausenstatus` | SCT | `87332000` | Perimenopausal |
| `vs-senologie-rt-applikationsart` | SCT | `1163834000` | 3D-konformale Bestrahlung |
| `vs-senologie-rt-applikationsart` | SCT | `1163833006` | IMRT (intensitätsmoduliert) |
| `vs-senologie-symmetrie` | SCT | `82332009` | Symmetrisch |
| `vs-senologie-therapie-intention` | SCT | `225298006` | Revision |
| `vs-senologie-vorstellungsgrund` | SCT | `183620003` | Wiedervorstellung |

## ⚠️ CRITICAL — code resolves to a completely different concept
| VS | System | Code | Claimed | Actual SCT/LOINC display |
|---|---|---|---|---|
| `vs-senologie-acr-brustdichte` | SCT | `129716005` | A — Fast vollständig fetthaltig | **Almost entirely fat breast composition** |
| `vs-senologie-acr-brustdichte` | SCT | `129717001` | B — Verstreute fibroglanduläre Verdichtungen | **Scattered fibroglandular densities** |
| `vs-senologie-acr-brustdichte` | SCT | `129718006` | C — Heterogen dicht | **Heterogeneously dense breast composition** |
| `vs-senologie-acr-brustdichte` | SCT | `129719003` | D — Extrem dicht | **Extremely dense breast composition** |
| `vs-senologie-b-klassifikation` | SCT | `87100004` | B0 — Specimen unsatisfactory | **Topography unknown** |
| `vs-senologie-b-klassifikation` | SCT | `76752008` | B1 — Normalgewebe | **Structure of breast** |
| `vs-senologie-b-klassifikation` | SCT | `269497004` | B3 — Unklares biologisches Potenzial | **Neoplasm of uncertain behaviour of breast** |
| `vs-senologie-b-klassifikation` | SCT | `254837009` | B5b — Maligne invasiv | **Malignant neoplasm of breast** |
| `vs-senologie-b3-subtypen` | SCT | `427785007` | ADH — Atypische duktale Hyperplasie | **Atypical ductal hyperplasia of breast** |
| `vs-senologie-b3-subtypen` | SCT | `860895001` | FEA — Flache epitheliale Atypie | **Flat epithelial atypia of breast** |
| `vs-senologie-b3-subtypen` | SCT | `444739008` | LIN — klassisches LCIS | **Classic lobular carcinoma in situ** |
| `vs-senologie-b3-subtypen` | SCT | `444591006` | LIN — nicht-klassisches (pleomorphes) LCIS | **Pleomorphic lobular carcinoma in situ** |
| `vs-senologie-bildgebung-modalitaet` | SCT | `723780005` | Tomosynthese beidseits | **Digital tomosynthesis of bilateral breasts** |
| `vs-senologie-birads` | SCT | `397138000` | BI-RADS 0 — Zusätzliche Bildgebung | **Mammography assessment (Category 0) - Need additional imaging evaluation** |
| `vs-senologie-birads` | SCT | `397140005` | BI-RADS 1 — Unauffällig | **Mammography assessment (Category 1) - Negative** |
| `vs-senologie-birads` | SCT | `397141009` | BI-RADS 2 — Gutartig | **Mammography assessment (Category 2) - Benign finding** |
| `vs-senologie-birads` | SCT | `397143007` | BI-RADS 3 — Wahrscheinlich gutartig | **Mammography assessment (Category 3) - Probably benign finding, short interval follow-up** |
| `vs-senologie-birads` | SCT | `397144001` | BI-RADS 4 — Suspekt | **Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered** |
| `vs-senologie-birads` | SCT | `397145000` | BI-RADS 5 — Hochverdächtig | **Mammography assessment (Category 5) - Highly suggestive of malignancy** |
| `vs-senologie-birads` | SCT | `6111000179101` | BI-RADS 6 — Histologisch gesichert maligne | **Mammography assessment (Category 6) - known biopsy, proven malignancy** |
| `vs-senologie-detektion-modus` | SCT | `444589003` | Intervallkarzinom | **Malignant neoplasm detection during interval between recommended screening examinations** |
| `vs-senologie-detektion-modus` | SCT | `261087003` | Zufallsbefund | **Incidental** |
| `vs-senologie-diagnose-lokal` | SCT | `51440002` | Bilateral | **Right and left** |
| `vs-senologie-diagnose-mamma-24` | SCT | `53430007` | Mastodynie | **Mastalgia** |
| `vs-senologie-diagnose-mamma-24` | SCT | `237474000` | Kapselfibrose | **Capsular contracture of breast** |
| `vs-senologie-diagnose-mamma-24` | SCT | `718220008` | Genetische Hochrisikosituation | **Hereditary breast and ovarian cancer syndrome** |
| `vs-senologie-diagnose` | SCT | `4754008` | Gynecomastia | **Gynaecomastia** |
| `vs-senologie-ecog` | LOINC | `LA9622-7` | 0 — Normale Aktivität | **Fully active, able to carry on all pre-disease performance without restriction** |
| `vs-senologie-ecog` | LOINC | `LA9623-5` | 1 — Einschränkung bei Anstrengung | **Restricted in physically strenuous activity but ambulatory and able to carry out work of a light or sedentary nature, e.g., light house work, office work** |
| `vs-senologie-ecog` | LOINC | `LA9624-3` | 2 — Gehfähig, nicht arbeitsfähig | **Ambulatory and capable of all selfcare but unable to carry out any work activities. Up and about more than 50% of waking hours** |
| `vs-senologie-ecog` | LOINC | `LA9625-0` | 3 — Begrenzte Selbstversorgung | **Capable of only limited selfcare, confined to bed or chair more than 50% of waking hours** |
| `vs-senologie-ecog` | LOINC | `LA9626-8` | 4 — Völlig pflegebedürftig | **Completely disabled. Cannot carry on any selfcare. Totally confined to bed or chair** |
| `vs-senologie-familien-erkrankung` | SCT | `363443007` | Ovarialkarzinom | **Malignant neoplasm of ovary** |
| `vs-senologie-familien-erkrankung` | SCT | `74964007` | Sonstiges | **Other** |
| `vs-senologie-grading-mamma` | SCT | `54102005` | G1 — gut differenziert | **G1 grade** |
| `vs-senologie-grading-mamma` | SCT | `1663004` | G2 — mäßig differenziert | **G2 grade** |
| `vs-senologie-grading-mamma` | SCT | `61026006` | G3 — schlecht differenziert | **G3 grade** |
| `vs-senologie-her2-fish` | SCT | `385432009` | nicht durchgeführt | **Not applicable** |
| `vs-senologie-histologie-typ` | SCT | `109889007` | DCIS | **Intraductal carcinoma in situ of breast** |
| `vs-senologie-praeparat-art` | SCT | `439479000` | Resektat / OP-Präparat | **Tissue specimen obtained by excision** |
| `vs-senologie-preop-markierung` | SCT | `397956004` | Drahtmarkierung (Wire guided) | **Prosthetic arthroplasty of the hip** |
| `vs-senologie-preop-markierung` | SCT | `405815000` | Clip-Markierung | **Procedure device** |
| `vs-senologie-quadrant-mamma` | SCT | `76365002` | Oberer äußerer Quadrant | **Structure of upper outer quadrant of breast** |
| `vs-senologie-quadrant-mamma` | SCT | `33564002` | Unterer äußerer Quadrant | **Structure of lower outer quadrant of breast** |
| `vs-senologie-quadrant-mamma` | SCT | `24142002` | Mamille | **Structure of nipple** |
| `vs-senologie-quadrant-mamma` | SCT | `70925003` | Zentral | **Structure of bone of maxilla** |
| `vs-senologie-r-status` | SCT | `395536008` | R0 — kein Residualtumor | **Surgical margin finding** |
| `vs-senologie-r-status` | SCT | `395537004` | R1 — mikroskopischer Residualtumor | **Surgical margin involvement by tumour cannot be assessed** |
| `vs-senologie-r-status` | SCT | `395538009` | R2 — makroskopischer Residualtumor | **Microscopic specimen observation** |
| `vs-senologie-r-status` | SCT | `395539001` | RX — nicht beurteilbar | **Presence of neoplasm of colon at mucosal surgical margin in colectomy specimen** |
| `vs-senologie-raucherstatus` | LOINC | `LA18978-9` | Nie geraucht (Never smoked) | **Never smoker** |
| `vs-senologie-raucherstatus` | LOINC | `LA18976-3` | Aktueller Raucher (Current smoker) | **Current every day smoker** |
| `vs-senologie-recist-response` | SCT | `260388006` | Stable disease (SD) | **No change** |
| `vs-senologie-recist-response` | SCT | `551001000124108` | Partielle Remission (PR) | **Malignant neoplasm in partial remission** |
| `vs-senologie-recist-response` | SCT | `550991000124107` | Komplettremission (CR) | **Malignant neoplasm in full remission** |
| `vs-senologie-recist-response` | SCT | `419835002` | Progressive Disease (PD) | **Tumour progression** |
| `vs-senologie-rt-zielvolumen` | SCT | `76752008` | Ganze Brust | **Structure of breast** |
| `vs-senologie-rt-zielvolumen` | SCT | `78904004` | Brustwand | **Chest wall structure** |
| `vs-senologie-screeningstatus` | SCT | `709491003` | Assessed (qualifier value) | **Enrolment in clinical trial** |
| `vs-senologie-screeningstatus` | SCT | `385646003` | Not eligible (qualifier value) | **Schedule rejected** |
| `vs-senologie-symmetrie` | SCT | `31739005` | Asymmetrisch | **Lateral abnormal curvature** |
| `vs-senologie-systemtherapie-art` | SCT | `169413002` | Endokrine Therapie | **Hormone therapy** |
| `vs-senologie-systemtherapie-art` | SCT | `432105003` | Zielgerichtete Therapie | **Insertion of drain into biliary tract using fluoroscopic guidance** |
| `vs-senologie-systemtherapie-medikation` | SCT | `386913001` | Mitoxantrone | **Mitozantrone** |
| `vs-senologie-therapie-status` | SCT | `385651009` | Laufend | **In progress** |
| `vs-senologie-therapie-status` | SCT | `410546004` | Abgeschlossen | **Discontinued** |
| `vs-senologie-therapie-status` | SCT | `410548003` | Abgebrochen | **Disorganised historian** |
| `vs-senologie-tumornachweis-status` | SCT | `64957009` | Abklärungsbedürftiger Befund | **Uncertain** |
| `vs-senologie-tumornachweis-status` | SCT | `260388006` | Verlauf — Stable disease (SD) | **No change** |
| `vs-senologie-tumornachweis-status` | SCT | `551001000124108` | Verlauf — Partielle Remission (PR) | **Malignant neoplasm in partial remission** |
| `vs-senologie-tumornachweis-status` | SCT | `550991000124107` | Verlauf — Komplettremission (CR) | **Malignant neoplasm in full remission** |
| `vs-senologie-tumornachweis-status` | SCT | `419835002` | Verlauf — Progressive Disease (PD) | **Tumour progression** |
| `vs-senologie-verlauf-tumorstatus-gesamt` | SCT | `271299001` | Tumor progression | **Patient's condition worsened** |
| `vs-senologie-vorstellungsgrund` | SCT | `185387006` | Erstvorstellung | **New patient consultation** |
| `vs-senologie-vorstellungsgrund` | SCT | `726007` | Zweitmeinung | **Pathology consultation, comprehensive, records and specimen with report** |
| `vs-senologie-vorstellungsgrund` | SCT | `390906007` | Nachsorge | **Follow-up encounter** |

## 💬 Translation/label difference (likely OK — manual verification)
| VS | System | Code | Claimed (DE/label) | Official (EN) |
|---|---|---|---|---|
| `vs-senologie-b-klassifikation` | SCT | `109889007` | B5a — Maligne in-situ-Karzinome | Intraductal carcinoma in situ of breast |
| `vs-senologie-b3-subtypen` | SCT | `99571000119102` | Papillom ohne Atypie | Papilloma of breast |
| `vs-senologie-b3-subtypen` | SCT | `1144917006` | Atypisches Papillom | Atypical intraductal papilloma of breast |
| `vs-senologie-b3-subtypen` | SCT | `390787006` | Radiäre Narbe / komplex sklerosierende Läsion | Radial scar of breast |
| `vs-senologie-b3-subtypen` | SCT | `450697004` | LIN — ALH (Atypische lobuläre Hyperplasie) | Atypical lobular hyperplasia of breast |
| `vs-senologie-bildgebung-modalitaet` | SCT | `43204002` | Mammographie beidseits | Mammography of bilateral breasts |
| `vs-senologie-bildgebung-modalitaet` | SCT | `566571000119105` | Mammographie rechts | Mammography of right breast |
| `vs-senologie-bildgebung-modalitaet` | SCT | `572701000119102` | Mammographie links | Mammography of left breast |
| `vs-senologie-bildgebung-modalitaet` | SCT | `12711000087103` | Sonographie Mamma/Axilla beidseits | Ultrasound of bilateral breasts and bilateral axillae |
| `vs-senologie-bildgebung-modalitaet` | SCT | `12641000087107` | Sonographie Mamma/Axilla rechts | Ultrasound of right breast and right axilla |
| `vs-senologie-bildgebung-modalitaet` | SCT | `12771000087105` | Sonographie Mamma/Axilla links | Ultrasound of left breast and left axilla |
| `vs-senologie-bildgebung-modalitaet` | SCT | `723778004` | Tomosynthese rechts | Digital tomosynthesis of right breast |
| `vs-senologie-bildgebung-modalitaet` | SCT | `723779007` | Tomosynthese links | Digital tomosynthesis of left breast |
| `vs-senologie-bildgebung-modalitaet` | SCT | `734951009` | MRT Mamma | MRI of bilateral breasts |
| `vs-senologie-clavien-dindo` | SCT | `1367519000` | Clavien-Dindo Grad I | Clavien-Dindo classification grade I |
| `vs-senologie-clavien-dindo` | SCT | `1367520006` | Clavien-Dindo Grad II | Clavien-Dindo classification grade II |
| `vs-senologie-clavien-dindo` | SCT | `1367521005` | Clavien-Dindo Grad III | Clavien-Dindo classification grade III |
| `vs-senologie-clavien-dindo` | SCT | `1367524002` | Clavien-Dindo Grad IV | Clavien-Dindo classification grade IV |
| `vs-senologie-clavien-dindo` | SCT | `1367527009` | Clavien-Dindo Grad V | Clavien-Dindo classification grade V |
| `vs-senologie-detektion-modus` | SCT | `268547008` | Screening-detektiert | Screening for breast cancer |
| `vs-senologie-diagnose-mamma-24` | SCT | `254837009` | Mammakarzinom | Malignant neoplasm of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `109889007` | Carcinoma in situ (DCIS) | Intraductal carcinoma in situ of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `27431007` | Fibrozystische Mastopathie | Fibrocystic disease of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `399123008` | Einfache Mammazyste | Benign retention cyst of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `449837001` | Komplexe Mammazyste | Complex cyst of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `83620003` | Mastitis non-puerperalis | Nonpuerperal mastitis |
| `vs-senologie-diagnose-mamma-24` | SCT | `1287638006` | Mastitis puerperalis | Postpartum mastitis |
| `vs-senologie-diagnose-mamma-24` | SCT | `16698000` | Abszess non-puerperalis der Mamma | Acute abscess of breast |
| `vs-senologie-diagnose-mamma-24` | SCT | `10745131000119107` | Abszess puerperalis der Mamma | Breast abscess during lactation |
| `vs-senologie-diagnose-mamma-24` | SCT | `237444008` | Granulomatöse Mastitis | Granulomatous mastitis |
| `vs-senologie-diagnose-mamma-24` | SCT | `237473006` | Rupturiertes Mammaimplantat | Rupture of breast implant |
| `vs-senologie-diagnose-mamma-24` | SCT | `4754008` | Gynäkomastie | Gynaecomastia |
| `vs-senologie-diagnose-sct` | SCT | `269497004` | Neoplasm of uncertain behavior of breast | Neoplasm of uncertain behaviour of breast |
| `vs-senologie-diagnose` | SCT | `1287638006` | Puerperal mastitis | Postpartum mastitis |
| `vs-senologie-diagnose` | SCT | `16698000` | Non-puerperal breast abscess | Acute abscess of breast |
| `vs-senologie-diagnose` | SCT | `10745131000119107` | Abscess of breast associated with lactation | Breast abscess during lactation |
| `vs-senologie-diagnose` | SCT | `269497004` | Neoplasm of uncertain behavior of breast | Neoplasm of uncertain behaviour of breast |
| `vs-senologie-diagnose` | SCT | `237473006` | Ruptured breast implant | Rupture of breast implant |
| `vs-senologie-diagnose` | SCT | `237474000` | Contracture of breast following insertion of breast implant | Capsular contracture of breast |
| `vs-senologie-familien-erkrankung` | SCT | `254837009` | Mammakarzinom | Malignant neoplasm of breast |
| `vs-senologie-fernmetastasen-lokalisation` | SCT | `39607008` | Lunge | Structure of lung |
| `vs-senologie-fernmetastasen-lokalisation` | SCT | `10200004` | Leber | Structure of liver |
| `vs-senologie-fernmetastasen-lokalisation` | SCT | `272673000` | Knochen | Structure of bone |
| `vs-senologie-fernmetastasen-lokalisation` | SCT | `12738006` | Hirn | Structure of brain |
| `vs-senologie-histologie-typ` | SCT | `82711006` | Invasives Karzinom NST | Infiltrating duct carcinoma |
| `vs-senologie-ja-nein` | SCT | `373066001` | Ja | Yes |
| `vs-senologie-ja-nein` | SCT | `373067005` | Nein | No |
| `vs-senologie-menopausenstatus-erweitert` | SCT | `309606002` | Prämenopausal | Before menopause |
| `vs-senologie-menopausenstatus` | SCT | `289903006` | Prämenopausal | Menopause present |
| `vs-senologie-praeparat-art` | SCT | `9911007` | Stanzbiopsie | Core needle biopsy |
| `vs-senologie-praeparat-art` | SCT | `786883001` | Vakuumbiopsie | Vacuum assisted biopsy |
| `vs-senologie-praeparat-art` | SCT | `68660007` | Punchbiopsie | Punch biopsy |
| `vs-senologie-praeparat-art` | SCT | `48469005` | Zytologie | Cytologic material |
| `vs-senologie-praeparat-art` | SCT | `387733004` | Feinnadelaspiration (FNA) | Needle aspiration of breast |
| `vs-senologie-preop-markierung` | SCT | `77343006` | Angiographische Markierung | Angiography |
| `vs-senologie-quadrant-mamma` | SCT | `77831004` | Oberer innerer Quadrant | Structure of upper inner quadrant of breast |
| `vs-senologie-quadrant-mamma` | SCT | `19100000` | Unterer innerer Quadrant | Structure of lower inner quadrant of breast |
| `vs-senologie-rt-applikationsart` | SCT | `152198000` | Brachytherapie | Brachytherapy |
| `vs-senologie-rt-zielvolumen` | SCT | `68171009` | Axilläre Lymphknoten | Structure of axillary lymph node |
| `vs-senologie-rt-zielvolumen` | SCT | `76838003` | Supraklavikuläre Lymphknoten | Structure of supraclavicular lymph node |
| `vs-senologie-rt-zielvolumen` | SCT | `245282001` | Parasternale Lymphknoten | Structure of internal mammary lymph node group |
| `vs-senologie-seite-mamma` | SCT | `24028007` | Rechts | Right |
| `vs-senologie-seite-mamma` | SCT | `7771000` | Links | Left |
| `vs-senologie-seite-mamma` | SCT | `51440002` | Beidseits | Right and left |
| `vs-senologie-systemtherapie-art` | SCT | `385786002` | Chemotherapie | Chemotherapy care |
| `vs-senologie-systemtherapie-art` | SCT | `76334006` | Immuntherapie | Immunological therapy |
| `vs-senologie-systemtherapie-medikation` | SCT | `772118008` | Doxorubicin hydrochloride pegylated liposome | Doxorubicin hydrochloride (as pegylated liposomal) |
| `vs-senologie-therapie-intention` | SCT | `373808002` | Kurativ | Curative - procedure intent |
| `vs-senologie-therapie-intention` | SCT | `103693007` | Diagnostisch | Diagnostic procedure |
