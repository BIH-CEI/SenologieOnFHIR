Profile: Senologie_SystemischeTherapieMedikation
Parent: MII_PR_Onko_Systemische_Therapie_Medikation
Id: senologie-systemische-therapie-medikation
Title: "BIH LM Senologie Brust Systemische Therapie Medikation"
Description: "Systemische Therapien im Rahmen der BIH-Spezifikation des Moduls Senologie"
* insert PR_CS_VS_Version
* ^status = #draft

* medicationCodeableConcept MS
* medicationCodeableConcept ^short = "Medikament"

* medicationCodeableConcept.coding contains snomed 0..* 
* medicationCodeableConcept.coding[snomed] from vs-senologie-systemische-therapie-medikation
