ValueSet: VS_Senologie_Systemtherapie_Medikation
Id: vs-senologie-systemtherapie-medikation
Title: "VS Senologie Systemtherapie Medikation"
Description: "Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01)"
* insert SenoCRMIValueSet

* insert PR_CS_VS_Version
* ^status = #draft
* ^experimental = true

// CDK4/6-Inhibitoren
* $SCT#715958001 "Palbociclib"
* $SCT#732257004 "Ribociclib"
* $SCT#761851004 "Abemaciclib"

// Antimetabolite
* $SCT#387381009 "Methotrexate"
* $SCT#387172005 "Fluorouracil"
* $SCT#386920008 "Gemcitabine"
* $SCT#386906001 "Capecitabine"

// Anthracycline
* $SCT#372817009 "Doxorubicin"
* $SCT#772118008 "Doxorubicin hydrochloride pegylated liposome"
* $SCT#372715008 "Daunorubicin"
* $SCT#417916005 "Epirubicin"
* $SCT#372539000 "Idarubicin"
* $SCT#386913001 "Mitoxantrone"

// Taxane
* $SCT#386918005 "Docetaxel"

// Platinverbindungen
* $SCT#387318005 "Cisplatin"
* $SCT#386905002 "Carboplatin"

// Alkylanzien
* $SCT#387420009 "Cyclophosphamide"

// Sonstige Antineoplastika
* $SCT#387331000 "Mitomycin"
* $SCT#708166000 "Eribulin"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:29347724-ccae-5d5d-8b5d-4cde5afc868b"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 19
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #715958001
* ^expansion.contains[=].display = "Palbociclib"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #732257004
* ^expansion.contains[=].display = "Ribociclib"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #761851004
* ^expansion.contains[=].display = "Abemaciclib"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387381009
* ^expansion.contains[=].display = "Methotrexate"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387172005
* ^expansion.contains[=].display = "Fluorouracil"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #386920008
* ^expansion.contains[=].display = "Gemcitabine"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #386906001
* ^expansion.contains[=].display = "Capecitabine"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #372817009
* ^expansion.contains[=].display = "Doxorubicin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #772118008
* ^expansion.contains[=].display = "Doxorubicin hydrochloride pegylated liposome"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #372715008
* ^expansion.contains[=].display = "Daunorubicin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #417916005
* ^expansion.contains[=].display = "Epirubicin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #372539000
* ^expansion.contains[=].display = "Idarubicin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #386913001
* ^expansion.contains[=].display = "Mitoxantrone"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #386918005
* ^expansion.contains[=].display = "Docetaxel"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387318005
* ^expansion.contains[=].display = "Cisplatin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #386905002
* ^expansion.contains[=].display = "Carboplatin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387420009
* ^expansion.contains[=].display = "Cyclophosphamide"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #387331000
* ^expansion.contains[=].display = "Mitomycin"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #708166000
* ^expansion.contains[=].display = "Eribulin"
