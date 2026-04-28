# Bekannte Fehler und Limitierungen

Diese Seite dokumentiert bekannte QA-Fehler und Validierungslimitierungen im aktuellen Build. Die aufgeführten Meldungen betreffen **Tooling- und Infrastruktur-Einschränkungen**, nicht inhaltliche Fehler in den Profilen oder Testdaten. Sie sind in der Datei `ignoreWarnings.txt` unterdrückt.

Die Fehlerquellen lassen sich in folgende Kategorien einteilen:

| Kategorie | Ursache | Anteil |
|---|---|---|
| [TX-Proxy](#tx-proxy-limitierungen) | Terminologieserver-Einschränkungen | ~35% |
| [StructureMap Validation](#structuremap-validation) | IG Publisher kann Logical-Model-Pfade nicht auflösen | ~15% |
| [SDC 4.0.0](#sdc-400-validierung) | Strengere Validierung von contained resources und Extensions | ~15% |
| [BCP-47 Sprache](#bcp-47-sprachvalidierung) | TX-Proxy hat kein BCP-47 CodeSystem | ~10% |
| [OPS ValueSet](#ops-codes-nicht-im-mii-valueset) | MII ValueSet enthält nicht alle OPS-Subkategorien | ~10% |
| [Questionnaire LinkIds](#questionnaire-linkid-mismatch) | QR-LinkIds referenzieren FSH-Questionnaire statt JSON-Template | ~10% |
| [Sonstiges](#sonstige-meldungen) | Slicing, FHIR-Version, IPS-Links | ~5% |

---

## TX-Proxy Limitierungen

**Ursache:** Der Build nutzt den MII Ontoserver über einen lokalen TX-Proxy (`localhost:3000`). Einige Validierungsanfragen schlagen fehl, weil der Ontoserver bestimmte CodeSysteme oder ValueSets nicht vollständig geladen hat.

**Auswirkung:** Falsch-positive Validierungsfehler bei korrekten Codes. Die Codes selbst sind korrekt und funktionieren in Produktivsystemen.

{:.stu-note}
Die folgenden Meldungen sind TX-Proxy-bedingt und stellen keine inhaltlichen Fehler dar.

### Unbekannte Codes

SNOMED CT, LOINC und RadLex Codes, die der TX-Proxy nicht auflösen kann:

| Code | System | Klinische Bedeutung |
|---|---|---|
| `784163009` | SNOMED CT | Sentinel-Lymphknoten-Biopsie |
| `784176009` | SNOMED CT | Sentinel-Lymphknoten |
| `301782006` | SNOMED CT | Klinisches Staging |
| `285345009` | SNOMED CT | Mammographie-Befund |
| `127465003` | SNOMED CT | Chemotherapie-Schema |
| `119380005` | SNOMED CT | Gewebeprobe |
| `241736003` | SNOMED CT | Bildgebung der Mamma |
| `300886002` | SNOMED CT | BI-RADS Klassifikation |
| `373945005` | SNOMED CT | Strahlentherapie |
| `183040004` | SNOMED CT | Nachsorge |
| `870370003` | SNOMED CT | Referenz zu anderem Encounter |
| `72018-2` | LOINC | TNM-Staging |
| `39638-7` | LOINC | Histologischer Grad |
| `87858-9` | LOINC | Genexpressionstest |
| `RID3933` | RadLex | Körperstruktur |
| `RID58844` | RadLex | Körperstruktur |

### DosageQuantity und UnitsOfTime

Der TX-Proxy kann die ValueSets `Dosage DoseQuantity ValueSet` und `UnitsOfTime` nicht validieren. Die verwendeten Einheiten (`d`, `wk`) sind korrekte UCUM-Codes.

### Senologie-Seite ValueSet

Die Codierung wird als nicht im ValueSet `VS Senologie Seite` befindlich gemeldet — ein TX-Proxy-Validierungsfehler.

---

## StructureMap Validation

**Ursache:** Der IG Publisher (v2.2.6) kann BackboneElement-Pfade in Logical Models nicht auflösen. Die betroffenen StructureMaps sind korrekt und funktionieren in [Matchbox](https://www.matchbox.health/).

**Auswirkung:** Fehler der Klassen `SM_TARGET_PATH_INVALID`, `SM_SOURCE_PATH_INVALID`, `SM_RULEGROUP_NOT_FOUND` und `SM_TARGET_CONTEXT_UNKNOWN` bei der Validierung von StructureMaps, die logische Modelle als Quelle oder Ziel verwenden.

{:.stu-note}
Diese Fehler sind ein bekanntes Problem des IG Publishers. Die StructureMaps wurden erfolgreich in Matchbox getestet.

Zusätzlich erkennt der Publisher `Bundle.entry.resource` nicht als konkreten Typ (Condition, Procedure, etc.), wenn über eine `where()`-Klausel gefiltert wird. Dies erzeugt Meldungen der Form: *"Der Parameter 'src' bezieht sich auf die Variable '%…'"*.

---

## SDC 4.0.0 Validierung

**Ursache:** Das Upgrade auf SDC 4.0.0 führt zu strengerer Validierung von contained resources, Extensions und Template-Extraction-Mechanismen.

**Auswirkung:** Validierungsfehler bei korrekten SDC-Konstrukten, die in SDC 3.0.0 noch akzeptiert wurden.

Betroffene Bereiche:

- **templateExtractValue / extractResourceId Extensions** — Der Validator akzeptiert die Typen `[string]` bzw. `[url]` nicht korrekt
- **templateExtract Extension** — wird als leerer Typ `[]` gemeldet
- **Slicing-Constraints** — `Extension.extension:name` und `Extension.extension:template` werden als fehlend gemeldet, obwohl sie vorhanden sind
- **Contained Resource Constraints** — `Extension.extension: mindestens erforderlich = 1`, `Extension.value[x]: maximal erlaubt = 0`, `Constraint failed: sdc-lcext-1`
- **extractResourceId** — `inv-1` Regel schlägt fehl (SDC 3.0.0 Extension in SDC 4.0.0 Kontext)
- **Condition.extension:Feststellungsdatum** — Template-bedingte Slice-Zuordnung schlägt fehl

{:.stu-note}
Diese Fehler werden voraussichtlich durch ein Update des IG Publishers oder SDC-Tooling behoben. Die SDC-Extraction-Logik wurde funktional in Matchbox getestet.

---

## BCP-47 Sprachvalidierung

**Ursache:** Der MII Ontoserver hat kein BCP-47 CodeSystem (`urn:ietf:bcp:47`) geladen. SDC 4.0.0 validiert `language`-Bindings strenger als frühere Versionen.

**Auswirkung:** Falsch-positive Fehler für korrekte BCP-47 Sprachcodes:

- `de-DE` und `de` — Deutsch
- `en-US` und `en` — Englisch

Meldungen: *"Der angegebene Wert ('de-DE') ist nicht im ValueSet 'All Languages'"* und *"Die System-URI konnte für den Code de-DE nicht aufgelöst werden"*.

---

## OPS-Codes nicht im MII ValueSet

**Ursache:** Das MII-Onkologie-ValueSet für Prozeduren enthält nicht alle OPS-Subkategorien, die in der senologischen Dokumentation benötigt werden.

**Auswirkung:** Korrekte OPS-Codes werden als nicht im ValueSet befindlich gemeldet.

Betroffene Codes:

| OPS-Code | Bedeutung |
|---|---|
| `5-870.a0` | Partielle Mastektomie — Segmentresektion |
| `5-870.a1` | Partielle Mastektomie — Segmentresektion mit Axilladissektion |
| `5-870.91` | Partielle Mastektomie — Quadrantenresektion |
| `5-872` | Mastektomie |
| `5-401.11` | Axilläre Lymphadenektomie — Level I |
| `5-402.11` | Axilläre Lymphadenektomie — Level I-II |
| `5-402.12` | Axilläre Lymphadenektomie — Level I-III |
| `5-886.17` | Andere plastische Rekonstruktion der Brust |
| `8-547.32` | Chemotherapie — Schema angegeben |

Zusätzlich werden OPS-Displays als falsch gemeldet (*"Wrong Display Name"*), weil OPS keine englischsprachigen Displays hat und der TX-Server `en-US` erwartet.

---

## Questionnaire LinkId Mismatch

**Ursache:** Die QuestionnaireResponse-Beispiele referenzieren LinkIds aus dem FSH-generierten Questionnaire. Das Diagnose-Template (JSON) verwendet abweichende LinkIds.

**Auswirkung:** Meldungen der Form *"LinkId 'diagnose-sct' im Questionnaire nicht gefunden"* bei der Validierung der QuestionnaireResponses.

Betroffene LinkIds:

- `diagnose-sct`, `diagnose-icd10`, `diagnose-icd10-display`, `diagnose-text`
- `seitenlokalisation`, `feststellungsdatum`, `recorded-date`
- `diagnosesicherung`, `stadium-summary`, `metastasen-summary`
- `clinical-status`, `onset`

{:.stu-note}
Dieses Problem wird durch die Anpassung der QuestionnaireResponses an das Diagnose-Template behoben (siehe [se-9bu](https://github.com/BIH-CEI/SenologieOnFHIR/issues)).

---

## Sonstige Meldungen

### FHIR-Version Mismatch (subscriptions-backport)

Das Paket `hl7.fhir.uv.subscriptions-backport` ist für eine andere FHIR-Version deklariert als dieser IG (4.0.1). Dies ist ein transitives Dependency-Problem und hat keine funktionale Auswirkung.

### IPS ValueSet Link

Das IPS Target-Site ValueSet (`http://hl7.org/fhir/uv/ips/ValueSet/target-site-uv-ips`) wird transitiv über MII Pathologie/Bildgebung eingebunden. Der Link wird als ungültig gemeldet, da das IPS-Paket nicht direkt als Dependency deklariert ist.

### Specimen Slicing (MII Patho)

Die Slice-Definition für `Specimen.processing:lagerprozess.extension` hat ein Minimum von 0, aber die Slices ergeben ein Minimum von 1. Dies ist ein Constraint-Problem im MII Pathologie-Profil.

### Observation Slicing (MII Onko Verlauf)

Das MII Onko Verlauf-Profil erwartet einen `Observation.code.coding:snomed`-Slice. Das Senologie-Profil verwendet LOINC als primären Code, wodurch der SNOMED-Slice als fehlend gemeldet wird.

### Observation Slicing (LOINC Discriminator)

Allgemeine Slicing-Meldungen der Form *"Slicing kann nicht ausgewertet werden: Diskriminator …"*. Diese treten auf, wenn der Validator den Slicing-Discriminator nicht auflösen kann.

### Condition.extension (Template-bedingt)

`Condition.extension: mindestens erforderlich = 1, aber nur gefunden 0` — entsteht durch die Template-basierte Extraction, bei der Extensions kontextabhängig gesetzt werden.
