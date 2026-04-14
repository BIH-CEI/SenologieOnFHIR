# Anwendungsfall: Austausch

### Überblick

Das Senologie-Modul ermöglicht den interoperablen Datenaustausch zwischen den beteiligten Systemen der Brustkrebsversorgung. Die FHIR-Profile definieren eine gemeinsame Sprache für den Datentransfer — unabhängig davon, in welchem System die Daten ursprünglich erfasst wurden.

### Austauschszenarien

#### 1. Klinisches Informationssystem ↔ Dokumentationssystem

Das Dokumentationssystem (z.B. dotbase) erfasst detaillierte Senologie-Daten über Formulare. Diese werden als FHIR-Ressourcen an das KIS übermittelt und dort mit bestehenden Patientendaten verknüpft.

- **Richtung**: Dokumentationssystem → KIS
- **Daten**: Diagnosen, OP-Berichte, Befunde, Therapieverläufe
- **Mechanismus**: FHIR REST API oder Messaging

#### 2. Klinisches Informationssystem ↔ Datenintegrationszentrum

Das DIZ erhält die klinischen Daten zur Aufbereitung für die Forschungsdatenbereitstellung. Die Senologie-Profile stellen sicher, dass die Daten in einheitlicher Struktur und Kodierung vorliegen.

- **Richtung**: KIS → DIZ (ETL-Prozess)
- **Daten**: Pseudonymisierter klinischer Datensatz
- **Verwendung**: Forschungsdatenrepository, Machbarkeitsabfragen

#### 3. Standortübergreifender Austausch (MII)

Im Rahmen der MII werden standortübergreifende Abfragen über die Datenintegrationszentren ermöglicht. Das Senologie-Modul stellt als Erweiterung des MII-Kerndatensatzes die strukturelle Kompatibilität sicher.

- **Richtung**: DIZ ↔ DIZ (föderiert)
- **Daten**: Aggregierte oder pseudonymisierte Einzeldaten
- **Infrastruktur**: MII-Forschungsdatenportal

#### 4. Klinik ↔ Krebsregister

Strukturierte Meldungen an klinische Krebsregister. Siehe [Meldedatensätze](anwendungsfaelle-meldedatensaetze.html).

### Kompatibilität

Die Profile sind so gestaltet, dass sie mit folgenden Standards kompatibel sind:

| Standard | Kompatibilität |
|---|---|
| **MII Kerndatensatz** | Profile erben von MII-Onkologie, -Pathologie und -Bildgebung |
| **ISiK 5.0** | Basiskompatibilität für Krankenhaussysteme |
| **oBDS** | Onkologischer Basisdatensatz für Krebsregistermeldungen |
| **HL7 SDC** | Formularbasierte Erfassung und Extraktion |

### Datenfluss

```
dotbase          KIS              DIZ            MII-Portal
  │                │                │                │
  ├─ FHIR ────────►│                │                │
  │  Ressourcen     ├─ ETL ────────►│                │
  │                 │               ├─ Föderiert ───►│
  │                 ├─ oBDS ───────►│                │
  │                 │  Meldung      │   Krebsregister│
  │                 ├─ DIMDI ──────►│                │
  │                 │  Implantat    │   Implantate-  │
  │                 │               │   register     │
```

### Terminologie-Mapping

Für den Datenaustausch ist eine konsistente Terminologie entscheidend. Das Modul stellt [ConceptMaps](terminologie-medikation.html) bereit, die Übersetzungen zwischen den verwendeten Kodiersystemen ermöglichen:

- **SNOMED CT → ATC**: Medikamente für Krebsregistermeldungen
- **SNOMED CT → ASK**: Medikamente für Arzneimittelsicherheit
- **SNOMED CT → ICD-10-GM**: Diagnosen (über bestehende MII-Mappings)
