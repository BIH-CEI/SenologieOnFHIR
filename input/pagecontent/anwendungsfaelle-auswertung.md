# Anwendungsfall: Auswertung

### Überblick

Die strukturierten FHIR-Daten des Senologie-Moduls ermöglichen die Sekundärnutzung für Versorgungsforschung, Qualitätssicherung und klinische Studien. Die einheitliche Profilierung stellt sicher, dass Daten standortübergreifend vergleichbar und auswertbar sind.

### Auswertungsszenarien

#### 1. Qualitätsindikatoren (DKG-Zertifizierung)

Zertifizierte Brustzentren müssen jährlich Qualitätsindikatoren nach DKG-Vorgaben erheben. Die strukturierten Daten ermöglichen eine automatisierte Berechnung:

| Indikator | Datengrundlage (Profile) |
|---|---|
| Anteil brusterhaltender Operationen | Senologie_Operation (Procedure) |
| Rate an R0-Resektionen | Senologie_Pathologie_Befund (DiagnosticReport) |
| Hormonrezeptor-Bestimmungsrate | Senologie_Pathologie_Befund (ER, PR, HER2, Ki-67) |
| Anteil Tumorkonferenz-Vorstellung | Senologie_Tumorboard_Empfehlung (CarePlan) |
| Postoperative Komplikationsrate | Senologie_Operative_Komplikation (Observation) |
| Systemtherapie-Adhärenz | Senologie_Systemtherapie_Procedure (Procedure) |

#### 2. Versorgungsforschung

Die FHIR-Daten können über MII-Datenintegrationszentren für standortübergreifende Versorgungsforschung bereitgestellt werden:

- **Behandlungspfadanalysen**: Abgleich des tatsächlichen Versorgungspfads mit Leitlinienempfehlungen über die Sequenz von Diagnose → Tumorkonferenz → Therapie
- **Outcome-Analysen**: Verknüpfung von Therapiedaten (Operation, Systemtherapie, Strahlentherapie) mit Komplikationen und Verlaufsdiagnosen
- **Risikostratifizierung**: Korrelation von Genexpressionstestergebnissen mit Therapieentscheidungen und Outcomes
- **Zeitanalysen**: Time-to-treatment, Diagnoseverzögerungen, Therapiedauern

#### 3. Klinische Studien

Das Modul unterstützt die Rekrutierung und Datenbereitstellung für klinische Studien:

- **Machbarkeitsabfragen**: Identifikation geeigneter Patientinnen über strukturierte Einschlusskriterien (Diagnose, Stadium, Rezeptorstatus, Vortherapien)
- **Datenexport**: Bereitstellung studienrelevanter Daten in FHIR-Format
- **Studienteilnahme-Tracking**: Dokumentation über ResearchSubject *(geplant)*

#### 4. Leitlinien-Compliance

Durch die Annotation der S3-Leitlinie mit FHIR-Datenpunkten kann die Leitlinien-Adhärenz systematisch überprüft werden:

- Werden alle empfohlenen Diagnostikschritte durchgeführt?
- Entspricht die Therapieempfehlung der Tumorkonferenz den Leitlinien?
- Werden Genexpressionstests leitliniengerecht eingesetzt?

### Abfragemuster

Beispielhafte FHIR-Abfragen für typische Auswertungen:

```
# Alle Patientinnen mit triple-negativem Mammakarzinom
GET Condition?code=http://snomed.info/sct|254837009
  &_has:Observation:subject:code=http://loinc.org|85337-4  # ER-negativ
  &_has:Observation:subject:code=http://loinc.org|85339-0  # PR-negativ
  &_has:Observation:subject:code=http://loinc.org|85319-2  # HER2-negativ

# Alle Operationen mit Komplikationen Clavien-Dindo ≥ III
GET Observation?code=clavien-dindo
  &value-concept=clavien-dindo-III,clavien-dindo-IV,clavien-dindo-V
  &_include=Observation:focus  # zugehörige Prozedur
```

### Automatisierung durch CQL

Die Auswertungen (insbesondere Qualitätsindikatoren und Leitlinien-Compliance) können in zukünftigen Versionen dieses IGs durch die [Clinical Quality Language (CQL)](http://cql.hl7.org/) automatisiert werden. CQL ermöglicht die formale Definition von Qualitätsmaßen und Entscheidungslogik direkt auf FHIR-Ressourcen, sodass Kennzahlen reproduzierbar und maschinenlesbar berechnet werden können.

### Datenschutz und Governance

Die Sekundärnutzung erfolgt ausschließlich über die etablierten MII-Governance-Strukturen:

- Pseudonymisierung durch das Datenintegrationszentrum
- Nutzungsanträge über das MII-Forschungsdatenportal
- Broad Consent als Rechtsgrundlage
