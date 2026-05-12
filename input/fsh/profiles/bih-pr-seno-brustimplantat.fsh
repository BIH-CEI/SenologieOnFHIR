Profile: Senologie_Implantat
Parent: Device
Id: senologie-implantat
Title: "BIH LM Senologie Brustimplantat"


Description: "Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie"
* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Operation.Implantat"
* ^mapping[=].name = "LM-Element: Operation.Implantat"



* status MS // wegen IPS-Konformität
* type MS
* type ^short = "Art des Implantats"
 // entweder Brustimplantat
* manufacturer MS
* manufacturer ^short = "Hersteller des Implantats"
* manufacturer ^definition = "Hersteller des Implantats, hier als String und somit abweichend vom Auswahlfeld"

* lotNumber MS
* lotNumber ^short = "REF-Nummer des Implantats"
* serialNumber MS
* serialNumber ^short = "Seriennummer des Implantats"