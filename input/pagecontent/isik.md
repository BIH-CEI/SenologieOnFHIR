# ISiK Kompatibilität

## Grundprinzip

Die ISiK-Spezifikation (Informationstechnische Systeme im Krankenhaus) der gematik definiert Basisprofile für den stationären Versorgungskontext in Deutschland. ISiK wird derzeit in Stufe 6 kommentiert. Der Senologie-IG nutzt ISiK-kompatible Profile wo diese den fachlichen Anforderungen entsprechen.

## ISiK-kompatible Elemente

| Konzept | ISiK-Profil | Verwendung im Senologie-IG |
|---------|------------|---------------------------|
| Raucherstatus | ISiKRaucherStatus | Raucherstatus-Observation (C03) nutzt das ISiK-Profil mit LOINC 72166-2 |
| Patient | ISiKPatient | Patienten-Ressourcen sind konform zu den ISiK-Basisvorgaben |
| Encounter | ISiKKontaktGesundheitseinrichtung | Stationäre und ambulante Kontakte |
| Condition | ISiKDiagnose | ICD-10-GM Kodierung kompatibel |
| Procedure | ISiKProzedur | OPS-Kodierung kompatibel |

## Abgrenzung

ISiK definiert bewusst generische Profile für den breiten Einsatz in Krankenhausinformationssystemen. Die fachspezifische Tiefe der Senologie — etwa TNM-Staging, Rezeptorstatus oder Tumorboard-Empfehlungen — geht über den ISiK-Scope hinaus. Hier greifen die MII KDS Profile als fachliche Erweiterung.

Die Kompatibilität zu ISiK stellt sicher, dass senologische Daten in bestehende KIS-Infrastrukturen integriert werden können, ohne die Interoperabilität auf Basisebene zu gefährden.
