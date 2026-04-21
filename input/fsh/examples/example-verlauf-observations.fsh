// ============================================================
// Verlaufs-Observations für oBDS-Verlaufsmeldungen
// Für drei Fälle: Fall 1 (Nachsorge rezidivfrei), Fall 2 (Progression), Fall 9 (Nachsorge)
// Nutzt MII_PR_Onko_Verlauf als Grundlage (kein eigenes Senologie-Profil nötig).
// Zusätzlich ECOG-Observations (oBDS-Pflichtfeld "Allgemeiner_Leistungszustand"
// in jeder Verlaufsmeldung, nutzt MII_PR_Onko_Allgemeiner_Leistungszustand_ECOG).
// ============================================================

Alias: $MII_ONKO_VERLAUF = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-verlauf
Alias: $MII_CS_VERLAUF_GESAMT = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung
Alias: $MII_CS_VERLAUF_PT = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor
Alias: $MII_CS_VERLAUF_LK = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten
Alias: $MII_CS_VERLAUF_FM = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen
Alias: $MII_ONKO_ECOG = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog
Alias: $MII_CS_ECOG = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog

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

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* focus = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-08-15"

// Gesamtbeurteilung: K = kein Anhalt für Resttumor
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "keine Änderung (no change, NC) = stable disease"

// Lokaler Tumorstatus
* component[+].code.coding = $SCT#277062004 "Anatomic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// Lymphknoten-Status
* component[+].code.coding = $SCT#277060007 "Lymph node group"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// Fernmetastasen-Status
* component[+].code.coding = $SCT#277061006 "Metastatic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall1-ECOG-6Monate
InstanceOf: Observation
Title: "Fall 1: ECOG-Leistungszustand 6 Monate postoperativ"
Description: "ECOG 0 — vollständig aktiv, keine Einschränkung"
Usage: #example

* meta.profile = $MII_ONKO_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-08-15"
* valueCodeableConcept.coding[+].system = $MII_CS_ECOG
* valueCodeableConcept.coding[=].code = #0
* valueCodeableConcept.coding[=].display = "Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)"


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

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* focus = Reference(Condition/Fall2-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-15"

// Gesamtbeurteilung: P = Progress
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #P
* valueCodeableConcept.coding[=].display = "Progression"

// Lokaler Tumorstatus: K (bereits reseziert, kein Lokalrezidiv)
* component[+].code.coding = $SCT#277062004 "Anatomic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// Lymphknoten-Status: K
* component[+].code.coding = $SCT#277060007 "Lymph node group"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// Fernmetastasen: N = Neu aufgetretene Fernmetastasen
* component[+].code.coding = $SCT#277061006 "Metastatic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #N
* component[=].valueCodeableConcept.coding[=].display = "Fernmetastasen No Change"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall2-ECOG-Progression
InstanceOf: Observation
Title: "Fall 2: ECOG-Leistungszustand bei Progression"
Description: "ECOG 2 — deutliche Einschränkung bei Progression mit Lebermetastasen"
Usage: #example

* meta.profile = $MII_ONKO_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2026-03-15"
* valueCodeableConcept.coding[+].system = $MII_CS_ECOG
* valueCodeableConcept.coding[=].code = #2
* valueCodeableConcept.coding[=].display = "Gehfähig, Selbstversorgung möglich, aber nicht arbeitsfähig; kann mehr als 50 % der Wachzeit aufstehen (50 - 60 % nach Karnofsky)"


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

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* focus = Reference(Condition/Fall9-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-20"

// Gesamtbeurteilung: K = kein Anhalt für Tumor
* valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_GESAMT
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "keine Änderung (no change, NC) = stable disease"

// Lokaler Tumorstatus: K
* component[+].code.coding = $SCT#277062004 "Anatomic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_PT
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// Lymphknoten-Status: K
* component[+].code.coding = $SCT#277060007 "Lymph node group"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_LK
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// Fernmetastasen: K
* component[+].code.coding = $SCT#277061006 "Metastatic site"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_VERLAUF_FM
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall9-ECOG-12Monate
InstanceOf: Observation
Title: "Fall 9: ECOG-Leistungszustand 12 Monate postoperativ"
Description: "ECOG 1 — leicht eingeschränkt (Residual-Lymphödem nach Axilladissektion)"
Usage: #example

* meta.profile = $MII_ONKO_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2026-03-20"
* valueCodeableConcept.coding[+].system = $MII_CS_ECOG
* valueCodeableConcept.coding[=].code = #1
* valueCodeableConcept.coding[=].display = "Einschränkung bei körperlicher Anstrengung, aber gehfähig; leichte körperliche Arbeit bzw. Arbeit im Sitzen (z. B. leichte Hausarbeit oder Büroarbeit) möglich (70 - 80 % nach Karnofsky)"
