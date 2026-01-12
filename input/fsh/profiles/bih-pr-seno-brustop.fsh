Profile: Senologie_Operation
Parent: Procedure
Id: senologie-operation
Title: "BIH LM Senologie Brustwand-operation"


Description: "Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie"
* insert PR_CS_VS_Version
* ^status = #draft

* extension MS
// hier Slicing einfügen
// intention mit oBDS abgleichen
* extension.url = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/bih-pr-seno-brustop-intention"
* extension.valueCodeableConcept MS

* category MS
* category from vs-senologie-operation-art 
* category ^short = "Art der Operation"
* category ^definition = "Art der Operation Brust, Axillär, Lateralität"

// * Kodierung der Operation
* code MS 
// hier kann nur ein Code vergeben werden. Einzelne Prozeduren sind als einzelne FHIR-Procedures zu konvertieren. Ggfs. hier eine übergeordnete Prozedur anlegen, um Intent o.ä. nachzuhalten
* performed[x] MS
* performedDateTime MS
* subject MS 
* subject only Reference(Patient)
* bodySite
* complication MS 
* complication ^short = "Komplikation nach oBDS"
* complication ^slicing.discriminator.type = #value
* complication ^slicing.discriminator.path = "system"
* complication ^slicing.rules = #open
* complication ^slicing.description = "Slicing der Angabe nach Komplikation nach oBDS, IQTIQ oder ander "
* complication ^slicing.ordered = false
* complication contains oBDS 0..* and IQTIQ 0..* 
* complication[oBDS].coding MS
* complication[IQTIQ].coding MS


* outcome MS
* outcome ^short = "Outcome der Operation, v.a. bei Revision"


* reasonReference MS 
* reasonReference only Reference(Condition)


* followUp MS
* followUp ^slicing.discriminator.type = #value
* followUp ^slicing.discriminator.path = "system"
* followUp ^slicing.rules = #open
* followUp ^slicing.description = "Slicing of usedCode by system"
* followUp ^slicing.ordered = false

* followUp contains drainage 0..* and verband 0..* and antibiotika 0..* and mobilisation 0..* and laborkontrolle 0..*
* followUp[drainage].coding MS
* followUp[verband].coding MS
* followUp[antibiotika].coding MS
* followUp[mobilisation].coding MS
* followUp[laborkontrolle].coding MS

* usedCode MS
* usedCode ^slicing.discriminator.type = #value
* usedCode ^slicing.discriminator.path = "system"
* usedCode ^slicing.rules = #open

* usedCode contains praeoperativeMarkierung 0..1 and intraoperativesImagingBrust 0..1 and intraoperativesImagingPraeparat 0..1 and drainage 0..1 and drainageGekuerzt 0..1
* usedCode ^short = "Verwendete Codes"
* usedCode ^definition = "Verwendete Codes für die Operation, z.B. prätherapeutische Markierung durch Drähte"

// ggfs eine OP = mehrere Sub-Prozeduren