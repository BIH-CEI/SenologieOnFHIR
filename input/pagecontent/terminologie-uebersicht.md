# Terminologie

Dieses Kapitel gibt eine Übersicht über alle im Senologie-Modul verwendeten Terminologien, ValueSets und CodeSystems.

## Verwendete Kodiersysteme

| System | OID / URL | Verwendung im Modul |
|---|---|---|
| SNOMED CT | `http://snomed.info/sct` | Diagnosen, Prozeduren, Befunde, Medikamente, Bildgebung |
| ICD-10-GM | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | Diagnosekodierung (Krebsregister, DRG) |
| LOINC | `http://loinc.org` | Laborwerte, Bildgebungsmodalitäten, klinische Beobachtungen |
| RadLex | `http://radlex.org` | Radiologische Befundkategorien (ACR-Dichte, BI-RADS, Tomosynthese) |
| ATC | `http://fhir.de/CodeSystem/bfarm/atc` | Arzneimittelklassifikation (Meldung) |
| ASK | `http://fhir.de/CodeSystem/ask` | Arzneistoffkatalog |
| OPS | `http://fhir.de/CodeSystem/bfarm/ops` | Operationen- und Prozedurenschlüssel |
| oBDS | diverse | Onkologischer Basisdatensatz (Diagnosesicherung, Therapieintention) |

## ValueSets

### Diagnose

| ValueSet | Kodiersysteme | Codes | Beschreibung |
|---|---|---|---|
| [VS Senologie Diagnose](ValueSet-vs-senologie-diagnose.html) | SNOMED CT, Lokal | 24 | Alle senologischen Diagnosen (maligne, benigne, B3, entzündlich, symptomatisch) |
| [VS Senologie Diagnose SCT](ValueSet-vs-senologie-diagnose-sct.html) | SNOMED CT | 3 | SNOMED-CT-Slice für maligne Diagnosen |
| [VS Senologie Diagnose Lokal](ValueSet-vs-senologie-diagnose-lokal.html) | SNOMED CT, Lokal | 3 | Lokale Codes ohne SNOMED-Mapping |
| [VS Senologie Diagnose B3](ValueSet-vs-senologie-diagnose-b3.html) | SNOMED CT | 8 | B3-Läsionen unsicherer Dignität nach S3-Leitlinie |
| [VS Senologie ICD-10](ValueSet-vs-senologie-icd10.html) | ICD-10-GM | 34 | ICD-10-GM-Codes für Brusterkrankungen (C50, D05, D24, D48.6, N60–N64, T85.4) |
| [VS Senologie Diagnosesicherung](ValueSet-vs-senologie-diagnosesicherung.html) | Lokal (oBDS) | 12 | Diagnosesicherung nach oBDS (Schlüssel 1–9) |
| [VS Senologie Metastasierung](ValueSet-vs-senologie-metastasierung.html) | Lokal | 3 | Metastasierungsstatus (nicht/primär/sekundär metastasiert) |
| [VS Senologie Seite](ValueSet-vs-senologie-seite.html) | SNOMED CT | 3 | Lateralität (rechts, links, bilateral) |

### Therapie

**Hinweis zur Medikamenten-Kodierung:** In SDC-Questionnaires kann pro Formularfeld nur **ein Coding** hinterlegt werden. Die Medikation wird daher primär in **SNOMED CT** kodiert, da SNOMED CT als Referenzterminologie die breiteste Abdeckung bietet. Für die Krebsregistermeldung (oBDS) wird ATC benötigt — die Übersetzung erfolgt über die [ConceptMap SNOMED CT → ATC](ConceptMap-cm-senologie-medikation-sct-atc.html). So wird eine doppelte Kodierung im Formular vermieden und die Meldedaten werden automatisch abgeleitet.

| ValueSet | Kodiersysteme | Codes | Beschreibung |
|---|---|---|---|
| [VS Senologie Systemtherapie Medikation](ValueSet-vs-senologie-systemtherapie-medikation.html) | SNOMED CT | 19 | Antineoplastische Medikamente (CDK4/6-Inhibitoren, Anthrazykline, Taxane, Platinverbindungen etc.) |
| [VS Senologie Operation Art](ValueSet-vs-senologie-operation-art.html) | SNOMED CT | 10 | Operationsarten (Mastektomie, BET, Axilladissektion, Rekonstruktion etc.) |

### Risiko und Diagnostik

| ValueSet | Kodiersysteme | Codes | Beschreibung |
|---|---|---|---|
| [VS Senologie Genexpressionstest](ValueSet-vs-senologie-genexpressionstest.html) | Lokal | 4 | Genexpressionstests (Oncotype DX, MammaPrint, Prosigna, EndoPredict) |
| [VS Senologie Risikoklasse](ValueSet-vs-senologie-risikoklasse.html) | HL7 risk-probability | 3 | Risikoklassen (niedrig, mittel, hoch) |
| [VS Senologie Screeningstatus](ValueSet-vs-senologie-screeningstatus.html) | SNOMED CT | 5 | Screening-Status für Studienteilnahme |

### ConceptMaps

