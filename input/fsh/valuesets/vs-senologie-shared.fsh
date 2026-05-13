// Wiederverwendbare ValueSets für die Senologie-IG.
// Bündelt häufig genutzte Auswahllisten die in mehreren Questionnaires + Profilen
// referenziert werden, damit die Definitionen nicht inline pro Form dupliziert sind.

Alias: $CLIN_CUSTOM = https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom
Alias: $BG_CUSTOM = https://www.senologie.org/fhir/CodeSystem/bildgebung-custom

// ============================================================
// Seitenlokalisation Mamma (Rechts/Links/Beidseits)
// ============================================================
ValueSet: VS_Senologie_Seite_Mamma
Id: vs-senologie-seite-mamma
Title: "VS Senologie Seitenlokalisation Mamma"
Description: "Brust-Seitenlokalisation (Rechts/Links/Beidseits) als SNOMED-CT-Codes für alle Formulare der Senologie-IG."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#24028007 "Rechts"
* $SCT#7771000 "Links"
* $SCT#51440002 "Beidseits"

// ============================================================
// Quadrant der Mamma (6 Quadranten + Mamille + Zentral)
// ============================================================
ValueSet: VS_Senologie_Quadrant_Mamma
Id: vs-senologie-quadrant-mamma
Title: "VS Senologie Quadrant Mamma"
Description: "Quadranten-Lokalisation der Brust (oben-aussen/innen, unten-aussen/innen, Mamille, Zentral)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-quadrant-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#76365002 "Oberer äußerer Quadrant"
* $SCT#77831004 "Oberer innerer Quadrant"
* $SCT#33564002 "Unterer äußerer Quadrant"
* $SCT#19100000 "Unterer innerer Quadrant"
* $SCT#24142002 "Mamille"
* $SCT#70925003 "Zentral"

// ============================================================
// auffällig / unauffällig (Inspektion + Palpation)
// ============================================================
ValueSet: VS_Senologie_Auffaellig_Unauffaellig
Id: vs-senologie-auffaellig-unauffaellig
Title: "VS Senologie Auffällig/Unauffällig"
Description: "Klinischer Befundstatus 'auffällig' / 'unauffällig' für Inspektion und Palpation."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#17621005 "unauffällig (Normal)"
* $SCT#263654008 "auffällig (Abnormal)"

// ============================================================
// Tumornachweis-Status (RECIST-Response + diagnostische Stati)
// ============================================================
ValueSet: VS_Senologie_Tumornachweis_Status
Id: vs-senologie-tumornachweis-status
Title: "VS Senologie Tumornachweis-Status"
Description: "Diagnostische Stati + RECIST-Response-Assessment für die klinische Untersuchung. Mischung aus Diagnose-Stage (Abklärungsbedürftig, Erstdiagnose) und Verlaufs-Response-Werten (SD/PR/CR/PD/Mixed)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#64957009 "Abklärungsbedürftiger Befund"
* $CLIN_CUSTOM#tumornachweis-erstdiagnose-bc "Erstdiagnose Mammakarzinom"
* $SCT#260388006 "Verlauf — Stable disease (SD)"
* $SCT#551001000124108 "Verlauf — Partielle Remission (PR)"
* $SCT#550991000124107 "Verlauf — Komplettremission (CR)"
* $CLIN_CUSTOM#tumornachweis-gemischtes-ansprechen "Verlauf — Gemischtes Ansprechen (Mixed)"
* $SCT#419835002 "Verlauf — Progressive Disease (PD)"

// ============================================================
// RECIST-Response (Verlauf-Form pur)
// ============================================================
ValueSet: VS_Senologie_RECIST_Response
Id: vs-senologie-recist-response
Title: "VS Senologie RECIST-Response"
Description: "Reine Response-Assessment-Werte (SD/PR/CR/PD/Mixed) für die Verlaufs-Dokumentation, ohne Erst-Diagnose-Stati."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-recist-response"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#260388006 "Stable disease (SD)"
* $SCT#551001000124108 "Partielle Remission (PR)"
* $SCT#550991000124107 "Komplettremission (CR)"
* $CLIN_CUSTOM#tumornachweis-gemischtes-ansprechen "Gemischtes Ansprechen (Mixed)"
* $SCT#419835002 "Progressive Disease (PD)"

// ============================================================
// R-Status (Resektionsstatus)
// ============================================================
ValueSet: VS_Senologie_R_Status
Id: vs-senologie-r-status
Title: "VS Senologie R-Status (Resektionsstatus)"
Description: "Resektionsstatus R0/R1/R2/RX als SNOMED-Codes."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#395536008 "R0 — kein Residualtumor"
* $SCT#395537004 "R1 — mikroskopischer Residualtumor"
* $SCT#395538009 "R2 — makroskopischer Residualtumor"
* $SCT#395539001 "RX — nicht beurteilbar"

