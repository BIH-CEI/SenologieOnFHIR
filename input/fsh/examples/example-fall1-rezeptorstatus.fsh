// ============================================================
// Fall 1: Rezeptorstatus — demonstriert granulare Erfassung
// (Senologie_ER_Status, Senologie_PR_Status, Senologie_HER2_Status)
//
// Klinisches Setting: Erika Neumann, 58 J., invasives Karzinom NST links,
// G2. Im ursprünglichen Befundtext steht "ER+ IRS 12, PR+ IRS 8,
// HER2- Score 1+". Mit den neuen Profilen wird daraus:
//   ER:  Leitlinie 'positiv', 95 % positive Zellen, Intensität "Strong",
//        IRS 12, Allred 8
//   PR:  Leitlinie 'positiv', 60 % positive Zellen, Intensität "Moderate",
//        IRS 8, Allred 7
//   HER2 IHC: Leitlinie 'HER2-low' (statt 'negativ'!), IHC 1+
//
// Konsequenz: HER2-low-Patientinnen werden jetzt analysierbar identifiziert
// und sind potenzielle Kandidatinnen für T-DXd (Trastuzumab Deruxtecan)
// im metastasierten Setting (DESTINY-Breast04).
// ============================================================

// --- ER-Status ---
Instance: Fall1-ER-Status
InstanceOf: Senologie_ER_Status
Title: "Fall 1: ER-Status — positiv, IRS 12, 95 % / Strong"
Description: "Östrogenrezeptor positiv, hochpositive Expression. Demonstriert die Senologie-Erweiterung mit IRS und Allred zusätzlich zum MII-Onko-Standard (% + Intensität)."
Usage: #example

* status = #final
* code = $LOINC#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* subject = Reference(Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-23"

// Beide Slices auf value[x] (oBDS für Krebsregister + Leitlinie für Auswertung)
* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6576-8 "Positive"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#positiv "positiv"

// MII-Onko-Components (code ist vom Profil fixiert auf SNOMED CT)
* component[AnteilPositiveZellen].valueQuantity.value = 95
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[Faerbeintensitaet].valueCodeableConcept = $LOINC#LA13035-3 "Strong"

// Senologie-Erweiterungen: IRS und Allred (abgeleitet aus den Rohwerten)
* component[irsScore].valueQuantity.value = 12
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}
* component[allredScore].valueQuantity.value = 8
* component[allredScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[allredScore].valueQuantity.code = #{score}


// --- PR-Status ---
Instance: Fall1-PR-Status
InstanceOf: Senologie_PR_Status
Title: "Fall 1: PR-Status — positiv, IRS 8, 60 % / Moderate"
Description: "Progesteronrezeptor positiv, mittelgradige Expression."
Usage: #example

* status = #final
* code = $LOINC#85339-0 "Progesterone receptor [Interpretation] in Tissue by Immune stain"
* subject = Reference(Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-23"

* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6576-8 "Positive"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#positiv "positiv"

* component[AnteilPositiveZellen].valueQuantity.value = 60
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[Faerbeintensitaet].valueCodeableConcept = $LOINC#LA13034-6 "Moderate"

* component[irsScore].valueQuantity.value = 8
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}
* component[allredScore].valueQuantity.value = 7
* component[allredScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[allredScore].valueQuantity.code = #{score}


// --- HER2-Status (IHC) — DAS BEISPIEL FÜR HER2-LOW ---
Instance: Fall1-HER2-Status
InstanceOf: Senologie_HER2_Status
Title: "Fall 1: HER2-Status — HER2-low (IHC 1+, KEINE ISH nötig)"
Description: "HER2 IHC 1+. Im oBDS-Slice 'negativ', aber im Leitlinien-Slice korrekt als 'HER2-low' klassifiziert — damit potenzielle T-DXd-Kandidatin bei späterer Metastasierung (DESTINY-Breast04). Demonstriert den Mehrwert der granularen Erfassung gegenüber binärem oBDS."
Usage: #example

* status = #final
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* subject = Reference(Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-23"

// Leitlinien-Slice: HER2-low (statt 'negativ'!)
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie#low "HER2-low"
// oBDS-Slice: 'negativ' (klassische Krebsregister-Sicht — verliert die HER2-low-Information!)
* valueCodeableConcept.coding[DefinitionOBDS] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds#N "negativ"

// IHC-Score: 1+
* component[IHCScore].valueCodeableConcept = $LOINC#LA26333-6 "1+"

// Keine ISH-Reflextestung nötig, weil IHC 1+ direkt HER2-low klassifiziert.
// Bei IHC 2+ wäre eine separate Observation nach MII_PR_MTB_INSITUHYBRIDIZATION_HER2
// anzulegen und via Observation.hasMember zu referenzieren.
