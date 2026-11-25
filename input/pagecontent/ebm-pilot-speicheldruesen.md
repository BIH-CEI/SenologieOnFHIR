# EBM-Pilot: Speicheldrüsentumoren (AWMF 007-102OL)

Dieser Pilot demonstriert die Repräsentation klinischer Leitlinien als FHIR-Ressourcen nach dem
**EBM on FHIR**-Ansatz am Beispiel der S3-Leitlinie Speicheldrüsentumoren
(AWMF-Reg.-Nr. 007-102OL, Version 1.0, Juli 2025).

Die Annotation folgt dem PICO-Schema (Population, Intervention, Comparator, Outcome) und nutzt
SNOMED CT für semantische Kodierung. Die Ergebnisse sind als Entwurf zu verstehen; der Pilot
dient der Erprobung der Methodik im Kontext des KDS Senologie.

---

## Architektur

Die Leitlinien-Repräsentation besteht aus drei Schichten:

| Schicht | FHIR-Ressource | Inhalt |
|---------|---------------|--------|
| Konzeptliste | `EvidenceVariable` | Populationen, Interventionen, Outcomes mit SNOMED-Codes |
| Empfehlungen | `ArtifactAssessment` | PICO-annotierte Empfehlungen mit Evidenzgrad |
| Dokument | `EvidenceReport` / `Citation` | Referenz auf die Leitlinie als Quelle |

Die Instanzen in diesem Piloten sind R4-kompatible Annäherungen. In FHIR R5/R6 (Dissolve-E-Profil der
AWMF) würden `characteristicCombination` und `variableRole` die Schichten-Semantik direkt ausdrücken.

---

## Populationsdefinitionen (EvidenceVariable)

Sechs `EvidenceVariable`-Instanzen decken die klinisch relevanten Patientengruppen der Leitlinie ab:

| Instanz | Population | Schlüssel-Empfehlung |
|---------|-----------|---------------------|
| [SpLD-BenignePArotis] | Benigne Raumforderung Gl. parotidea (oberflächlich) | 4.2 (B), 4.3 (B) |
| [SpLD-KarzinomAllgemein] | Speicheldrüsenkarzinom allgemein, kurativ resektabel | 4.14 (A) |
| [SpLD-KarzinomHighGrade] | High-grade-Karzinom (inkl. High-grade-Transformation) | 4.26 (A), adjuvante RT |
| [SpLD-AdCC-T3T4] | Adenoid-zystisches Karzinom T3/T4 cN0 | 4.27 (B) |
| [SpLD-ParotisKarzinom-Fazialis] | Parotiskarzinom + präoperative Fazialisparese | 4.14/4.19 |
| [SpLD-KarzinomR1-RT] | Speicheldrüsenkarzinom nach R1/R2-Resektion | 4.28–4.31 (RT-Indikation) |

---

## Glossar und SNOMED-Abdeckung

Das Pilot-Glossar umfasst **44 Konzepte** aus 7 Kategorien:

| Kategorie | Konzepte | SNOMED-mapped | Gap |
|-----------|---------|---------------|-----|
| Anatomie (Lokalisationen) | 4 | 4 | 0 |
| Tumorentitäten (Morphologie) | 7 | 6 | 1 (Azinuszellkarzinom*) |
| Diagnostische Verfahren | 5 | 5 | 0 |
| Chirurgische Eingriffe | 7 | 6 | 1 (Extrakapsulare Dissektion) |
| Systemtherapie / Substanzen | 3 | 3 | 0 |
| Pathologische Befunde | 7 | 3 | 4 (High-grade, R0, L1, V1**) |
| Outcomes | 4 | 1 | 3 (Lokalrezidiv, OS, Fazialisparese) |

\* Azinuszellkarzinom: SNOMED-Code `254977003` existiert; Agent hat ihn beim ersten Durchlauf übersehen.  
\*\* R0 und Lymphangioinvasion über LOINC adressierbar (`44648-4`, `85319-2`); Veneninvasion bleibt echte Lücke.

Die vollständige Glossar-CSV liegt unter `docs/ebm-pilot-speicheldrüsen/glossar.csv`.

---

## PICO-Annotation der Empfehlungen

Die Leitlinie enthält **71 annotierte Einträge** (Empfehlungen + Statements), strukturiert nach:

```
recommendations.yaml (docs/ebm-pilot-speicheldrüsen/)
  ├── Kapitel 3: Diagnostik          (14 Einträge, 3.1–3.14)
  ├── Kapitel 4.1: Chirurgie benigne (10 Einträge, 4.1–4.10)
  ├── Kapitel 4.2: Chirurgie maligne (17 Einträge, 4.11–4.27)
  ├── Kapitel 4.3: Nicht-chirurgisch (12 Einträge, 4.28–4.39)
  └── Kapitel 5: Nachsorge / Rezidiv (16 Einträge, 5.1–5.16)
```

Jede Empfehlung enthält:
- Empfehlungsgrad (A / B / EK / Statement) und Evidenzlevel
- PICO-Annotation mit SNOMED-Codes je Element
- Referenz auf die zugehörige `EvidenceVariable`-ID
- Skeleton eines `ArtifactAssessment`-Eintrags

---

## Nächste Schritte

1. **FSH → JSON**: SUSHI-Kompilierung der EvidenceVariable-Instanzen
2. **ArtifactAssessment-Instanzen** aus `recommendations.yaml` generieren
3. **R5-Migration**: `characteristicCombination` + `variableRole` aktivieren sobald R5-Package verfügbar
4. **Dissolve-E-Alignment**: Abgleich mit AWMF IG (https://fhir.awmf.org/awmf.ig/ci-build/en/index.html)
5. **CPG on FHIR**: `PlanDefinition` pro Empfehlung für CDS-Hooks-Integration
