# Leitlinien-Annotations-Schema

> Version: 0.1.0-pilot | Stand: 2026-02-17
> Basiert auf: S3-Leitlinie Mammakarzinom v5.0 (Dezember 2025), AWMF-Reg. 032-045OL

## Zweck

Dieses Schema definiert die Struktur zur Annotation von Leitlinien-Empfehlungen
mit medizinischen Datenobjekten, versionierten Terminologien und FHIR-Bezug.
Ziel ist ein maschinenlesbares Data Dictionary, das die Leitlinie als normative
Grundlage der FHIR-Spezifikation nutzbar macht.

## Quellen

| Kürzel | Quelle | Version |
|--------|--------|---------|
| S3 | S3-Leitlinie Früherkennung, Diagnostik, Therapie und Nachsorge des Mammakarzinoms | v5.0, Dezember 2025 |
| AGO | AGO-Empfehlungen Kommission Mamma | 2025 |

## Empfehlungstypen in der S3-Leitlinie

| Typ | Beschreibung | Empfehlungsgrad | Evidenzlevel |
|-----|-------------|-----------------|--------------|
| Evidenzbasierte Empfehlung | Systematische Literaturrecherche | A (soll) / B (sollte) / 0 (kann) | Oxford 1-5 oder GRADE |
| Konsensbasierte Empfehlung (EK) | Expertenkonsens | - (ergibt sich aus Formulierung soll/sollte/kann) | - |
| Statement | Darlegung ohne Handlungsaufforderung | - | Oxford 1-5 oder GRADE |

## Konsensstärke

| Bezeichnung | Zustimmung |
|-------------|-----------|
| Starker Konsens | > 95% |
| Konsens | > 75-95% |
| Mehrheitliche Zustimmung | > 50-75% |

## Annotations-Schema pro Empfehlung

```yaml
id: "S3-5.0-{Empfehlungsnummer}"      # z.B. S3-5.0-4.73
kapitel: "{Kapitelnummer}"              # z.B. 4.5.4
kapitel_titel: ""                       # z.B. "Details Biomarker-Diagnostik"
empfehlung_nr: ""                       # z.B. "4.73"
typ: ""                                 # Evidenzbasiert | Konsensbasiert (EK) | Statement
empfehlungsgrad: ""                     # A | B | 0 | EK | -
evidenzlevel: ""                        # 1 | 2 | 3 | 4 | 5 | GRADE-Symbol | -
konsensstaerke: ""                      # Starker Konsens | Konsens | Mehrheitliche Zustimmung
status: ""                              # geprüft 2025 | neu 2025 | modifiziert 2025
text: ""                                # Originaltext der Empfehlung

# --- Kernannotation ---
datenobjekte:
  - name: ""                            # Bezeichnung des Datenobjekts
    beschreibung: ""                    # Was genau erfasst werden soll
    datentyp: ""                        # CodeableConcept | Quantity | string | boolean | ...
    terminologie:
      system: ""                        # z.B. SNOMED CT, LOINC, ICD-O-3
      version: ""                       # z.B. 2025-01-31
      code: ""                          # Konkreter Code (wenn eindeutig)
      display: ""                       # Anzeigetext
    wertebereich: ""                    # Erlaubte Werte / ValueSet
    verpflichtung: ""                   # obligat | empfohlen | optional
    bedingung: ""                       # Unter welcher Bedingung relevant

# --- FHIR-Mapping (sofern vorhanden) ---
fhir_mapping:
  profil: ""                            # z.B. Senologie_Pathologie_Befund
  element: ""                           # z.B. Observation.valueCodeableConcept
  status: ""                            # mapped | gap | partial
  anmerkung: ""                         # Freitextkommentar

# --- Querverweis ---
referenzen:
  s3_literatur: []                      # Literaturverweise [556], [557] etc.
  ago_kapitel: ""                       # Korrespondierendes AGO-Kapitel
  querschnittsleitlinien: []            # Verweis auf S3-Querschnittsleitlinien
  verwandte_empfehlungen: []            # Verweis auf andere Empfehlungen in dieser LL
```

## Verzeichnisstruktur

```
leitlinien-annotation/
  00-schema.md                          # Dieses Dokument
  01-uebersicht.md                      # Kapitelübersicht mit Empfehlungszählung
  s3-kap-4.5-pathologie.md             # Annotation pro Kapitel
  s3-kap-4.1-diagnostik.md
  ...
```

## Terminologie-Herkunft und Validierungsstatus

Die Leitlinie selbst liefert **klinische Klassifikationen**, aber **keine digitalen Terminologie-Codes**:

| Was die Leitlinie liefert | Was wir ergänzen (muss validiert werden) |
|---------------------------|------------------------------------------|
| TNM-Klassifikation (8. Auflage) | SNOMED CT Codes für TNM-Kategorien |
| WHO-Tumorklassifikation (5. Aufl.) | ICD-O-3 Morphologie-Codes |
| BI-RADS Kategorien (5. Aufl.) | ACR BI-RADS ValueSets |
| ASCO/CAP HER2-Scoring | LOINC-Codes für Biomarker-Observations |
| Elston/Ellis Grading | SNOMED CT Codes für Grading |
| B-Klassifikation (Biopsie) | Lokale CodeSystems |
| ICD-10-GM Codes (explizit benannt) | Direkt übernehmbar |
| Formblattvorschläge (Kap. 10.2/10.3) | Strukturierte Datenelemente |

### Terminologie-Mapping-Status pro Datenobjekt

```yaml
terminologie:
  system: ""
  version: ""
  code: ""
  display: ""
  mapping_quelle: ""        # leitlinie | mii-kds | standard | vorschlag
  validiert: false           # true wenn durch Fachexperten bestätigt
```

| mapping_quelle | Bedeutung |
|---------------|-----------|
| `leitlinie` | Code/System wird explizit in der Leitlinie benannt (z.B. ICD-10-GM C50) |
| `mii-kds` | Code stammt aus dem MII Kerndatensatz Onkologie (bereits validiert) |
| `standard` | Etabliertes Standard-Mapping (z.B. LOINC für ER/PR/HER2 Biomarker) |
| `vorschlag` | Von uns zugewiesen, **muss noch validiert werden** |

## Konventionen

1. **Empfehlungs-ID**: `S3-5.0-{Nr}` bzw. `AGO-2025-{Kapitel}-{Nr}`
2. **Terminologie-Versionen**: Immer die zum Zeitpunkt der Leitlinie gültige Version angeben
3. **Verpflichtung**: Leitet sich aus dem Empfehlungsgrad ab:
   - Grad A / "soll" = obligat
   - Grad B / "sollte" = empfohlen
   - Grad 0 / "kann" = optional
4. **FHIR-Mapping-Status**:
   - `mapped` = Datenobjekt ist vollständig in bestehendem Profil abgebildet
   - `partial` = Teilweise abgebildet, Ergänzung nötig
   - `gap` = Kein bestehendes Profil, neues Profil/Extension nötig
5. **Sprache**: Empfehlungstext immer im deutschen Original
6. **Terminologie-Transparenz**: Jedes Mapping muss eine `mapping_quelle` angeben. Alle `vorschlag`-Mappings sind Review-pflichtig.
