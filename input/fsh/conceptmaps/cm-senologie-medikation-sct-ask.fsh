Instance: CM-Senologie-Medikation-SCT-ASK
InstanceOf: ConceptMap
Title: "ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie)"
Description: "Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf Arzneistoffkatalog (ASK, BfArM 2026). Validiert über fhir-terminology MCP Server."
Usage: #definition

* status = #draft
* version = "0.1.0"
* date = "2026-03-14"
* publisher = "Berlin Institute of Health at Charité (BIH)"

* sourceUri = "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation"
// targetUri omitted — no corresponding ASK ValueSet available; group.target references the CodeSystem

* group[+]
  * source = "http://snomed.info/sct"
  * target = "http://fhir.de/CodeSystem/ask"

  // CDK4/6-Inhibitoren
  * element[+]
    * code = #715958001
    * display = "Palbociclib"
    * target[+]
      * code = #37539
      * display = "Palbociclib"
      * equivalence = #equivalent

  * element[+]
    * code = #732257004
    * display = "Ribociclib"
    * target[+]
      * code = #41432
      * display = "Ribociclib"
      * equivalence = #equivalent

  * element[+]
    * code = #761851004
    * display = "Abemaciclib"
    * target[+]
      * code = #41207
      * display = "Abemaciclib"
      * equivalence = #equivalent

  // Antimetabolite
  * element[+]
    * code = #387381009
    * display = "Methotrexate"
    * target[+]
      * code = #00658
      * display = "Methotrexat"
      * equivalence = #equivalent

  * element[+]
    * code = #387172005
    * display = "Fluorouracil"
    * target[+]
      * code = #07374
      * display = "Fluorouracil"
      * equivalence = #equivalent

  * element[+]
    * code = #386920008
    * display = "Gemcitabine"
    * target[+]
      * code = #26094
      * display = "Gemcitabin"
      * equivalence = #equivalent

  * element[+]
    * code = #386906001
    * display = "Capecitabine"
    * target[+]
      * code = #28663
      * display = "Capecitabin"
      * equivalence = #equivalent

  // Anthracycline
  * element[+]
    * code = #372817009
    * display = "Doxorubicin"
    * target[+]
      * code = #06459
      * display = "Doxorubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #772118008
    * display = "Doxorubicin hydrochloride pegylated liposome"
    * target[+]
      * code = #06459
      * display = "Doxorubicin"
      * equivalence = #wider
      * comment = "ASK codiert auf Wirkstoffebene, nicht auf Darreichungsform-Ebene. Peg. lipo. Doxorubicin hat keinen eigenen ASK-Code."

  * element[+]
    * code = #372715008
    * display = "Daunorubicin"
    * target[+]
      * code = #07162
      * display = "Daunorubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #417916005
    * display = "Epirubicin"
    * target[+]
      * code = #22965
      * display = "Epirubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #372539000
    * display = "Idarubicin"
    * target[+]
      * code = #22865
      * display = "Idarubicin"
      * equivalence = #equivalent

  * element[+]
    * code = #386913001
    * display = "Mitoxantrone"
    * target[+]
      * code = #23189
      * display = "Mitoxantron"
      * equivalence = #equivalent

  // Taxane
  * element[+]
    * code = #386918005
    * display = "Docetaxel"
    * target[+]
      * code = #26819
      * display = "Docetaxel"
      * equivalence = #equivalent

  // Platinverbindungen
  * element[+]
    * code = #387318005
    * display = "Cisplatin"
    * target[+]
      * code = #15579
      * display = "Cisplatin"
      * equivalence = #equivalent

  * element[+]
    * code = #386905002
    * display = "Carboplatin"
    * target[+]
      * code = #23168
      * display = "Carboplatin"
      * equivalence = #equivalent

  // Alkylanzien
  * element[+]
    * code = #387420009
    * display = "Cyclophosphamide"
    * target[+]
      * code = #00533
      * display = "Cyclophosphamid"
      * equivalence = #equivalent

  // Sonstige Antineoplastika
  * element[+]
    * code = #387331000
    * display = "Mitomycin"
    * target[+]
      * code = #07643
      * display = "Mitomycin"
      * equivalence = #equivalent

  * element[+]
    * code = #708166000
    * display = "Eribulin"
    * target[+]
      * code = #34925
      * display = "Eribulin"
      * equivalence = #equivalent
