// ============================================================================
// Reverse ConceptMaps: SNOMED CT / FHIR -> oBDS Codes
// Fuer die Ruecktransformation von FHIR-Ressourcen in oBDS-XML-Meldungen
// Basierend auf MII Onkologie ConceptMaps (umgekehrte Richtung)
// ============================================================================

Alias: $SCT = http://snomed.info/sct
Alias: $OBDS_Seitenlokalisation = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation
Alias: $OBDS_Intention = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention
Alias: $OBDS_Grading = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading
Alias: $UICC_R = https://www.uicc.org/resources/r-classification
Alias: $OBDS_Stellung = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-stellungzurop
Alias: $OBDS_Therapieart = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ
Alias: $OBDS_FM = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-fernmetastasen
Alias: $OBDS_Verlauf = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung

// ============================================================================
// 1. Seitenlokalisation: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-seitenlokalisation
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Seitenlokalisation"
Description: "Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Seitenlokalisation
* group[=].element[+].code = #24028007
* group[=].element[=].display = "Right (qualifier value)"
* group[=].element[=].target[+].code = #R
* group[=].element[=].target[=].display = "rechts"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #7771000
* group[=].element[=].display = "Left (qualifier value)"
* group[=].element[=].target[+].code = #L
* group[=].element[=].target[=].display = "links"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #51440002
* group[=].element[=].display = "Right and left (qualifier value)"
* group[=].element[=].target[+].code = #B
* group[=].element[=].target[=].display = "beidseitig"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #260528009
* group[=].element[=].display = "Median (qualifier value)"
* group[=].element[=].target[+].code = #M
* group[=].element[=].target[=].display = "Mittellinie/mittig"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #261665006
* group[=].element[=].display = "Unknown (qualifier value)"
* group[=].element[=].target[+].code = #U
* group[=].element[=].target[=].display = "unbekannt"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #385432009
* group[=].element[=].display = "Not applicable (qualifier value)"
* group[=].element[=].target[+].code = #T
* group[=].element[=].target[=].display = "trifft nicht zu"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 2. Intention: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-intention
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Intention"
Description: "Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Intention
* group[=].element[+].code = #373808002
* group[=].element[=].display = "Curative - procedure intent (qualifier value)"
* group[=].element[=].target[+].code = #K
* group[=].element[=].target[=].display = "kurativ"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #363676003
* group[=].element[=].display = "Palliative - procedure intent (qualifier value)"
* group[=].element[=].target[+].code = #P
* group[=].element[=].target[=].display = "palliativ"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #261004008
* group[=].element[=].display = "Diagnostic intent (qualifier value)"
* group[=].element[=].target[+].code = #D
* group[=].element[=].target[=].display = "diagnostisch"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #255231005
* group[=].element[=].display = "Revision - value (qualifier value)"
* group[=].element[=].target[+].code = #R
* group[=].element[=].target[=].display = "Revision/Komplikation"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #74964007
* group[=].element[=].display = "Other (qualifier value)"
* group[=].element[=].target[+].code = #S
* group[=].element[=].target[=].display = "Sonstiges"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #1287211007
* group[=].element[=].display = "No information available (qualifier value)"
* group[=].element[=].target[+].code = #X
* group[=].element[=].target[=].display = "fehlende Angabe"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 3. Grading: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-grading
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Grading"
Description: "Mapping von SNOMED CT Gradingcodes zu oBDS Grading (1, 2, 3, 4, X, L, M, H, B)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-grading"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Grading
* group[=].element[+].code = #415175000
* group[=].element[=].display = "Primary acquired melanosis of conjunctiva without atypia (disorder)"
* group[=].element[=].target[+].code = #0
* group[=].element[=].target[=].display = "primaer erworbene Melanose ohne zellulaere Atypien (nur beim malignen Melanom der Konjunktiva)"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #373375007
* group[=].element[=].display = "Well differentiated histological grade finding (finding)"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "gut differenziert"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #373377004
* group[=].element[=].display = "Moderately differentiated histological grade finding (finding)"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "maessig differenziert"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #373373000
* group[=].element[=].display = "Poorly differentiated histological grade finding (finding)"
* group[=].element[=].target[+].code = #3
* group[=].element[=].target[=].display = "schlecht differenziert"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #373374006
* group[=].element[=].display = "Undifferentiated histological grade finding (finding)"
* group[=].element[=].target[+].code = #4
* group[=].element[=].target[=].display = "undifferenziert"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 4. Residualstatus: SNOMED (UICC R) -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-residualstatus
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Residualstatus"
Description: "Mapping von SNOMED CT UICC R-Klassifikation zu oBDS Residualstatus (R0, R1, R2, RX)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-residualstatus"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $UICC_R
* group[=].element[+].code = #1352526005
* group[=].element[=].display = "Union for International Cancer Control R0 (qualifier value)"
* group[=].element[=].target[+].code = #R0
* group[=].element[=].target[=].display = "Kein Residualtumor"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #1352529003
* group[=].element[=].display = "Union for International Cancer Control R1 (qualifier value)"
* group[=].element[=].target[+].code = #R1
* group[=].element[=].target[=].display = "Mikroskopischer Residualtumor"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 5. Therapiestellung: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-therapiestellung
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Therapie-Stellung zur OP"
Description: "Mapping von SNOMED CT Codes zu oBDS Stellung zur OP (O, A, N, I, Z, S)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapiestellung"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Stellung
* group[=].element[+].code = #373846009
* group[=].element[=].display = "Adjuvant - intent (qualifier value)"
* group[=].element[=].target[+].code = #A
* group[=].element[=].target[=].display = "adjuvant"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #373847000
* group[=].element[=].display = "Neo-adjuvant - intent (qualifier value)"
* group[=].element[=].target[+].code = #N
* group[=].element[=].target[=].display = "neoadjuvant"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #277671009
* group[=].element[=].display = "Intraoperative (qualifier value)"
* group[=].element[=].target[+].code = #I
* group[=].element[=].target[=].display = "intraoperativ"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #260364009
* group[=].element[=].display = "Additive (qualifier value)"
* group[=].element[=].target[+].code = #Z
* group[=].element[=].target[=].display = "additiv"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #74964007
* group[=].element[=].display = "Other (qualifier value)"
* group[=].element[=].target[+].code = #S
* group[=].element[=].target[=].display = "Sonstiges"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 6. Therapieart: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-therapieart
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Therapieart"
Description: "Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Therapieart
* group[=].element[+].code = #367336001
* group[=].element[=].display = "Chemotherapy (procedure)"
* group[=].element[=].target[+].code = #CH
* group[=].element[=].target[=].display = "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #169413002
* group[=].element[=].display = "Hormone therapy (procedure)"
* group[=].element[=].target[+].code = #HO
* group[=].element[=].target[=].display = "Hormontherapie"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #897713009
* group[=].element[=].display = "Immunotherapy (procedure)"
* group[=].element[=].target[+].code = #IM
* group[=].element[=].target[=].display = "Immun-/Antikoerpertherapie"
* group[=].element[=].target[=].equivalence = #narrower
* group[=].element[=].target[=].comment = "SNOMED 897713009 wird sowohl fuer IM als auch fuer CI und CIZ verwendet; hier wird IM als Standardziel gewaehlt"

