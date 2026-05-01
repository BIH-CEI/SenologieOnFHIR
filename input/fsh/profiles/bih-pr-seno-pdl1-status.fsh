Alias: $MII_PR_MTB_IHC_PDL1 = https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/StructureDefinition/mii-pr-mtb-immunohistochemistry-pdl1

Profile: Senologie_PDL1_Status
Parent: MII_PR_MTB_Immunohistochemistry_PDL1
Id: senologie-pdl1-status
Title: "BIH Senologie PD-L1 Status"
Description: "PD-L1 Immunhistochemie-Befund für Mamma-Karzinom. Erbt TPS, CPS, ICS und TC-Score Slices vom MII MTB PD-L1 Profil. Klinisch relevant bei TNBC (Pembrolizumab-Indikation bei CPS >= 10, KEYNOTE-522)."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS

* code MS
* code.text ^short = "PD-L1 Immunhistochemie"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der IHC-Untersuchung"

* method MS
* method ^short = "IHC-Klon / Assay (z.B. SP142, 22C3, SP263)"
* method ^comment = "Der verwendete Antikörperklon ist klinisch relevant: SP142 (Ventana) für Atezolizumab, 22C3 (Dako) für Pembrolizumab, SP263 (Ventana) für Durvalumab."

* specimen ^short = "Pathologisches Präparat (Stanzbiopsie / OP-Resektat)"

// CPS ist der primäre Score für Mammakarzinom (KEYNOTE-522)
* component[cps-score] MS
* component[cps-score] ^short = "Combined Positive Score (CPS)"
* component[cps-score] ^comment = "Primärer Score für Pembrolizumab-Indikation bei TNBC. CPS >= 10 ist Schwellenwert (KEYNOTE-522)."

// TPS sekundär relevant
* component[tps-score] ^short = "Tumor Proportion Score (TPS)"

// ICS für Atezolizumab (IMpassion130)
* component[ics-score] ^short = "Immune Cell Score (ICS)"
* component[ics-score] ^comment = "Relevant für Atezolizumab-Indikation (IMpassion130). IC >= 1% ist Schwellenwert."
