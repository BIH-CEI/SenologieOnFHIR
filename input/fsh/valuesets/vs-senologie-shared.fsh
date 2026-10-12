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
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#24028007 "Rechts"
* $SCT#7771000 "Links"
* $SCT#51440002 "Beidseits"

// ============================================================
// Quadrant der Mamma (6 Quadranten + Mamille + Zentral)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:4529fbb9-fb5a-50b5-8c41-b311f5a8d1ea"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #24028007
* ^expansion.contains[=].display = "Rechts"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #7771000
* ^expansion.contains[=].display = "Links"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #51440002
* ^expansion.contains[=].display = "Beidseits"

ValueSet: VS_Senologie_Quadrant_Mamma
Id: vs-senologie-quadrant-mamma
Title: "VS Senologie Quadrant Mamma"
Description: "Quadranten-Lokalisation der Brust (oben-aussen/innen, unten-aussen/innen, Mamille, Zentral)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-quadrant-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#76365002 "Oberer äußerer Quadrant"
* $SCT#77831004 "Oberer innerer Quadrant"
* $SCT#33564002 "Unterer äußerer Quadrant"
* $SCT#19100000 "Unterer innerer Quadrant"
* $SCT#24142002 "Mamille"
* $SCT#49058007 "Zentral (Structure of central portion of breast)"

// ============================================================
// auffällig / unauffällig (Inspektion + Palpation)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:2e7a7291-b5b9-579b-97bc-4cf1c4895078"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 6
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76365002
* ^expansion.contains[=].display = "Oberer äußerer Quadrant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #77831004
* ^expansion.contains[=].display = "Oberer innerer Quadrant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #33564002
* ^expansion.contains[=].display = "Unterer äußerer Quadrant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #19100000
* ^expansion.contains[=].display = "Unterer innerer Quadrant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #24142002
* ^expansion.contains[=].display = "Mamille"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #49058007
* ^expansion.contains[=].display = "Zentral (Structure of central portion of breast)"

ValueSet: VS_Senologie_Auffaellig_Unauffaellig
Id: vs-senologie-auffaellig-unauffaellig
Title: "VS Senologie Auffällig/Unauffällig"
Description: "Klinischer Befundstatus 'auffällig' / 'unauffällig' für Inspektion und Palpation."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#17621005 "unauffällig (Normal)"
* $SCT#263654008 "auffällig (Abnormal)"

// ============================================================
// Tumornachweis-Status (RECIST-Response + diagnostische Stati)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:603220cc-9d2a-5ac3-aea2-6e9454aededf"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #17621005
* ^expansion.contains[=].display = "unauffällig (Normal)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #263654008
* ^expansion.contains[=].display = "auffällig (Abnormal)"

ValueSet: VS_Senologie_Tumornachweis_Status
Id: vs-senologie-tumornachweis-status
Title: "VS Senologie Tumornachweis-Status"
Description: "Diagnostische Stati + RECIST-Response-Assessment für die klinische Untersuchung. Mischung aus Diagnose-Stage (Abklärungsbedürftig, Erstdiagnose) und Verlaufs-Response-Werten (SD/PR/CR/PD/Mixed)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#134405005 "Abklärungsbedürftiger Befund (Malignant neoplasm of breast suspected)"
* $CLIN_CUSTOM#tumornachweis-erstdiagnose-bc "Erstdiagnose Mammakarzinom"
* $SCT#260388006 "Verlauf — Stable disease (SD)"
* $SCT#551001000124108 "Verlauf — Partielle Remission (PR)"
* $SCT#550991000124107 "Verlauf — Komplettremission (CR)"
* $CLIN_CUSTOM#tumornachweis-gemischtes-ansprechen "Verlauf — Gemischtes Ansprechen (Mixed)"
* $SCT#419835002 "Verlauf — Progressive Disease (PD)"

// ============================================================
// RECIST-Response (Verlauf-Form pur)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:fc2bfddb-2d80-5e18-8575-84309abfc7ac"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 7
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #134405005
* ^expansion.contains[=].display = "Abklärungsbedürftiger Befund (Malignant neoplasm of breast suspected)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260388006
* ^expansion.contains[=].display = "Verlauf — Stable disease (SD)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #551001000124108
* ^expansion.contains[=].display = "Verlauf — Partielle Remission (PR)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #550991000124107
* ^expansion.contains[=].display = "Verlauf — Komplettremission (CR)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #419835002
* ^expansion.contains[=].display = "Verlauf — Progressive Disease (PD)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #tumornachweis-erstdiagnose-bc
* ^expansion.contains[=].display = "Erstdiagnose Mammakarzinom"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #tumornachweis-gemischtes-ansprechen
* ^expansion.contains[=].display = "Verlauf — Gemischtes Ansprechen (Mixed)"

ValueSet: VS_Senologie_RECIST_Response
Id: vs-senologie-recist-response
Title: "VS Senologie RECIST-Response"
Description: "Reine Response-Assessment-Werte (SD/PR/CR/PD/Mixed) für die Verlaufs-Dokumentation, ohne Erst-Diagnose-Stati."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1c60942d-bbc8-5bc4-a503-19a7a794cfa7"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260388006
* ^expansion.contains[=].display = "Stable disease (SD)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #551001000124108
* ^expansion.contains[=].display = "Partielle Remission (PR)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #550991000124107
* ^expansion.contains[=].display = "Komplettremission (CR)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #419835002
* ^expansion.contains[=].display = "Progressive Disease (PD)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #tumornachweis-gemischtes-ansprechen
* ^expansion.contains[=].display = "Gemischtes Ansprechen (Mixed)"

ValueSet: VS_Senologie_R_Status
Id: vs-senologie-r-status
Title: "VS Senologie R-Status (Resektionsstatus)"
Description: "Resektionsstatus R0/R1/R2/RX als SNOMED-Codes."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/form-helper#r-0 "R0 — kein Residualtumor"
* https://www.senologie.org/fhir/CodeSystem/form-helper#r-1 "R1 — mikroskopischer Residualtumor"
* https://www.senologie.org/fhir/CodeSystem/form-helper#r-2 "R2 — makroskopischer Residualtumor"
* https://www.senologie.org/fhir/CodeSystem/form-helper#r-x "RX — nicht beurteilbar"

// ============================================================
// Ptosis-Grad (Regnault-Klassifikation)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:efe0a41a-7a30-5e66-9881-cd0ad3ba0ae4"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #r-0
* ^expansion.contains[=].display = "R0 — kein Residualtumor"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #r-1
* ^expansion.contains[=].display = "R1 — mikroskopischer Residualtumor"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #r-2
* ^expansion.contains[=].display = "R2 — makroskopischer Residualtumor"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #r-x
* ^expansion.contains[=].display = "RX — nicht beurteilbar"

ValueSet: VS_Senologie_Ptosis_Grad
Id: vs-senologie-ptosis-grad
Title: "VS Senologie Ptosis-Grad (Regnault)"
Description: "Ptosis-Grad nach Regnault (0/I/II/III) für die Inspektion."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1ea1437d-c77f-5f1d-b771-e15f68320e02"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #ptosis-0
* ^expansion.contains[=].display = "0 — keine Ptosis"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #ptosis-i
* ^expansion.contains[=].display = "I — leicht"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #ptosis-ii
* ^expansion.contains[=].display = "II — moderat"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #ptosis-iii
* ^expansion.contains[=].display = "III — schwer"

