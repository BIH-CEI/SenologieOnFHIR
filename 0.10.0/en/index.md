# Home - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ImplementationGuide/kds-senologie | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:SenologieKDS |

 There is no translation page available for the current page, so it has been rendered in the default language 

### Kerndatensatz Senologie

> **English:** For international readers there is an [English summary](english-summary.md) of this guide.

Der **Kerndatensatz Senologie** definiert FHIR-Profile für die strukturierte Dokumentation der Brustkrebsversorgung an zertifizierten Brustzentren und darüber hinaus. Er umfasst den gesamten Versorgungspfad von der Erstvorstellung über Diagnostik, Therapie und Nachsorge bis zur Verlaufsdokumentation.

![](dgs-logo.png)

#### Für wen ist dieser IG?

| | | |
| :--- | :--- | :--- |
| **Kliniker:innen** | Welche Daten werden erfasst, welche Terminologien werden verwendet | [Datenmodell](datenmodell.md),[Testpatientinnen](testpatientinnen.md) |
| **IT / Entwickler:innen** | FHIR-Profile, Questionnaires, Extraktion, technische Schnittstellen | [Profile](profilbeschreibungen.md),[Artifacts](artifacts.md) |
| **Qualitätssicherung** | Ableitung von Meldedatensätzen (oBDS, IQTIG, OncoBox, IRegG) | [Anwendungsfälle](anwendungsfaelle-uebersicht.md) |
| **Forschende** | Sekundärnutzung, Terminologien, Interoperabilität | [Terminologie](terminologie-uebersicht.md),[Datenmodell](datenmodell.md) |

#### Versorgungspfad

Der Datensatz bildet den klinischen Workflow der Senologie in folgenden Bereichen ab:

| | | |
| :--- | :--- | :--- |
| **Diagnose** | Erstdiagnose, Rezidiv, Staging (cTNM), Seitenlokalisation | [Diagnose](StructureDefinition-senologie-diagnose-maligne.md) |
| **Diagnostik** | Bildgebung (Mammografie, Sono, MRT), Pathologie, Biomarker | [Bildgebung](StructureDefinition-senologie-bildgebung-befund.md),[Pathologie](StructureDefinition-senologie-pathologie-befund.md) |
| **Therapie** | Operation, Systemtherapie, Strahlentherapie | [Operation](StructureDefinition-senologie-operation.md),[Systemtherapie](StructureDefinition-senologie-systemtherapie-procedure.md) |
| **Tumorkonferenz** | Therapieempfehlungen, Fachdisziplinen | [Tumorboard](StructureDefinition-senologie-tumorboard-empfehlung.md) |
| **Nachsorge** | Verlauf, Vitalstatus, Rezidivmonitoring | [Follow-Up](StructureDefinition-senologie-follow-up.md) |

Das detaillierte FHIR-Ressourcenmodell finden Sie unter [Datenmodell](datenmodell.md).

#### Zielsetzung

1. **Standardisierte Erfassung**klinischer Daten entlang des Versorgungspfads Mammakarzinom
1. **Interoperabler Datenaustausch**zwischen klinischen Systemen, Krebsregistern und Forschungsdatenbanken auf Basis von HL7 FHIR
1. **Sekundärnutzung**der Versorgungsdaten für Qualitätssicherung, Versorgungsforschung und klinische Studien

#### Einordnung

Der Kerndatensatz nutzt bestehende MII-Kerndatensatzprofile als technische Basis, ist aber ein eigenständiger Datensatz – kein MII-Modul. Die technische Umsetzung erfolgt durch das **Berlin Institute of Health at Charité (BIH)**, die inhaltliche Abstimmung mit der **[Deutschen Gesellschaft für Senologie (DGS)](https://www.senologie.org/)**, der **[Deutschen Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)](https://www.dggg.de/)** und der **[Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)](https://www.ago-online.de/)**.

#### Designprinzip: Formular-First

Die Datenerfassung erfolgt über **SDC-Questionnaires**, die sich am klinischen Workflow orientieren. Im Hintergrund werden die Formulardaten über Template-based Extraction in FHIR-Ressourcen überführt. Siehe [Erfassung](anwendungsfaelle-erfassung.md).

#### Abhängigkeiten

* Technisch (FHIR-Pakete): [MII Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie)
  * ?: Diagnose, Operation, Systemtherapie, Strahlentherapie
* Technisch (FHIR-Pakete): [MII Pathologie](https://simplifier.net/medizininformatikinitiative-modulpathologie)
  * ?: Pathologiebefund, Präparat
* Technisch (FHIR-Pakete): [MII Bildgebung](https://simplifier.net/medizininformatikinitiative-modulbildgebung)
  * ?: Tumorlokalisation (BodyStructure)
* Technisch (FHIR-Pakete): [ISiK](https://simplifier.net/isik)
  * ?: Basisprofil-Kompatibilität
* Technisch (FHIR-Pakete): [HL7 SDC](http://hl7.org/fhir/uv/sdc/)
  * ?: Formularbasierte Datenerfassung
* Technisch (FHIR-Pakete): Inhaltlich (Standards & Leitlinien)
* Technisch (FHIR-Pakete): **S3-Leitlinie Mammakarzinom**
  * ?: Klinische Empfehlungen (AWMF 032-045OL)
* Technisch (FHIR-Pakete): **oBDS**
  * ?: Onkologischer Basisdatensatz (Krebsregistermeldungen)
* Technisch (FHIR-Pakete): **IQTIG QS 18/1**
  * ?: Externe stationäre Qualitätssicherung Mammachirurgie
* Technisch (FHIR-Pakete): **DKG-Zertifizierung**
  * ?: Qualitätsindikatoren Brustzentren (OncoBox)
* Technisch (FHIR-Pakete): **IRegG**
  * ?: Implantateregister-Meldepflicht

#### Übersicht

* [Datenmodell](datenmodell.md) – Logisches Modell, Ressourcenmodell und FHIR-Mapping
* [Profile](profilbeschreibungen.md) – Alle FHIR-Profile im Detail
* [Testpatientinnen](testpatientinnen.md) – Zwei durchgängige Beispielfälle (kurativ + palliativ)
* [Anwendungsfälle](anwendungsfaelle-uebersicht.md) – Erfassung, Austausch, Auswertung, Meldedatensätze
* [Terminologie](terminologie-uebersicht.md) – ValueSets, CodeSystems, ConceptMaps
* [Offene Fragen](offene-fragen.md) – Ballot-Fragen zur Kommentierung
* [Artifacts](artifacts.md) – Alle FHIR-Artefakte

#### Geplante Weiterentwicklungen

* **Implantateregister-Meldung (IRegG)** – StructureMaps für automatische Ableitung von Implantateregisterdaten
* **CQL-basierte Qualitätsindikatoren** – Formale Definition der DKG-Kennzahlen als [CQL](http://cql.hl7.org/) Measures
* **Synthetische Testkohorte** – Regelbasiert generierte Testdaten (100 Patientinnen) für SQL on FHIR und CQL
* **PRO-Integration** – PRO-CTCAE und EORTC QLQ-BR23/BR45/BR42 für Patientinnenbefragungen