* group[=].element[+].code = #1255831008
* group[=].element[=].display = "Chemotherapy for malignant neoplastic disease using targeted agent (procedure)"
* group[=].element[=].target[+].code = #ZS
* group[=].element[=].target[=].display = "zielgerichtete Substanzen"
* group[=].element[=].target[=].equivalence = #narrower
* group[=].element[=].target[=].comment = "SNOMED 1255831008 wird sowohl fuer ZS als auch CZ verwendet; hier wird ZS als Standardziel gewaehlt"

* group[=].element[+].code = #1269349006
* group[=].element[=].display = "Transplantation of stem cell (procedure)"
* group[=].element[=].target[+].code = #SZ
* group[=].element[=].target[=].display = "Stammzelltransplantation (inkl. Knochenmarktransplantation)"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 7. Fernmetastasen-Lokalisation: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-fm-lokalisation
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Fernmetastasen-Lokalisation"
Description: "Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_FM
* group[=].element[+].code = #258332000
* group[=].element[=].display = "PUL (body structure)"
* group[=].element[=].target[+].code = #PUL
* group[=].element[=].target[=].display = "Lunge"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258333005
* group[=].element[=].display = "OSS (body structure)"
* group[=].element[=].target[+].code = #OSS
* group[=].element[=].target[=].display = "Knochen"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258334004
* group[=].element[=].display = "HEP (body structure)"
* group[=].element[=].target[+].code = #HEP
* group[=].element[=].target[=].display = "Leber"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #313367003
* group[=].element[=].display = "BRA (body structure)"
* group[=].element[=].target[+].code = #BRA
* group[=].element[=].target[=].display = "Hirn"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258336002
* group[=].element[=].display = "LYM (body structure)"
* group[=].element[=].target[+].code = #LYM
* group[=].element[=].target[=].display = "Lymphknoten"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #14016003
* group[=].element[=].display = "Bone marrow structure (body structure)"
* group[=].element[=].target[+].code = #MAR
* group[=].element[=].target[=].display = "Knochenmark"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258337006
* group[=].element[=].display = "PLE (body structure)"
* group[=].element[=].target[+].code = #PLE
* group[=].element[=].target[=].display = "Pleura"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258338001
* group[=].element[=].display = "PER (body structure)"
* group[=].element[=].target[+].code = #PER
* group[=].element[=].target[=].display = "Peritoneum"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258339009
* group[=].element[=].display = "ADR (body structure)"
* group[=].element[=].target[+].code = #ADR
* group[=].element[=].target[=].display = "Nebennieren"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258340006
* group[=].element[=].display = "SKI (body structure)"
* group[=].element[=].target[+].code = #SKI
* group[=].element[=].target[=].display = "Haut"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #258348004
* group[=].element[=].display = "OTH (body structure)"
* group[=].element[=].target[+].code = #OTH
* group[=].element[=].target[=].display = "andere Organe"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #405843009
* group[=].element[=].display = "Widespread metastatic malignant neoplastic disease (disorder)"
* group[=].element[=].target[+].code = #GEN
* group[=].element[=].target[=].display = "generalisierte Metastasierung"
* group[=].element[=].target[=].equivalence = #equivalent