Für den Datenaustausch und die Krebsregistermeldung stehen Übersetzungstabellen bereit:

| ConceptMap | Quelle → Ziel | Beschreibung |
|---|---|---|
| [CM Medikation SCT→ATC](ConceptMap-cm-senologie-medikation-sct-atc.html) | SNOMED CT → ATC | Medikamenten-Mapping für Krebsregistermeldungen |
| [CM Medikation SCT→ASK](ConceptMap-cm-senologie-medikation-sct-ask.html) | SNOMED CT → ASK | Medikamenten-Mapping für Arzneistoffkatalog |

Siehe [Terminologie Medikation](terminologie-medikation.html) für Details zu den Medikamenten-Mappings.

---

## Lokale CodeSystems

Das Modul definiert eigene CodeSystems für Konzepte, die nicht durch internationale Terminologien abgedeckt werden.

### CS Senologie Diagnose Lokal

Lokale Diagnosecodes für Konzepte ohne SNOMED-CT-Entsprechung:

{:.stu-note}
Für die folgenden Konzepte konnte kein passendes SNOMED-CT-Konzept identifiziert werden. Es wird geprüft, ob diese als Extension Requests an SNOMED International bzw. das BfArM NRC eingereicht werden können.

| Code | Bedeutung | SNOMED-CT-Äquivalent | Status |
|---|---|---|---|
| `bz-diagnose-bc-recurrence` | Mammakarzinom Rezidiv | `1306515008 | Recurrent primary malignant neoplasm of breast` | **Migrationskandidat** |
| `bz-diagnose-sonstiges` | Sonstiges | — (generisch, kein SNOMED-Äquivalent sinnvoll) | Bleibt lokal |
| `bz-makromastie` | Makromastie | `43336006 | Gigantomastia` | **Migrationskandidat** |
| `bz-mamillensekretion-nicht-blutig` | Nicht blutige Mamillensekretion | `54302000 | Discharge from nipple` (Spezifizierung "nicht blutig" fehlt in SNOMED) | Teilweise |
| `bz-mamillensekretion-blutig` | Blutige Mamillensekretion | `290113009 | Bloody nipple discharge` | **Migrationskandidat** |
| `bz-befund-unklarer-dignitaet` | Befund unklarer Dignität | `269497004 | Neoplasm of uncertain behavior of breast` | **Migrationskandidat** |
| `bz-anisomastie` | Anisomastie | Kein exakter Match (nächster: `163438002 | O/E - breast asymmetry`, aber klinisches Finding, keine Diagnose) | Bleibt lokal |
| `bz-kapselfibrose` | Kapselfibrose (Implantat) | `237474000 | Contracture of breast following insertion of breast implant` | **Migrationskandidat** |

### CS Senologie Metastasierung

| Code | Bedeutung | Anmerkung |
|---|---|---|
| `nicht-metastasiert` | M0 — keine Fernmetastasen | Kein direktes SNOMED-Äquivalent als Status-Konzept |
| `primaer-metastasiert` | M1 bei Erstdiagnose | oBDS-spezifische Unterscheidung |
| `sekundaer-metastasiert` | M1 im Verlauf | oBDS-spezifische Unterscheidung |

### CS Senologie Diagnosesicherung

12 Codes nach oBDS-Schlüssel (1–9 mit Subklassen). Diese sind oBDS-spezifisch und haben keine direkte SNOMED-Entsprechung, da sie den deutschen Krebsregistermeldungsprozess abbilden.

### CS Senologie Genexpressionstest

| Code | Bedeutung | Anmerkung |
|---|---|---|
| `oncotype-dx` | Oncotype DX (21-Gene, Score 0–100) | Kein SNOMED-Code — proprietärer Testname |
| `mammaprint` | MammaPrint (70-Gene, Index −1,0 bis +1,0) | Kein SNOMED-Code — proprietärer Testname |
| `prosigna` | Prosigna/PAM50 (ROR Score 0–100) | Kein SNOMED-Code — proprietärer Testname |
| `endopredict` | EndoPredict (EPclin, kontinuierlich) | Kein SNOMED-Code — proprietärer Testname |

### Zusammenfassung: Lokale Codes und SNOMED-Abdeckung

| Kategorie | Lokal | Davon migrationsfähig zu SNOMED | Verbleibend lokal |
|---|---|---|---|
| Diagnosen | 8 | 5 (Rezidiv, Makromastie, blutige Mamillensekretion, unklare Dignität, Kapselfibrose) | 3 |
| Metastasierung | 3 | 0 (oBDS-spezifisch) | 3 |
| Diagnosesicherung | 12 | 0 (oBDS-spezifisch) | 12 |
| Genexpressionstests | 4 | 0 (proprietäre Testnamen) | 4 |
| **Gesamt** | **27** | **5** | **22** |

Die verbleibenden 22 lokalen Codes sind entweder oBDS-spezifisch (15), proprietäre Testnamen (4) oder haben kein SNOMED-Äquivalent (3).

*Alle SNOMED-CT-Codes wurden am 14.04.2026 gegen Snowstorm 10.8.2 (SNOMED CT International Edition) validiert.*