ValueSet: VS_Senologie_Bildgebung_Modalitaet
Id: vs-senologie-bildgebung-modalitaet
Title: "VS Senologie Bildgebungs-Modalität"
Description: "Bildgebende Verfahren (Mammographie/Sonographie/Tomosynthese/MRT) mit Seitenlokalisation."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:e2f25db4-ad93-56bb-8a1b-b2a8e7a0f128"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 10
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #43204002
* ^expansion.contains[=].display = "Mammographie beidseits"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #566571000119105
* ^expansion.contains[=].display = "Mammographie rechts"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #572701000119102
* ^expansion.contains[=].display = "Mammographie links"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #12711000087103
* ^expansion.contains[=].display = "Sonographie Mamma/Axilla beidseits"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #12641000087107
* ^expansion.contains[=].display = "Sonographie Mamma/Axilla rechts"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #12771000087105
* ^expansion.contains[=].display = "Sonographie Mamma/Axilla links"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #723780005
* ^expansion.contains[=].display = "Tomosynthese beidseits"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #723778004
* ^expansion.contains[=].display = "Tomosynthese rechts"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #723779007
* ^expansion.contains[=].display = "Tomosynthese links"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #734951009
* ^expansion.contains[=].display = "MRT Mamma"

ValueSet: VS_Senologie_BIRADS
Id: vs-senologie-birads
Title: "VS Senologie BI-RADS Kategorie"
Description: "BI-RADS Mammographie-Assessment-Kategorien 0-6 als SNOMED-Codes."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:ba83f2aa-c3d4-594a-a709-a1b54215f7d6"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 7
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397138000
* ^expansion.contains[=].display = "BI-RADS 0 — Zusätzliche Bildgebung"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397140005
* ^expansion.contains[=].display = "BI-RADS 1 — Unauffällig"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397141009
* ^expansion.contains[=].display = "BI-RADS 2 — Gutartig"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397143007
* ^expansion.contains[=].display = "BI-RADS 3 — Wahrscheinlich gutartig"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397144001
* ^expansion.contains[=].display = "BI-RADS 4 — Suspekt"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #397145000
* ^expansion.contains[=].display = "BI-RADS 5 — Hochverdächtig"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #6111000179101
* ^expansion.contains[=].display = "BI-RADS 6 — Histologisch gesichert maligne"

ValueSet: VS_Senologie_ACR_Brustdichte
Id: vs-senologie-acr-brustdichte
Title: "VS Senologie ACR Brustdichte"
Description: "ACR Brustdichte-Kategorien A-D als SNOMED-Codes."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:c48a5dd8-7469-5eb2-8e9a-1dd5e21708d7"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129716005
* ^expansion.contains[=].display = "A — Fast vollständig fetthaltig"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129717001
* ^expansion.contains[=].display = "B — Verstreute fibroglanduläre Verdichtungen"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129718006
* ^expansion.contains[=].display = "C — Heterogen dicht"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129719003
* ^expansion.contains[=].display = "D — Extrem dicht"

ValueSet: VS_Senologie_Mikrokalk_Triage
Id: vs-senologie-mikrokalk-triage
Title: "VS Senologie Mikrokalk-Triage"
Description: "Mikrokalk-Auswahl: Ja-suspekt / Ja-nicht-suspekt / Nein."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-mikrokalk-triage"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#mikrokalk-ja-suspekt "Ja, suspekt"
* $BG_CUSTOM#mikrokalk-ja-nicht-suspekt "Ja, nicht suspekt"
* $BG_CUSTOM#mikrokalk-nein "Nein"

// ============================================================
// LK-Status (axilläre Lymphknoten in der Bildgebung)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:9920ec04-0a4e-50af-8f48-4f5394da4a12"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #mikrokalk-ja-suspekt
* ^expansion.contains[=].display = "Ja, suspekt"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #mikrokalk-ja-nicht-suspekt
* ^expansion.contains[=].display = "Ja, nicht suspekt"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #mikrokalk-nein
* ^expansion.contains[=].display = "Nein"

ValueSet: VS_Senologie_LK_Status_Bildgebung
Id: vs-senologie-lk-status-bildgebung
Title: "VS Senologie LK-Status (Bildgebung)"
Description: "Axillärer Lymphknoten-Status: unauffällig/unklar/suspekt/kein LK abgebildet."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:a1bfd829-83aa-50f1-9ed7-34ddb213f8f6"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #lk-unauffaellig
* ^expansion.contains[=].display = "unauffällig"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #lk-unklar
* ^expansion.contains[=].display = "unklar"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #lk-suspekt
* ^expansion.contains[=].display = "suspekt"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #lk-kein-abgebildet
* ^expansion.contains[=].display = "kein LK abgebildet"

ValueSet: VS_Senologie_US_DEGUM
Id: vs-senologie-us-degum
Title: "VS Senologie US-DEGUM Klassifikation"
Description: "DEGUM-Sonographie-Klassifikation 0-6 für Mamma-Sono."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:5fbeca13-fa88-59d3-8f6e-9bc47274554d"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 7
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-0
* ^expansion.contains[=].display = "DEGUM 0"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-1
* ^expansion.contains[=].display = "DEGUM 1"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-2
* ^expansion.contains[=].display = "DEGUM 2"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-3
* ^expansion.contains[=].display = "DEGUM 3"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-4
* ^expansion.contains[=].display = "DEGUM 4"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-5
* ^expansion.contains[=].display = "DEGUM 5"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #us-degum-6
* ^expansion.contains[=].display = "DEGUM 6"

ValueSet: VS_Senologie_Beurteilbarkeit
Id: vs-senologie-beurteilbarkeit
Title: "VS Senologie Beurteilbarkeit"
Description: "Beurteilbarkeit einer Bildgebung (gut / eingeschränkt)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-beurteilbarkeit"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#beurteilbarkeit-gut "gut"
* $BG_CUSTOM#beurteilbarkeit-eingeschraenkt "eingeschränkt"

// ============================================================
// Standort (intern / extern)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:9833aba7-d7d9-5e1c-96f5-792b6034d029"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #beurteilbarkeit-gut
* ^expansion.contains[=].display = "gut"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #beurteilbarkeit-eingeschraenkt
* ^expansion.contains[=].display = "eingeschränkt"

ValueSet: VS_Senologie_Standort
Id: vs-senologie-standort
Title: "VS Senologie Standort (intern / extern)"
Description: "Standort einer Untersuchung: intern (eigene Klinik) / extern (externe Praxis/Klinik)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-standort"
* ^status = #draft
* insert PR_CS_VS_Version
* $BG_CUSTOM#standort-intern "intern"
* $BG_CUSTOM#standort-extern "extern"

// ============================================================
// Material-Art (Specimen.type — Pathologie)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:d9ad030d-b828-5a01-9ab8-bff11fbecd24"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #standort-intern
* ^expansion.contains[=].display = "intern"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom"
* ^expansion.contains[=].code = #standort-extern
* ^expansion.contains[=].display = "extern"