// ============================================================
// Ptosis-Grad (Regnault-Klassifikation)
// ============================================================
ValueSet: VS_Senologie_Ptosis_Grad
Id: vs-senologie-ptosis-grad
Title: "VS Senologie Ptosis-Grad (Regnault)"
Description: "Ptosis-Grad nach Regnault (0/I/II/III) für die Inspektion."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ptosis-grad"
* ^status = #draft
* insert PR_CS_VS_Version
* $CLIN_CUSTOM#ptosis-0 "0 — keine Ptosis"
* $CLIN_CUSTOM#ptosis-i "I — leicht"
* $CLIN_CUSTOM#ptosis-ii "II — moderat"
* $CLIN_CUSTOM#ptosis-iii "III — schwer"

// ============================================================
// Bildgebungs-Modalität (Mammographie/Sono/Tomo/MRT × Seite)
// ============================================================
ValueSet: VS_Senologie_Bildgebung_Modalitaet
Id: vs-senologie-bildgebung-modalitaet
Title: "VS Senologie Bildgebungs-Modalität"
Description: "Bildgebende Verfahren (Mammographie/Sonographie/Tomosynthese/MRT) mit Seitenlokalisation."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-bildgebung-modalitaet"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#43204002 "Mammographie beidseits"
* $SCT#566571000119105 "Mammographie rechts"
* $SCT#572701000119102 "Mammographie links"
* $SCT#12711000087103 "Sonographie Mamma/Axilla beidseits"
* $SCT#12641000087107 "Sonographie Mamma/Axilla rechts"
* $SCT#12771000087105 "Sonographie Mamma/Axilla links"
* $SCT#723780005 "Tomosynthese beidseits"
* $SCT#723778004 "Tomosynthese rechts"
* $SCT#723779007 "Tomosynthese links"
* $SCT#734951009 "MRT Mamma"

// ============================================================
// BI-RADS-Kategorien (0-6)
// ============================================================
ValueSet: VS_Senologie_BIRADS
Id: vs-senologie-birads
Title: "VS Senologie BI-RADS Kategorie"
Description: "BI-RADS Mammographie-Assessment-Kategorien 0-6 als SNOMED-Codes."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-birads"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#397138000 "BI-RADS 0 — Zusätzliche Bildgebung"
* $SCT#397140005 "BI-RADS 1 — Unauffällig"
* $SCT#397141009 "BI-RADS 2 — Gutartig"
* $SCT#397143007 "BI-RADS 3 — Wahrscheinlich gutartig"
* $SCT#397144001 "BI-RADS 4 — Suspekt"
* $SCT#397145000 "BI-RADS 5 — Hochverdächtig"
* $SCT#6111000179101 "BI-RADS 6 — Histologisch gesichert maligne"

// ============================================================
// ACR Brustdichte (A-D)
// ============================================================
ValueSet: VS_Senologie_ACR_Brustdichte
Id: vs-senologie-acr-brustdichte
Title: "VS Senologie ACR Brustdichte"
Description: "ACR Brustdichte-Kategorien A-D als SNOMED-Codes."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-acr-brustdichte"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#129716005 "A — Fast vollständig fetthaltig"
* $SCT#129717001 "B — Verstreute fibroglanduläre Verdichtungen"
* $SCT#129718006 "C — Heterogen dicht"
* $SCT#129719003 "D — Extrem dicht"

// ============================================================
// Mikrokalk-Triage (Sono/Mammo)
// ============================================================
ValueSet: VS_Senologie_Mikrokalk_Triage
Id: vs-senologie-mikrokalk-triage
Title: "VS Senologie Mikrokalk-Triage"
Description: "Mikrokalk-Auswahl: Ja-suspekt / Ja-nicht-suspekt / Nein."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-mikrokalk-triage"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#mikrokalk-ja-suspekt "Ja, suspekt"
* $BG_CUSTOM#mikrokalk-ja-nicht-suspekt "Ja, nicht suspekt"
* $BG_CUSTOM#mikrokalk-nein "Nein"

// ============================================================
// LK-Status (axilläre Lymphknoten in der Bildgebung)
// ============================================================
ValueSet: VS_Senologie_LK_Status_Bildgebung
Id: vs-senologie-lk-status-bildgebung
Title: "VS Senologie LK-Status (Bildgebung)"
Description: "Axillärer Lymphknoten-Status: unauffällig/unklar/suspekt/kein LK abgebildet."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-lk-status-bildgebung"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#lk-unauffaellig "unauffällig"
* $BG_CUSTOM#lk-unklar "unklar"
* $BG_CUSTOM#lk-suspekt "suspekt"
* $BG_CUSTOM#lk-kein-abgebildet "kein LK abgebildet"

