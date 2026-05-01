// ============================================================
// Somatische Mutationen BRCA1/BRCA2/PALB2 (F16-F18)
// ============================================================

Alias: $HGNC = http://www.genenames.org/geneId
Alias: $MII_CS_Auspraegung = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-genetische-variante-auspraegung

// --- Fall 1: BRCA1 somat. Wildtyp ---
Instance: Fall1-Somatische-Mutation-BRCA1
InstanceOf: Senologie_Somatische_Mutation
Title: "Fall 1: BRCA1 somatisch — Wildtyp"
Description: "BRCA1 somatische Mutation nicht nachgewiesen (Wildtyp)"
Usage: #example

* status = #final
* code = $LOINC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-25"
* interpretation.coding = $MII_CS_Auspraegung#W "Wildtyp/nicht mutiert/ negativ"
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"


// --- Fall 1: BRCA2 somat. Wildtyp ---
Instance: Fall1-Somatische-Mutation-BRCA2
InstanceOf: Senologie_Somatische_Mutation
Title: "Fall 1: BRCA2 somatisch — Wildtyp"
Description: "BRCA2 somatische Mutation nicht nachgewiesen (Wildtyp)"
Usage: #example

* status = #final
* code = $LOINC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-25"
* interpretation.coding = $MII_CS_Auspraegung#W "Wildtyp/nicht mutiert/ negativ"
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1101 "BRCA2"


// --- Fall 1: PALB2 somat. Wildtyp ---
Instance: Fall1-Somatische-Mutation-PALB2
InstanceOf: Senologie_Somatische_Mutation
Title: "Fall 1: PALB2 somatisch — Wildtyp"
Description: "PALB2 somatische Mutation nicht nachgewiesen (Wildtyp)"
Usage: #example

* status = #final
* code = $LOINC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-25"
* interpretation.coding = $MII_CS_Auspraegung#W "Wildtyp/nicht mutiert/ negativ"
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:26144 "PALB2"


// --- Fall 5: BRCA1 somat. Mutation nachgewiesen ---
Instance: Fall5-Somatische-Mutation-BRCA1
InstanceOf: Senologie_Somatische_Mutation
Title: "Fall 5: BRCA1 somatisch — Mutation nachgewiesen"
Description: "BRCA1 somatische Mutation nachgewiesen im Tumorgewebe"
Usage: #example

* status = #final
* code = $LOINC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-02-01"
* interpretation.coding = $MII_CS_Auspraegung#M "Mutation/positiv"
* note.text = "BRCA1 somatische Mutation im Tumorgewebe nachgewiesen"
* component[gene-studied].code = $LOINC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:1100 "BRCA1"