ValueSet: VS_Senologie_Praeparat_Art
Id: vs-senologie-praeparat-art
Title: "VS Senologie Präparat-Art"
Description: "Material-Art für Patho-Specimen (Stanze/Vakuum/Punch/Resektat/Zytologie/FNA). Treibt den oBDS-Diagnosesicherungs-Code."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:c890336f-e2de-5dd3-aee7-42debe952f82"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 6
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #9911007
* ^expansion.contains[=].display = "Stanzbiopsie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #786883001
* ^expansion.contains[=].display = "Vakuumbiopsie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #68660007
* ^expansion.contains[=].display = "Punchbiopsie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #439479000
* ^expansion.contains[=].display = "Resektat / OP-Präparat"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #48469005
* ^expansion.contains[=].display = "Zytologie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387733004
* ^expansion.contains[=].display = "Feinnadelaspiration (FNA)"

ValueSet: VS_Senologie_Diagnose_Mamma
Id: vs-senologie-diagnose-mamma-24
Title: "VS Senologie Diagnose Mamma (24 Choices)"
Description: "24 Mamma-Diagnose-Choices entsprechend dem konsentierten Senologie-Datensatz (Mischung SNOMED + bz-* Custom-Codes), klinisch sortiert nach Häufigkeit."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#254837009 "Mammakarzinom"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#bc-recurrence "Mammakarzinom Rezidiv"
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
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#mamillensekretion-blutig "Blutige Mamillensekretion"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
* $SCT#237474000 "Kapselfibrose"
* $SCT#237473006 "Rupturiertes Mammaimplantat"
* $SCT#4754008 "Gynäkomastie"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#anisomastie "Anisomastie"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#makromastie "Makromastie"
* $SCT#718220008 "Genetische Hochrisikosituation"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#befund-unklarer-dignitaet "Befund unklarer Dignität"
* https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom#sonstiges "Sonstiges"

// Pre-baked expansion (locks display order in clients that respect it)
* ^expansion.identifier = "urn:uuid:61122395-f8e6-5a75-af79-26286bda0af2"
* ^expansion.timestamp = "2026-05-13T00:00:00Z"
* ^expansion.total = 24
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Mammakarzinom"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
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
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #mamillensekretion-blutig
* ^expansion.contains[=].display = "Blutige Mamillensekretion"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
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
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #anisomastie
* ^expansion.contains[=].display = "Anisomastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #makromastie
* ^expansion.contains[=].display = "Makromastie"
* ^expansion.contains[+].system = $SCT
* ^expansion.contains[=].code = #718220008
* ^expansion.contains[=].display = "Genetische Hochrisikosituation"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #befund-unklarer-dignitaet
* ^expansion.contains[=].display = "Befund unklarer Dignität"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #sonstiges
* ^expansion.contains[=].display = "Sonstiges"

// ============================================================
// B3-Subtypen
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:61122395-f8e6-5a75-af79-26286bda0af2"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 24
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Mammakarzinom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #109889007
* ^expansion.contains[=].display = "Carcinoma in situ (DCIS)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #269497004
* ^expansion.contains[=].display = "B3-Läsion (Neoplasm of uncertain behaviour of breast)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254845004
* ^expansion.contains[=].display = "Fibroadenom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #27431007
* ^expansion.contains[=].display = "Fibrozystische Mastopathie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #399123008
* ^expansion.contains[=].display = "Einfache Mammazyste"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #449837001
* ^expansion.contains[=].display = "Komplexe Mammazyste"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #53430007
* ^expansion.contains[=].display = "Mastodynie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #83620003
* ^expansion.contains[=].display = "Mastitis non-puerperalis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1287638006
* ^expansion.contains[=].display = "Mastitis puerperalis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #16698000
* ^expansion.contains[=].display = "Abszess non-puerperalis der Mamma"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #10745131000119107
* ^expansion.contains[=].display = "Abszess puerperalis der Mamma"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237444008
* ^expansion.contains[=].display = "Granulomatöse Mastitis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237474000
* ^expansion.contains[=].display = "Kapselfibrose"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237473006
* ^expansion.contains[=].display = "Rupturiertes Mammaimplantat"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #4754008
* ^expansion.contains[=].display = "Gynäkomastie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #718220008
* ^expansion.contains[=].display = "Genetische Hochrisikosituation"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #bc-recurrence
* ^expansion.contains[=].display = "Mammakarzinom Rezidiv"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #mamillensekretion-blutig
* ^expansion.contains[=].display = "Blutige Mamillensekretion"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #mamillensekretion-nicht-blutig
* ^expansion.contains[=].display = "Nicht blutige Mamillensekretion"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #anisomastie
* ^expansion.contains[=].display = "Anisomastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #makromastie
* ^expansion.contains[=].display = "Makromastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #befund-unklarer-dignitaet
* ^expansion.contains[=].display = "Befund unklarer Dignität"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #sonstiges
* ^expansion.contains[=].display = "Sonstiges"

ValueSet: VS_Senologie_B3_Subtypen
Id: vs-senologie-b3-subtypen
Title: "VS Senologie B3-Subtypen"
Description: "Sub-Klassifikation der B3-Läsion (ADH, FEA, Papillom, Radiäre Narbe, LIN-ALH, LCIS klassisch/pleomorph)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:b756fd9a-6723-5a89-b7c8-fa9480c5d9d2"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 8
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #427785007
* ^expansion.contains[=].display = "ADH — Atypische duktale Hyperplasie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #860895001
* ^expansion.contains[=].display = "FEA — Flache epitheliale Atypie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #99571000119102
* ^expansion.contains[=].display = "Papillom ohne Atypie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1144917006
* ^expansion.contains[=].display = "Atypisches Papillom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #390787006
* ^expansion.contains[=].display = "Radiäre Narbe / komplex sklerosierende Läsion"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #450697004
* ^expansion.contains[=].display = "LIN — ALH (Atypische lobuläre Hyperplasie)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #444739008
* ^expansion.contains[=].display = "LIN — klassisches LCIS"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #444591006
* ^expansion.contains[=].display = "LIN — nicht-klassisches (pleomorphes) LCIS"

ValueSet: VS_Senologie_Diagnose_Sicherheit
Id: vs-senologie-diagnose-sicherheit
Title: "VS Senologie Diagnostische Sicherheit"
Description: "Diagnostische Sicherheits-Stati: Verdacht auf / Gesichert / Ausschluss / Z.n. (FHIR condition-ver-status)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:4d792f26-927b-57fb-84a4-0899d1d97533"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* ^expansion.contains[=].code = #provisional
* ^expansion.contains[=].display = "Verdacht auf"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* ^expansion.contains[=].code = #confirmed
* ^expansion.contains[=].display = "Gesichert"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* ^expansion.contains[=].code = #refuted
* ^expansion.contains[=].display = "Ausschluss"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* ^expansion.contains[=].code = #unconfirmed
* ^expansion.contains[=].display = "Zustand nach"

ValueSet: VS_Senologie_Symmetrie
Id: vs-senologie-symmetrie
Title: "VS Senologie Symmetrie der Brüste"
Description: "Symmetrie-Bewertung: Symmetrisch / Asymmetrisch."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-symmetrie"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#290064007 "Symmetrisch (Symmetrical breasts)"
* $SCT#129790003 "Asymmetrisch (Asymmetric breast tissue)"

// ============================================================
// Histologie-Typ Mamma (NST, lobulär, DCIS, etc.)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:b0269d5a-eedc-55af-b47f-a0ea58aca934"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #290064007
* ^expansion.contains[=].display = "Symmetrisch (Symmetrical breasts)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129790003
* ^expansion.contains[=].display = "Asymmetrisch (Asymmetric breast tissue)"

