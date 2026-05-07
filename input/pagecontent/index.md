# Kerndatensatz Senologie

Der **Kerndatensatz Senologie** definiert FHIR-Profile für die strukturierte Dokumentation der Brustkrebsversorgung an zertifizierten Brustzentren und darüber hinaus. Er umfasst den gesamten Versorgungspfad von der Erstvorstellung über Diagnostik, Therapie und Nachsorge bis zur Verlaufsdokumentation.

<div style="margin: 1.5em 0;">
<img src="versorgungspfad-uebersicht.svg" alt="Versorgungspfad Senologie: Diagnose, Tumorkonferenz, Therapie, Nachsorge" style="width:100%; max-width:900px;"/>
</div>

<div style="margin: 1em 0;">
<a href="https://www.senologie.org/"><img src="dgs-logo.png" alt="Deutsche Gesellschaft für Senologie" style="height:60px"/></a>
</div>

### Für wen ist dieser IG?

| Zielgruppe | Was finde ich hier? | Einstieg |
|---|---|---|
| **Kliniker:innen** | Welche Daten werden erfasst, welche Terminologien werden verwendet | [Datenmodell](datenmodell.html), [Testpatientinnen](testpatientinnen.html) |
| **IT / Entwickler:innen** | FHIR-Profile, Questionnaires, Extraktion, technische Schnittstellen | [Profile](profilbeschreibungen.html), [Artifacts](artifacts.html) |
| **Qualitätssicherung** | Ableitung von Meldedatensätzen (oBDS, IQTIG, OncoBox, IRegG) | [Anwendungsfälle](anwendungsfaelle-uebersicht.html) |
| **Forschende** | Sekundärnutzung, Terminologien, Interoperabilität | [Terminologie](terminologie-uebersicht.html), [Datenmodell](datenmodell.html) |

### Versorgungspfad

Der Datensatz bildet den klinischen Workflow der Senologie in folgenden Bereichen ab:

| Bereich | Beschreibung | Profile |
|---|---|---|
| **Diagnose** | Erstdiagnose, Rezidiv, Staging (cTNM), Seitenlokalisation | [Diagnose](StructureDefinition-senologie-diagnose-maligne.html) |
| **Diagnostik** | Bildgebung (Mammografie, Sono, MRT), Pathologie, Biomarker | [Bildgebung](StructureDefinition-senologie-bildgebung-befund.html), [Pathologie](StructureDefinition-senologie-pathologie-befund.html) |
| **Therapie** | Operation, Systemtherapie, Strahlentherapie | [Operation](StructureDefinition-senologie-operation.html), [Systemtherapie](StructureDefinition-senologie-systemtherapie-procedure.html) |
| **Tumorkonferenz** | Therapieempfehlungen, Fachdisziplinen | [Tumorboard](StructureDefinition-senologie-tumorboard-empfehlung.html) |
| **Nachsorge** | Verlauf, Vitalstatus, Rezidivmonitoring | [Follow-Up](StructureDefinition-senologie-follow-up.html) |

Das detaillierte FHIR-Ressourcenmodell finden Sie unter [Datenmodell](datenmodell.html).

### Zielsetzung

1. **Standardisierte Erfassung** klinischer Daten entlang des Versorgungspfads Mammakarzinom
2. **Interoperabler Datenaustausch** zwischen klinischen Systemen, Krebsregistern und Forschungsdatenbanken auf Basis von HL7 FHIR
3. **Sekundärnutzung** der Versorgungsdaten für Qualitätssicherung, Versorgungsforschung und klinische Studien

### Einordnung

Der Kerndatensatz nutzt bestehende MII-Kerndatensatzprofile als technische Basis, ist aber ein eigenständiger Datensatz -- kein MII-Modul. Die technische Umsetzung erfolgt durch das **Berlin Institute of Health at Charité (BIH)**, die inhaltliche Abstimmung mit der **[Deutschen Gesellschaft für Senologie (DGS)](https://www.senologie.org/)**, der **[Deutschen Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)](https://www.dggg.de/)** und der **[Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)](https://www.ago-online.de/)**.

### Designprinzip: Formular-First

Die Datenerfassung erfolgt über **SDC-Questionnaires**, die sich am klinischen Workflow orientieren. Im Hintergrund werden die Formulardaten über Template-based Extraction in FHIR-Ressourcen überführt. Siehe [Erfassung](anwendungsfaelle-erfassung.html).

### Abhängigkeiten

<table>
<tr><th colspan="2">Technisch (FHIR-Pakete)</th></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulonkologie">MII Onkologie</a></td><td>Diagnose, Operation, Systemtherapie, Strahlentherapie</td></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulpathologie">MII Pathologie</a></td><td>Pathologiebefund, Präparat</td></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulbildgebung">MII Bildgebung</a></td><td>Tumorlokalisation (BodyStructure)</td></tr>
<tr><td><a href="https://simplifier.net/isik">ISiK</a></td><td>Basisprofil-Kompatibilität</td></tr>
<tr><td><a href="http://hl7.org/fhir/uv/sdc/">HL7 SDC</a></td><td>Formularbasierte Datenerfassung</td></tr>
<tr><th colspan="2">Inhaltlich (Standards & Leitlinien)</th></tr>
<tr><td><strong>S3-Leitlinie Mammakarzinom</strong></td><td>Klinische Empfehlungen (AWMF 032-045OL)</td></tr>
<tr><td><strong>oBDS</strong></td><td>Onkologischer Basisdatensatz (Krebsregistermeldungen)</td></tr>
<tr><td><strong>IQTIG QS 18/1</strong></td><td>Externe stationäre Qualitätssicherung Mammachirurgie</td></tr>
<tr><td><strong>DKG-Zertifizierung</strong></td><td>Qualitätsindikatoren Brustzentren (OncoBox)</td></tr>
<tr><td><strong>IRegG</strong></td><td>Implantateregister-Meldepflicht</td></tr>
</table>

### Übersicht

- [Datenmodell](datenmodell.html) -- Logisches Modell, Ressourcenmodell und FHIR-Mapping
- [Profile](profilbeschreibungen.html) -- Alle FHIR-Profile im Detail
- [Testpatientinnen](testpatientinnen.html) -- Zwei durchgängige Beispielfälle (kurativ + palliativ)
- [Anwendungsfälle](anwendungsfaelle-uebersicht.html) -- Erfassung, Austausch, Auswertung, Meldedatensätze
- [Terminologie](terminologie-uebersicht.html) -- ValueSets, CodeSystems, ConceptMaps
- [Offene Fragen](offene-fragen.html) -- Ballot-Fragen zur Kommentierung
- [Artifacts](artifacts.html) -- Alle FHIR-Artefakte

### Geplante Weiterentwicklungen

- **Implantateregister-Meldung (IRegG)** -- StructureMaps für automatische Ableitung von Implantateregisterdaten
- **CQL-basierte Qualitätsindikatoren** -- Formale Definition der DKG-Kennzahlen als [CQL](http://cql.hl7.org/) Measures
- **Synthetische Testkohorte** -- Regelbasiert generierte Testdaten (100 Patientinnen) für SQL on FHIR und CQL
- **PRO-Integration** -- PRO-CTCAE und EORTC QLQ-BR23/BR45/BR42 für Patientinnenbefragungen
