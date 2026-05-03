# Interoperabilität

## Einordnung

Dieser Implementation Guide existiert nicht isoliert, sondern baut auf bestehenden nationalen und internationalen Spezifikationen auf und ist zu diesen kompatibel. Die nachfolgenden Unterseiten beschreiben die Kompatibilität mit MII KDS, ISiK und europäischen Standards im Detail.

## Verwandte Spezifikationen

| Spezifikation | Beschreibung | Link |
|--------------|-------------|------|
| [MII KDS Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie) | Kerndatensatz der MII für onkologische Daten. Basis-Profile für Diagnose, TNM, Therapie, Verlauf. Dieses Modul erbt direkt davon. | Simplifier |
| [MII KDS Pathologie](https://simplifier.net/medizininformatikinitiative-modulpathologie) | Pathologie-Befundberichte nach MII-Spezifikation. Grundlage für DiagnosticReport und Specimen-Profile. | Simplifier |
| [Breast Cancer Pathology Specification](https://bih-cei.github.io/BreastCancerSpec/) | Beispielhafte Darstellung eines FHIR-basierten Pathologieberichts im Brustkrebskontext. Demonstriert, wie strukturierte Pathologie in FHIR aussehen kann. | BIH-CEI |
| [ISiK (gematik)](https://simplifier.net/isik) | Informationstechnische Systeme im Krankenhaus. Basisprofile für den deutschen Krankenhauskontext (Patient, Encounter, Condition etc.). | Simplifier |
| [HL7 Europe Laboratory & Imaging](https://build.fhir.org/ig/hl7-eu/laboratory/) | Europäische Spezifikation für Labor- und Bildgebungsbefunde. Potentielle syntaktische Grundlage für strukturierte Bildgebungsbefunde. | HL7 Europe |
| [mCODE (HL7 US)](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/) | Minimal Common Oncology Data Elements. US-amerikanisches Äquivalent für onkologische Basisdokumentation auf FHIR. | HL7 US |
| [International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/) | Internationaler Patientenkurzbrief. Relevant für grenzüberschreitende Versorgung und EHDS-Konformität. | HL7 International |
| [oBDS (ADT/GEKID)](https://basisdatensatz.de) | Onkologischer Basisdatensatz. XML-basierter Meldedatensatz für Krebsregister in Deutschland. Zielformat der oBDS-StructureMaps. | ADT/GEKID |
