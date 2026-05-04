# Roadmap & Zukünftige Entwicklungen

Die folgenden Themen sind für zukünftige Versionen des Kerndatensatz Senologie vorgesehen.

## ISiK Stufe 6 Integration

Mit der Veröffentlichung von ISiK Stufe 6 wird eine tiefere Integration der Senologie-Profile mit den ISiK-Basisprofilen angestrebt. Dies umfasst insbesondere die Anbindung an das ISiK-Formularmodul für patienten- und personalbefüllte Fragebögen sowie die Nutzung der ISiK-Profile für Patientenstammdaten und Fallzuordnung.

## Patient-Reported Outcomes (PROMs)

Die Integration von PROMs ist ein zentrales Thema für die Weiterentwicklung. Vorarbeiten aus dem MII-PRO Modul bieten die Grundlage, Daten als QuestionnaireResponses und Observations gegen öffentliche Definitionen zu validieren. Relevante Instrumente für die Senologie sind insbesondere:

- **EORTC QLQ-C30** (allgemeine Lebensqualität)
- **EORTC QLQ-BR23 / BR45 / BR42** (brustkrebsspezifische Lebensqualität)
- **PRO-CTCAE** (patientenberichtete Nebenwirkungen)

Von Seiten der DKG wird derzeit an einer PRO-Umsetzung für das Onkologische Basisscreening gearbeitet.

## Implantatregister

Die FHIR-Anbindung des Brustimplantatregisters (IRegG) ist durch die Gesundheitsstrategie angekündigt. Das bestehende Logical Model (ireg-brustimplantat-meldung) und die StructureMaps für die IRegG-Transformation bilden die Grundlage für eine zukünftige direkte FHIR-basierte Meldung.

## Krebsregistrierung über FHIR

Die bestehenden StructureMaps für oBDS und OncoBox demonstrieren die Transformation von FHIR in proprietäre Meldeformate. Perspektivisch könnten Krebsregistermeldungen direkt als FHIR-Bundles übermittelt werden — vorausgesetzt, die Empfängerseite unterstützt FHIR als Eingangsformat.

## IPS-Konformität

Die Sicherstellung der Kompatibilität mit dem International Patient Summary (IPS) ermöglicht die Versorgung internationaler Patientinnen. Ziel ist, dass aus den Senologie-Daten automatisch ein IPS-konformer Patientenkurzbrief generiert werden kann — relevant für den European Health Data Space (EHDS) und grenzüberschreitende Behandlungen.

## MII Onkologie: Axilläre Eingriffe

Die axilläre Chirurgie (Sentinel-Lymphknoten-Biopsie, Axilla-Dissektion) ist derzeit nicht über das MII Onkologie-Modul abbildbar. Eine entsprechende Erweiterung wurde als Feature aufgenommen und soll in zukünftigen Versionen des MII KDS verfügbar sein.

## CQL-basierte Qualitätsindikatoren

Die formale Definition der DKG-Kennzahlen (KB-1 bis KB-20) und deskriptiver Statistiken als CQL Measures für automatisierte Auswertung. Dies würde eine Echtzeit-Qualitätssicherung auf Basis der FHIR-Daten ermöglichen.

## Leitlinien-Annotation

Mittelfristig ist die systematische Annotation von Leitlinieninhalten geplant — die Zuordnung von Empfehlungen der S3-Leitlinie Mammakarzinom zu den konkreten Datenelementen des Datenmodells. Dies schafft die Grundlage für Computable Clinical Guidelines und automatisierte Leitlinien-Adhärenz-Prüfungen.

## Synthetische Testkohorte

Regelbasiert generierte Testdaten (100 Patientinnen mit Variation von Subtypen, Stadien und Therapien) als Docker-Container für SQL on FHIR und CQL-Auswertungen.
