Alias: $CS_LOKAL = http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-diagnose-lokal

ValueSet: VS_Senologie_Diagnose
Id: vs-senologie-diagnose
Title: "VS Senologie Diagnose"
Description: "Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes"

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

// B3 Läsionen
* $SCT#439401001 "Breast lesion with uncertain malignant potential"

// Symptome/Befunde
* $SCT#53430007 "Mastalgia"

// Implantat-bezogen
* $SCT#237473006 "Ruptured breast implant"

// Andere
* $SCT#4754008 "Gynecomastia"
* $SCT#718220008 "At high risk for hereditary breast and ovarian cancer syndrome"

// === Lokale Codes (kein SNOMED Mapping) ===
* $CS_LOKAL#bz-diagnose-bc-recurrence "Mammakarzinom Rezidiv"
* $CS_LOKAL#bz-diagnose-sonstiges "Sonstiges"
* $CS_LOKAL#bz-makromastie "Makromastie"
* $CS_LOKAL#bz-mamillensekretion-nicht-blutig "Nicht blutige Mamillensekretion"
* $CS_LOKAL#bz-mamillensekretion-blutig "Blutige Mamillensekretion"
* $CS_LOKAL#bz-befund-unklarer-dignitaet "Befund unklarer Dignität"
* $CS_LOKAL#bz-anisomastie "Anisomastie"
* $CS_LOKAL#bz-kapselfibrose "Kapselfibrose"


ValueSet: VS_Senologie_Diagnose_B3
Id: vs-senologie-diagnose-b3
Title: "VS Senologie B3 Läsionen"
Description: "B3 Läsionen der Mamma nach S3-Leitlinie"

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


ValueSet: VS_Senologie_Seite
Id: vs-senologie-seite
Title: "VS Senologie Seite"
Description: "Lateralität der Mamma-Erkrankung"

* ^status = #draft
* ^version = "0.1.0"

// === SNOMED CT only (für code.coding[sct] Binding im Maligne-Profil) ===
ValueSet: VS_Senologie_Diagnose_SCT
Id: vs-senologie-diagnose-sct
Title: "VS Senologie Diagnose SNOMED CT"
Description: "SNOMED CT Diagnosen für maligne Mamma-Erkrankungen (Binding für sct-Slice)"

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* $SCT#254837009 "Malignant neoplasm of breast"
* $SCT#109889007 "Ductal carcinoma in situ of breast"
* $SCT#439401001 "Breast lesion with uncertain malignant potential"


// === Lokale Codes only (für code.coding[senologie] Binding) ===
ValueSet: VS_Senologie_Diagnose_Lokal
Id: vs-senologie-diagnose-lokal
Title: "VS Senologie Diagnose Lokal"
Description: "Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice)"

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* include codes from system http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-diagnose-lokal


* $SCT#24028007 "Right"
* $SCT#7771000 "Left"
* $SCT#51440002 "Bilateral"


Alias: $CS_META = http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-metastasierung

ValueSet: VS_Senologie_Metastasierung
Id: vs-senologie-metastasierung
Title: "VS Senologie Metastasierung"
Description: "Metastasierungsstatus - lokale Codes basierend auf Dotbase"

* ^status = #draft
* ^version = "0.1.0"

* $CS_META#nicht-metastasiert "Nicht metastasiert"
* $CS_META#primaer-metastasiert "Primär metastasiert"
* $CS_META#sekundaer-metastasiert "Sekundär metastasiert"