ValueSet: VS_Senologie_Histologie_Typ
Id: vs-senologie-histologie-typ
Title: "VS Senologie Histologie-Typ Mamma"
Description: "Histologische Subtypen des Mamma-Befunds (NST, lobulär, DCIS)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-histologie-typ"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#82711006 "Invasives Karzinom NST"
// TODO: 443451005 invalid in SCT — kein eindeutiger ILC-Code vorhanden, vorerst auskommentiert
// * $SCT#443451005 "Invasives lobuläres Karzinom"
* $SCT#109889007 "DCIS"

// ============================================================
// Grading (Elston-Ellis G1/G2/G3)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1bd75c9b-374c-5a20-904f-b047a161f1df"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #82711006
* ^expansion.contains[=].display = "Invasives Karzinom NST"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #109889007
* ^expansion.contains[=].display = "DCIS"

ValueSet: VS_Senologie_Grading_Mamma
Id: vs-senologie-grading-mamma
Title: "VS Senologie Grading Mamma (Elston-Ellis)"
Description: "Histologic Grading nach Elston-Ellis (G1/G2/G3) als SNOMED-Codes."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-grading-mamma"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#54102005 "G1 — gut differenziert"
* $SCT#1663004 "G2 — mäßig differenziert"
* $SCT#61026006 "G3 — schlecht differenziert"

// ============================================================
// L-Kategorie (Lymphangiosis, UICC TNM)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:25a0a7b5-8692-5feb-a646-f688c8943d71"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #54102005
* ^expansion.contains[=].display = "G1 — gut differenziert"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1663004
* ^expansion.contains[=].display = "G2 — mäßig differenziert"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #61026006
* ^expansion.contains[=].display = "G3 — schlecht differenziert"

ValueSet: VS_Senologie_L_Kategorie
Id: vs-senologie-l-kategorie
Title: "VS Senologie L-Kategorie (Lymphangiosis)"
Description: "L-Kategorie (Lymphangiosis carcinomatosa) nach UICC TNM (L0/L1/LX)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-l-kategorie"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.uicc.org/resources/tnm#L0 "L0 — keine Lymphangiosis"
* https://www.uicc.org/resources/tnm#L1 "L1 — Lymphangiosis nachweisbar"
* https://www.uicc.org/resources/tnm#LX "LX — nicht beurteilbar"

// ============================================================
// V-Kategorie (Vasoinvasion, UICC TNM)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:071d522f-72cb-5fdf-99c5-7cc06ed5daa6"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #L0
* ^expansion.contains[=].display = "L0 — keine Lymphangiosis"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #L1
* ^expansion.contains[=].display = "L1 — Lymphangiosis nachweisbar"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #LX
* ^expansion.contains[=].display = "LX — nicht beurteilbar"

ValueSet: VS_Senologie_V_Kategorie
Id: vs-senologie-v-kategorie
Title: "VS Senologie V-Kategorie (Vasoinvasion)"
Description: "V-Kategorie (Venöse Invasion) nach UICC TNM (V0/V1/V2/VX)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:0660e927-2a3e-5dc1-81d6-161bfe13a45e"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #V0
* ^expansion.contains[=].display = "V0 — keine Venöse Invasion"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #V1
* ^expansion.contains[=].display = "V1 — mikroskopische Venöse Invasion"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #V2
* ^expansion.contains[=].display = "V2 — makroskopische Venöse Invasion"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #VX
* ^expansion.contains[=].display = "VX — nicht beurteilbar"

ValueSet: VS_Senologie_Pn_Kategorie
Id: vs-senologie-pn-kategorie
Title: "VS Senologie Pn-Kategorie (Perineural)"
Description: "Pn-Kategorie (Perineuralinvasion) nach UICC TNM (Pn0/Pn1/PnX)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-pn-kategorie"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.uicc.org/resources/tnm#Pn0 "Pn0 — keine Perineuralinvasion"
* https://www.uicc.org/resources/tnm#Pn1 "Pn1 — Perineuralinvasion nachweisbar"
* https://www.uicc.org/resources/tnm#PnX "PnX — nicht beurteilbar"

// ============================================================
// Therapie-Intention (Adjuvant/Neoadjuvant/Palliativ/Kurativ)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:270584cb-ded0-51fd-b7af-b502793b57d1"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #Pn0
* ^expansion.contains[=].display = "Pn0 — keine Perineuralinvasion"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #Pn1
* ^expansion.contains[=].display = "Pn1 — Perineuralinvasion nachweisbar"
* ^expansion.contains[+].system = "https://www.uicc.org/resources/tnm"
* ^expansion.contains[=].code = #PnX
* ^expansion.contains[=].display = "PnX — nicht beurteilbar"

ValueSet: VS_Senologie_Therapie_Intention
Id: vs-senologie-therapie-intention
Title: "VS Senologie Therapie-Intention"
Description: "Therapeutische Intention (Adjuvant/Neoadjuvant/Palliativ/Kurativ/Revision/Diagnostisch). Verwendet für OP-Planung, Postop, Strahlen- und Systemtherapie."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-intention"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#373808002 "Kurativ"
* $SCT#373846009 "Adjuvant"
* $SCT#373847000 "Neoadjuvant"
* $SCT#363676003 "Palliativ"
* $SCT#261004008 "Diagnostisch"
* https://www.senologie.org/fhir/CodeSystem/form-helper#intention-revision "Revision"

// ============================================================
// Therapiestatus (Abgeschlossen/Abgebrochen/Laufend)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:59d3f6ff-b05e-5c68-85d0-c4beb49df7e9"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 6
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373808002
* ^expansion.contains[=].display = "Kurativ"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373846009
* ^expansion.contains[=].display = "Adjuvant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373847000
* ^expansion.contains[=].display = "Neoadjuvant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #363676003
* ^expansion.contains[=].display = "Palliativ"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #261004008
* ^expansion.contains[=].display = "Diagnostisch"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #intention-revision
* ^expansion.contains[=].display = "Revision"

ValueSet: VS_Senologie_Therapie_Status
Id: vs-senologie-therapie-status
Title: "VS Senologie Therapie-Status"
Description: "Status einer Therapieeinheit (Strahlen- oder Systemtherapie)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-therapie-status"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/form-helper#therapie-laufend "Laufend"
* https://www.senologie.org/fhir/CodeSystem/form-helper#therapie-abgeschlossen "Abgeschlossen"
* https://www.senologie.org/fhir/CodeSystem/form-helper#therapie-abgebrochen "Abgebrochen"

// ============================================================
// HER2 IHC-Score (0/1+/2+/3+)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:2080656d-6ab8-5000-8861-222df75b33ad"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #therapie-laufend
* ^expansion.contains[=].display = "Laufend"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #therapie-abgeschlossen
* ^expansion.contains[=].display = "Abgeschlossen"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #therapie-abgebrochen
* ^expansion.contains[=].display = "Abgebrochen"

