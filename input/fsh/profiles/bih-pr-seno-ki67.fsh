Profile: Senologie_Ki67_Proliferationsindex
Parent: Observation
Id: senologie-ki67-proliferationsindex
Title: "BIH Senologie Ki-67 Proliferationsindex"
Description: "Observation fuer den Ki-67-Proliferationsindex (%). LOINC 29593-1. Wert als valueQuantity in Prozent."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* code MS
* code = $LOINC#29593-1 "Ki-67 proliferation index [Ratio] in Tissue by Immune stain"
* code.coding MS

* subject MS
* subject only Reference(Patient)

* value[x] only Quantity
* valueQuantity MS
* valueQuantity ^short = "Ki-67 Index in %"
* valueQuantity.value MS
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%

* specimen ^short = "Zugehoeriges Praeparat"
* note ^short = "Anmerkungen zum Ki-67-Befund"