// ============================================================
// US-DEGUM Klassifikation
// ============================================================
ValueSet: VS_Senologie_US_DEGUM
Id: vs-senologie-us-degum
Title: "VS Senologie US-DEGUM Klassifikation"
Description: "DEGUM-Sonographie-Klassifikation 0-6 für Mamma-Sono."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-us-degum"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#us-degum-0 "DEGUM 0"
* $BG_CUSTOM#us-degum-1 "DEGUM 1"
* $BG_CUSTOM#us-degum-2 "DEGUM 2"
* $BG_CUSTOM#us-degum-3 "DEGUM 3"
* $BG_CUSTOM#us-degum-4 "DEGUM 4"
* $BG_CUSTOM#us-degum-5 "DEGUM 5"
* $BG_CUSTOM#us-degum-6 "DEGUM 6"

// ============================================================
// Beurteilbarkeit (gut / eingeschränkt)
// ============================================================
ValueSet: VS_Senologie_Beurteilbarkeit
Id: vs-senologie-beurteilbarkeit
Title: "VS Senologie Beurteilbarkeit"
Description: "Beurteilbarkeit einer Bildgebung (gut / eingeschränkt)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-beurteilbarkeit"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#beurteilbarkeit-gut "gut"
* $BG_CUSTOM#beurteilbarkeit-eingeschraenkt "eingeschränkt"

// ============================================================
// Standort (intern / extern)
// ============================================================
ValueSet: VS_Senologie_Standort
Id: vs-senologie-standort
Title: "VS Senologie Standort (intern / extern)"
Description: "Standort einer Untersuchung: intern (eigene Klinik) / extern (externe Praxis/Klinik)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-standort"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#standort-intern "intern"
* $BG_CUSTOM#standort-extern "extern"

// ============================================================
// Material-Art (Specimen.type — Pathologie)
// ============================================================
ValueSet: VS_Senologie_Praeparat_Art
Id: vs-senologie-praeparat-art
Title: "VS Senologie Präparat-Art"
Description: "Material-Art für Patho-Specimen (Stanze/Vakuum/Punch/Resektat/Zytologie/FNA). Treibt den oBDS-Diagnosesicherungs-Code."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-praeparat-art"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#9911007 "Stanzbiopsie"
* $SCT#786883001 "Vakuumbiopsie"
* $SCT#68660007 "Punchbiopsie"
* $SCT#439479000 "Resektat / OP-Präparat"
* $SCT#48469005 "Zytologie"
* $SCT#387733004 "Feinnadelaspiration (FNA)"

// ============================================================
// Diagnose Mamma (24 Choices, klinisch sortiert)
//
// Mit pre-baked expansion.contains um die klinische Reihenfolge zu locken
// (Aidbox/FormBox respektiert compose.include.concept-Reihenfolge nicht).
// ============================================================
ValueSet: VS_Senologie_Diagnose_Mamma
Id: vs-senologie-diagnose-mamma-24
Title: "VS Senologie Diagnose Mamma (24 Choices)"
Description: "24 Mamma-Diagnose-Choices entsprechend dem konsentierten Senologie-Datensatz (Mischung SNOMED + bz-* Custom-Codes), klinisch sortiert nach Häufigkeit."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#254837009 "Mammakarzinom"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#bc-recurrence "Mammakarzinom Rezidiv"
* $SCT#109889007 "Carcinoma in situ (DCIS)"
* $SCT#269497004 "B3-Läsion (Neoplasm of uncertain behaviour of breast)"
* $SCT#254845004 "Fibroadenom"
* $SCT#27431007 "Fibrozystische Mastopathie"
* $SCT#399123008 "Einfache Mammazyste"
* $SCT#449837001 "Komplexe Mammazyste"
* $SCT#53430007 "Mastodynie"
* $SCT#83620003 "Mastitis non-puerperalis"
* $SCT#1287638006 "Mastitis puerperalis"
* $SCT#16698000 "Abszess non-puerperalis der Mamma"
* $SCT#10745131000119107 "Abszess puerperalis der Mamma"
* $SCT#237444008 "Granulomatöse Mastitis"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#mamillensekretion-blutig "Blutige Mamillensekretion"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
* $SCT#237474000 "Kapselfibrose"
* $SCT#237473006 "Rupturiertes Mammaimplantat"
* $SCT#4754008 "Gynäkomastie"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#anisomastie "Anisomastie"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#makromastie "Makromastie"
* $SCT#718220008 "Genetische Hochrisikosituation"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#befund-unklarer-dignitaet "Befund unklarer Dignität"
* https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom#sonstiges "Sonstiges"

