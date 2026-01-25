ValueSet: VS_Senologie_Diagnose
Id: vs-senologie-diagnose
Title: "VS Senologie Diagnose"
Description: "Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook mit SNOMED CT Mapping"

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

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
* $SCT#290076002 "Non-bloody nipple discharge"
* $SCT#289909001 "Bloody nipple discharge"

// Implantat-bezogen
* $SCT#237473006 "Ruptured breast implant"
* $SCT#449868002 "Capsular contracture of breast"

// Anatomische Varianten
* $SCT#34911000 "Macromastia"
* $SCT#22970007 "Asymmetry of breasts"
* $SCT#4754008 "Gynecomastia"

// Risiko
* $SCT#718220008 "At high risk for hereditary breast and ovarian cancer syndrome"

// Unklare Befunde
* $SCT#169229003 "Finding of uncertain significance"


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

* $SCT#24028007 "Right"
* $SCT#7771000 "Left"
* $SCT#51440002 "Bilateral"


ValueSet: VS_Senologie_Metastasierung
Id: vs-senologie-metastasierung
Title: "VS Senologie Metastasierung"
Description: "Metastasierungsstatus"

* ^status = #draft
* ^version = "0.1.0"

* $SCT#1229901006 "M0 category"
* $SCT#1229903009 "M1 category"
