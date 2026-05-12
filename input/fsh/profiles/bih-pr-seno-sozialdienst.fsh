Profile: Senologie_Sozialdienst
Parent: Procedure
Id: senologie-sozialdienst
Title: "BIH Senologie Sozialdienst-Kontakt"
Description: "Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Sozialdienst"
* ^mapping[=].name = "LM-Element: Sozialdienst"

* status MS
* status ^short = "Durchgeführt oder nicht durchgeführt"
* status ^comment = "completed = Kontakt stattgefunden (L02=ja), not-done = nicht stattgefunden (L02=nein)"

* code MS
* code = $SCT#310134006 "Social services"
* code ^short = "Sozialdienst-Beratung"

* subject MS
* subject only Reference(Patient)

* performed[x] only dateTime
* performedDateTime MS
* performedDateTime ^short = "Datum des Sozialdienst-Kontakts"
