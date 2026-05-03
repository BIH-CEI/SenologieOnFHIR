# Strahlentherapie

## Überblick

Die adjuvante Strahlentherapie ist nach brusterhaltender Operation Standardbestandteil der Behandlung und wird bei bestimmten Risikofaktoren auch nach Mastektomie durchgeführt. Die Bestrahlung erfolgt in der Regel durch eine eigenständige Strahlentherapie-Abteilung oder ein externes Zentrum mit eigenem Dokumentationssystem.

Die Strahlentherapie-Daten werden am Brustzentrum selbst nicht primär erfasst, sind aber für die Meldung an Krebsregister (oBDS), DKG-Zertifizierung (OncoBox) und Qualitätssicherung (IQTIG) erforderlich. Das Datenmodell definiert daher die Struktur, in der diese Informationen empfangen, vorgehalten und an die verschiedenen Meldewege weitergeleitet werden können.

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