ValueSet: VS_Senologie_HER2_IHC_Score
Id: vs-senologie-her2-ihc-score
Title: "VS Senologie HER2 IHC-Score"
Description: "IHC-Score-Werte für HER2 (0/1+/2+/3+) nach Standardpathologie. Codes aus MII MTB INSITUHYBRIDIZATION."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:91baf32b-03af-5444-af12-21fdfc19b5c8"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score"
* ^expansion.contains[=].code = #0
* ^expansion.contains[=].display = "0"
* ^expansion.contains[+].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score"
* ^expansion.contains[=].code = #1
* ^expansion.contains[=].display = "1+"
* ^expansion.contains[+].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score"
* ^expansion.contains[=].code = #2
* ^expansion.contains[=].display = "2+"
* ^expansion.contains[+].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score"
* ^expansion.contains[=].code = #3
* ^expansion.contains[=].display = "3+"

ValueSet: VS_Senologie_HER2_Gesamt
Id: vs-senologie-her2-gesamt
Title: "VS Senologie HER2 Gesamtbewertung (Leitlinie)"
Description: "HER2-Gesamtbewertung nach Leitlinie 2024 (positiv/low/ultralow/negativ/equivocal)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:c8e3d1c9-34f7-5a8c-a843-e8655d2a22f3"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #her2-positiv
* ^expansion.contains[=].display = "HER2-positiv"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #her2-low
* ^expansion.contains[=].display = "HER2-low"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #her2-ultralow
* ^expansion.contains[=].display = "HER2-ultralow"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #her2-negativ
* ^expansion.contains[=].display = "HER2-negativ"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #her2-equivocal
* ^expansion.contains[=].display = "HER2-equivocal"

ValueSet: VS_Senologie_HER2_FISH
Id: vs-senologie-her2-fish
Title: "VS Senologie HER2 FISH-Ergebnis"
Description: "FISH-Ergebnis bei HER2-Amplifikationstestung."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-fish"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#10828004 "positiv"
* $SCT#260385009 "negativ"
* https://www.senologie.org/fhir/CodeSystem/form-helper#her2-fish-nicht-durchgefuehrt "nicht durchgefuehrt"

// ============================================================
// ISH-Methode (FISH/CISH/DISH/SISH)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:47082331-a5c5-54a3-960e-6febe6eb9420"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #10828004
* ^expansion.contains[=].display = "positiv"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260385009
* ^expansion.contains[=].display = "negativ"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #her2-fish-nicht-durchgefuehrt
* ^expansion.contains[=].display = "nicht durchgefuehrt"

ValueSet: VS_Senologie_ISH_Methode
Id: vs-senologie-ish-methode
Title: "VS Senologie ISH-Methode"
Description: "In-situ-Hybridisierungs-Methode für HER2."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:ad4c4d49-116b-59b9-9601-e1af892d1065"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #fish
* ^expansion.contains[=].display = "FISH"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #cish
* ^expansion.contains[=].display = "CISH"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #dish
* ^expansion.contains[=].display = "DISH"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #sish
* ^expansion.contains[=].display = "SISH"

ValueSet: VS_Senologie_IHC_Intensitaet
Id: vs-senologie-ihc-intensitaet
Title: "VS Senologie IHC-Färbeintensität"
Description: "IHC-Färbeintensität für ER/PR-Beurteilung (negative/weak/moderate/strong)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1dade356-875d-548c-8958-745a5c2b5e1f"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #intensity-negative
* ^expansion.contains[=].display = "negative"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #intensity-weak
* ^expansion.contains[=].display = "weak"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #intensity-moderate
* ^expansion.contains[=].display = "moderate"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker"
* ^expansion.contains[=].code = #intensity-strong
* ^expansion.contains[=].display = "strong"

ValueSet: VS_Senologie_Clavien_Dindo
Id: vs-senologie-clavien-dindo
Title: "VS Senologie Clavien-Dindo Grade"
Description: "Clavien-Dindo Klassifikation operativer Komplikationen (Grad I-V)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:d746eba2-d791-52db-ab24-db288d609335"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1367519000
* ^expansion.contains[=].display = "Clavien-Dindo Grad I"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1367520006
* ^expansion.contains[=].display = "Clavien-Dindo Grad II"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1367521005
* ^expansion.contains[=].display = "Clavien-Dindo Grad III"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1367524002
* ^expansion.contains[=].display = "Clavien-Dindo Grad IV"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1367527009
* ^expansion.contains[=].display = "Clavien-Dindo Grad V"

ValueSet: VS_Senologie_ECOG
Id: vs-senologie-ecog
Title: "VS Senologie ECOG-Performance-Status"
Description: "ECOG-Performance-Status 0-4."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1e4d9a07-e717-5de4-aec3-365420acc10b"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA9622-7
* ^expansion.contains[=].display = "0 — Normale Aktivität"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA9623-5
* ^expansion.contains[=].display = "1 — Einschränkung bei Anstrengung"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA9624-3
* ^expansion.contains[=].display = "2 — Gehfähig, nicht arbeitsfähig"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA9625-0
* ^expansion.contains[=].display = "3 — Begrenzte Selbstversorgung"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA9626-8
* ^expansion.contains[=].display = "4 — Völlig pflegebedürftig"

ValueSet: VS_Senologie_Menopausenstatus
Id: vs-senologie-menopausenstatus
Title: "VS Senologie Menopausenstatus"
Description: "Menopausenstatus für Anamnese."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#289903006 "Prämenopausal"
* $SCT#198435007 "Perimenopausal (Female climacteric state)"
* $SCT#76498008 "Postmenopausal"

// ============================================================
// Raucherstatus (LOINC LA codes via 72166-2 panel)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:9326976b-906b-5658-bb42-87f03ead952d"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #289903006
* ^expansion.contains[=].display = "Prämenopausal"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #198435007
* ^expansion.contains[=].display = "Perimenopausal (Female climacteric state)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76498008
* ^expansion.contains[=].display = "Postmenopausal"

ValueSet: VS_Senologie_Raucherstatus
Id: vs-senologie-raucherstatus
Title: "VS Senologie Raucherstatus"
Description: "Tobacco smoking status (LOINC LA codes für Antworten zur Frage 72166-2)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-raucherstatus"
* ^status = #draft
* insert PR_CS_VS_Version
* http://loinc.org#LA18978-9 "Nie geraucht (Never smoked)"
* http://loinc.org#LA15920-4 "Ehemaliger Raucher (Former smoker)"
* http://loinc.org#LA18976-3 "Aktueller Raucher (Current smoker)"

// ============================================================
// Verwandtschaftsgrad (für Familienanamnese)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:f37b06e7-2d1c-5278-8d80-00bb2fee331c"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA18978-9
* ^expansion.contains[=].display = "Nie geraucht (Never smoked)"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA15920-4
* ^expansion.contains[=].display = "Ehemaliger Raucher (Former smoker)"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA18976-3
* ^expansion.contains[=].display = "Aktueller Raucher (Current smoker)"

ValueSet: VS_Senologie_Verwandtschaftsgrad
Id: vs-senologie-verwandtschaftsgrad
Title: "VS Senologie Verwandtschaftsgrad"
Description: "Verwandtschaftsgrad (mütterlicher-/väterlicher-Stamm) für Familienanamnese."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:94259439-1956-54d3-9b83-a08d637a3fc8"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #MTH
* ^expansion.contains[=].display = "Mutter"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #SIS
* ^expansion.contains[=].display = "Schwester"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #DAUC
* ^expansion.contains[=].display = "Tochter"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #GRMTH
* ^expansion.contains[=].display = "Großmutter"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #AUNT
* ^expansion.contains[=].display = "Tante"