// Pre-baked expansion (locks display order in clients that respect it)
* ^expansion.identifier = "urn:uuid:vs-senologie-diagnose-mamma-24-expansion"
* ^expansion.timestamp = "2026-05-13T00:00:00Z"
* ^expansion.total = 24
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Mammakarzinom"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #bc-recurrence
* ^expansion.contains[=].display = "Mammakarzinom Rezidiv"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #109889007
* ^expansion.contains[=].display = "Carcinoma in situ (DCIS)"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #269497004
* ^expansion.contains[=].display = "B3-Läsion (Neoplasm of uncertain behaviour of breast)"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #254845004
* ^expansion.contains[=].display = "Fibroadenom"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #27431007
* ^expansion.contains[=].display = "Fibrozystische Mastopathie"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #399123008
* ^expansion.contains[=].display = "Einfache Mammazyste"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #449837001
* ^expansion.contains[=].display = "Komplexe Mammazyste"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #53430007
* ^expansion.contains[=].display = "Mastodynie"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #83620003
* ^expansion.contains[=].display = "Mastitis non-puerperalis"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #1287638006
* ^expansion.contains[=].display = "Mastitis puerperalis"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #16698000
* ^expansion.contains[=].display = "Abszess non-puerperalis der Mamma"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #10745131000119107
* ^expansion.contains[=].display = "Abszess puerperalis der Mamma"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #237444008
* ^expansion.contains[=].display = "Granulomatöse Mastitis"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #mamillensekretion-blutig
* ^expansion.contains[=].display = "Blutige Mamillensekretion"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #mamillensekretion-nicht-blutig
* ^expansion.contains[=].display = "Nicht blutige Mamillensekretion"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #237474000
* ^expansion.contains[=].display = "Kapselfibrose"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #237473006
* ^expansion.contains[=].display = "Rupturiertes Mammaimplantat"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #4754008
* ^expansion.contains[=].display = "Gynäkomastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #anisomastie
* ^expansion.contains[=].display = "Anisomastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #makromastie
* ^expansion.contains[=].display = "Makromastie"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #718220008
* ^expansion.contains[=].display = "Genetische Hochrisikosituation"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #befund-unklarer-dignitaet
* ^expansion.contains[=].display = "Befund unklarer Dignität"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom"
* ^expansion.contains[=].code = #sonstiges
* ^expansion.contains[=].display = "Sonstiges"

// ============================================================
// B3-Subtypen
// ============================================================
ValueSet: VS_Senologie_B3_Subtypen
Id: vs-senologie-b3-subtypen
Title: "VS Senologie B3-Subtypen"
Description: "Sub-Klassifikation der B3-Läsion (ADH, FEA, Papillom, Radiäre Narbe, LIN-ALH, LCIS klassisch/pleomorph)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-b3-subtypen"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#427785007 "ADH — Atypische duktale Hyperplasie"
* $SCT#860895001 "FEA — Flache epitheliale Atypie"
* $SCT#99571000119102 "Papillom ohne Atypie"
* $SCT#1144917006 "Atypisches Papillom"
* $SCT#390787006 "Radiäre Narbe / komplex sklerosierende Läsion"
* $SCT#450697004 "LIN — ALH (Atypische lobuläre Hyperplasie)"
* $SCT#444739008 "LIN — klassisches LCIS"
* $SCT#444591006 "LIN — nicht-klassisches (pleomorphes) LCIS"

// ============================================================
// Diagnostische Sicherheit (dotbase-Werte als FHIR ver-status)
// ============================================================
ValueSet: VS_Senologie_Diagnose_Sicherheit
Id: vs-senologie-diagnose-sicherheit
Title: "VS Senologie Diagnostische Sicherheit"
Description: "Diagnostische Sicherheits-Stati: Verdacht auf / Gesichert / Ausschluss / Z.n. (FHIR condition-ver-status)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-sicherheit"
* ^status = #draft
* insert PR_CS_VS_Version
* http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Verdacht auf"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Gesichert"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#refuted "Ausschluss"
* http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed "Zustand nach"

// ============================================================
// Symmetrie der Brüste
// ============================================================
ValueSet: VS_Senologie_Symmetrie
Id: vs-senologie-symmetrie
Title: "VS Senologie Symmetrie der Brüste"
Description: "Symmetrie-Bewertung: Symmetrisch / Asymmetrisch."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-symmetrie"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#82332009 "Symmetrisch"
* $SCT#31739005 "Asymmetrisch"

