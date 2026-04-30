Profile: Senologie_Ki67_Proliferationsindex
Parent: Observation
Id: senologie-ki67-proliferationsindex
Title: "BIH Senologie Ki-67 Proliferationsindex"
Description: "Ki-67-Proliferationsindex (%) aus immunhistochemischer Untersuchung. Kein MII-Onko-Profil vorhanden — senologiespezifisch, orientiert am MII ER/PR-Muster (LOINC-Code + valueQuantity %)."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossene Messung"

* code MS
* code.coding MS
* code.coding = $LOINC#29593-1 "Ki-67 [#/100 cells] in Tissue by Immune stain"
* code.coding ^short = "Ki-67-Proliferationsindex"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der immunhistochemischen Untersuchung"

* value[x] only Quantity
* valueQuantity MS
* valueQuantity ^short = "Ki-67 Index (%)"
* valueQuantity ^comment = "Anteil Ki-67-positiver Tumorzellen in Prozent"
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%

* specimen ^short = "Untersuchtes Praeparat"
