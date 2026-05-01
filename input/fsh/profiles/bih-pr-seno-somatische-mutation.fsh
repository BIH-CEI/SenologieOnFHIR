Profile: Senologie_Somatische_Mutation
Parent: MII_PR_Onko_Genetische_Variante
Id: senologie-somatische-mutation
Title: "BIH Senologie Somatische Mutation"
Description: "Somatischer Mutationsstatus für BRCA1, BRCA2 und PALB2 im Tumorgewebe. Erbt Gen-Kodierung und Ausprägung von MII Onko Genetische Variante."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status ^short = "Untersuchungsstatus"

* category MS

* code MS
* code ^short = "Genetische Variante (LOINC 69548-6)"

* subject MS
* subject ^short = "Patient/in"

* effectiveDateTime MS
* effectiveDateTime ^short = "Zeitpunkt der Bestimmung"

* interpretation MS
* interpretation ^short = "Ausprägung (M=Mutation, W=Wildtyp, N=nicht bestimmbar, U=unbekannt)"

* component[gene-studied] MS
* component[gene-studied] ^short = "Untersuchtes Gen (BRCA1/BRCA2/PALB2)"

* specimen MS
* specimen ^short = "Tumorprobe"