// ============================================================
// Histologie-Typ Mamma (NST, lobulär, DCIS, etc.)
// ============================================================
ValueSet: VS_Senologie_Histologie_Typ
Id: vs-senologie-histologie-typ
Title: "VS Senologie Histologie-Typ Mamma"
Description: "Histologische Subtypen des Mamma-Befunds (NST, lobulär, DCIS)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-histologie-typ"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#82711006 "Invasives Karzinom NST"
* $SCT#443451005 "Invasives lobuläres Karzinom"
* $SCT#109889007 "DCIS"

// ============================================================
// Grading (Elston-Ellis G1/G2/G3)
// ============================================================
ValueSet: VS_Senologie_Grading_Mamma
Id: vs-senologie-grading-mamma
Title: "VS Senologie Grading Mamma (Elston-Ellis)"
Description: "Histologic Grading nach Elston-Ellis (G1/G2/G3) als SNOMED-Codes."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-grading-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#54102005 "G1 — gut differenziert"
* $SCT#1663004 "G2 — mäßig differenziert"
* $SCT#61026006 "G3 — schlecht differenziert"

// ============================================================
// L-Kategorie (Lymphangiosis, UICC TNM)
// ============================================================
ValueSet: VS_Senologie_L_Kategorie
Id: vs-senologie-l-kategorie
Title: "VS Senologie L-Kategorie (Lymphangiosis)"
Description: "L-Kategorie (Lymphangiosis carcinomatosa) nach UICC TNM (L0/L1/LX)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-l-kategorie"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.uicc.org/resources/tnm#L0 "L0 — keine Lymphangiosis"
* https://www.uicc.org/resources/tnm#L1 "L1 — Lymphangiosis nachweisbar"
* https://www.uicc.org/resources/tnm#LX "LX — nicht beurteilbar"

// ============================================================
// V-Kategorie (Vasoinvasion, UICC TNM)
// ============================================================
ValueSet: VS_Senologie_V_Kategorie
Id: vs-senologie-v-kategorie
Title: "VS Senologie V-Kategorie (Vasoinvasion)"
Description: "V-Kategorie (Venöse Invasion) nach UICC TNM (V0/V1/V2/VX)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-v-kategorie"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.uicc.org/resources/tnm#V0 "V0 — keine Venöse Invasion"
* https://www.uicc.org/resources/tnm#V1 "V1 — mikroskopische Venöse Invasion"
* https://www.uicc.org/resources/tnm#V2 "V2 — makroskopische Venöse Invasion"
* https://www.uicc.org/resources/tnm#VX "VX — nicht beurteilbar"

// ============================================================
// Pn-Kategorie (Perineuralinvasion, UICC TNM)
// ============================================================
ValueSet: VS_Senologie_Pn_Kategorie
Id: vs-senologie-pn-kategorie
Title: "VS Senologie Pn-Kategorie (Perineural)"
Description: "Pn-Kategorie (Perineuralinvasion) nach UICC TNM (Pn0/Pn1/PnX)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-pn-kategorie"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.uicc.org/resources/tnm#Pn0 "Pn0 — keine Perineuralinvasion"
* https://www.uicc.org/resources/tnm#Pn1 "Pn1 — Perineuralinvasion nachweisbar"
* https://www.uicc.org/resources/tnm#PnX "PnX — nicht beurteilbar"

// ============================================================
// Therapie-Intention (Adjuvant/Neoadjuvant/Palliativ/Kurativ)
// ============================================================
ValueSet: VS_Senologie_Therapie_Intention
Id: vs-senologie-therapie-intention
Title: "VS Senologie Therapie-Intention"
Description: "Therapeutische Intention (Adjuvant/Neoadjuvant/Palliativ/Kurativ/Revision/Diagnostisch). Verwendet für OP-Planung, Postop, Strahlen- und Systemtherapie."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-intention"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#373808002 "Kurativ"
* $SCT#373846009 "Adjuvant"
* $SCT#373847000 "Neoadjuvant"
* $SCT#363676003 "Palliativ"
* $SCT#103693007 "Diagnostisch"
* $SCT#225298006 "Revision"

// ============================================================
// Therapiestatus (Abgeschlossen/Abgebrochen/Laufend)
// ============================================================
ValueSet: VS_Senologie_Therapie_Status
Id: vs-senologie-therapie-status
Title: "VS Senologie Therapie-Status"
Description: "Status einer Therapieeinheit (Strahlen- oder Systemtherapie)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-status"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#385651009 "Laufend"
* $SCT#410546004 "Abgeschlossen"
* $SCT#410548003 "Abgebrochen"

