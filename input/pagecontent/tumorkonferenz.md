# Tumorkonferenz

## Stellenwert

Die interdisziplinäre Tumorkonferenz (Tumorboard) ist der zentrale Entscheidungsort in der Brustkrebsversorgung. Hier treffen Senologie, Radiologie, Pathologie, Strahlentherapie, Onkologie und ggf. weitere Disziplinen zusammen, um auf Basis aller verfügbaren Befunde eine individuelle Therapieempfehlung auszusprechen. Die DKG-Zertifizierung fordert die Vorstellung aller Patientinnen mit maligner Diagnose — sowohl prätherapeutisch (KB-2) als auch postoperativ (KB-1).

## Typen

| Typ | Zeitpunkt | Fragestellung |
|-----|-----------|--------------|
| Prätherapeutisch | Nach Diagnosesicherung, vor Therapiebeginn | Operative Strategie, Neoadjuvanz? |
| Postoperativ | Nach definitiver Histologie | Adjuvante Therapie, Nachsorgestrategie |
| Rezidiv / Metastasen | Bei Progress | Therapieumstellung, palliative Optionen |

## Empfehlungen als einzelne Therapie-Empfehlungen

Das MII Onko Modul modelliert Tumorkonferenz-Empfehlungen als einzelne, eigenständige Ressourcen — nicht als monolithischen Freitext. Jede Therapiemodalität wird als separater Eintrag dokumentiert:

| Empfehlung | Beispiel | Status |
|-----------|---------|--------|
| Operative Therapie | BET links + SLNB | empfohlen / nicht empfohlen |
| Strahlentherapie | Ganzbrust 50 Gy + Boost | empfohlen |
| Chemotherapie | Nicht empfohlen (Oncotype RS 18) | explizit nicht empfohlen |
| Endokrine Therapie | Aromatasehemmer 5–10 Jahre | empfohlen |
| Zielgerichtete Therapie | — | nicht indiziert |
| Immuntherapie | — | nicht indiziert |

Diese Einzelmodellierung ermöglicht:
- Die explizite Dokumentation, dass eine Therapie bewusst **nicht** empfohlen wurde (z.B. "keine Chemotherapie")
- Den späteren Abgleich: Wurde die Empfehlung tatsächlich umgesetzt?
- Die automatisierte Berechnung von Qualitätskennzahlen (z.B. Anteil der Patientinnen mit leitliniengerechter Empfehlung)

## Umsetzungskontrolle

Der Vergleich zwischen Empfehlung und tatsächlich durchgeführter Therapie ist ein wichtiger Aspekt der Qualitätssicherung. Das Datenmodell unterstützt diesen Abgleich, indem die durchgeführten Therapien (Procedure, MedicationRequest) auf die Tumorboard-Empfehlung referenzieren können.

## Dokumentation der Konferenz

Neben den inhaltlichen Empfehlungen werden folgende Kontextdaten erfasst:

- Datum der Konferenz
- Beteiligte Disziplinen
- Vorstellungsgrund (Erstdiagnose, postoperativ, Rezidiv)
- Bezug zur Condition (bei bilateralen Tumoren: welche Diagnose?)
