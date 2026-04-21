Instance: CM-Senologie-Medikation-SCT-ATC
InstanceOf: ConceptMap
Title: "ConceptMap: SNOMED CT → ATC (Senologie Systemtherapie)"
Description: "Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf ATC (BfArM 2026). Validiert über fhir-terminology MCP Server gegen lokale Snowstorm- und ATC-Instanz."
Usage: #definition

* status = #draft
* version = "0.1.0"
* date = "2026-03-14"
* publisher = "Berlin Institute of Health at Charité (BIH)"

* sourceUri = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"
// targetUri omitted — no corresponding ATC ValueSet available; group.target references the CodeSystem

* group[+]
  * source = "http://snomed.info/sct"
  * target = "http://fhir.de/CodeSystem/bfarm/atc"

  // CDK4/6-Inhibitoren
  * element[+]
    * code = #715958001
    * display = "Palbociclib"
    * target[+]
      * code = #L01EF01
      * display = "Palbociclib"
      * equivalence = #equivalent

  * element[+]
    * code = #732257004
    * display = "Ribociclib"
    * target[+]
      * code = #L01EF02
      * display = "Ribociclib"
      * equivalence = #equivalent

  * element[+]
    * code = #761851004
    * display = "Abemaciclib"
    * target[+]
      * code = #L01EF03
      * display = "Abemaciclib"
      * equivalence = #equivalent

  // Antimetabolite
  * element[+]
    * code = #387381009
    * display = "Methotrexate"
    * target[+]
      * code = #L01BA01
      * display = "Methotrexat"
      * equivalence = #equivalent

  * element[+]
    * code = #387172005
    * display = "Fluorouracil"
    * target[+]
      * code = #L01BC02
      * display = "Fluorouracil"
      * equivalence = #equivalent

  * element[+]
    * code = #386920008
    * display = "Gemcitabine"
    * target[+]
      * code = #L01BC05
      * display = "Gemcitabin"
      * equivalence = #equivalent

  * element[+]
    * code = #386906001
    * display = "Capecitabine"
    * target[+]
      * code = #L01BC06
      * display = "Capecitabin"
      * equivalence = #equivalent

  // Anthracycline
  * element[+]
    * code = #372817009
    * display = "Doxorubicin"
    * target[+]
      * code = #L01DB01
      * display = "Doxorubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #772118008
    * display = "Doxorubicin hydrochloride pegylated liposome"
    * target[+]
      * code = #L01DB01
      * display = "Doxorubicin"
      * equivalence = #wider
      * comment = "ATC unterscheidet nicht zwischen konventionellem und pegyliert liposomalem Doxorubicin"

  * element[+]
    * code = #372715008
    * display = "Daunorubicin"
    * target[+]
      * code = #L01DB02
      * display = "Daunorubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #417916005
    * display = "Epirubicin"
    * target[+]
      * code = #L01DB03
      * display = "Epirubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #372539000
    * display = "Idarubicin"
    * target[+]
      * code = #L01DB06
      * display = "Idarubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #386913001
    * display = "Mitoxantrone"
    * target[+]
      * code = #L01DB07
      * display = "Mitoxantron"
      * equivalence = #equivalent

  // Taxane
  * element[+]
    * code = #386918005
    * display = "Docetaxel"
    * target[+]
      * code = #L01CD02
      * display = "Docetaxel"
      * equivalence = #equivalent

  // Platinverbindungen
  * element[+]
    * code = #387318005
    * display = "Cisplatin"
    * target[+]
      * code = #L01XA01
      * display = "Cisplatin"
      * equivalence = #equivalent

  * element[+]
    * code = #386905002
    * display = "Carboplatin"
    * target[+]
      * code = #L01XA02
      * display = "Carboplatin"
      * equivalence = #equivalent

  // Alkylanzien
  * element[+]
    * code = #387420009
    * display = "Cyclophosphamide"
    * target[+]
      * code = #L01AA01
      * display = "Cyclophosphamid"
      * equivalence = #equivalent

  // Sonstige Antineoplastika
  * element[+]
    * code = #387331000
    * display = "Mitomycin"
    * target[+]
      * code = #L01DC03
      * display = "Mitomycin"
      * equivalence = #equivalent

  * element[+]
    * code = #708166000
    * display = "Eribulin"
    * target[+]
      * code = #L01XX41
      * display = "Eribulin"
      * equivalence = #equivalent
