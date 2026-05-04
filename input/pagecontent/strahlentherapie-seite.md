# Strahlentherapie

## Überblick

Die Strahlentherapie ist ein zentraler Bestandteil der Behandlung des Mammakarzinoms und wird je nach klinischer Situation in unterschiedlichen Settings eingesetzt. Nach brusterhaltender Operation stellt sie einen Standardbestandteil der adjuvanten Therapie dar und wird bei definierten Risikokonstellationen auch nach Mastektomie durchgeführt. Darüber hinaus kann sie intraoperativ appliziert werden sowie im metastasierten Setting zur Symptomkontrolle beitragen.

Die Durchführung erfolgt in der Regel durch eine eigenständige Strahlentherapie-Abteilung oder ein externes Zentrum mit eigenem Dokumentationssystem. Die entsprechenden Daten werden am Brustzentrum häufig nicht primär erfasst, sind jedoch für die Meldung an Krebsregister (oBDS), Zertifizierungsanforderungen (DKG/OncoBox) und Maßnahmen der Qualitätssicherung (IQTIG) erforderlich. Das Datenmodell definiert daher die Struktur, in der diese Informationen empfangen, vorgehalten und an die verschiedenen Meldewege weitergeleitet werden können.

## Relevante Datenpunkte

| Datenpunkt | Beschreibung | Meldeweg |
|-----------|-------------|----------|
| Beginn / Ende | Zeitraum der Bestrahlung | oBDS, OncoBox |
| Zielgebiet | Brust, Brustwand, Lymphabfluss, Boost | oBDS, OncoBox |
| Gesamtdosis (Gy) | Kumulierte Dosis | oBDS, OncoBox |
| Einzeldosis (Gy) | Dosis pro Fraktion | OncoBox |
| Anzahl Fraktionen | Gesamtzahl der Bestrahlungssitzungen | OncoBox |
| Stellung zur OP | Adjuvant, neoadjuvant, palliativ | oBDS, OncoBox |
| Simultane Radiochemotherapie | Gleichzeitige Systemtherapie | OncoBox |
| Intention | Kurativ, palliativ | oBDS |

## Profil-Grundlage

Das Strahlentherapie-Profil erbt vom MII Onko Modul und ergänzt senologie-spezifische Felder wie Einzeldosis pro Fraktion und das Flag für simultane Radiochemotherapie. Die Stellung zur Operation und die Therapieintention werden über MII Onko Extensions abgebildet.

## Zugehörige Ressourcen

| Typ | Ressource |
|-----|-----------|
| Profil | [Senologie_Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html) |
| Questionnaire | [Strahlentherapie](Questionnaire-senologie-strahlentherapie-quest.html) |
| Beispiel | [Fall 1 — Strahlentherapie](Procedure-Fall1-Strahlentherapie.html) |
