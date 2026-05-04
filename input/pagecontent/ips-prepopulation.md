# IPS/EPS-Prepopulation

Dieses Kapitel dokumentiert, welche Datenpunkte der senologischen Dokumentation potenziell aus einer **International Patient Summary (IPS)** bzw. **European Patient Summary (EPS)** vorbelegt werden können.

### Hintergrund

Die Allgemeine Anamnese im Brustzentrum erhebt umfangreiche Daten zu Vorerkrankungen, Medikation, Allergien und sozialem Hintergrund. Viele dieser Informationen liegen bei Patientinnen mit bestehender digitaler Gesundheitsakte bereits strukturiert vor — insbesondere über die IPS, die als FHIR-Dokument (Bundle) standardisiert ist.

Eine Vorbelegung (Prepopulation) dieser Felder kann:
- **Dokumentationsaufwand** für Kliniker und Patientinnen reduzieren
- **Datenqualität** verbessern (kodierte Vorerkrankungen statt Freitext)
- **Internationale Patientinnen** unterstützen, deren Vorbefunde über die EPS bereitgestellt werden

### Prepopulation-Modell

Die Vorbelegung ist **nicht deterministisch** — sie liefert Vorschläge, die klinisch bestätigt oder korrigiert werden müssen:

- IPS-Daten können veraltet oder unterschiedlich granular sein
- Die klinische Fragestellung ist oft spezifischer als die IPS-Dokumentation (z.B. "Bluthochdruck" vs. "welche Herz-Kreislauf-Erkrankung genau?")
- Kodierungssysteme können abweichen (IPS: ICD-10-WHO/SNOMED CT, Dokumentationssystem: teils lokale Codes)

Technisch kann die Vorbelegung über `sdc-questionnaire-initialExpression` (FHIRPath) im SDC-Questionnaire erfolgen.

### Mapping: Anamnese-Felder → IPS-Sektionen

#### Vollständig prepopulierbar

| Anamnese-Datenpunkt | IPS-Sektion | IPS-Ressource | Anmerkung |
|---|---|---|---|
| Vorerkrankungen (Herz-Kreislauf, Atemwege, Gefäße, Neurologie, Verdauung, Haut, Rheumatologie, Nieren/Urogenital, Psyche, Infektionen, Krebs) | Past Illness History | Condition | IPS enthält aktive und abgeschlossene Diagnosen. Granularität kann abweichen. |
| Allergien | Allergies and Intolerances | AllergyIntolerance | **IPS-Pflichtsektion** — immer vorhanden. |
| Regelmäßige Medikation (Bestandsmedikation) | Medications | MedicationStatement | **IPS-Pflichtsektion**. In der ePA über die **ePA-Medikationsliste (eML)**, den **Bundesmedikationsplan (BMP)** und aggregierte **E-Rezept-Verordnungen** verfügbar. Die Bestandsmedikation (Metoprolol, L-Thyroxin etc.) muss nicht im Brustzentrum erfasst werden, sondern kann aus der ePA/KIS übernommen werden. |
| Voroperationen | Procedure History | Procedure | Kodierung über SNOMED CT oder OPS. |
| Schwangerschaft (aktuell) | Pregnancy | Observation | IPS-Sektion mit Status und erwartetem Entbindungsdatum. |
| Implantate (Metall, MRT-Fähigkeit) | Medical Devices | DeviceUseStatement | IPS-Sektion für aktive Implantate. |
| Größe, Gewicht, BMI | Vital Signs | Observation | IPS-Sektion. Aktualität prüfen. |
| Raucherstatus | Social History | Observation | IPS-Sektion. Detailgrad (Pack Years, Zigaretten/Tag) variiert. |
| Patientenverfügung / Vorsorgevollmacht | Advance Directives | Consent | IPS-Sektion. Inhalt und Gültigkeit prüfen. |

#### Teilweise prepopulierbar

| Anamnese-Datenpunkt | IPS-Sektion | Einschränkung |
|---|---|---|
| Alkoholkonsum | Social History | IPS hat Social History, aber nicht AUDIT-C-Detailgrad |
| Drogenkonsum | Social History | IPS hat Substanzgebrauch, aber nicht spezifisch |
| Allgemeinzustand (ECOG) | Functional Status | IPS hat funktionalen Status, aber nicht zwingend ECOG |
| Blutgerinnungsstörung | Past Illness History | Als Condition vorhanden, aber Detailfragen (Zahnfleischbluten, Nachblutung) fehlen |
| Geschlecht bei Geburt | Patient | `Patient.gender` bzw. Geburtsgeschlecht-Extension — Semantik kann abweichen |

