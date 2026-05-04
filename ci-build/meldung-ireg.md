# Implantatregister (IRegG) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Meldewege**](anwendungsfaelle-meldedatensaetze.md)
* **Implantatregister (IRegG)**

## Implantatregister (IRegG)

# IRegG-Meldungstransformation (Brustimplantate)

### Überblick

Das Implantateregistergesetz (IRegG) verpflichtet Gesundheitseinrichtungen zur Meldung bei Einsatz, Wechsel oder Entfernung von Brustimplantaten an das Deutsche Institut für Medizinische Dokumentation und Information (DIMDI). Diese Transformation erzeugt **IRegG-konforme XML-Meldungen aus klinischen FHIR-Daten**, die auf den Senologie-Profilen dieses IGs basieren.

* **Qüllformat**: FHIR Bundle mit Senologie-Profilen (dieser IG)
* **Zielformat**: IRegG XML (GEMeldung), Spezifikation **V4.1.1**
* **Methode**: FHIR StructureMaps (FML) mit IRegG Logical Model als Zielstruktur
* **Ausführung**: [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke
* **Scope**: Nur Brustimplantate – keine Endoprothesen, keine Aortenklappen

### Architektur

Die Transformation folgt dem gleichen Muster wie die [oBDS-Transformation](meldung-obds.md): FHIR-Ressourcen werden über StructureMaps auf ein Logical Model abgebildet, das anschliessend als XML serialisiert wird.

```
┌─────────────────────────────┐
│  FHIR Bundle                │
│  (Senologie-Profile)        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  StructureMap (FML)         │
│  Orchestrator + Teil-Maps   │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  IRegG Logical Model        │
│  (Brustimplantat-Meldung)   │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → IRegG XML (V4.1.1)      │
└─────────────────────────────┘

```

Im Unterschied zur oBDS-Transformation erzeugt die IRegG-Meldung **eine einzelne GEMeldung pro Behandlungsfall** (statt mehrerer Meldungen pro klinischem Ereignis). Alle relevanten Informationen (Patient, Operation, Implantat, Entlassung) werden in einer Meldung zusammengefasst.

### StructureMap-Übersicht

| | | | |
| :--- | :--- | :--- | :--- |
| **SenologieToIRegMeldung** | Orchestrator: dispatcht an Teil-Maps | Bundle (alle Profile) | IRegBrustimplantatMeldung |
| **SenologieToIRegPatient** | Patientendaten bei Aufnahme | Patient + Observations (Groesse, Gewicht) | Patientenaufnahme (PAT_* + PAB_*) |
| **SenologieToIRegOperation** | OP-Daten + Artikelidentifikation | Procedure + Device | Operation (OPE_* + OBI_**) + Artikelidentifikation (ARI_**+ ARB_* + ABI_*) |
| **SenologieToIRegEntlassung** | Entlassung + Diagnosen | Encounter + Condition | Entlassung (ENT_* + DBI_*) |

### Mapping-Tabelle: FHIR-Elemente zu IRegG-XML

#### Meldungskopf (MEL_*)

| | | |
| :--- | :--- | :--- |
| MEL_IrdIdGesundheitseinrichtung | Organization.identifier (system: ird/ge-kennung) | IRD-GE-Kennung |
| MEL_StandortId | Organization.identifier | Standort-ID |
| MEL_Bsnr | Organization.identifier (BSNR) | Betriebsstättennummer |
| MEL_IrdSpezVersion | fest: 4.1.1 | Version der Spezifikation |
| MEL_SwName / SwHersteller / SwVersion | Bundle.meta / fest | Softwarekennung |

#### Fall (FAL_*)

| | | |
| :--- | :--- | :--- |
| FAL_Aufnahmedatum | Encounter.period.start |   |
| FAL_ArtAufenthaltSchluessel | Encounter.class | IMP=1, SS=2, AMB=3 |
| FAL_Transfernummer | Encounter.identifier | 64-stellig, pseudonymisiert |
| FAL_DatumZeitSatzErstellung | now() | Zeitpunkt der Transformation |
| ALR_ProzedurenSchluessel | Procedure.code.coding (OPS) | Ausloesende OPS-Prozedur |

#### Patientenaufnahme (PAT_* + PAB_*)

| | | |
| :--- | :--- | :--- |
| PAT_Alter | Patient.birthDate | Berechnet (heute - Geburtsdatum) |
| PAT_Groesse | Observation (LOINC 8302-2) | Körpergroesse in cm |
| PAT_Gewicht | Observation (LOINC 29463-7) | Körpergewicht in kg |
| PAT_GeschlechtSchluessel | Patient.gender | male=1, female=2, other=3 |
| PAB_AutoimmunerkrankungSchluessel | Patient.extension (ireg-autoimmunerkrankung) | enum_0122 |
| PAB_VerlaufAutoimmunerkrankungSchluessel | Patient.extension (ireg-verlauf-autoimmunerkrankung) | enum_0123 |
| PAB_GeschlechtGeburtSchluessel | Patient.extension (patient-birthsex) | enum_0170 |

#### Operation (OPE_* + OBI_*)

| | | |
| :--- | :--- | :--- |
| OPE_Datum | Procedure.performedDateTime |   |
| OPE_SeitenLokalisationSchluessel | Procedure.bodySite (SNOMED CT) | rechts/links/beidseits |
| OPE_AsaSchluessel | Procedure.extension (ireg-asa-klassifikation) | enum_0044 |
| OPE_ImplantattypSchluessel | fest: 3 (Brustimplantat) | enum_0080 |
| OBI_ArtEingriffSchluessel | Procedure.category | enum_0100 |
| OBI_GrundPrimaerEingriffSchluessel | Procedure.extension | enum_0102 |
| OBI_GrundAustauschSchluessel | Procedure.extension | enum_0104 |
| OBI_GrundRevisionExplantationSchluessel | Procedure.extension | enum_0106 |
| OBI_LageSchluessel | Procedure.extension | enum_0112 |
| OBI_ZugangSchluessel | Procedure.extension | enum_0118 |
| PBI_ProzedurenSchluessel | Procedure.code.coding (OPS) | OPS-Kodes |

#### Artikelidentifikation (ARI_* + ARB_* + ABI_*)

| | | |
| :--- | :--- | :--- |
| ARI_Artikelkennzeichen | Device.udiCarrier.deviceIdentifier | UDI oder REF |
| ARI_KennzeichenTypSchluessel | abgeleitet (UDI vorhanden?) | enum_0068 |
| ARI_ArtikelArtSchluessel | Device.status | active=Implantat, inactive=Explantat |
| ARB_LotNummer | Device.lotNumber | Chargen-/LOT-Nummer |
| ARB_SerienNummer | Device.serialNumber | Seriennummer |
| ARB_Artikelbezeichnung | Device.deviceName | Artikelbezeichnung |
| ARB_Barcode | Device.udiCarrier.carrierHRF | Barcode |
| ABI_HerstellerSchluessel / Sonstiger | Device.manufacturer | Hersteller |
| ABI_ArtikelTypSchluessel | Device.type | enum_0190 |
| ABI_FormSchluessel | Device.extension (ireg-implantat-form) | enum_0126 |
| ABI_OberflaecheSchluessel | Device.extension (ireg-implantat-oberflaeche) | enum_0128 |
| ABI_FüllungSchluessel | Device.extension (ireg-implantat-füllung) | enum_0124 |
| ABI_Volumen | Device.extension (ireg-implantat-volumen) | in ml |

#### Entlassung (ENT_* + DBI_*)

| | | |
| :--- | :--- | :--- |
| ENT_Datum | Encounter.period.end | Entlassungsdatum |
| ENT_GrundSchluessel | Encounter.hospitalization.dischargeDisposition | 2-stellig nach Paragraph 301 SGB V |
| DBI_IcdSchluessel | Condition.code.coding (ICD-10-GM) | Mit optionaler Seitenlokalisation (:R/:L/:B) |

### Code-Übersetzung

Die IRegG-Meldung verwendet eigene Enumerationen (enum_0044, enum_0050, enum_0065, etc.) statt SNOMED CT oder anderer Standardterminologien. Die Übersetzung erfolgt direkt in den StructureMaps:

| | | | |
| :--- | :--- | :--- | :--- |
| Geschlecht | Patient.gender (FHIR-Code) | enum_0070 | Direkte Zuordnung in FML |
| Seitenlokalisation | SNOMED CT (24028007/7771000/51440002) | enum_0050 | Direkte Zuordnung in FML |
| Art des Aufenthalts | HL7 ActEncounterCode (IMP/SS/AMB) | enum_0065 | Direkte Zuordnung in FML |
| Art des Eingriffs | Senologie CodeSystem | enum_0100 | CodeSystem-Binding |
| Implantat-Eigenschaften | Device Extensions | enum_0124/0126/0128 | CodeSystem-Binding |

### Datenverfügbarkeit und offene Lücken

Nicht alle IRegG-Pflichtfelder können aus den Senologie-Profilen abgeleitet werden. Für eine vollständige IRegG-Meldung müssen zusätzliche Datenqüllen eingebunden werden.

Die folgende Tabelle zeigt, welche IRegG-Daten aus welcher Qülle kommen:

| | | |
| :--- | :--- | :--- |
| OP-Datum, OPS-Codes, Seitenlokalisation | Senologie_Operation | Vorhanden |
| Implantat: Typ, Hersteller, LOT, Seriennummer | Senologie_Implantat | Vorhanden (Basis) |
| ICD-10-GM Diagnose | Senologie_Diagnose_Maligne / _Benigne | Vorhanden |
| Implantat: UDI-DI, Form, Oberfläche, Füllung, Volumen | Senologie_Implantat | **Erweiterung nötig**— Profil aktüll zu dünn |
| Implantatlage (submuskulär/subfaszial etc.) | Senologie_Operation | **Erweiterung nötig**— kein Datenpunkt im Profil |
| Zugang (axillär/periareolär/submammär etc.) | Senologie_Operation | **Erweiterung nötig** |
| Prozedurtyp (Primär/Austausch/Revision/Explantation) | Senologie_Operation | **Teilweise**— Ableitung aus OP-Art möglich, aber nicht IRegG-kodiert |
| Grund der Implantation (Karzinom/Rekonstruktion/Kosmetisch) | Senologie_Diagnose | **Teilweise**— über reasonReference ableitbar |
| ASA-Klassifikation | — | **Fehlt**— kommt aus Anästhesie/Narkoseprotokoll |
| Transfernummer (Pseudonym) | Vertraünsstelle | **Externe Qülle**— nicht klinisch, wird vom Vertraünsdienst vergeben |
| Körpergröße, Gewicht, Alter | KIS / Allgemeine Anamnese | **Externe Qülle**— nicht im Senologie-Scope (→ IPS/KIS) |
| Geschlecht bei Geburt | KIS / Patient | **Externe Qülle**— Patient.extension |
| Entlassungsdatum, -grund | KIS / Encounter | **Externe Qülle**— ISiK-Encounter |
| IRegG-Befundcodes (Infektion, Kapselfibrose, BIA-ALCL etc.) | Senologie_Operative_Komplikation | **Teilweise**— Mapping auf enum_0121 nötig |

#### Handlungsoptionen

Für die fehlenden Daten gibt es drei Ansätze:

1. **Senologie-Profile erweitern** — Implantat-Profil um UDI-DI, Form, Oberfläche, Füllung, Volumen ergänzen; OP-Profil um Lage und Zugang. Vorteil: alles in einem Formular erfassbar. Nachteil: Senologie-Profil wird IRegG-lastig.
1. **Eigenes IRegG-Erfassungsformular** — Separater SDC-Questionnaire speziell für die IRegG-Meldung, der die fehlenden Felder nacherfasst. Wird nach der OP ausgefüllt und ergänzt die klinische Dokumentation. Vorteil: klare Trennung klinisch vs. regulatorisch. Nachteil: Doppelerfassung möglich.
1. **Hausinterne ETL-Strecke** — Die fehlenden Daten (ASA, Vitals, Entlassung, Transfernummer) werden aus KIS, Anästhesiesystem und Vertraünsstelle zusammengeführt und mit den Senologie-Daten zu einer vollständigen IRegG-Meldung kombiniert. Vorteil: nutzt bestehende Datenqüllen. Nachteil: standortspezifische Integration nötig.

**Empfehlung**: Kombination aus Option 1 (Profilerweiterung für klinisch relevante Implantatdaten) und Option 3 (ETL für administrative Daten). Die konkreten Anforderungen sollten mit der GB IT des Standorts abgestimmt werden.

### IRegG-Spezifikation

Die Transformation basiert auf der IRegG-Spezifikation V4.1.1 (XML-Schema):

* **XML-Schema**: `GEMeldung_V4.1.1.xsd`
* **Logical Model**: [IRegBrustimplantatMeldung](StructureDefinition-ireg-brustimplantat-meldung.md) – bildet die XML-Hierarchie als FHIR StructureDefinition ab
* **Scope**: Nur der Brustimplantat-Anteil (keine Endoprothesen, keine Aortenklappen)

> **Hinweis**: Die IRegG-Spezifikation deckt drei Produktgruppen ab: Brustimplantate, Endoprothesen und Aortenklappen. Dieser IG bildet ausschliesslich den **Brustimplantat-Anteil** ab. Die weiteren Produktgruppen werden durch andere IGs oder Erweiterungen abgedeckt.

### Ausführung

Die Transformation wird analog zur oBDS-Transformation über [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke ausgeführt.

**Transformation:**

```
POST http://localhost:8080/fhir/StructureMap/$transform
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "source",
      "resource": { /* FHIR Bundle mit Senologie-Ressourcen */ }
    },
    {
      "name": "source",
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung"
    }
  ]
}

```

Das Ergebnis ist eine Instanz des IRegG Logical Models, die als XML serialisiert und an das DIMDI übermittelt werden kann.