// ============================================================
// HER2 IHC-Score (0/1+/2+/3+)
// ============================================================
ValueSet: VS_Senologie_HER2_IHC_Score
Id: vs-senologie-her2-ihc-score
Title: "VS Senologie HER2 IHC-Score"
Description: "IHC-Score-Werte für HER2 (0/1+/2+/3+) nach Standardpathologie. Codes aus MII MTB INSITUHYBRIDIZATION."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-ihc-score"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score#0 "0"
* https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score#1 "1+"
* https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score#2 "2+"
* https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score#3 "3+"

// ============================================================
// HER2 Gesamtbewertung (Leitlinie 2024: positiv/low/ultralow/negativ/equivocal)
// ============================================================
ValueSet: VS_Senologie_HER2_Gesamt
Id: vs-senologie-her2-gesamt
Title: "VS Senologie HER2 Gesamtbewertung (Leitlinie)"
Description: "HER2-Gesamtbewertung nach Leitlinie 2024 (positiv/low/ultralow/negativ/equivocal)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-gesamt"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#her2-positiv "HER2-positiv"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#her2-low "HER2-low"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#her2-ultralow "HER2-ultralow"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#her2-negativ "HER2-negativ"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#her2-equivocal "HER2-equivocal"

// ============================================================
// HER2 FISH-Ergebnis (positiv/negativ/nicht durchgeführt)
// ============================================================
ValueSet: VS_Senologie_HER2_FISH
Id: vs-senologie-her2-fish
Title: "VS Senologie HER2 FISH-Ergebnis"
Description: "FISH-Ergebnis bei HER2-Amplifikationstestung."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-fish"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#10828004 "positiv"
* $SCT#260385009 "negativ"
* $SCT#385432009 "nicht durchgeführt"

// ============================================================
// ISH-Methode (FISH/CISH/DISH/SISH)
// ============================================================
ValueSet: VS_Senologie_ISH_Methode
Id: vs-senologie-ish-methode
Title: "VS Senologie ISH-Methode"
Description: "In-situ-Hybridisierungs-Methode für HER2."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ish-methode"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#fish "FISH"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#cish "CISH"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#dish "DISH"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#sish "SISH"

// ============================================================
// IHC-Intensität (negative/weak/moderate/strong)
// ============================================================
ValueSet: VS_Senologie_IHC_Intensitaet
Id: vs-senologie-ihc-intensitaet
Title: "VS Senologie IHC-Färbeintensität"
Description: "IHC-Färbeintensität für ER/PR-Beurteilung (negative/weak/moderate/strong)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ihc-intensitaet"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#intensity-negative "negative"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#intensity-weak "weak"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#intensity-moderate "moderate"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker#intensity-strong "strong"

// ============================================================
// Clavien-Dindo Komplikations-Grad (I-V)
// ============================================================
ValueSet: VS_Senologie_Clavien_Dindo
Id: vs-senologie-clavien-dindo
Title: "VS Senologie Clavien-Dindo Grade"
Description: "Clavien-Dindo Klassifikation operativer Komplikationen (Grad I-V)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-clavien-dindo"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#1367519000 "Clavien-Dindo Grad I"
* $SCT#1367520006 "Clavien-Dindo Grad II"
* $SCT#1367521005 "Clavien-Dindo Grad III"
* $SCT#1367524002 "Clavien-Dindo Grad IV"
* $SCT#1367527009 "Clavien-Dindo Grad V"

// ============================================================
// ECOG-Performance-Status (0-4)
// ============================================================
ValueSet: VS_Senologie_ECOG
Id: vs-senologie-ecog
Title: "VS Senologie ECOG-Performance-Status"
Description: "ECOG-Performance-Status 0-4."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ecog"
* ^status = #draft
* insert PR_CS_VS_Version
* http://loinc.org#LA9622-7 "0 — Normale Aktivität"
* http://loinc.org#LA9623-5 "1 — Einschränkung bei Anstrengung"
* http://loinc.org#LA9624-3 "2 — Gehfähig, nicht arbeitsfähig"
* http://loinc.org#LA9625-0 "3 — Begrenzte Selbstversorgung"
* http://loinc.org#LA9626-8 "4 — Völlig pflegebedürftig"

// ============================================================
// Menopausenstatus
// ============================================================
ValueSet: VS_Senologie_Menopausenstatus
Id: vs-senologie-menopausenstatus
Title: "VS Senologie Menopausenstatus"
Description: "Menopausenstatus für Anamnese."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#289903006 "Prämenopausal"
* $SCT#87332000 "Perimenopausal"
* $SCT#76498008 "Postmenopausal"