ValueSet: VS_Senologie_RT_Zielvolumen
Id: vs-senologie-rt-zielvolumen
Title: "VS Senologie Strahlentherapie-Zielvolumen"
Description: "Zielvolumen der Mamma-Strahlentherapie."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:51116ab8-f795-53e5-98a5-010b6b910a18"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 5
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76752008
* ^expansion.contains[=].display = "Ganze Brust"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #78904004
* ^expansion.contains[=].display = "Brustwand"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #68171009
* ^expansion.contains[=].display = "Axilläre Lymphknoten"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76838003
* ^expansion.contains[=].display = "Supraklavikuläre Lymphknoten"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #245282001
* ^expansion.contains[=].display = "Parasternale Lymphknoten"

ValueSet: VS_Senologie_RT_Applikationsart
Id: vs-senologie-rt-applikationsart
Title: "VS Senologie Strahlentherapie-Applikationsart"
Description: "Applikationsmodus der Strahlentherapie (3D-konformal/IMRT/Brachytherapie)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-rt-applikationsart"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#441783000 "3D-konformale Bestrahlung (Conformal radiotherapy)"
* $SCT#441799006 "IMRT (Intensity modulated radiation therapy)"
* $SCT#152198000 "Brachytherapie"

// ============================================================
// Systemtherapie-Art
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:87725dd7-f1e0-5a3c-8138-53d1c9328d74"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #441783000
* ^expansion.contains[=].display = "3D-konformale Bestrahlung (Conformal radiotherapy)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #441799006
* ^expansion.contains[=].display = "IMRT (Intensity modulated radiation therapy)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #152198000
* ^expansion.contains[=].display = "Brachytherapie"

ValueSet: VS_Senologie_Systemtherapie_Art
Id: vs-senologie-systemtherapie-art
Title: "VS Senologie Systemtherapie-Art"
Description: "Art der Systemtherapie (Chemo/Endokrin/Zielgerichtet/Immuntherapie)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-art"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#385786002 "Chemotherapie"
* $SCT#169413002 "Endokrine Therapie"
* $SCT#413648008 "Zielgerichtete/Biologische Therapie (Biological treatment)"
* $SCT#76334006 "Immuntherapie"

// ============================================================
// Pre-OP-Markierung
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:422e2233-0d3c-5291-a709-ba20f7854a2b"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #385786002
* ^expansion.contains[=].display = "Chemotherapie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #169413002
* ^expansion.contains[=].display = "Endokrine Therapie"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #413648008
* ^expansion.contains[=].display = "Zielgerichtete/Biologische Therapie (Biological treatment)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76334006
* ^expansion.contains[=].display = "Immuntherapie"

ValueSet: VS_Senologie_PreOp_Markierung
Id: vs-senologie-preop-markierung
Title: "VS Senologie Pre-OP-Markierung"
Description: "Methode der präoperativen Markierung der Mamma-Läsion."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-preop-markierung"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/form-helper#markierung-draht "Drahtmarkierung (Wire guided)"
* https://www.senologie.org/fhir/CodeSystem/form-helper#markierung-clip "Clip-Markierung"
* $SCT#77343006 "Angiographische Markierung"

// ============================================================
// Verlauf-Kontrolltermin-Art
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:45087b90-9628-501e-9287-fd866381523d"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #markierung-draht
* ^expansion.contains[=].display = "Drahtmarkierung (Wire guided)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #markierung-clip
* ^expansion.contains[=].display = "Clip-Markierung"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #77343006
* ^expansion.contains[=].display = "Angiographische Markierung"

ValueSet: VS_Senologie_Kontrolltermin_Art
Id: vs-senologie-kontrolltermin-art
Title: "VS Senologie Kontrolltermin-Art"
Description: "Art einer Verlaufs-/Nachsorge-Kontrolle."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:8785eaf2-7c86-5820-935e-8a92f229a5fa"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #kontrolle-6-monate
* ^expansion.contains[=].display = "6-Monats-Kontrolle"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #kontrolle-12-monate
* ^expansion.contains[=].display = "12-Monats-Kontrolle"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #kontrolle-ausserplan
* ^expansion.contains[=].display = "Außerplanmäßig"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom"
* ^expansion.contains[=].code = #kontrolle-abschluss
* ^expansion.contains[=].display = "Abschlusskontrolle"

ValueSet: VS_Senologie_Verlauf_Tumorstatus_Gesamt
Id: vs-senologie-verlauf-tumorstatus-gesamt
Title: "VS Senologie Verlauf Tumorstatus Gesamtbeurteilung"
Description: "Gesamtbeurteilung des Tumorstatus im Verlauf (CR/PR/SD/Progression). Unterscheidet sich von RECIST-Response durch Disease-State-Sicht (langfristig)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:2fa8230f-a7a7-533b-b02d-5d28cd98a019"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #103338009
* ^expansion.contains[=].display = "In full remission"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #103337004
* ^expansion.contains[=].display = "In partial remission"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #58158008
* ^expansion.contains[=].display = "Stable"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #271299001
* ^expansion.contains[=].display = "Tumor progression"

ValueSet: VS_Senologie_Vorstellungsgrund
Id: vs-senologie-vorstellungsgrund
Title: "VS Senologie Vorstellungsgrund"
Description: "Grund der Erst- oder Folge-Vorstellung in der Senologie."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-vorstellungsgrund"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/form-helper#vorstellung-erstvorstellung "Erstvorstellung"
* https://www.senologie.org/fhir/CodeSystem/form-helper#vorstellung-zweitmeinung "Zweitmeinung"
* https://www.senologie.org/fhir/CodeSystem/form-helper#vorstellung-nachsorge "Nachsorge"
* https://www.senologie.org/fhir/CodeSystem/form-helper#vorstellung-wiedervorstellung "Wiedervorstellung"

// ============================================================
// Screening-Status (Vorgeschichte)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:e4788881-8b16-5faf-b592-212948fb2b58"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #vorstellung-erstvorstellung
* ^expansion.contains[=].display = "Erstvorstellung"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #vorstellung-zweitmeinung
* ^expansion.contains[=].display = "Zweitmeinung"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #vorstellung-nachsorge
* ^expansion.contains[=].display = "Nachsorge"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #vorstellung-wiedervorstellung
* ^expansion.contains[=].display = "Wiedervorstellung"

ValueSet: VS_Senologie_Detektion_Modus
Id: vs-senologie-detektion-modus
Title: "VS Senologie Screening-Status"
Description: "Art der Detektion (Screening-detektiert / Intervallkarzinom / Selbstuntersuchung / Zufallsbefund)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-detektion-modus"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#268547008 "Screening-detektiert"
* $SCT#444589003 "Intervallkarzinom"
* $SCT#409979009 "Selbstuntersuchung (Breast self-examination)"
* $SCT#261087003 "Zufallsbefund"

// ============================================================
// Familienanamnese: Erkrankung
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:1dd4b71e-95ec-5ad2-98b0-467f55372608"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #268547008
* ^expansion.contains[=].display = "Screening-detektiert"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #444589003
* ^expansion.contains[=].display = "Intervallkarzinom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #409979009
* ^expansion.contains[=].display = "Selbstuntersuchung (Breast self-examination)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #261087003
* ^expansion.contains[=].display = "Zufallsbefund"

