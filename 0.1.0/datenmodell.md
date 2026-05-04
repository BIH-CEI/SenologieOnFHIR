# Datenmodell - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* **Datenmodell**

## Datenmodell

# Datenmodell

Das Senologie-Modul basiert auf einem logischen Modell, das die klinischen Datenpunkte der Brustkrebsversorgung strukturiert. Dieses Modell wird auf FHIR-Ressourcen abgebildet, die als Profile in diesem IG spezifiziert sind.

### Profilvererbung

Die Senologie-Profile erben entweder von MII-Kerndatensatzprofilen (wo onkologische Basisstrukturen benötigt werden) oder direkt von FHIR R4 Basisressourcen. Die Darstellung folgt dem klinischen Ablauf: Information → Entscheidung → Handlung.

#### Information (Anamnese, Risiko, Bildgebung, Pathologie)

**Diagramm wird in einer zukünftigen Version ergänzt.**

#### Diagnose & Workflow (Entscheidung)

**Diagramm wird in einer zukünftigen Version ergänzt.**

#### Therapie (Handlung)

**Diagramm wird in einer zukünftigen Version ergänzt.**

### Referenzmodell

Die Profile sind über FHIR-Referenzen miteinander verknüpft. Der Patient bildet den zentralen Ankerpunkt, die Diagnose ist die klinische Klammer für Therapie und Planung:

**Diagramm wird in einer zukünftigen Version ergänzt.**

### Logisches Modell

Das [logische Modell](StructureDefinition-LogicalModelSenologie.md) (BIH_LM_Senologie) beschreibt die klinische Domäne unabhängig von der technischen FHIR-Repräsentation. Es orientiert sich am Dokumentationsworkflow des Brustzentrums und der S3-Leitlinie.

| | | |
| :--- | :--- | :--- |
| Diagnose | Maligne und benigne Brusterkrankungen, Seitenlokalisation, Diagnosesicherung, Metastasierung | [Condition](StructureDefinition-senologie-diagnose-maligne.md),[Condition (benigne)](StructureDefinition-senologie-diagnose-benigne.md) |
| Vorstellung | Erst- vs. Verlaufsvorstellung mit Datum | **geplant: Encounter** |
| Allgemeine Anamnese | Lebensqualität (EQ-5D-5L) | **geplant: Observation** |
| Gynäkologische Anamnese | Menarche, Menopause, Schwangerschaften, HRT | [Observation](StructureDefinition-senologie-gynaekologische-anamnese.md) |
| Familienanamnese | Brust-/Eierstockkrebs bei Verwandten | [FamilyMemberHistory](StructureDefinition-senologie-familienanamnese.md) |
| Klinische Untersuchung | Palpation, Hautveränderungen, Mamillen, Lymphknoten | [Observation](StructureDefinition-senologie-klinische-untersuchung.md) |
| Bildgebung Mamma | Mammographie, Sonographie, MRT, Tomosynthese mit BI-RADS/ACR | [DiagnosticReport](StructureDefinition-senologie-bildgebung-befund.md),[Observation](StructureDefinition-senologie-bildgebung-observation.md) |
| Bildgebung Sonstige | Staging-Bildgebung (Skelettszintigraphie, CT, PET-CT etc.) | [DiagnosticReport](StructureDefinition-senologie-bildgebung-sonstige.md) |
| Pathologie | Histologie, Rezeptorstatus (ER, PR, HER2, Ki-67), B3-Läsionen | [DiagnosticReport](StructureDefinition-senologie-pathologie-befund.md),[Specimen](StructureDefinition-senologie-pathologie-praeparat.md) |
| Tumorlokalisation | Quadrant, Uhrzeigerposition, Mamillenabstand | [BodyStructure](StructureDefinition-senologie-tumorlokalisation.md) |
| Genexpressionstest | Oncotype DX, MammaPrint, Prosigna, EndoPredict | [RiskAssessment](StructureDefinition-senologie-genexpressionstest.md),[Observation](StructureDefinition-senologie-genexpressions-score.md) |
| Operation | Brustoperation mit Intention, Subprozeduren, Komplikationen | [Procedure](StructureDefinition-senologie-operation.md) |
| OP-Planung | Präoperative Planung (Dauer, Markierung, Lagerung) | [ServiceRequest](StructureDefinition-senologie-op-planung.md) |
| Operative Komplikation | Clavien-Dindo-Klassifikation | [Observation](StructureDefinition-senologie-operative-komplikation.md) |
| Systemische Therapie | Chemotherapie, Hormontherapie, zielgerichtete Therapie, Immuntherapie | [Procedure](StructureDefinition-senologie-systemtherapie-procedure.md),[MedicationStatement](StructureDefinition-senologie-systemtherapie-medikation.md),[MedicationRequest](StructureDefinition-senologie-geplante-systemtherapie.md) |
| Strahlentherapie | Bestrahlung mit Dosis, Boost, Fraktionierung | [Procedure](StructureDefinition-senologie-strahlentherapie.md) |
| Tumorkonferenz | Interdisziplinäre Therapieempfehlungen | [CarePlan](StructureDefinition-senologie-tumorboard-empfehlung.md) |
| Implantat | Brustimplantate (Typ, Hersteller, Seriennummer) | [Device](StructureDefinition-senologie-implantat.md) |
| Medikation | Begleitmedikation | **geplant: MedicationStatement** |
| Studienteilnahme | Klinische Studien | **geplant: ResearchSubject** |

### Operationen als Unterprozeduren

Auch wenn im klinischen Alltag ein operativer Eingriff als eine Operation bezeichnet wird, ist zur datengenauen Darstellung die Unterscheidung in mehrere Sub-Eingriffe erforderlich:

* Gleiche oder ähnliche Eingriffe an beiden Seiten (links, rechts) als getrennte Eingriffe
* Intraoperatives Entfernen der Lymphknoten bei Lymphmetastasierung als getrennter Eingriff von der Resektion
* Rekonstruktion (autolog oder implantatbasiert) als getrennter Eingriff von Resektion

Eine übergeordnete `Procedure` kann definiert werden, auf die von den Subprozeduren über `Procedure.partOf` verwiesen wird. Ausnahme: Observations und Komplikationen, die sich explizit auf eine bestimmte Subprozedur beziehen (z.B. Implantatrevision).

### Terminologien

| | |
| :--- | :--- |
| SNOMED CT | Diagnosen, Prozeduren, Befunde, Medikamente |
| ICD-10-GM | Diagnosekodierung (Krebsregister, DRG) |
| LOINC | Laborwerte, Bildgebungsmodalitäten |
| RadLex | Radiologische Befundkategorien (ACR, BI-RADS) |
| ATC | Arzneimittelklassifikation |
| ASK | Arzneistoffkatalog |
| OPS | Operationen- und Prozedurenschlüssel |
| oBDS | Onkologischer Basisdatensatz |

Für die Medikamenten-Terminologie stehen [ConceptMaps](terminologie-medikation.md) bereit, die SNOMED CT auf ATC und ASK abbilden.

