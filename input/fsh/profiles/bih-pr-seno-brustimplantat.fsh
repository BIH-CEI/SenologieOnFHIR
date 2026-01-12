Profile: Senologie_Implantat
Parent: Device
Id: senologie-implantat
Title: "BIH LM Senologie Brustimplantat"


Description: "Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie"
* insert PR_CS_VS_Version
* ^status = #draft



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