ValueSet: VS_Senologie_Familien_Erkrankung
Id: vs-senologie-familien-erkrankung
Title: "VS Senologie Familienanamnese-Erkrankung"
Description: "Erkrankungen, die in der Familienanamnese erfasst werden (Mamma- und Ovarialkarzinom-Fokus)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-familien-erkrankung"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#254837009 "Mammakarzinom"
* $SCT#363443007 "Ovarialkarzinom"
* $SCT#74964007 "Sonstiges"

// ============================================================
// Ja/Nein (Hormonersatztherapie)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:f87df954-822a-5c9f-ac0f-49f97fcaf281"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Mammakarzinom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #363443007
* ^expansion.contains[=].display = "Ovarialkarzinom"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #74964007
* ^expansion.contains[=].display = "Sonstiges"

ValueSet: VS_Senologie_JaNein
Id: vs-senologie-ja-nein
Title: "VS Senologie Ja/Nein"
Description: "Generisches Ja/Nein als SNOMED-Codes (Hormonersatztherapie, andere Boolean-Fragen)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ja-nein"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#373066001 "Ja"
* $SCT#373067005 "Nein"

// ============================================================
// Menopausenstatus (genau)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:eb504eb5-c543-5e02-b247-17cb06f27eb0"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373066001
* ^expansion.contains[=].display = "Ja"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373067005
* ^expansion.contains[=].display = "Nein"

ValueSet: VS_Senologie_Menopausenstatus_Erweitert
Id: vs-senologie-menopausenstatus-erweitert
Title: "VS Senologie Menopausenstatus (mit ext. Codes)"
Description: "Menopausenstatus mit den im Form genutzten Codes (inkl. 309606002 und 161541000119104)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus-erweitert"
* ^status = #draft
* insert PR_CS_VS_Version
* $SCT#309606002 "Prämenopausal"
* $SCT#161541000119104 "Perimenopausal"
* $SCT#76498008 "Postmenopausal"

// ============================================================
// Fernmetastasen-Lokalisation
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:8127a37c-4df9-55e3-8673-509ae2278daf"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #309606002
* ^expansion.contains[=].display = "Prämenopausal"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #161541000119104
* ^expansion.contains[=].display = "Perimenopausal"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #76498008
* ^expansion.contains[=].display = "Postmenopausal"

ValueSet: VS_Senologie_Fernmetastasen_Lokalisation
Id: vs-senologie-fernmetastasen-lokalisation
Title: "VS Senologie Fernmetastasen-Lokalisation"
Description: "Häufige Fernmetastasen-Lokalisationen beim Mammakarzinom (Lunge/Leber/Knochen/Hirn)."
* insert SenoCRMIValueSet

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

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:b774723e-5c2b-5bf0-8e0f-a880e3cc4f68"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #39607008
* ^expansion.contains[=].display = "Lunge"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #10200004
* ^expansion.contains[=].display = "Leber"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #272673000
* ^expansion.contains[=].display = "Knochen"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #12738006
* ^expansion.contains[=].display = "Hirn"

ValueSet: VS_Senologie_B_Klassifikation
Id: vs-senologie-b-klassifikation
Title: "VS Senologie B-Klassifikation (NHSBSP)"
Description: "Histopathologische B-Klassifikation der Mamma-Biopsie nach NHSBSP (B0-B5b) als SNOMED-Codes."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-b-klassifikation"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-0 "B0 — Specimen unsatisfactory"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-1 "B1 — Normalgewebe"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-2 "B2 — Benigne"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-3 "B3 — Unklares biologisches Potenzial"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-4 "B4 — Malignitaetsverdaechtig"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-5a "B5a — Maligne in-situ-Karzinome"
* https://www.senologie.org/fhir/CodeSystem/form-helper#b-5b "B5b — Maligne invasiv"

// ============================================================
// Tumorboard-Empfehlung Status (Beschlusszustand pro Therapieoption)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:55d5b421-7a44-541f-ab4b-e7244f61734e"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 7
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-0
* ^expansion.contains[=].display = "B0 — Specimen unsatisfactory"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-1
* ^expansion.contains[=].display = "B1 — Normalgewebe"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-2
* ^expansion.contains[=].display = "B2 — Benigne"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-3
* ^expansion.contains[=].display = "B3 — Unklares biologisches Potenzial"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-4
* ^expansion.contains[=].display = "B4 — Malignitaetsverdaechtig"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-5a
* ^expansion.contains[=].display = "B5a — Maligne in-situ-Karzinome"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #b-5b
* ^expansion.contains[=].display = "B5b — Maligne invasiv"

ValueSet: VS_Senologie_Tumorboard_Empfehlung_Status
Id: vs-senologie-tumorboard-empfehlung-status
Title: "VS Senologie Tumorboard Empfehlung Status"
Description: "Beschlusszustand pro Therapie-Empfehlung im Tumorboard (empfohlen / bedingt empfohlen / nicht empfohlen / nicht diskutiert)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* ^status = #draft
* insert PR_CS_VS_Version
* https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen "Empfohlen"
* https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen "Bedingt empfohlen"
* https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#nicht-empfohlen "Nicht empfohlen"
* https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#nicht-diskutiert "Nicht diskutiert"

// ============================================================
// Hormonelle Kontrazeption Status (Nie / Frueher / Aktuell)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:b13f4531-bb8a-57a4-a692-b166c7361fbc"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung"
* ^expansion.contains[=].code = #empfohlen
* ^expansion.contains[=].display = "Empfohlen"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung"
* ^expansion.contains[=].code = #bedingt-empfohlen
* ^expansion.contains[=].display = "Bedingt empfohlen"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung"
* ^expansion.contains[=].code = #nicht-empfohlen
* ^expansion.contains[=].display = "Nicht empfohlen"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung"
* ^expansion.contains[=].code = #nicht-diskutiert
* ^expansion.contains[=].display = "Nicht diskutiert"

ValueSet: VS_Senologie_Kontrazeption_Status
Id: vs-senologie-kontrazeption-status
Title: "VS Senologie Kontrazeption Status"
Description: "Nutzungs-Status hormoneller Kontrazeption (nie / frueher / aktuell)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-kontrazeption-status"
* ^status = #draft
* insert PR_CS_VS_Version
// Lokale Codes — SCT hat kein passendes Tripel (473387004 'Never used
// contraception' deckt nur "nie" ab, "frueher" und "aktuell" fehlen.)
* https://www.senologie.org/fhir/CodeSystem/form-helper#kontrazeption-nie "Nie"
* https://www.senologie.org/fhir/CodeSystem/form-helper#kontrazeption-frueher "Frueher"
* https://www.senologie.org/fhir/CodeSystem/form-helper#kontrazeption-aktuell "Aktuell"

// ============================================================
// Komplikations-Zeitpunkt (Intraoperativ / Postoperativ / Stationaer)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:5e19e10c-a250-54e4-b0c9-42c3d2bddf58"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #kontrazeption-nie
* ^expansion.contains[=].display = "Nie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #kontrazeption-frueher
* ^expansion.contains[=].display = "Frueher"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #kontrazeption-aktuell
* ^expansion.contains[=].display = "Aktuell"

