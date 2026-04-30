Profile: Senologie_Ki67_Proliferationsindex
Parent: Observation
Id: senologie-ki67-proliferationsindex
Title: "BIH Senologie Ki-67 Proliferationsindex"
Description: "Observation fuer den Ki-67 Proliferationsindex (immunhistochemisch) aus dem pathologischen Befund. OncoBox: Ki67_Prozent."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)

* code MS
* code.coding MS
* code.coding = $LOINC#29593-1 "Ki-67 Ag [Mass/volume] in Tissue by Immune stain"
* code ^short = "Ki-67 Proliferationsindex"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Bestimmung"

* valueQuantity MS
* valueQuantity ^short = "Ki-67 Proliferationsindex (%)"
* valueQuantity.value MS
* valueQuantity.unit = "%" (exactly)
* valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* valueQuantity.code = #% (exactly)

* specimen MS
* specimen ^short = "Untersuchtes Praeparat"
