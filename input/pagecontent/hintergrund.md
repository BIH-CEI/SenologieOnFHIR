# Hintergrund & Motivation

## Ausgangslage

Zertifizierte Brustzentren dokumentieren die Versorgung ihrer Patientinnen für unterschiedliche Zwecke: die DKG-Zertifizierung (OnkoZert), die Krebsregistermeldung (oBDS), die gesetzliche Qualitätssicherung (IQTIG), das Implantatregister und die klinische Forschung. Obwohl sich die inhaltlichen Anforderungen dieser Meldewege weitgehend überschneiden, werden die Daten häufig redundant erfasst, in unterschiedlichen Formaten vorgehalten und separat ausgeleitet. Da die Datenanforderungen jeweils von den Empfängern her definiert werden, entsteht ein erheblicher Aufwand bei der Zuordnung und Transformation der klinischen Daten in die jeweiligen Zielformate. Hinzu kommen eigene und standortübergreifende Studien, die ihrerseits spezifische Datenanforderungen mitbringen. Die parallele Pflege all dieser Dokumentationsstränge führt zu Inkonsistenzen, Fehleranfälligkeit und einem Aufwand, der mit den verfügbaren Ressourcen kaum zu bewältigen ist.

## Zielsetzung

<img src="senologie-meldewege-uebersicht.png" alt="Klinische Dokumentation → FHIR → Meldewege" style="max-width:100%"/>

Dieser Implementation Guide definiert ein gemeinsames Datenmodell für die strukturierte Dokumentation der Brustkrebsversorgung. Ziel ist es, klinische Informationen einmalig zu erfassen und daraus die verschiedenen Meldungen und Berichte abzuleiten. Anstatt für jeden Meldeweg ein eigenes System zu pflegen, wird ein geteiltes Modell geschaffen, das die Anforderungen aller Beteiligten abdeckt.

## Analyse der Meldewege

Ein wesentlicher Beitrag dieses IG ist die systematische Gegenüberstellung der verschiedenen Meldedatensätze. Die Anforderungen von oBDS, OncoBox, IQTIG und Implantatregister überlappen in weiten Teilen, unterscheiden sich jedoch in Details — etwa bei Kodierungen, Granularität oder Pflichtfeldern. Durch die explizite Dokumentation dieser Unterschiede entsteht eine Grundlage, auf der mittelfristig an einer stärkeren Harmonisierung der Meldewege gearbeitet werden kann.

## Weitergehende Perspektiven

Ein standortübergreifend einheitliches Datenmodell für die Senologie eröffnet Möglichkeiten, die über die reine Meldepflicht hinausgehen:

- **Clinical Decision Support**: Strukturierte Daten ermöglichen die automatisierte Unterstützung klinischer Entscheidungen, etwa bei der Therapieplanung auf Basis molekularer Subtypen.
- **Computable Clinical Guidelines**: Leitlinienempfehlungen (z.B. der S3-Leitlinie Mammakarzinom) können maschinenlesbar abgebildet und gegen die dokumentierten Daten geprüft werden.
- **Automatisierte Qualitätsindikatoren**: DKG-Kennzahlen und IQTIG-Indikatoren lassen sich direkt aus dem Datenmodell berechnen, ohne manuelle Aggregation.
- **Standortübergreifende Auswertungen**: Einheitlich strukturierte Daten sind die Voraussetzung für Versorgungsforschung, Registerstudien und Benchmarking zwischen Zentren.

## Zielgruppen

Dieser Implementation Guide richtet sich an unterschiedliche Nutzergruppen:

- **Medizinisches Personal an Brustzentren**: Sowohl das behandelnde Team als auch Mitarbeitende, die in Meldungen, Dokumentation und Auswertungen eingebunden sind. Für sie schafft ein einheitliches Datenmodell die Grundlage, Dokumentationsaufwand zu reduzieren und die Datenqualität zu verbessern.
- **Hersteller von Dokumentations- und Informationssystemen**: Die hier definierten Profile, Terminologien und Transformationsregeln stehen als offene Spezifikation zur Verfügung und können als Grundlage für die Implementierung in klinischen Systemen genutzt werden.
- **Interoperabilitäts-Community**: Dieses Projekt möchte aufzeigen, wie aus der Community heraus — in Zusammenarbeit mit Fachgesellschaften — grundlegende fachspezifische Spezifikationen entstehen können, die die Roadmap des Interop Councils ergänzen und konkretisieren.
- **Institutionen der Qualitätssicherung und Registrierung**: Für Krebsregister, Zertifizierungsstellen, die gesetzliche Qualitätssicherung und Leitlinienorganisationen kann dieses Projekt als konkreter Ausgangspunkt dienen, bestehende Meldewege auf eine gemeinsame FHIR-basierte Grundlage zu stellen. Insbesondere eine Einigung auf einheitliche semantische Annotationen — also die durchgängige Kodierung klinischer Konzepte mit internationalen Terminologien wie SNOMED CT, LOINC und ICD — hätte einen erheblichen Mehrwert: Sie würde nicht nur die Transformation zwischen Meldewegen vereinfachen, sondern auch die Anschlussfähigkeit an den European Health Data Space (EHDS) und die europäische Harmonisierung klinischer Datensätze sicherstellen.

## Einordnung

Dieses Datenmodell baut auf dem Kerndatensatz der Medizininformatik-Initiative (MII KDS Onkologie) auf und ist kompatibel mit den Informationstechnischen Systemen im Krankenhaus (ISiK). Die Konformität mit europäischen Standards (EHDS, European Patient Summary) wird angestrebt.

## Inhaltlich unterstützt durch

| Person | Institution / Funktion |
|--------|----------------------|
| Prof. Dr. med. Wolfgang Janni | DGGG, Vertreter der Arbeitsgemeinschaft Gynäkologische Onkologie |
| Prof. Dr. med. Markus Wallwiener | DGGG, Sprecher der Kommission Digitale Medizin; AGO, Stellvertretender Vorsitzender |
| Prof. Dr. med. Andreas Schneeweiß | DGS, Vorsitzender der Deutschen Gesellschaft für Senologie |
| Prof. Dr. med. Volkmar Müller | AGO, Sprecher Kommission Mamma |
| Prof. Dr. med. Achim Wöckel | S3-Leitlinienkoordination Mammakarzinom |
| PD Dr. rer. nat. Christoph Kowalski | Deutsche Krebsgesellschaft, Versorgungsforschung |
| Prof. Dr. med. Dipl.-Ing. Sylvia Thun | Berlin Institute of Health at Charité (BIH) |

## Hinweis zum Status

Die vorliegende Spezifikation ist nicht als normative Vorgabe zu verstehen, sondern als wissenschaftliche Einladung zur gemeinsamen, intersektoralen Ausgestaltung eines einzelnen medizinischen Fachgebietes in seiner gesamten Granularität. Rückmeldungen, Korrekturen und Erweiterungsvorschläge sind ausdrücklich erwünscht.
