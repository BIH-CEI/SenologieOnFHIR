// ============================================================
// Verlaufs-Observations für oBDS-Verlaufsmeldungen
// Für drei Fälle: Fall 1 (Nachsorge rezidivfrei), Fall 2 (Progression), Fall 9 (Nachsorge)
// Nutzt MII_PR_Onko_Verlauf als Grundlage (kein eigenes Senologie-Profil nötig).
// ============================================================

Alias: $MII_ONKO_VERLAUF = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-verlauf
Alias: $MII_CS_VERLAUF_GESAMT = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung
Alias: $MII_CS_VERLAUF_PT = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor
Alias: $MII_CS_VERLAUF_LK = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten
Alias: $MII_CS_VERLAUF_FM = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen

// ============================================================
// Fall 1: Erika Neumann — Verlauf 6 Monate postoperativ (rezidivfrei)
// ============================================================

Instance: Fall1-Verlauf-6Monate
InstanceOf: Observation
Title: "Fall 1: Verlaufskontrolle 6 Monate postoperativ"
Description: "Nachsorge-Untersuchung nach BET und Strahlentherapie, kein Rezidivhinweis"
Usage: #example

* meta.profile = $MII_ONKO_VERLAUF

* status = #final

* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #97509-4
* code.coding[=].display = "Cancer disease status"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* focus = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-08-15"

// Gesamtbeurteilung: K = kein Anhalt für Resttumor
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "kein Anhalt für Tumor"

// Lokaler Tumorstatus
* component[+].code.coding = http://loinc.org#LP248431-2 "Primary tumor response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Tumor"

// Lymphknoten-Status
* component[+].code.coding = http://loinc.org#LP417347-6 "Regional lymph node response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Lymphknotenbefall"

// Fernmetastasen-Status
* component[+].code.coding = http://loinc.org#LP128969-2 "Distant metastasis response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Fernmetastasen"


// ============================================================
// Fall 2: Lena Hoffmann — Verlauf bei Progression (hepatische Metastasen)
// ============================================================

Instance: Fall2-Verlauf-Progression
InstanceOf: Observation
Title: "Fall 2: Verlaufskontrolle bei Progression"
Description: "Progression mit neuen hepatischen Metastasen nach 18 Monaten adjuvanter Therapie"
Usage: #example

* meta.profile = $MII_ONKO_VERLAUF

* status = #final

* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #97509-4
* code.coding[=].display = "Cancer disease status"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* focus = Reference(Condition/Fall2-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-15"

// Gesamtbeurteilung: P = Progress
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #P
* valueCodeableConcept.coding[=].display = "Progression"

// Lokaler Tumorstatus: K (bereits reseziert, kein Lokalrezidiv)
* component[+].code.coding = http://loinc.org#LP248431-2 "Primary tumor response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Lokalrezidiv"

// Lymphknoten-Status: K
* component[+].code.coding = http://loinc.org#LP417347-6 "Regional lymph node response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für LK-Rezidiv"

// Fernmetastasen: N = Neu aufgetretene Fernmetastasen
* component[+].code.coding = http://loinc.org#LP128969-2 "Distant metastasis response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #N
* component[=].valueCodeableConcept.coding[=].display = "neu aufgetretene Fernmetastasen"


// ============================================================
// Fall 9: Andrea Wolf — Verlauf 12 Monate postoperativ (rezidivfrei, unter endokriner Therapie)
// ============================================================

Instance: Fall9-Verlauf-12Monate
InstanceOf: Observation
Title: "Fall 9: Verlaufskontrolle 12 Monate postoperativ"
Description: "Nachsorge nach BET + Axilladissektion + Chemo + RT, unter Tamoxifen-Therapie"
Usage: #example

* meta.profile = $MII_ONKO_VERLAUF

* status = #final

* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #97509-4
* code.coding[=].display = "Cancer disease status"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* focus = Reference(Condition/Fall9-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-20"

// Gesamtbeurteilung: K = kein Anhalt für Tumor
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "kein Anhalt für Tumor"

// Lokaler Tumorstatus: K
* component[+].code.coding = http://loinc.org#LP248431-2 "Primary tumor response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Tumor"

// Lymphknoten-Status: K
* component[+].code.coding = http://loinc.org#LP417347-6 "Regional lymph node response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Lymphknotenbefall"

// Fernmetastasen: K
* component[+].code.coding = http://loinc.org#LP128969-2 "Distant metastasis response"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Anhalt für Fernmetastasen"
