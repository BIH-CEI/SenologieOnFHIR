// ============================================================
// Verlaufs-Observations für Nachsorge / Verlaufsmeldungen (OncoBox M01-M10, D27)
// Für vier Fälle:
//   Fall 1: Nachsorge rezidivfrei (M06, Gesamtbeurteilung K)
//   Fall 2: Progression (M06, Gesamtbeurteilung P)
//   Fall 4: Post-Therapie Teilremission (D27, Gesamtbeurteilung T)
//   Fall 9: Nachsorge rezidivfrei (M06, Gesamtbeurteilung K)
// Nutzt Senologie_FollowUp (erweitert MII_PR_Onko_Verlauf um M03-M04, M08-M10).
// Zusätzlich ECOG-Observations (oBDS-Pflichtfeld "Allgemeiner_Leistungszustand"
// in jeder Verlaufsmeldung, nutzt MII_PR_Onko_Allgemeiner_Leistungszustand_ECOG).
// ============================================================

Alias: $CS_FU_EX = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

// ============================================================
// Fall 1: Erika Neumann — Verlauf 6 Monate postoperativ (rezidivfrei)
// ============================================================

Instance: Fall1-Verlauf-6Monate
InstanceOf: Senologie_FollowUp
Title: "Fall 1: Verlaufskontrolle 6 Monate postoperativ"
Description: "Nachsorge-Untersuchung nach BET und Strahlentherapie, kein Rezidivhinweis. Aktive Nachsorge, Patientin lebend, kein Zweittumor."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* focus = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-08-15"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: K = kein Anhalt für Resttumor
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "keine Änderung (no change, NC) = stable disease"

// M05: Lokaler Tumorstatus
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// M06: Lymphknoten-Status
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen-Status
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// M03: Art der Nachsorge — aktiv
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #nachsorge-art
* component[=].code.coding[=].display = "Art der Nachsorge"
* component[=].valueCodeableConcept.coding[+].system = $CS_FU_EX
* component[=].valueCodeableConcept.coding[=].code = #aktiv
* component[=].valueCodeableConcept.coding[=].display = "Aktive Nachsorge"

// M04: Vitalstatus — lebend
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #vitalstatus
* component[=].code.coding[=].display = "Vitalstatus"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #438949009
* component[=].valueCodeableConcept.coding[=].display = "Alive (finding)"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall1-ECOG-6Monate
InstanceOf: Observation
Title: "Fall 1: ECOG-Leistungszustand 6 Monate postoperativ"
Description: "ECOG 0 — vollständig aktiv, keine Einschränkung"
Usage: #example

* meta.profile = $MII_PR_Onko_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-08-15"
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_ECOG
* valueCodeableConcept.coding[=].code = #0
* valueCodeableConcept.coding[=].display = "Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)"


// ============================================================
// Fall 2: Lena Hoffmann — Verlauf bei Progression (hepatische Metastasen)
// ============================================================

