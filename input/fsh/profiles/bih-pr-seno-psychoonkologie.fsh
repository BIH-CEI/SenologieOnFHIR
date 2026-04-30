Profile: Senologie_Psychoonkologie
Parent: Procedure
Id: senologie-psychoonkologie
Title: "BIH Senologie Psychoonkologische Mitbetreuung"
Description: "Procedure fuer psychoonkologische Mitbetreuung (OncoBox KB-9). status=completed + performedDateTime zeigt 'erfolgt=ja' an, status=not-done zeigt 'erfolgt=nein' an."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status ^short = "Durchfuehrungsstatus"
* status ^comment = "completed = psychoonkologische Anbindung erfolgt (KB-9: 1=ja), not-done = nicht erfolgt (KB-9: 0=nein)"

* code MS
* code = $SCT#160967006 "Psychotherapy (procedure)"
* code ^short = "Psychoonkologische Mitbetreuung"

* subject MS
* subject only Reference(Patient)

* performedDateTime MS
* performedDateTime ^short = "Datum des ersten psychoonkologischen Kontakts"
* performedDateTime ^comment = "OncoBox: Psych_Datum. Nur bei status=completed relevant."

* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"