ValueSet: VS_Senologie_Komplikation_Zeitpunkt
Id: vs-senologie-komplikation-zeitpunkt
Title: "VS Senologie Komplikations-Zeitpunkt"
Description: "Phase der OP-Komplikation (intraoperativ / postoperativ direkt / stationaerer Aufenthalt)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-komplikation-zeitpunkt"
* ^status = #draft
* insert PR_CS_VS_Version
// SCT-Codes Ontoserver-verifiziert (vorher waren 262068006 'Preoperative'
// und 262061001 ein Tippfehler — korrekt ist 262061000 'Postoperative period').
* $SCT#277671009 "Intraoperative"
* $SCT#262061000 "Postoperative period"
* $SCT#394656005 "Inpatient care"

// ============================================================
// Dosis-Einheit (mg / mg/m2 / mg/kg) — UCUM-basiert
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:fe4fef2f-88e5-5b54-b597-6e60f1e416c8"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #277671009
* ^expansion.contains[=].display = "Intraoperative"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #262061000
* ^expansion.contains[=].display = "Postoperative period"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #394656005
* ^expansion.contains[=].display = "Inpatient care"

ValueSet: VS_Senologie_Dosis_Einheit
Id: vs-senologie-dosis-einheit
Title: "VS Senologie Dosis-Einheit"
Description: "Standard-Dosis-Einheiten fuer Onkologie-Medikation (UCUM)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-dosis-einheit"
* ^status = #draft
* insert PR_CS_VS_Version
* http://unitsofmeasure.org#mg "mg"
* http://unitsofmeasure.org#mg/m2 "mg/m2"
* http://unitsofmeasure.org#mg/kg "mg/kg"

// ============================================================
// Applikationsart (i.v. / s.c. / p.o.)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:6fd11033-91a1-51a2-8971-1529daf8e775"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://unitsofmeasure.org"
* ^expansion.contains[=].code = #mg
* ^expansion.contains[=].display = "mg"
* ^expansion.contains[+].system = "http://unitsofmeasure.org"
* ^expansion.contains[=].code = #mg/m2
* ^expansion.contains[=].display = "mg/m2"
* ^expansion.contains[+].system = "http://unitsofmeasure.org"
* ^expansion.contains[=].code = #mg/kg
* ^expansion.contains[=].display = "mg/kg"

ValueSet: VS_Senologie_Applikationsart
Id: vs-senologie-applikationsart
Title: "VS Senologie Applikationsart"
Description: "Applikationsroute der Medikation (intravenoes / subkutan / oral / intramuskulaer)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-applikationsart"
* ^status = #draft
* insert PR_CS_VS_Version
// SCT-Codes Ontoserver-verifiziert: Standard-Route-of-Administration-Codes.
* $SCT#47625008 "Intravenous route"
* $SCT#34206005 "Subcutaneous route"
* $SCT#26643006 "Oral route"
* $SCT#78421000 "Intramuscular route"

// ============================================================
// Nachsorge-Modus (Aktiv vs Passiv)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:9630b984-0b6f-50d9-8f06-6d3ff3c3ef3a"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #47625008
* ^expansion.contains[=].display = "Intravenous route"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #34206005
* ^expansion.contains[=].display = "Subcutaneous route"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #26643006
* ^expansion.contains[=].display = "Oral route"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #78421000
* ^expansion.contains[=].display = "Intramuscular route"

ValueSet: VS_Senologie_Nachsorge_Modus
Id: vs-senologie-nachsorge-modus
Title: "VS Senologie Nachsorge-Modus"
Description: "Nachsorge-Erhebung aktiv (persoenlich) vs passiv (Aktenlage/Register)."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-nachsorge-modus"
* ^status = #draft
* insert PR_CS_VS_Version
// Lokale Codes — SCT 410546004/410547008 sind 'Discontinued' bzw. unrelated.
* https://www.senologie.org/fhir/CodeSystem/form-helper#nachsorge-aktiv "Aktiv (persoenlich untersucht)"
* https://www.senologie.org/fhir/CodeSystem/form-helper#nachsorge-passiv "Passiv (Aktenlage/Register)"

// ============================================================
// Allgemeinzustand (Gut / Eingeschraenkt / Schlecht) — vereinfacht
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:34261434-d313-564e-86fe-33ef84b993f4"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #nachsorge-aktiv
* ^expansion.contains[=].display = "Aktiv (persoenlich untersucht)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #nachsorge-passiv
* ^expansion.contains[=].display = "Passiv (Aktenlage/Register)"

ValueSet: VS_Senologie_Allgemeinzustand
Id: vs-senologie-allgemeinzustand
Title: "VS Senologie Allgemeinzustand"
Description: "Vereinfachte Allgemeinzustands-Skala (gut/eingeschraenkt/schlecht). Fuer detaillierte Erfassung ECOG verwenden."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-allgemeinzustand"
* ^status = #draft
* insert PR_CS_VS_Version
// Lokale Codes — die SCT-Picks waren falsch (102500002 = 'Good neonatal
// condition', 162653009 = ungueltig). Fuer praezise Allgemeinzustands-
// Erfassung ECOG verwenden (vs-senologie-ecog).
* https://www.senologie.org/fhir/CodeSystem/form-helper#ag-gut "Gut"
* https://www.senologie.org/fhir/CodeSystem/form-helper#ag-eingeschraenkt "Eingeschraenkt"
* https://www.senologie.org/fhir/CodeSystem/form-helper#ag-schlecht "Schlecht"

// ============================================================
// Lymphoedem-Grad (Kein / I / II / III)
// ============================================================

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:288a5c4f-8bca-5eaf-a73f-2f4707a6564a"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #ag-gut
* ^expansion.contains[=].display = "Gut"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #ag-eingeschraenkt
* ^expansion.contains[=].display = "Eingeschraenkt"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #ag-schlecht
* ^expansion.contains[=].display = "Schlecht"

ValueSet: VS_Senologie_Lymphoedem_Grad
Id: vs-senologie-lymphoedem-grad
Title: "VS Senologie Lymphoedem Grad"
Description: "Schweregrad eines Lymphoedems (kein / Grad I / II / III) nach ISL-Kriterien."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-lymphoedem-grad"
* ^status = #draft
* insert PR_CS_VS_Version
// Lokale Codes nach ISL — SCT hat keine ISL-spezifischen Lymphoedem-Stages.
// (Vorherige Picks 260413007/260415000/1140000/260416004 waren generische
// Qualifier oder ungueltig — 1140000 ist kein valider SCT-Code.)
* https://www.senologie.org/fhir/CodeSystem/form-helper#lymphoedem-0 "Kein Lymphoedem (ISL Stage 0)"
* https://www.senologie.org/fhir/CodeSystem/form-helper#lymphoedem-1 "Grad I (reversibel)"
* https://www.senologie.org/fhir/CodeSystem/form-helper#lymphoedem-2 "Grad II (spontan irreversibel)"
* https://www.senologie.org/fhir/CodeSystem/form-helper#lymphoedem-3 "Grad III (Elephantiasis)"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:ff6358c5-f325-51ed-92e3-bae4fdd005bc"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #lymphoedem-0
* ^expansion.contains[=].display = "Kein Lymphoedem (ISL Stage 0)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #lymphoedem-1
* ^expansion.contains[=].display = "Grad I (reversibel)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #lymphoedem-2
* ^expansion.contains[=].display = "Grad II (spontan irreversibel)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/form-helper"
* ^expansion.contains[=].code = #lymphoedem-3
* ^expansion.contains[=].display = "Grad III (Elephantiasis)"
