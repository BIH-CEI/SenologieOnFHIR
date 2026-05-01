Profile: Senologie_Sozialdienst
Parent: Procedure
Id: senologie-sozialdienst
Title: "BIH Senologie Sozialdienst-Kontakt"
Description: "Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status ^short = "Durchgeführt oder nicht durchgeführt"
* status ^comment = "completed = Kontakt stattgefunden (L02=ja), not-done = nicht stattgefunden (L02=nein)"

* code MS
* code = $SCT#410321003 "Social services intervention (procedure)"
* code ^short = "Sozialdienst-Beratung"

* subject MS
* subject only Reference(Patient)

* performed[x] only dateTime
* performedDateTime MS
* performedDateTime ^short = "Datum des Sozialdienst-Kontakts"
