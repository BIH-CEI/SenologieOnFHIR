# Kerndatensatz Senologie

Willkommen beim Implementation Guide für den **Kerndatensatz Senologie**.

Dieser Kerndatensatz definiert FHIR-Profile für die strukturierte Dokumentation der **Brustkrebsversorgung** an zertifizierten Brustzentren und darüber hinaus. Er wird gemeinsam mit dem Brustzentrum der Charité – Universitätsmedizin Berlin entwickelt und vom Berlin Institute of Health (BIH) herausgegeben.

### Zielsetzung

Das Modul verfolgt drei Ziele:

1. **Standardisierte Erfassung** klinischer Daten entlang des Versorgungspfads Mammakarzinom — von der Erstvorstellung über Diagnostik, Therapie und Nachsorge
2. **Interoperabler Datenaustausch** zwischen klinischen Systemen, Krebsregistern und Forschungsdatenbanken auf Basis von HL7 FHIR
3. **Sekundärnutzung** der Versorgungsdaten für Qualitätssicherung, Versorgungsforschung und klinische Studien

### Klinischer Versorgungspfad

Das Modul bildet den gesamten klinischen Workflow der Senologie ab:

<div>
<img src="senologie-ressourcenmodell.png" alt="FHIR Ressourcenmodell Senologie" style="width:100%"/>
<p><em>FHIR Ressourcenmodell Senologie — Klinischer Versorgungspfad Mammakarzinom</em></p>
</div>

### Einordnung in die MII

Der Kerndatensatz nutzt bestehende MII-Kerndatensatzprofile als technische Basis, ist aber ein eigenständiger Datensatz — kein MII-Modul. Er orientiert sich an den Anforderungen der [Deutschen Gesellschaft für Senologie (DGS)](https://www.senologie.org/) und der S3-Leitlinie Mammakarzinom.

<div style="margin: 1em 0;">
<a href="https://www.senologie.org/"><img src="dgs-logo.png" alt="Deutsche Gesellschaft für Senologie" style="height:60px"/></a>
</div>

### Technische Abhängigkeiten

| Abhängigkeit | Verwendung |
|---|---|
| [MII Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie) | Diagnose, Operation, Systemtherapie, Strahlentherapie |
| [MII Pathologie](https://simplifier.net/medizininformatikinitiative-modulpathologie) | Pathologiebefund, Präparat |
| [MII Bildgebung](https://simplifier.net/medizininformatikinitiative-modulbildgebung) | Tumorlokalisation (BodyStructure) |
| [ISiK 5.0](https://simplifier.net/isik) | Basisprofil-Kompatibilität |
| [HL7 SDC](http://hl7.org/fhir/uv/sdc/) | Formularbasierte Datenerfassung |

### Leitlinien und Standards

Die Profilierung orientiert sich an:

- **S3-Leitlinie Mammakarzinom** (AWMF 032-045OL) — [Leitlinien-Annotation](s3-kap-3-allgemeines.html)
- **Onkologischer Basisdatensatz (oBDS)** — Krebsregistermeldungen
- **DKG-Zertifizierungskriterien** für Brustzentren

### Designprinzip: Formular-First

Die Datenerfassung erfolgt über **SDC-Questionnaires**, die sich am klinischen Workflow orientieren. Im Hintergrund werden die Formulardaten über Definition-based Extraction in domänenbasierte FHIR-Ressourcen überführt — aus einer Operationsdokumentation entstehen so einzelne Prozeduren, Implantate und Komplikationen. Siehe [Erfassung](anwendungsfaelle-erfassung.html).

### Übersicht

- [Datenmodell](datenmodell.html) — Logisches Modell und FHIR-Mapping
- [Profile](profilbeschreibungen.html) — Alle FHIR-Profile im Detail
- [Anwendungsfälle](anwendungsfaelle-uebersicht.html) — Erfassung, Austausch, Auswertung, Meldedatensätze
- [Terminologie](terminologie-medikation.html) — Medikamenten-Terminologie
- [Artifacts](artifacts.html) — Alle FHIR-Artefakte
