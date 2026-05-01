Profile: Senologie_Nebenwirkung
Parent: MII_PR_Onko_Nebenwirkung_Adverse_Event
Id: senologie-nebenwirkung
Title: "BIH Senologie Nebenwirkung"
Description: "AdverseEvent für CTCAE-Nebenwirkungsgrading unter Systemtherapie. Erbt MedDRA-Kodierung und CTCAE-Grad von MII Onko Nebenwirkung."

* insert PR_CS_VS_Version
* ^status = #draft

// Inherited from MII parent (MS flags for Senologie):
* actuality MS
* actuality = #actual (exactly)

* event MS
* event ^short = "Nebenwirkungsart (MedDRA)"

* subject MS
* subject ^short = "Betroffene/r Patient/in"

* date MS
* date ^short = "Zeitpunkt der Bewertung"

* seriousness MS
* seriousness ^short = "CTCAE-Grad (1-5, U, K)"

* suspectEntity MS
* suspectEntity ^short = "Auslösende Therapie"
* suspectEntity.instance MS
* suspectEntity.instance ^short = "Referenz auf auslösende Systemtherapie-Procedure"
