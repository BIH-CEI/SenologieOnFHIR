// ============================================================
// PALB2 Keimbahnmutation (OncoBox C07)
// Observation-Instanzen via MII_PR_Onko_Genetische_Variante
// gene-studied: HGNC:26144 PALB2
// genomic-source-class: Germline (LA6683-2)
// interpretation: M (Mutation) oder W (Wildtyp)
// ============================================================

// --- Beispiel 1: PALB2 Wildtyp (Fall 1 Erika Neumann) ---
// Genetische Testung im Rahmen der Familienanamnese (Mutter
// Mammakarzinom mit 52 J.) — kein Nachweis pathogener PALB2-Variante.
Instance: Fall1-PALB2-Keimbahn-Wildtyp
InstanceOf: MII_PR_Onko_Genetische_Variante
Title: "Fall 1: PALB2-Keimbahnmutation — Wildtyp"
Description: "Kein Nachweis einer pathogenen PALB2-Keimbahnvariante bei Erika Neumann (Familienanamnese positiv, Mutter Mammakarzinom 52 J.)"
Usage: #example

* status = #final

* code = $LOINC#69548-6 "Genetic variant assessment"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-02-10"

// Kein Nachweis → Absent
* valueCodeableConcept = $LOINC#LA9634-2 "Absent"

// oBDS-Ausprägung: W = Wildtyp
* interpretation[oBDS].coding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-genetische-variante-auspraegung#W "Wildtyp"

// Gene studied: PALB2
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept.coding = http://www.genenames.org/geneId#HGNC:26144 "PALB2"

// Genomic source class: Germline (Keimbahn)
* component[genomic-source-class].code = $LOINC#48002-0 "Genomic source class [Type]"
* component[genomic-source-class].valueCodeableConcept.coding = $LOINC#LA6683-2 "Germline"


// --- Beispiel 2: PALB2 pathogene Mutation (Fall 10 Christina Becker) ---
// Paneldiagnostik bei BRCA1-positiver Patientin — zusätzlich
// PALB2 c.509_510del p.(Arg170Ilefs*14) pathogen nachgewiesen.
// Hinweis: Doppelmutation BRCA1+PALB2 ist selten, aber klinisch
// beschrieben. Hier als Demonstrationsbeispiel.
Instance: Fall10-PALB2-Keimbahn-Mutation
InstanceOf: MII_PR_Onko_Genetische_Variante
Title: "Fall 10: PALB2-Keimbahnmutation — pathogen"
Description: "Nachweis einer pathogenen PALB2-Keimbahnvariante bei Christina Becker (c.509_510del, Paneldiagnostik)"
Usage: #example

* status = #final

* code = $LOINC#69548-6 "Genetic variant assessment"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-03-15"

// Nachweis → Present
* valueCodeableConcept = $LOINC#LA9633-4 "Present"

// oBDS-Ausprägung: M = Mutation
* interpretation[oBDS].coding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-genetische-variante-auspraegung#M "Mutation"

// Gene studied: PALB2
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept.coding = http://www.genenames.org/geneId#HGNC:26144 "PALB2"

// Genomic source class: Germline (Keimbahn)
* component[genomic-source-class].code = $LOINC#48002-0 "Genomic source class [Type]"
* component[genomic-source-class].valueCodeableConcept.coding = $LOINC#LA6683-2 "Germline"

// Representative coding HGVS
* component[representative-coding-hgvs].code = $LOINC#48004-6 "DNA change (c.HGVS)"
* component[representative-coding-hgvs].valueCodeableConcept.coding.system = "http://varnomen.hgvs.org"
* component[representative-coding-hgvs].valueCodeableConcept.coding.code = #NM_024675.4:c.509_510del
* component[representative-coding-hgvs].valueCodeableConcept.coding.display = "PALB2 c.509_510del"

// Representative protein HGVS
* component[representative-protein-hgvs].code = $LOINC#48005-3 "Amino acid change (p.HGVS)"
* component[representative-protein-hgvs].valueCodeableConcept.coding.system = "http://varnomen.hgvs.org"
* component[representative-protein-hgvs].valueCodeableConcept.coding.code = #NP_079541.2:p.(Arg170Ilefs*14)
* component[representative-protein-hgvs].valueCodeableConcept.coding.display = "PALB2 p.(Arg170Ilefs*14)"