#### Nicht prepopulierbar (nicht in IPS)

| Anamnese-Datenpunkt | Grund |
|---|---|
| Menopausenstatus | Nicht in IPS — wird im Senologie-Modul über Gynäkologische Anamnese erfasst |
| Bildungsabschluss | Soziodemographisch, nicht in IPS |
| Beziehungsstatus | Soziodemographisch, nicht in IPS |
| Wohnsituation | Soziodemographisch, nicht in IPS |
| Beschäftigungsstatus | Soziodemographisch, nicht in IPS |
| Pflegegrad | DE-spezifisch, nicht in IPS |
| Soziale Belastungen | Nicht standardisiert |
| Hör-/Sehbeeinträchtigung | Nicht als eigene IPS-Sektion |
| Detailfragen (z.B. NYHA-Schweregrad bei Herzinsuffizienz, Diabetische Organschäden) | IPS liefert die Diagnose, aber nicht den klinischen Detailgrad |

### Implikationen für den IG

{:.stu-note}
Die Allgemeine Anamnese wird bewusst **nicht** im Scope dieses Moduls profiliert. Die Datenpunkte sind nicht senologiespezifisch und sollten aus übergreifenden Quellen (IPS/EPS, KIS-Stammdaten) übernommen werden. Das Senologie-Modul definiert lediglich die **senologiespezifischen** Anamnese-Profile (Gynäkologische Anamnese, Familienanamnese).

Mittelfristig sollte die Prepopulation über IPS als SDC-Feature implementiert werden:

```
// Beispiel: Vorbelegung Allergien aus IPS
* item[+]
  * linkId = "allergien"
  * text = "Haben Sie Allergien?"
  * type = #choice
  * extension[sdc-questionnaire-initialExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%patient.reverseResolve(AllergyIntolerance.patient).exists()"
```

### Relevante Standards

Für die Prepopulation kommen mehrere Quellen in Frage:

| Standard | Beschreibung | Relevanz |
|---|---|---|
| **HL7 IPS** | International Patient Summary — globaler Standard für Patientenzusammenfassungen | Internationale Patientinnen, Forschungskontext |
| **European Patient Summary (EPS)** | EU-weite Umsetzung über eHDSI/MyHealth@EU | Europäische Patientinnen, grenzüberschreitende Versorgung |
| **MIO Patientenkurzakte (PKA)** | Deutsche IPS-Umsetzung der KBV/mio42 für die ePA | **Primäre Quelle** für deutsche Patientinnen — enthält Diagnosen, Medikation, Allergien, Prozeduren, Implantate |
| **ePA Medikationsliste** | Bundesmedikationsplan in der ePA | Medikations-Prepopulation |
| **HL7 SDC Population** | SDC-Mechanismen für Questionnaire-Vorbelegung | Technische Umsetzung |

Die MIO PKA (Patientenkurzakte / Notfalldatensatz) ist als deutsche IPS-Umsetzung spezifiziert, aber in der Praxis noch kaum verbreitet. Die ePA 3.0 (Opt-out, ab 2025) schafft die infrastrukturelle Grundlage, jedoch fehlt bislang die breite Befüllung durch KIS und PVS. Für Zuverlegungen und neue Patientinnen wäre die ePA der natürliche Kanal, in der Praxis kommen Vorbefunde aktuell überwiegend als Arztbrief-PDF.

Langfristig werden die **DE Basisprofile**, **ISiK** und die **ePA-Spezifikation** die Prepopulation standardisieren. Dieses Modul definiert keine eigene Prepopulation-Logik, sondern dokumentiert lediglich, welche Felder prinzipiell vorbelegbar sind — die technische Umsetzung wird durch die übergeordneten Standards geregelt.

### Referenzen

- [HL7 IPS Implementation Guide](http://hl7.org/fhir/uv/ips/)
- [European Patient Summary (EPS) — eHDSI](https://art-decor.ehdsi.eu/publication/epSOS/)
- [KBV MIO Patientenkurzakte](https://mio.kbv.de/display/PKA/)
- [HL7 SDC — Questionnaire Population](http://hl7.org/fhir/uv/sdc/populate.html)
