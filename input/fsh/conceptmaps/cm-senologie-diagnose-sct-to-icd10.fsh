// ConceptMap: SNOMED CT → ICD-10-GM für die Diagnose-Mamma Choices.
// Wird vom Diagnose-Questionnaire-Extract via FHIRPath translate() konsumiert,
// um die ICD-10-Slice der MII-Onko-Diagnose-Primärtumor-Profile automatisch
// zu befüllen.

Alias: $SCT = http://snomed.info/sct
Alias: $ICD10GM = http://fhir.de/CodeSystem/bfarm/icd-10-gm
Alias: $DIAG_CUSTOM = https://www.senologie.org/fhir/CodeSystem/diagnose-mamma-custom

Instance: cm-senologie-diagnose-sct-to-icd10
InstanceOf: ConceptMap
Title: "CM Senologie Diagnose SCT → ICD-10-GM"
Description: "Mapping der Mamma-Diagnose-Choices (SNOMED CT + Senologie-Custom) zu ICD-10-GM-Codes. Eingesetzt im Diagnose-Questionnaire-Extract zur automatischen Befüllung der ICD-10-Slice."
Usage: #definition

* url = "https://www.senologie.org/fhir/ConceptMap/cm-senologie-diagnose-sct-to-icd10"
* version = "0.1.0"
* status = #draft
* experimental = true
* sourceUri = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose"
* targetUri = $ICD10GM

* group[+].source = $SCT
* group[=].target = $ICD10GM
* group[=].element[+].code = #254837009
* group[=].element[=].display = "Mammakarzinom"
* group[=].element[=].target[+].code = #C50.9
* group[=].element[=].target[=].display = "Bösartige Neubildung der Brustdrüse, nicht näher bezeichnet"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #109889007
* group[=].element[=].display = "Carcinoma in situ (DCIS)"
* group[=].element[=].target[+].code = #D05.1
* group[=].element[=].target[=].display = "Intraduktales Carcinoma in situ der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #269497004
* group[=].element[=].display = "B3-Läsion (Neoplasm of uncertain behaviour of breast)"
* group[=].element[=].target[+].code = #D48.6
* group[=].element[=].target[=].display = "Neubildung unsicheren oder unbekannten Verhaltens: Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #254845004
* group[=].element[=].display = "Fibroadenom"
* group[=].element[=].target[+].code = #D24
* group[=].element[=].target[=].display = "Gutartige Neubildung der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #27431007
* group[=].element[=].display = "Fibrozystische Mastopathie"
* group[=].element[=].target[+].code = #N60.1
* group[=].element[=].target[=].display = "Diffuse zystische Mastopathie"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #53430007
* group[=].element[=].display = "Mastodynie"
* group[=].element[=].target[+].code = #N64.4
* group[=].element[=].target[=].display = "Mastodynie"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #4754008
* group[=].element[=].display = "Gynäkomastie"
* group[=].element[=].target[+].code = #N62
* group[=].element[=].target[=].display = "Mammahypertrophie"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #83620003
* group[=].element[=].display = "Mastitis non-puerperalis"
* group[=].element[=].target[+].code = #N61
* group[=].element[=].target[=].display = "Entzündliche Krankheiten der Mamma"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #1287638006
* group[=].element[=].display = "Mastitis puerperalis"
* group[=].element[=].target[+].code = #O91.2
* group[=].element[=].target[=].display = "Nichteitrige Mastitis im Wochenbett"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #237444008
* group[=].element[=].display = "Granulomatöse Mastitis"
* group[=].element[=].target[+].code = #N61
* group[=].element[=].target[=].display = "Entzündliche Krankheiten der Mamma"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #16698000
* group[=].element[=].display = "Abszess non-puerperalis der Mamma"
* group[=].element[=].target[+].code = #N61
* group[=].element[=].target[=].display = "Entzündliche Krankheiten der Mamma"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #10745131000119107
* group[=].element[=].display = "Abszess puerperalis der Mamma"
* group[=].element[=].target[+].code = #O91.1
* group[=].element[=].target[=].display = "Mammaabszess im Wochenbett"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #399123008
* group[=].element[=].display = "Einfache Mammazyste"
* group[=].element[=].target[+].code = #N60.0
* group[=].element[=].target[=].display = "Solitäre Zyste der Mamma"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #449837001
* group[=].element[=].display = "Komplexe Mammazyste"
* group[=].element[=].target[+].code = #N60.8
* group[=].element[=].target[=].display = "Sonstige gutartige Mammadysplasie"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #718220008
* group[=].element[=].display = "Genetische Hochrisikosituation"
* group[=].element[=].target[+].code = #Z80.3
* group[=].element[=].target[=].display = "Bösartige Neubildung der Brustdrüse in der Familienanamnese"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #237474000
* group[=].element[=].display = "Kapselfibrose"
* group[=].element[=].target[+].code = #T85.49
* group[=].element[=].target[=].display = "Mechanische Komplikation durch Mammaimplantate"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #237473006
* group[=].element[=].display = "Rupturiertes Mammaimplantat"
* group[=].element[=].target[+].code = #T85.43
* group[=].element[=].target[=].display = "Mechanische Komplikation durch Mammaimplantate - Bruch"
* group[=].element[=].target[=].equivalence = #equivalent

// Custom (bz-*) → ICD-10
* group[+].source = $DIAG_CUSTOM
* group[=].target = $ICD10GM
* group[=].element[+].code = #bc-recurrence
* group[=].element[=].display = "Mammakarzinom Rezidiv"
* group[=].element[=].target[+].code = #C50.9
* group[=].element[=].target[=].display = "Bösartige Neubildung der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #anisomastie
* group[=].element[=].display = "Anisomastie"
* group[=].element[=].target[+].code = #N64.8
* group[=].element[=].target[=].display = "Sonstige näher bezeichnete Krankheiten der Mamma"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #makromastie
* group[=].element[=].display = "Makromastie"
* group[=].element[=].target[+].code = #N62
* group[=].element[=].target[=].display = "Mammahypertrophie"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #mamillensekretion-blutig
* group[=].element[=].display = "Blutige Mamillensekretion"
* group[=].element[=].target[+].code = #N64.5
* group[=].element[=].target[=].display = "Sonstige Symptome der Mamma"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #mamillensekretion-nicht-blutig
* group[=].element[=].display = "Nicht blutige Mamillensekretion"
* group[=].element[=].target[+].code = #N64.5
* group[=].element[=].target[=].display = "Sonstige Symptome der Mamma"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #befund-unklarer-dignitaet
* group[=].element[=].display = "Befund unklarer Dignität"
* group[=].element[=].target[+].code = #R92
* group[=].element[=].target[=].display = "Abnorme Befunde bei bildgebender Diagnostik der Mamma"
* group[=].element[=].target[=].equivalence = #wider

// "Sonstiges" → kein direktes Mapping, wird leer gelassen
