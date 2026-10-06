Alias: $ICD10GM = http://fhir.de/CodeSystem/bfarm/icd-10-gm

ValueSet: VSSenologieICD10
Id: vs-senologie-icd10
Title: "ValueSet Senologie ICD-10-GM"
Description: "ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook"

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10"
* ^status = #draft

// === C50 - Bösartige Neubildung der Brustdrüse (Cancer Registry) ===
* $ICD10GM#C50.0 "Brustwarze und Warzenhof"
* $ICD10GM#C50.1 "Zentraler Drüsenkörper der Brustdrüse"
* $ICD10GM#C50.2 "Oberer innerer Quadrant der Brustdrüse"
* $ICD10GM#C50.3 "Unterer innerer Quadrant der Brustdrüse"
* $ICD10GM#C50.4 "Oberer äußerer Quadrant der Brustdrüse"
* $ICD10GM#C50.5 "Unterer äußerer Quadrant der Brustdrüse"
* $ICD10GM#C50.6 "Recessus axillaris der Brustdrüse"
* $ICD10GM#C50.8 "Brustdrüse, mehrere Teilbereiche überlappend"
* $ICD10GM#C50.9 "Brustdrüse, nicht näher bezeichnet"

// === D05 - Carcinoma in situ der Brustdrüse ===
* $ICD10GM#D05.0 "Lobuläres Carcinoma in situ der Brustdrüse"
* $ICD10GM#D05.1 "Intraduktales Carcinoma in situ der Brustdrüse"
* $ICD10GM#D05.7 "Sonstiges Carcinoma in situ der Brustdrüse"
* $ICD10GM#D05.9 "Carcinoma in situ der Brustdrüse, nicht näher bezeichnet"

// === D24 - Gutartige Neubildung der Brustdrüse ===
* $ICD10GM#D24 "Gutartige Neubildung der Brustdrüse"

// === D48.6 - Neubildung unsicheren Verhaltens (B3 Läsionen) ===
* $ICD10GM#D48.6 "Neubildung unsicheren oder unbekannten Verhaltens der Brustdrüse"

// === N60 - Gutartige Mammadysplasie ===
* $ICD10GM#N60.0 "Solitäre Zyste der Mamma"
* $ICD10GM#N60.1 "Diffuse zystische Mastopathie"
* $ICD10GM#N60.2 "Fibroadenose der Mamma"
* $ICD10GM#N60.3 "Fibrosklerose der Mamma"
* $ICD10GM#N60.4 "Mammäre Duktektasie"
* $ICD10GM#N60.8 "Sonstige gutartige Mammadysplasien"
* $ICD10GM#N60.9 "Gutartige Mammadysplasie, nicht näher bezeichnet"

// === N61 - Entzündliche Krankheiten der Mamma ===
* $ICD10GM#N61 "Entzündliche Krankheiten der Mamma"

// === N62 - Hypertrophie der Mamma ===
* $ICD10GM#N62 "Hypertrophie der Mamma"

// === N63 - Nicht näher bezeichnete Knoten in der Mamma ===
* $ICD10GM#N63 "Nicht näher bezeichnete Knoten in der Mamma"

// === N64 - Sonstige Krankheiten der Mamma ===
* $ICD10GM#N64.0 "Fissur und Fistel der Brustwarze"
* $ICD10GM#N64.1 "Fettgewebsnekrose der Mamma"
* $ICD10GM#N64.2 "Atrophie der Mamma"
* $ICD10GM#N64.3 "Galaktorrhoe, nicht im Zusammenhang mit der Geburt"
* $ICD10GM#N64.4 "Mastodynie"
* $ICD10GM#N64.5 "Sonstige Symptome, die die Mamma betreffen"
* $ICD10GM#N64.8 "Sonstige näher bezeichnete Krankheiten der Mamma"
* $ICD10GM#N64.9 "Krankheit der Mamma, nicht näher bezeichnet"

// === T85.4 - Komplikationen durch Mammaprothese/Implantat ===
* $ICD10GM#T85.4 "Mechanische Komplikation durch Mammaprothese oder -implantat"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-icd10-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 34
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.0
* ^expansion.contains[=].display = "Brustwarze und Warzenhof"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.1
* ^expansion.contains[=].display = "Zentraler Drüsenkörper der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.2
* ^expansion.contains[=].display = "Oberer innerer Quadrant der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.3
* ^expansion.contains[=].display = "Unterer innerer Quadrant der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.4
* ^expansion.contains[=].display = "Oberer äußerer Quadrant der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.5
* ^expansion.contains[=].display = "Unterer äußerer Quadrant der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.6
* ^expansion.contains[=].display = "Recessus axillaris der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.8
* ^expansion.contains[=].display = "Brustdrüse, mehrere Teilbereiche überlappend"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #C50.9
* ^expansion.contains[=].display = "Brustdrüse, nicht näher bezeichnet"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D05.0
* ^expansion.contains[=].display = "Lobuläres Carcinoma in situ der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D05.1
* ^expansion.contains[=].display = "Intraduktales Carcinoma in situ der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D05.7
* ^expansion.contains[=].display = "Sonstiges Carcinoma in situ der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D05.9
* ^expansion.contains[=].display = "Carcinoma in situ der Brustdrüse, nicht näher bezeichnet"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D24
* ^expansion.contains[=].display = "Gutartige Neubildung der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #D48.6
* ^expansion.contains[=].display = "Neubildung unsicheren oder unbekannten Verhaltens der Brustdrüse"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.0
* ^expansion.contains[=].display = "Solitäre Zyste der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.1
* ^expansion.contains[=].display = "Diffuse zystische Mastopathie"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.2
* ^expansion.contains[=].display = "Fibroadenose der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.3
* ^expansion.contains[=].display = "Fibrosklerose der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.4
* ^expansion.contains[=].display = "Mammäre Duktektasie"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.8
* ^expansion.contains[=].display = "Sonstige gutartige Mammadysplasien"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N60.9
* ^expansion.contains[=].display = "Gutartige Mammadysplasie, nicht näher bezeichnet"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N61
* ^expansion.contains[=].display = "Entzündliche Krankheiten der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N62
* ^expansion.contains[=].display = "Hypertrophie der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N63
* ^expansion.contains[=].display = "Nicht näher bezeichnete Knoten in der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.0
* ^expansion.contains[=].display = "Fissur und Fistel der Brustwarze"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.1
* ^expansion.contains[=].display = "Fettgewebsnekrose der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.2
* ^expansion.contains[=].display = "Atrophie der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.3
* ^expansion.contains[=].display = "Galaktorrhoe, nicht im Zusammenhang mit der Geburt"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.4
* ^expansion.contains[=].display = "Mastodynie"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.5
* ^expansion.contains[=].display = "Sonstige Symptome, die die Mamma betreffen"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.8
* ^expansion.contains[=].display = "Sonstige näher bezeichnete Krankheiten der Mamma"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #N64.9
* ^expansion.contains[=].display = "Krankheit der Mamma, nicht näher bezeichnet"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* ^expansion.contains[=].code = #T85.4
* ^expansion.contains[=].display = "Mechanische Komplikation durch Mammaprothese oder -implantat"
