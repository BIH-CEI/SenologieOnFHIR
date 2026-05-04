# MII KDS Kompatibilität

## Grundprinzip

Die Profile dieses IG erben wo immer möglich direkt von den Profilen des MII Kerndatensatzes (KDS). Dadurch sind Senologie-Daten automatisch konform zu den MII-Vorgaben und können in den standortübergreifenden Datenintegrationszentren (DIZ) der Medizininformatik-Initiative verarbeitet werden.

## Genutzte MII Module

| MII Modul | Version | Verwendung im Senologie-IG |
|-----------|---------|---------------------------|
| Onkologie | 2026.0.3 | Diagnose (Primärtumor), TNM, Operation, Systemtherapie, Strahlentherapie, Verlauf, Nebenwirkungen, Genetische Variante, ECOG |
| Molekulares Tumorboard | 2026.0.1 | PD-L1 Immunhistochemie, molekularpathologische Marker |
| Pathologie | 2026.0.2 | DiagnosticReport, Specimen |
| Bildgebung | 2026.0.0 | BodyStructure (Tumorlokalisation) |
| Person | — | Vitalstatus, Todesursache |

## Profil-Vererbung

| Senologie-Profil | Erbt von (MII KDS) |
|-----------------|-------------------|
| Senologie_Diagnose_Maligne | mii-pr-onko-diagnose-primaertumor |
| Senologie_Operation | mii-pr-onko-mamma-operation |
| Senologie_Systemtherapie_Procedure | mii-pr-onko-systemische-therapie |
| Senologie_Strahlentherapie | mii-pr-onko-strahlentherapie |
| Senologie_FollowUp | mii-pr-onko-verlauf |
| Senologie_Nebenwirkung | mii-pr-onko-nebenwirkung |
| Senologie_Somatische_Mutation | mii-pr-onko-genetische-variante |
| Senologie_Pathologie_Befund | mii-pr-patho-report |
| Senologie_Pathologie_Praeparat | mii-pr-patho-specimen |

## Ergänzungen gegenüber MII KDS

Wo der MII KDS keine fachspezifischen Vorgaben macht, definiert der Senologie-IG eigene Profile — z.B. für:

- Bildgebungsbefunde (BI-RADS, ACR-Dichte)
- Gynäkologische Anamnese
- Genexpressionstests (Oncotype DX, EndoPredict)
- Tumorboard-Empfehlung (CarePlan)
- Klinische Untersuchung
- Begleitmedikation
- Sozialdienst / Psychoonkologie

Diese Profile sind so gestaltet, dass sie bei einer zukünftigen Aufnahme in den MII KDS kompatibel bleiben.

## MII Kerndatensatz Gesamtübersicht

Der MII Kerndatensatz umfasst modulübergreifend die folgenden Bereiche. Der Senologie-IG nutzt primär die Module Onkologie, Pathologie, Bildgebung und Person.

Weitere Details: [MII Kerndatensatz Complete v2026.1.0](https://github.com/medizininformatik-initiative/kerndatensatz-complete/releases/tag/v2026.1.0)
