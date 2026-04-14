# Datenmodell

Das Senologie-Modul basiert auf einem logischen Modell, das die klinischen Datenpunkte der Brustkrebsversorgung strukturiert. Dieses Modell wird auf FHIR-Ressourcen abgebildet, die als Profile in diesem IG spezifiziert sind.

### Profilvererbung

Die Senologie-Profile erben entweder von MII-Kerndatensatzprofilen (wo onkologische Basisstrukturen benötigt werden) oder direkt von FHIR R4 Basisressourcen. Die Darstellung folgt dem klinischen Ablauf: Information → Entscheidung → Handlung.

#### Information (Anamnese, Risiko, Bildgebung, Pathologie)

{% include img.html img="profil-vererbung-information.png" caption="Vererbung — Informationserhebung" width="100%" %}

#### Diagnose & Workflow (Entscheidung)

{% include img.html img="profil-vererbung-diagnose.png" caption="Vererbung — Diagnose und Workflow" width="100%" %}

#### Therapie (Handlung)

{% include img.html img="profil-vererbung-therapie.png" caption="Vererbung — Therapeutische Maßnahmen" width="100%" %}

### Referenzmodell

Die Profile sind über FHIR-Referenzen miteinander verknüpft. Der Patient bildet den zentralen Ankerpunkt, die Diagnose ist die klinische Klammer für Therapie und Planung:

{% include img.html img="profil-referenzen.png" caption="Referenzbeziehungen zwischen Senologie-Profilen" width="100%" %}

### Logisches Modell

Das [logische Modell](StructureDefinition-LogicalModelSenologie.html) (BIH_LM_Senologie) beschreibt die klinische Domäne unabhängig von der technischen FHIR-Repräsentation. Es orientiert sich am Dokumentationsworkflow des Brustzentrums und der S3-Leitlinie.

| Domäne | Beschreibung | FHIR-Ressource(n) |
|---|---|---|
| Diagnose | Maligne und benigne Brusterkrankungen, Seitenlokalisation, Diagnosesicherung, Metastasierung | [Condition](StructureDefinition-senologie-diagnose-maligne.html), [Condition (benigne)](StructureDefinition-senologie-diagnose-benigne.html) |
| Vorstellung | Erst- vs. Verlaufsvorstellung mit Datum | *geplant: Encounter* |
| Allgemeine Anamnese | Lebensqualität (EQ-5D-5L) | *geplant: Observation* |
| Gynäkologische Anamnese | Menarche, Menopause, Schwangerschaften, HRT | [Observation](StructureDefinition-senologie-gynaekologische-anamnese.html) |
| Familienanamnese | Brust-/Eierstockkrebs bei Verwandten | [FamilyMemberHistory](StructureDefinition-senologie-familienanamnese.html) |
| Klinische Untersuchung | Palpation, Hautveränderungen, Mamillen, Lymphknoten | [Observation](StructureDefinition-senologie-klinische-untersuchung.html) |
| Bildgebung Mamma | Mammographie, Sonographie, MRT, Tomosynthese mit BI-RADS/ACR | [DiagnosticReport](StructureDefinition-senologie-bildgebung-befund.html), [Observation](StructureDefinition-senologie-bildgebung-observation.html) |
| Bildgebung Sonstige | Staging-Bildgebung (Skelettszintigraphie, CT, PET-CT etc.) | [DiagnosticReport](StructureDefinition-senologie-bildgebung-sonstige.html) |
| Pathologie | Histologie, Rezeptorstatus (ER, PR, HER2, Ki-67), B3-Läsionen | [DiagnosticReport](StructureDefinition-senologie-pathologie-befund.html), [Specimen](StructureDefinition-senologie-pathologie-praeparat.html) |
| Tumorlokalisation | Quadrant, Uhrzeigerposition, Mamillenabstand | [BodyStructure](StructureDefinition-senologie-tumorlokalisation.html) |
| Genexpressionstest | Oncotype DX, MammaPrint, Prosigna, EndoPredict | [RiskAssessment](StructureDefinition-senologie-genexpressionstest.html), [Observation](StructureDefinition-senologie-genexpressions-score.html) |
| Operation | Brustoperation mit Intention, Subprozeduren, Komplikationen | [Procedure](StructureDefinition-senologie-operation.html) |
| OP-Planung | Präoperative Planung (Dauer, Markierung, Lagerung) | [ServiceRequest](StructureDefinition-senologie-op-planung.html) |
| Operative Komplikation | Clavien-Dindo-Klassifikation | [Observation](StructureDefinition-senologie-operative-komplikation.html) |
| Systemische Therapie | Chemotherapie, Hormontherapie, zielgerichtete Therapie, Immuntherapie | [Procedure](StructureDefinition-senologie-systemtherapie-procedure.html), [MedicationStatement](StructureDefinition-senologie-systemtherapie-medikation.html), [MedicationRequest](StructureDefinition-senologie-geplante-systemtherapie.html) |
| Strahlentherapie | Bestrahlung mit Dosis, Boost, Fraktionierung | [Procedure](StructureDefinition-senologie-strahlentherapie.html) |
| Tumorkonferenz | Interdisziplinäre Therapieempfehlungen | [CarePlan](StructureDefinition-senologie-tumorboard-empfehlung.html) |
| Implantat | Brustimplantate (Typ, Hersteller, Seriennummer) | [Device](StructureDefinition-senologie-brustimplantat.html) |
| Medikation | Begleitmedikation | *geplant: MedicationStatement* |
| Studienteilnahme | Klinische Studien | *geplant: ResearchSubject* |

### Operationen als Unterprozeduren

Auch wenn im klinischen Alltag ein operativer Eingriff als eine Operation bezeichnet wird, ist zur datengenauen Darstellung die Unterscheidung in mehrere Sub-Eingriffe erforderlich:

- Gleiche oder ähnliche Eingriffe an beiden Seiten (links, rechts) als getrennte Eingriffe
- Intraoperatives Entfernen der Lymphknoten bei Lymphmetastasierung als getrennter Eingriff von der Resektion
- Rekonstruktion (autolog oder implantatbasiert) als getrennter Eingriff von Resektion

Eine übergeordnete `Procedure` kann definiert werden, auf die von den Subprozeduren über `Procedure.partOf` verwiesen wird. Ausnahme: Observations und Komplikationen, die sich explizit auf eine bestimmte Subprozedur beziehen (z.B. Implantatrevision).

### Terminologien

| System | Verwendung |
|---|---|
| SNOMED CT | Diagnosen, Prozeduren, Befunde, Medikamente |
| ICD-10-GM | Diagnosekodierung (Krebsregister, DRG) |
| LOINC | Laborwerte, Bildgebungsmodalitäten |
| RadLex | Radiologische Befundkategorien (ACR, BI-RADS) |
| ATC | Arzneimittelklassifikation |
| ASK | Arzneistoffkatalog |
| OPS | Operationen- und Prozedurenschlüssel |
| oBDS | Onkologischer Basisdatensatz |

Für die Medikamenten-Terminologie stehen [ConceptMaps](terminologie-medikation.html) bereit, die SNOMED CT auf ATC und ASK abbilden.
