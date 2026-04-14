# Anwendungsfall: Meldedatensätze

### Überblick

Ein zentraler Mehrwert der strukturierten FHIR-Dokumentation ist die automatisierte Ableitung regulatorischer Meldungen. Anstatt Daten mehrfach zu erfassen, werden die klinischen FHIR-Ressourcen als Single Source of Truth genutzt und die Meldedatensätze daraus generiert.

### Meldepflichten

Zertifizierte Brustzentren unterliegen mehreren Meldepflichten:

| Meldung | Empfänger | Rechtsgrundlage | Häufigkeit |
|---|---|---|---|
| Krebsregistermeldung (oBDS) | Klinisches Krebsregister | Landeskrebsregistergesetze | Bei Diagnose, Therapie, Verlauf, Tod |
| Implantateregistermeldung | DIMDI (Implantateregister) | Implantateregistergesetz (IRegG) | Bei Implantation, Explantation, Revision |
| DKG-Kennzahlenbogen | Deutsche Krebsgesellschaft | Zertifizierungsordnung | Jährlich |
| Qualitätssicherung (QS) | IQTIG / G-BA | SGB V §136 | Fallbezogen |

### Krebsregistermeldung (oBDS)

Der Onkologische Basisdatensatz (oBDS) ist der Standard für Krebsregistermeldungen in Deutschland. Das Senologie-Modul bildet alle oBDS-relevanten Datenpunkte ab:

#### Mapping: FHIR-Profile → oBDS-Meldeanlässe

| oBDS-Meldeanlass | FHIR-Profil | Relevante Elemente |
|---|---|---|
| **Diagnose** | Senologie_Diagnose_Maligne | ICD-10-GM, Diagnosedatum, Seitenlokalisation, Diagnosesicherung, TNM |
| **Histologie** | Senologie_Pathologie_Befund | Histologietyp (ICD-O-3 Morphologie), Grading |
| **Operation** | Senologie_Operation | OPS-Kode, OP-Datum, Intention, Residualstatus |
| **Strahlentherapie** | Senologie_Strahlentherapie | Beginn/Ende, Zielgebiet, Dosis, Intention |
| **Systemische Therapie** | Senologie_Systemtherapie_Procedure + _Medikation | Substanz, Beginn/Ende, Intention, Protokoll |
| **Verlauf** | Senologie_Diagnose_Maligne (Rezidiv) | Rezidivdiagnose, Metastasierungsstadium |
| **Tod** | *(MII Kerndatensatz Person)* | Sterbedatum, Todesursache |

#### oBDS-Kompatibilität

Die Profile stellen oBDS-Kompatibilität sicher durch:

- Erbt von `MII_PR_Onko_Diagnose_Primaertumor` mit vollständiger oBDS-Diagnosestruktur
- Diagnosesicherung nach oBDS-Schlüssel (1–9)
- Metastasierungsstatus als eigenständiges CodeSystem (nicht-/primär-/sekundär-metastasiert)
- TNM-Staging über referenzierte MII-Onkologie-Profile
- Residualklassifikation (R0/R1/R2) bei Operationen

### Implantateregistermeldung

Das Implantateregistergesetz (IRegG) verpflichtet zur Meldung bei Einsatz, Wechsel oder Entfernung von Brustimplantaten.

#### Mapping: FHIR-Profile → Implantateregister

| Meldedatum | FHIR-Profil | Element |
|---|---|---|
| Implantattyp | Senologie_Implantat (Device) | `Device.type` |
| Hersteller | Senologie_Implantat (Device) | `Device.manufacturer` |
| Artikelnummer (REF) | Senologie_Implantat (Device) | `Device.lotNumber` |
| Seriennummer (UDI) | Senologie_Implantat (Device) | `Device.serialNumber` |
| Implantationsdatum | Senologie_Operation (Procedure) | `Procedure.performed` |
| Indikation | Senologie_Diagnose_Maligne (Condition) | `Condition.code` |
| Eingriffsart | Senologie_Operation (Procedure) | `Procedure.code` |
| Komplikationen | Senologie_Operative_Komplikation (Observation) | Clavien-Dindo, Typ |

### DKG-Kennzahlenbogen

Die jährliche Erhebung der DKG-Qualitätsindikatoren für die Brustzentrum-Zertifizierung kann aus den FHIR-Daten abgeleitet werden. Siehe [Auswertung: Qualitätsindikatoren](anwendungsfaelle-auswertung.html).

### Architektur: Meldungsgenerierung

```
FHIR-Ressourcen          Transformator           Meldung
      │                       │                     │
      ├── Condition ─────────►│                     │
      ├── Procedure ─────────►│  oBDS-XML ─────────►│ Krebsregister
      ├── DiagnosticReport ──►│                     │
      │                       │                     │
      ├── Device ────────────►│  IRegG-Format ─────►│ DIMDI
      ├── Procedure ─────────►│                     │
      │                       │                     │
      ├── alle Profile ──────►│  Kennzahlen ───────►│ DKG
      │                       │                     │
```

Der Transformator ist **nicht** Teil dieses IGs, sondern wird als eigenständige Komponente implementiert. Der IG definiert die Quelldatenstruktur und stellt sicher, dass alle für die Meldungen erforderlichen Datenpunkte in den Profilen enthalten sind.

### Vollständigkeitsprüfung

Für jede Meldepflicht kann geprüft werden, ob die erforderlichen Daten vollständig vorliegen:

| Prüfung | Methode |
|---|---|
| oBDS-Pflichtfelder vorhanden | Profil-Validierung (Kardinalität 1..1 / 1..*) |
| ICD-10-GM kodiert | Binding-Validierung am Diagnose-Profil |
| Diagnosesicherung angegeben | Required Binding am oBDS-Diagnosesicherung-VS |
| Implantatdaten vollständig | Device-Profil mit Pflichtfeldern |

Fehlende Daten werden durch die FHIR-Validierung erkannt und können vor der Meldung ergänzt werden.

### Technische Umsetzung: XML-Meldungen und Zukunftsperspektive

Sowohl das Krebsregister (oBDS) als auch das Implantateregister (DIMDI) empfangen Meldungen derzeit noch im **XML-Format**. Die FHIR-Ressourcen aus diesem IG müssen daher in die jeweiligen XML-Schemata transformiert werden.

Für den Übergang gibt es zwei Ansätze:

- **Kurzfristig**: Ein Adapter transformiert die FHIR-Ressourcen in das jeweilige XML-Meldeformat. Dieser Adapter muss bei Änderungen der Meldeformate gepflegt werden.
- **Mittelfristig**: Eine Umstellung der Krebs- und Implantateregister auf FHIR-basierte Meldungen ist wahrscheinlich. In diesem Fall kann die Transformation über Open-Source-Tooling erfolgen — z.B. über [FHIR StructureMaps](http://hl7.org/fhir/mapping-language.html) in Kombination mit einem [Matchbox](https://github.com/ahdis/matchbox)-Docker-Container als lokale ETL-Strecke. Dieser Ansatz ist standardkonform, transparent und unabhängig von proprietärer Software.
