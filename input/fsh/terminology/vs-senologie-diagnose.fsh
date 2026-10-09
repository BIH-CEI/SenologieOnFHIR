Alias: $CS_LOKAL = https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom

ValueSet: VS_Senologie_Diagnose
Id: vs-senologie-diagnose
Title: "VS Senologie Diagnose"
Description: "Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

// === SNOMED CT Codes ===

// Maligne Erkrankungen
* $SCT#254837009 "Malignant neoplasm of breast"
* $SCT#109889007 "Ductal carcinoma in situ of breast"

// Benigne Erkrankungen
* $SCT#254845004 "Fibroadenoma of breast"
* $SCT#27431007 "Fibrocystic disease of breast"
* $SCT#399123008 "Benign retention cyst of breast"
* $SCT#449837001 "Complex cyst of breast"

// Entzündliche Erkrankungen
* $SCT#83620003 "Non-puerperal mastitis"
* $SCT#1287638006 "Puerperal mastitis"
* $SCT#16698000 "Non-puerperal breast abscess"
* $SCT#10745131000119107 "Abscess of breast associated with lactation"
* $SCT#237444008 "Granulomatous mastitis"

// B3 Läsionen / unklare Dignität
* $SCT#269497004 "Neoplasm of uncertain behavior of breast"

// Symptome/Befunde
* $SCT#53430007 "Mastalgia"

// Implantat-bezogen
* $SCT#237473006 "Ruptured breast implant"

// Andere
* $SCT#4754008 "Gynecomastia"
* $SCT#718220008 "At high risk for hereditary breast and ovarian cancer syndrome"

// Migriert von lokal zu SNOMED CT (validiert gegen Snowstorm 10.8.2, 2026-04-14)
* $SCT#1306515008 "Recurrent primary malignant neoplasm of breast"
* $SCT#43336006 "Gigantomastia"
* $SCT#290113009 "Bloody nipple discharge"
* $SCT#237474000 "Contracture of breast following insertion of breast implant"

// === Lokale Codes (kein exaktes SNOMED Mapping) ===
* $CS_LOKAL#sonstiges "Sonstiges"
* $CS_LOKAL#mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
* $CS_LOKAL#anisomastie "Anisomastie"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:56306de4-16e3-59c7-b208-95068cb33bd5"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 23
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Malignant neoplasm of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #109889007
* ^expansion.contains[=].display = "Ductal carcinoma in situ of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254845004
* ^expansion.contains[=].display = "Fibroadenoma of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #27431007
* ^expansion.contains[=].display = "Fibrocystic disease of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #399123008
* ^expansion.contains[=].display = "Benign retention cyst of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #449837001
* ^expansion.contains[=].display = "Complex cyst of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #83620003
* ^expansion.contains[=].display = "Non-puerperal mastitis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1287638006
* ^expansion.contains[=].display = "Puerperal mastitis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #16698000
* ^expansion.contains[=].display = "Non-puerperal breast abscess"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #10745131000119107
* ^expansion.contains[=].display = "Abscess of breast associated with lactation"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237444008
* ^expansion.contains[=].display = "Granulomatous mastitis"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #269497004
* ^expansion.contains[=].display = "Neoplasm of uncertain behavior of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #53430007
* ^expansion.contains[=].display = "Mastalgia"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237473006
* ^expansion.contains[=].display = "Ruptured breast implant"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #4754008
* ^expansion.contains[=].display = "Gynecomastia"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #718220008
* ^expansion.contains[=].display = "At high risk for hereditary breast and ovarian cancer syndrome"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1306515008
* ^expansion.contains[=].display = "Recurrent primary malignant neoplasm of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #43336006
* ^expansion.contains[=].display = "Gigantomastia"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #290113009
* ^expansion.contains[=].display = "Bloody nipple discharge"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #237474000
* ^expansion.contains[=].display = "Contracture of breast following insertion of breast implant"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #sonstiges
* ^expansion.contains[=].display = "Sonstiges"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #mamillensekretion-nicht-blutig
* ^expansion.contains[=].display = "Nicht blutige Mamillensekretion"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #anisomastie
* ^expansion.contains[=].display = "Anisomastie"

ValueSet: VS_Senologie_Diagnose_B3
Id: vs-senologie-diagnose-b3
Title: "VS Senologie B3 Läsionen"
Description: "B3 Läsionen der Mamma nach S3-Leitlinie"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