// ============================================================
// Raucherstatus (LOINC LA codes via 72166-2 panel)
// ============================================================
ValueSet: VS_Senologie_Raucherstatus
Id: vs-senologie-raucherstatus
Title: "VS Senologie Raucherstatus"
Description: "Tobacco smoking status (LOINC LA codes für Antworten zur Frage 72166-2)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-raucherstatus"
* ^status = #draft
* insert PR_CS_VS_Version
* http://loinc.org#LA18978-9 "Nie geraucht (Never smoked)"
* http://loinc.org#LA15920-4 "Ehemaliger Raucher (Former smoker)"
* http://loinc.org#LA18976-3 "Aktueller Raucher (Current smoker)"

// ============================================================
// Verwandtschaftsgrad (für Familienanamnese)
// ============================================================
ValueSet: VS_Senologie_Verwandtschaftsgrad
Id: vs-senologie-verwandtschaftsgrad
Title: "VS Senologie Verwandtschaftsgrad"
Description: "Verwandtschaftsgrad (mütterlicher-/väterlicher-Stamm) für Familienanamnese."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-verwandtschaftsgrad"
* ^status = #draft
* insert PR_CS_VS_Version
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mutter"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIS "Schwester"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#DAUC "Tochter"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#GRMTH "Großmutter"
* http://terminology.hl7.org/CodeSystem/v3-RoleCode#AUNT "Tante"

// ============================================================
// RT-Zielvolumen
// ============================================================
ValueSet: VS_Senologie_RT_Zielvolumen
Id: vs-senologie-rt-zielvolumen
Title: "VS Senologie Strahlentherapie-Zielvolumen"
Description: "Zielvolumen der Mamma-Strahlentherapie."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-rt-zielvolumen"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#76752008 "Ganze Brust"
* $SCT#78904004 "Brustwand"
* $SCT#68171009 "Axilläre Lymphknoten"
* $SCT#76838003 "Supraklavikuläre Lymphknoten"
* $SCT#245282001 "Parasternale Lymphknoten"

// ============================================================
// RT-Applikationsart
// ============================================================
ValueSet: VS_Senologie_RT_Applikationsart
Id: vs-senologie-rt-applikationsart
Title: "VS Senologie Strahlentherapie-Applikationsart"
Description: "Applikationsmodus der Strahlentherapie (3D-konformal/IMRT/Brachytherapie)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-rt-applikationsart"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#1163834000 "3D-konformale Bestrahlung"
* $SCT#1163833006 "IMRT (intensitätsmoduliert)"
* $SCT#152198000 "Brachytherapie"

// ============================================================
// Systemtherapie-Art
// ============================================================
ValueSet: VS_Senologie_Systemtherapie_Art
Id: vs-senologie-systemtherapie-art
Title: "VS Senologie Systemtherapie-Art"
Description: "Art der Systemtherapie (Chemo/Endokrin/Zielgerichtet/Immuntherapie)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-art"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#385786002 "Chemotherapie"
* $SCT#169413002 "Endokrine Therapie"
* $SCT#432105003 "Zielgerichtete Therapie"
* $SCT#76334006 "Immuntherapie"

// ============================================================
// Pre-OP-Markierung
// ============================================================
ValueSet: VS_Senologie_PreOp_Markierung
Id: vs-senologie-preop-markierung
Title: "VS Senologie Pre-OP-Markierung"
Description: "Methode der präoperativen Markierung der Mamma-Läsion."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-preop-markierung"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#397956004 "Drahtmarkierung (Wire guided)"
* $SCT#405815000 "Clip-Markierung"
* $SCT#77343006 "Angiographische Markierung"

// ============================================================
// Verlauf-Kontrolltermin-Art
// ============================================================
ValueSet: VS_Senologie_Kontrolltermin_Art
Id: vs-senologie-kontrolltermin-art
Title: "VS Senologie Kontrolltermin-Art"
Description: "Art einer Verlaufs-/Nachsorge-Kontrolle."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-kontrolltermin-art"
* ^status = #draft
* insert PR_CS_VS_Version
* $CLIN_CUSTOM#kontrolle-6-monate "6-Monats-Kontrolle"
* $CLIN_CUSTOM#kontrolle-12-monate "12-Monats-Kontrolle"
* $CLIN_CUSTOM#kontrolle-ausserplan "Außerplanmäßig"
* $CLIN_CUSTOM#kontrolle-abschluss "Abschlusskontrolle"