// ============================================================================
// 8. Verlauf Gesamtbeurteilung: SNOMED -> oBDS
// ============================================================================

Instance: cm-sct-to-obds-verlauf-gesamtbeurteilung
InstanceOf: ConceptMap
Usage: #definition
Title: "SNOMED CT to oBDS Verlauf Gesamtbeurteilung"
Description: "Mapping von SNOMED CT Tumorstatusbewertungen zu oBDS Gesamtbeurteilung Tumorstatus (V, T, K, P, U, X)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-verlauf-gesamtbeurteilung"
* version = "0.1.0"
* status = #draft
// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

* group[+].source = $SCT
* group[=].target = $OBDS_Verlauf
* group[=].element[+].code = #550991000124107
* group[=].element[=].display = "Malignant neoplasm in full remission (disorder)"
* group[=].element[=].target[+].code = #V
* group[=].element[=].target[=].display = "Vollremission (complete remission, CR)"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #551001000124108
* group[=].element[=].display = "Malignant neoplasm in partial remission (disorder)"
* group[=].element[=].target[+].code = #T
* group[=].element[=].target[=].display = "Teilremission (partial remission, PR)"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #260388006
* group[=].element[=].display = "No status change (qualifier value)"
* group[=].element[=].target[+].code = #K
* group[=].element[=].target[=].display = "keine Aenderung (no change, NC) = stable disease"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #419835002
* group[=].element[=].display = "Tumor progression (finding)"
* group[=].element[=].target[+].code = #P
* group[=].element[=].target[=].display = "Progression"
* group[=].element[=].target[=].equivalence = #equivalent