* $SCT#427785007 "Atypical ductal hyperplasia of breast"
* $SCT#860895001 "Flat epithelial atypia of breast"
* $SCT#99571000119102 "Intraductal papilloma of breast without atypia"
* $SCT#1144917006 "Atypical intraductal papilloma of breast"
* $SCT#390787006 "Radial scar of breast"
* $SCT#450697004 "Atypical lobular hyperplasia of breast"
* $SCT#444739008 "Classic lobular carcinoma in situ of breast"
* $SCT#444591006 "Pleomorphic lobular carcinoma in situ of breast"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:f67e06ad-12e4-52c7-9d2f-edc247aa077e"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 8
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #427785007
* ^expansion.contains[=].display = "Atypical ductal hyperplasia of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #860895001
* ^expansion.contains[=].display = "Flat epithelial atypia of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #99571000119102
* ^expansion.contains[=].display = "Intraductal papilloma of breast without atypia"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #1144917006
* ^expansion.contains[=].display = "Atypical intraductal papilloma of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #390787006
* ^expansion.contains[=].display = "Radial scar of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #450697004
* ^expansion.contains[=].display = "Atypical lobular hyperplasia of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #444739008
* ^expansion.contains[=].display = "Classic lobular carcinoma in situ of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #444591006
* ^expansion.contains[=].display = "Pleomorphic lobular carcinoma in situ of breast"

ValueSet: VS_Senologie_Seite
Id: vs-senologie-seite
Title: "VS Senologie Seite"
Description: "Lateralität der Mamma-Erkrankung"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

// === SNOMED CT only (für code.coding[sct] Binding im Maligne-Profil) ===
ValueSet: VS_Senologie_Diagnose_SCT
Id: vs-senologie-diagnose-sct
Title: "VS Senologie Diagnose SNOMED CT"
Description: "SNOMED CT Diagnosen für maligne Mamma-Erkrankungen (Binding für sct-Slice)"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* $SCT#254837009 "Malignant neoplasm of breast"
* $SCT#109889007 "Ductal carcinoma in situ of breast"
* $SCT#269497004 "Neoplasm of uncertain behavior of breast"


// === Lokale Codes only (für code.coding[senologie] Binding) ===

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:9f4089fa-bdd6-59f8-9916-9c3b0c88190e"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #254837009
* ^expansion.contains[=].display = "Malignant neoplasm of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #109889007
* ^expansion.contains[=].display = "Ductal carcinoma in situ of breast"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #269497004
* ^expansion.contains[=].display = "Neoplasm of uncertain behavior of breast"

ValueSet: VS_Senologie_Diagnose_Lokal
Id: vs-senologie-diagnose-lokal
Title: "VS Senologie Diagnose Lokal"
Description: "Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice)"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* include codes from system https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom


* $SCT#24028007 "Right"
* $SCT#7771000 "Left"
* $SCT#51440002 "Bilateral"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:411183a2-c979-599c-8fad-d067dbc91180"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 10
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
* ^expansion.contains[=].code = #makromastie
* ^expansion.contains[=].display = "Makromastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #anisomastie
* ^expansion.contains[=].display = "Anisomastie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #befund-unklarer-dignitaet
* ^expansion.contains[=].display = "Befund unklarer Dignitaet"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom"
* ^expansion.contains[=].code = #sonstiges
* ^expansion.contains[=].display = "Sonstiges"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #24028007
* ^expansion.contains[=].display = "Right"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #7771000
* ^expansion.contains[=].display = "Left"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #51440002
* ^expansion.contains[=].display = "Bilateral"

Alias: $CS_META = https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung

ValueSet: VS_Senologie_Metastasierung
Id: vs-senologie-metastasierung
Title: "VS Senologie Metastasierung"
Description: "Metastasierungsstatus - lokale Codes basierend auf Dotbase"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

* $CS_META#nicht-metastasiert "Nicht metastasiert"
* $CS_META#primaer-metastasiert "Primär metastasiert"
* $CS_META#sekundaer-metastasiert "Sekundär metastasiert"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:c46bebfb-322c-5abf-b2c9-2b1d40a24f04"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung"
* ^expansion.contains[=].code = #nicht-metastasiert
* ^expansion.contains[=].display = "Nicht metastasiert"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung"
* ^expansion.contains[=].code = #primaer-metastasiert
* ^expansion.contains[=].display = "Primär metastasiert"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-metastasierung"
* ^expansion.contains[=].code = #sekundaer-metastasiert
* ^expansion.contains[=].display = "Sekundär metastasiert"
