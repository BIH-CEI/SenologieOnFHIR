Alias: $NCIT = https://nih-ncpi.github.io/ncpi-fhir-ig/CodeSystem-ncit.html

// ===========================================================================
// PD-L1 Status Beispiele für TNBC-Fälle
// ===========================================================================

// Fall 2: Lena Hoffmann — TNBC metastasiert, CPS 15 (Pembrolizumab-Indikation)
Instance: Fall2-PDL1-Status
InstanceOf: Senologie_PDL1_Status
Title: "Fall 2: PD-L1 Status — CPS 15, positiv (22C3)"
Description: "PD-L1 IHC bei TNBC: CPS 15 (≥10 → Pembrolizumab-Indikation per KEYNOTE-522)"
Usage: #example

* status = #final
* code.coding[generisch] = $SCT#1234806008 "Observation using immunohistochemistry (observable entity)"
* code.text = "PD-L1 Immunhistochemie"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-18"
* method.text = "PD-L1 IHC 22C3 pharmDx (Dako/Agilent)"

* component[cps-score].code = $NCIT#C176582 "PD-L1 Combined Positive Score"
* component[cps-score].valueQuantity = 15 '{score}' "score"
* component[cps-score].interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#POS "Positive"

* component[tps-score].code = $NCIT#C184941 "PD-L1 Tumor Proportion Score"
* component[tps-score].valueQuantity = 10 '%' "%"


// Fall 7: Kathrin Mueller — TNBC kurativ, CPS 2 (negativ)
Instance: Fall7-PDL1-Status
InstanceOf: Senologie_PDL1_Status
Title: "Fall 7: PD-L1 Status — CPS 2, negativ (22C3)"
Description: "PD-L1 IHC bei TNBC: CPS 2 (<10 → kein Pembrolizumab)"
Usage: #example

* status = #final
* code.coding[generisch] = $SCT#1234806008 "Observation using immunohistochemistry (observable entity)"
* code.text = "PD-L1 Immunhistochemie"
* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* effectiveDateTime = "2025-04-10"
* method.text = "PD-L1 IHC 22C3 pharmDx (Dako/Agilent)"

* component[cps-score].code = $NCIT#C176582 "PD-L1 Combined Positive Score"
* component[cps-score].valueQuantity = 2 '{score}' "score"
* component[cps-score].interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#NEG "Negative"

* component[tps-score].code = $NCIT#C184941 "PD-L1 Tumor Proportion Score"
* component[tps-score].valueQuantity = 1 '%' "%"


// Fall 10: Christina Becker — BRCA1+TNBC, CPS 25 (stark positiv)
Instance: Fall10-PDL1-Status
InstanceOf: Senologie_PDL1_Status
Title: "Fall 10: PD-L1 Status — CPS 25, positiv (SP142)"
Description: "PD-L1 IHC bei TNBC + BRCA1: CPS 25, IC 5% (Atezolizumab-Indikation per IMpassion130)"
Usage: #example

* status = #final
* code.coding[generisch] = $SCT#1234806008 "Observation using immunohistochemistry (observable entity)"
* code.text = "PD-L1 Immunhistochemie"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-06-05"
* method.text = "PD-L1 IHC SP142 (Ventana/Roche)"

* component[cps-score].code = $NCIT#C176582 "PD-L1 Combined Positive Score"
* component[cps-score].valueQuantity = 25 '{score}' "score"
* component[cps-score].interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#POS "Positive"

* component[ics-score].code = $NCIT#C199175 "Cells.programmed cell death ligand 1/Viable tumor cells in Tissue by Immune stain"
* component[ics-score].valueQuantity = 5 '%' "%"
* component[ics-score].interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#POS "Positive"
