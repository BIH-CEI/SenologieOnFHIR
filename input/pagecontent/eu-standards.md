# Einordnung in EU- und internationale Standards

Der Kerndatensatz Senologie ist als nationale Spezifikation für die Brustkrebsversorgung konzipiert, nimmt aber bewusst Bezug auf den europäischen und internationalen Kontext. Diese Seite ordnet den Kerndatensatz in die relevanten Spezifikationsebenen ein.

### European Health Data Space (EHDS)

Die [EHDS-Verordnung](https://health.ec.europa.eu/ehealth-digital-health-and-care/european-health-data-space-regulation-ehds_en) (in Kraft seit März 2025) definiert prioritäre Kategorien von Gesundheitsdaten, die EU-weit interoperabel ausgetauscht werden sollen. [HL7 Europe](https://www.hl7europe.org/new-hl7-europe-fhir-implementation-guides-to-support-the-european-health-data-space/) entwickelt dafür FHIR Implementation Guides:

| EHDS-Kategorie | EU FHIR IG | Status (2026) | Relevanz für Senologie |
|---|---|---|---|
| **Patient Summary** (EPS) | HL7 Europe IPS | STU | Bestandsmedikation, Allergien, Vorerkrankungen → [IPS-Prepopulation](ips-prepopulation.html) |
| **Laboratory Report** | HL7 Europe Laboratory | STU | Laborwerte (Tumormarker, Blutbild unter Chemotherapie) |
| **Medical Imaging Report** | HL7 Europe Imaging Study | Ballot | Mammographie, Sonographie, MRT-Befunde → kompatibel mit Senologie_Bildgebung_Befund |
| **Hospital Discharge Report** | HL7 Europe HDR | In Arbeit | Entlassbrief nach OP, Therapieabschluss |
| **ePrescription / eDispensation** | HL7 Europe eP/eD | STU | Ambulante Verordnungen: endokrine Therapie (Tamoxifen, Letrozol), orale Chemotherapie (Capecitabin), supportive Medikation. Nicht relevant für stationär/tagesklinisch administrierte i.v.-Chemotherapie. |
| **Pathology Report** | *(noch kein EU IG)* | — | Wird national über MII Patho abgebildet; EU-IG mittelfristig zu erwarten |

### Bezug des Kerndatensatzes zu EU-Kategorien

Der Kerndatensatz bildet Inhalte ab, die mehrere EU-Kategorien berühren:

**Bildgebung** — Die Senologie-Profile für Bildgebungsbefunde (Mammographie, Sonographie, MRT mit BI-RADS/ACR) sind inhaltlich kompatibel mit dem entstehenden [HL7 Europe Imaging Study IG](https://hl7europe.eu/new-webinar-the-hl7-europe-imaging-study-fhir-ig-and-how-to-contribute/). Die Basis-Ressource (DiagnosticReport) und die Modalitätskodierung (LOINC, RadLex) sind abgestimmt. Die senologiespezifischen Ergänzungen (BI-RADS-Kategorien, ACR-Dichte, Quadrantenlokalisation) sind Spezialisierungen, die auf dem EU-Standard aufsetzen können.

**Pathologie** — Für Pathologiebefunde existiert auf EU-Ebene noch kein eigenständiger FHIR IG. Der Kerndatensatz nutzt die MII-Pathologie-Profile (`MII_PR_Patho_Report`, `MII_PR_Patho_Specimen`) als Basis. Sobald ein EU Pathology Report IG entsteht, sollte die Kompatibilität geprüft und ggf. eine Migration der Parent-Profile angestoßen werden.

**Laborbefunde** — Laborwerte (z.B. Tumormarker, Blutbild unter Chemotherapie) sind aktuell nicht im Senologie-Scope (→ MII Labor-Modul). Der HL7 Europe Laboratory IG definiert das EU-Format. Eine zukünftige Integration könnte relevante Laborwerte über den EU-Standard beziehen.

**Patientenzusammenfassung** — Die Allgemeine Anamnese (Vorerkrankungen, Medikation, Allergien) ist bewusst nicht im Senologie-Scope. Sie soll über die [IPS-/EPS-basierte Prepopulation](ips-prepopulation.html) aus der ePA oder einer EU Patient Summary bezogen werden.

### Nationale Spezifikationsebenen

Der Kerndatensatz positioniert sich zwischen den nationalen Basisstandards und der klinischen Domäne:

```
┌─────────────────────────────────────────────────────────────┐
│  EU / International                                          │
│  HL7 FHIR R4  ·  IPS/EPS  ·  EU Lab/Imaging  ·  SNOMED CT  │
├─────────────────────────────────────────────────────────────┤
│  DE National                                                 │
│  ISiK  ·  MII Kerndatensatz  ·  DE Basisprofile  ·  ePA     │
├─────────────────────────────────────────────────────────────┤
│  Domäne Onkologie                                            │
│  MII Onkologie  ·  MII Pathologie  ·  MII Bildgebung         │
├─────────────────────────────────────────────────────────────┤
│  Fachgebiet Senologie                                        │
│  ► Kerndatensatz Senologie ◄                                  │
│  S3-Leitlinie  ·  DGS  ·  DKG-Zertifizierung                 │
└─────────────────────────────────────────────────────────────┘
```

Jede Ebene erbt von der darüberliegenden und spezialisiert sie für den jeweiligen Kontext. Der Kerndatensatz Senologie ist die **unterste, fachspezifischste Ebene** — er setzt die S3-Leitlinie und die Anforderungen der Brustzentren technisch um, nutzt dabei aber durchgängig die Standards der darüberliegenden Ebenen.

### Terminologie-Kontext

| Terminologie | Ebene | Verwendung im Senologie-KDS |
|---|---|---|
| **SNOMED CT** | International | Primäre klinische Kodierung (Diagnosen, Prozeduren, Befunde) |
| **LOINC** | International | Laborwerte, Bildgebungsmodalitäten, Beobachtungscodes |
| **ICD-10-GM** | DE National | Diagnosekodierung (DRG, Krebsregister) |
| **ICD-O-3** | International (WHO) | Morphologie (Histologie), Topographie |
| **OPS** | DE National | Prozedurenkodierung (KIS) |
| **ATC-WHO** | International (WHO) | Arzneimittelklassifikation — EU-weit das primäre Kodiersystem für Medikamente (EMA, EHDS ePrescription). Der Kerndatensatz kodiert Medikamente primär in SNOMED CT und stellt [ConceptMaps](terminologie-medikation.html) (SNOMED CT → ATC) für den europäischen Austausch bereit. |
| **ATC-DE** | DE National (BfArM) | Deutsche ATC-Erweiterung — relevant für die Krebsregistermeldung (oBDS). Unterscheidet sich in einzelnen Codes von ATC-WHO. |
| **UNII** | International (FDA) | Unique Ingredient Identifier — für Studienmedikationen und regulatorische Zwecke. Relevant bei klinischen Studien (z.B. IND-Arzneimittel). |
| **INN** | International (WHO) | International Nonproprietary Name — wirkstoffbasierte Benennung, herstellerunabhängig. Standard für Studienprotokolle und wissenschaftliche Kommunikation. |
| **RadLex** | International (RSNA) | Radiologische Befundkategorien (ACR-Dichte) |

Wo internationale Terminologien Lücken aufweisen, werden [Vorschläge für das BfArM](terminologie-uebersicht.html) als nationales SNOMED-CT-Release-Center dokumentiert.

### Kompatibilitätsziele

| Standard | Kompatibilitätsziel | Status |
|---|---|---|
| **ISiK** | Encounter, Patient, Condition, Procedure kompatibel | Vorhanden (ISiK als Dependency) |
| **MII Kerndatensatz** | Profile erben von MII Onko, Patho, Bildgebung | Vorhanden (Parent-Profile) |
| **EU IPS/EPS** | Allgemeine Anamnese aus IPS beziehbar | Dokumentiert ([IPS-Prepopulation](ips-prepopulation.html)) |
| **EU Imaging Report** | Bildgebungsbefunde strukturell kompatibel | Konzeptuell, formale Prüfung ausstehend |
| **EU Laboratory Report** | Laborwerte aus EU Lab beziehbar | Noch nicht integriert (MII Labor-Modul als Zwischenschritt) |
| **EHDS Sekundärnutzung** | Daten für Forschung über EHDS nutzbar | Vorbereitet (SQL on FHIR, CQL) |

### Weiterentwicklung

Mit dem Fortschreiten der EU-Implementing-Acts (erwartet Anfang 2027) und der Veröffentlichung weiterer EU FHIR IGs wird die Kompatibilität des Kerndatensatzes regelmäßig geprüft. Insbesondere:

- **EU Pathology Report** — sobald ein IG entsteht, Abgleich mit MII Patho / Senologie Pathologie
- **EU Imaging Report** — formale Kompatibilitätsprüfung der Senologie-Bildgebungsprofile
- **EHDS Sekundärnutzung** — Bereitstellung der Senologie-Daten über die nationale Kontaktstelle

Die Einbettung in den europäischen Kontext ist eines der langfristigen Ziele des Kerndatensatzes — die technische Grundlage dafür ist mit FHIR R4, SNOMED CT und LOINC bereits gelegt.