// ============================================================
// Verlauf-Tumorstatus Gesamt (Disease-State)
// ============================================================
ValueSet: VS_Senologie_Verlauf_Tumorstatus_Gesamt
Id: vs-senologie-verlauf-tumorstatus-gesamt
Title: "VS Senologie Verlauf Tumorstatus Gesamtbeurteilung"
Description: "Gesamtbeurteilung des Tumorstatus im Verlauf (CR/PR/SD/Progression). Unterscheidet sich von RECIST-Response durch Disease-State-Sicht (langfristig)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-verlauf-tumorstatus-gesamt"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#103338009 "In full remission"
* $SCT#103337004 "In partial remission"
* $SCT#58158008 "Stable"
* $SCT#271299001 "Tumor progression"

// ============================================================
// Vorstellungsgrund (Anamnese)
// ============================================================
ValueSet: VS_Senologie_Vorstellungsgrund
Id: vs-senologie-vorstellungsgrund
Title: "VS Senologie Vorstellungsgrund"
Description: "Grund der Erst- oder Folge-Vorstellung in der Senologie."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-vorstellungsgrund"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#185387006 "Erstvorstellung"
* $SCT#726007 "Zweitmeinung"
* $SCT#390906007 "Nachsorge"
* $SCT#183620003 "Wiedervorstellung"

// ============================================================
// Screening-Status (Vorgeschichte)
// ============================================================
ValueSet: VS_Senologie_Detektion_Modus
Id: vs-senologie-detektion-modus
Title: "VS Senologie Screening-Status"
Description: "Art der Detektion (Screening-detektiert / Intervallkarzinom / Selbstuntersuchung / Zufallsbefund)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-detektion-modus"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#268547008 "Screening-detektiert"
* $SCT#444589003 "Intervallkarzinom"
* $SCT#129434009 "Selbstuntersuchung"
* $SCT#261087003 "Zufallsbefund"

// ============================================================
// Familienanamnese: Erkrankung
// ============================================================
ValueSet: VS_Senologie_Familien_Erkrankung
Id: vs-senologie-familien-erkrankung
Title: "VS Senologie Familienanamnese-Erkrankung"
Description: "Erkrankungen, die in der Familienanamnese erfasst werden (Mamma- und Ovarialkarzinom-Fokus)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-familien-erkrankung"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#254837009 "Mammakarzinom"
* $SCT#363443007 "Ovarialkarzinom"
* $SCT#74964007 "Sonstiges"

// ============================================================
// Ja/Nein (Hormonersatztherapie)
// ============================================================
ValueSet: VS_Senologie_JaNein
Id: vs-senologie-ja-nein
Title: "VS Senologie Ja/Nein"
Description: "Generisches Ja/Nein als SNOMED-Codes (Hormonersatztherapie, andere Boolean-Fragen)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ja-nein"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#373066001 "Ja"
* $SCT#373067005 "Nein"

// ============================================================
// Menopausenstatus (genau)
// ============================================================
ValueSet: VS_Senologie_Menopausenstatus_Erweitert
Id: vs-senologie-menopausenstatus-erweitert
Title: "VS Senologie Menopausenstatus (mit ext. Codes)"
Description: "Menopausenstatus mit den im Form genutzten Codes (inkl. 309606002 und 161541000119104)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus-erweitert"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#309606002 "Prämenopausal"
* $SCT#161541000119104 "Perimenopausal"
* $SCT#76498008 "Postmenopausal"

// ============================================================
// Fernmetastasen-Lokalisation
// ============================================================
ValueSet: VS_Senologie_Fernmetastasen_Lokalisation
Id: vs-senologie-fernmetastasen-lokalisation
Title: "VS Senologie Fernmetastasen-Lokalisation"
Description: "Häufige Fernmetastasen-Lokalisationen beim Mammakarzinom (Lunge/Leber/Knochen/Hirn)."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-fernmetastasen-lokalisation"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#39607008 "Lunge"
* $SCT#10200004 "Leber"
* $SCT#272673000 "Knochen"
* $SCT#12738006 "Hirn"

// ============================================================
// B-Klassifikation (NHSBSP B0-B5b)
// ============================================================
ValueSet: VS_Senologie_B_Klassifikation
Id: vs-senologie-b-klassifikation
Title: "VS Senologie B-Klassifikation (NHSBSP)"
Description: "Histopathologische B-Klassifikation der Mamma-Biopsie nach NHSBSP (B0-B5b) als SNOMED-Codes."

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-b-klassifikation"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#87100004 "B0 — Specimen unsatisfactory"
* $SCT#76752008 "B1 — Normalgewebe"
* $SCT#53076004 "B2 — Benigne"
* $SCT#269497004 "B3 — Unklares biologisches Potenzial"
* $SCT#1145403004 "B4 — Malignitätsverdächtig"
* $SCT#109889007 "B5a — Maligne in-situ-Karzinome"
* $SCT#254837009 "B5b — Maligne invasiv"