Instance: Fall2-Verlauf-Progression
InstanceOf: Senologie_FollowUp
Title: "Fall 2: Verlaufskontrolle bei Progression"
Description: "Progression mit neuen hepatischen Metastasen nach 18 Monaten adjuvanter Therapie. Aktive Nachsorge, Patientin lebend, kein Zweittumor."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* focus = Reference(Condition/Fall2-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-15"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: P = Progress
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #P
* valueCodeableConcept.coding[=].display = "Progression"

// M05: Lokaler Tumorstatus: K (bereits reseziert, kein Lokalrezidiv)
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// M06: Lymphknoten-Status: K
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen: N = Neu aufgetretene Fernmetastasen
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #N
* component[=].valueCodeableConcept.coding[=].display = "Fernmetastasen No Change"

// M03: Art der Nachsorge — aktiv
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #nachsorge-art
* component[=].code.coding[=].display = "Art der Nachsorge"
* component[=].valueCodeableConcept.coding[+].system = $CS_FU_EX
* component[=].valueCodeableConcept.coding[=].code = #aktiv
* component[=].valueCodeableConcept.coding[=].display = "Aktive Nachsorge"

// M04: Vitalstatus — lebend
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #vitalstatus
* component[=].code.coding[=].display = "Vitalstatus"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #438949009
* component[=].valueCodeableConcept.coding[=].display = "Alive (finding)"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall2-ECOG-Progression
InstanceOf: Observation
Title: "Fall 2: ECOG-Leistungszustand bei Progression"
Description: "ECOG 2 — deutliche Einschränkung bei Progression mit Lebermetastasen"
Usage: #example

* meta.profile = $MII_PR_Onko_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2026-03-15"
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_ECOG
* valueCodeableConcept.coding[=].code = #2
* valueCodeableConcept.coding[=].display = "Gehfähig, Selbstversorgung möglich, aber nicht arbeitsfähig; kann mehr als 50 % der Wachzeit aufstehen (50 - 60 % nach Karnofsky)"


// ============================================================
// Fall 9: Andrea Wolf — Verlauf 12 Monate postoperativ (rezidivfrei, unter endokriner Therapie)
// ============================================================

Instance: Fall9-Verlauf-12Monate
InstanceOf: Senologie_FollowUp
Title: "Fall 9: Verlaufskontrolle 12 Monate postoperativ"
Description: "Nachsorge nach BET + Axilladissektion + Chemo + RT, unter Tamoxifen-Therapie. Aktive Nachsorge, Patientin lebend, kein Zweittumor."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* focus = Reference(Condition/Fall9-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-03-20"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: K = kein Anhalt für Tumor
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "keine Änderung (no change, NC) = stable disease"

// M05: Lokaler Tumorstatus: K
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// M06: Lymphknoten-Status: K
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen: K
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// M03: Art der Nachsorge — aktiv
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #nachsorge-art
* component[=].code.coding[=].display = "Art der Nachsorge"
* component[=].valueCodeableConcept.coding[+].system = $CS_FU_EX
* component[=].valueCodeableConcept.coding[=].code = #aktiv
* component[=].valueCodeableConcept.coding[=].display = "Aktive Nachsorge"

// M04: Vitalstatus — lebend
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #vitalstatus
* component[=].code.coding[=].display = "Vitalstatus"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #438949009
* component[=].valueCodeableConcept.coding[=].display = "Alive (finding)"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall9-ECOG-12Monate
InstanceOf: Observation
Title: "Fall 9: ECOG-Leistungszustand 12 Monate postoperativ"
Description: "ECOG 1 — leicht eingeschränkt (Residual-Lymphödem nach Axilladissektion)"
Usage: #example

* meta.profile = $MII_PR_Onko_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2026-03-20"
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_ECOG
* valueCodeableConcept.coding[=].code = #1
* valueCodeableConcept.coding[=].display = "Einschränkung bei körperlicher Anstrengung, aber gehfähig; leichte körperliche Arbeit bzw. Arbeit im Sitzen (z. B. leichte Hausarbeit oder Büroarbeit) möglich (70 - 80 % nach Karnofsky)"


// ============================================================
// Fall 4: Julia Fischer — D27 Gesamtbeurteilung nach neoadjuvanter Therapie (PR)
// ============================================================

Instance: Fall4-Verlauf-PostTherapie
InstanceOf: Senologie_FollowUp
Title: "Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27)"
Description: "Gesamtbeurteilung Tumorstatus nach Abschluss der neoadjuvanten Systemtherapie: Teilremission (PR). Lokaler Tumorrückgang, LK und FM stabil. D27-Kontext (post-definitive Therapie)."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* focus = Reference(Condition/Fall4-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-06-10"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: T = Teilremission (PR)
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #T
* valueCodeableConcept.coding[=].display = "Teilremission (partial remission, PR)"

// M05: Lokaler Tumorstatus: T = Tumorreste (Residualtumor)
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #T
* component[=].valueCodeableConcept.coding[=].display = "Tumorreste (Residualtumor)"

// M06: Lymphknoten-Status: K
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen: K
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// M03: Art der Nachsorge — aktiv (direkte Beurteilung nach Therapie)
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #nachsorge-art
* component[=].code.coding[=].display = "Art der Nachsorge"
* component[=].valueCodeableConcept.coding[+].system = $CS_FU_EX
* component[=].valueCodeableConcept.coding[=].code = #aktiv
* component[=].valueCodeableConcept.coding[=].display = "Aktive Nachsorge"

// M04: Vitalstatus — lebend
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #vitalstatus
* component[=].code.coding[=].display = "Vitalstatus"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #438949009
* component[=].valueCodeableConcept.coding[=].display = "Alive (finding)"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"

// ECOG-Leistungszustand (oBDS-Pflichtfeld Verlauf.Allgemeiner_Leistungszustand)
Instance: Fall4-ECOG-PostTherapie
InstanceOf: Observation
Title: "Fall 4: ECOG-Leistungszustand nach neoadjuvanter Therapie"
Description: "ECOG 1 — leichte Einschränkung nach Chemotherapie"
Usage: #example

* meta.profile = $MII_PR_Onko_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status"
* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* effectiveDateTime = "2025-06-10"
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_ECOG
* valueCodeableConcept.coding[=].code = #1
* valueCodeableConcept.coding[=].display = "Einschränkung bei körperlicher Anstrengung, aber gehfähig; leichte körperliche Arbeit bzw. Arbeit im Sitzen (z. B. leichte Hausarbeit oder Büroarbeit) möglich (70 - 80 % nach Karnofsky)"


// ============================================================
// Fall 1: Erika Neumann — D27 Gesamtbeurteilung nach definitiver Therapie (CR)
// ============================================================

Instance: Fall1-Verlauf-PostTherapie
InstanceOf: Senologie_FollowUp
Title: "Fall 1: Gesamtbeurteilung nach definitiver Therapie (D27)"
Description: "Gesamtbeurteilung Tumorstatus nach BET + Strahlentherapie: Vollremission (CR). Kein Residualtumor. D27-Kontext (post-definitive Therapie)."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* focus = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-04-01"

// M02: Melder
* performer = Reference(Organization/Brustzentrum-Charite)

// Gesamtbeurteilung: V = Vollremission (CR)
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #V
* valueCodeableConcept.coding[=].display = "Vollremission (complete remission, CR)"

// M05: Lokaler Tumorstatus: K (kein Tumor nachweisbar)
* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

// M06: Lymphknoten-Status: K
* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

// M07: Fernmetastasen: K
* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

// M03: Art der Nachsorge — aktiv
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #nachsorge-art
* component[=].code.coding[=].display = "Art der Nachsorge"
* component[=].valueCodeableConcept.coding[+].system = $CS_FU_EX
* component[=].valueCodeableConcept.coding[=].code = #aktiv
* component[=].valueCodeableConcept.coding[=].display = "Aktive Nachsorge"

// M04: Vitalstatus — lebend
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #vitalstatus
* component[=].code.coding[=].display = "Vitalstatus"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #438949009
* component[=].valueCodeableConcept.coding[=].display = "Alive (finding)"

// M08: Zweittumor — nein
* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"
