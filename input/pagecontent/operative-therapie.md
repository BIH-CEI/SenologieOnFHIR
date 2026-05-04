# Operative Therapie

<img src="senologie-operation.png" alt="UML Operative Therapie" style="max-width:100%"/>

## Stellenwert der operativen Therapie

Die Operation ist bei den meisten Mammakarzinomen zentraler Bestandteil der Behandlung — entweder als erster therapeutischer Schritt oder nach neoadjuvanter Systemtherapie, und wird ihrerseits durch adjuvante Therapien (Strahlentherapie, Systemtherapie) flankiert. Das Spektrum umfasst brusterhaltende Eingriffe, Mastektomien, axilläre Eingriffe zur Lymphknoten-Diagnostik sowie rekonstruktive Operationen. Darüber hinaus werden an Brustzentren auch risikoreduzierende Eingriffe (z.B. bei BRCA-Mutationsträgerinnen) und Revisionsoperationen (z.B. bei Implantat-Komplikationen) durchgeführt.

## Struktur einer Operation

Da im Rahmen einer Operation häufig mehrere Einzelprozeduren durchgeführt werden — etwa eine brusterhaltende Exzision zusammen mit einer Sentinel-Lymphknoten-Biopsie und einer intraoperativen Präparatradiographie — bildet das Datenmodell eine übergreifende Operation mit zugehörigen Unterprozeduren ab. Die Hauptprozedur repräsentiert den operativen Eingriff als Ganzes (Zeitpunkt, Intention, Gesamtergebnis), während die Unterprozeduren die einzelnen chirurgischen Maßnahmen mit ihren spezifischen OPS-Codes dokumentieren.

## Kodierung operativer Eingriffe

Die Kodierung operativer Eingriffe erfolgt in Deutschland über den Operationen- und Prozedurenschlüssel (OPS). Die exakten OPS-Codes werden über das KIS erfasst und können von dort übernommen werden. Eine vollständige Abbildung der OPS-Systematik auf SNOMED CT ist ohne umfangreiche Nutzung von Postkoordination nicht möglich und liegt daher außerhalb der ersten Version dieses Moduls. Das Datenmodell sieht beide Kodiersysteme als Coding-Slices vor — OPS als Primärkodierung aus dem KIS, SNOMED CT optional als internationale Ergänzung wo eindeutige Mappings bestehen.

| Eingriffstyp | OPS-Bereich | SNOMED CT (soweit eindeutig) |
|-------------|-------------|------------------------------|
| Brusterhaltende Exzision | 5-870 | 392021009 Lumpectomy |
| Mastektomie | 5-872 | 172043006 Modified radical mastectomy |
| Sentinel-LK-Biopsie | 5-401.11 | 396487001 Sentinel lymph node biopsy |
| Axilla-Dissektion | 5-402 | 79544006 Axillary dissection |
| Brustrekonstruktion (Implantat) | 5-886 | 33496007 Mammoplasty |

## Von der Empfehlung zur Durchführung

Die operative Versorgung folgt einem definierten Pfad: Die interdisziplinäre Tumorkonferenz spricht eine Therapieempfehlung aus. Daraus entsteht eine OP-Planung mit Angaben zu Seitenlokalisation, geplanter Operationsart und ggf. präoperativer Markierung. Nach Durchführung dokumentiert der Operateur das Ergebnis — einschließlich des Residualstatus (R0/R1/R2), der sich aus dem pathologischen Befund des OP-Präparats ergibt.

## Axilläre Chirurgie

Axilläre chirurgische Maßnahmen erfüllen diagnostische, prognostische und therapeutische Funktionen. Entsprechend variiert das operative Vorgehen in Abhängigkeit vom klinischen Befund und der systemischen Therapiestrategie. Die Sentinel-Lymphknoten-Biopsie stellt bei klinisch unauffälliger Axilla ein etabliertes Verfahren dar, wird jedoch im Zuge aktueller Deeskalationskonzepte zunehmend kritisch hinterfragt. Bei suspekten Lymphknoten kommt weiterhin selektiv eine axilläre Dissektion, zunehmend auch eine Target Axillary Dissection zum Einsatz.

Das Ergebnis — Anzahl entnommener und befallener Lymphknoten — fließt in das pathologische N-Staging ein.

## Nachresektion

Wird kein tumorfreier Resektionsrand erreicht (R1-Situation), folgt eine Nachresektion. Die Anzahl der Eingriffe bis zum Erreichen von R0 ist eine ableitbare Qualitätskennzahl für die DKG-Zertifizierung.

## Komplikationen

Operative Komplikationen werden nach der Clavien-Dindo-Klassifikation (Grad I–V) erfasst, ergänzt durch die ICD-10-kodierte Komplikationsdiagnose. Diese Informationen sind sowohl für die interne Qualitätssicherung als auch für die externe Meldung (oBDS, IQTIG) relevant.

## Rekonstruktion und Implantatregister

Bei Brustrekonstruktion mit Implantat werden zusätzlich Implantat-Daten erfasst (Hersteller, Typ, Volumen, UDI). Diese sind für die gesetzliche Meldung an das Implantatregister (IRegG) erforderlich.

## Zugehörige Ressourcen

| Typ | Ressource |
|-----|-----------|
| Profil | [Senologie_Operation](StructureDefinition-senologie-operation.html) |
| Profil | [Senologie_OP_Planung](StructureDefinition-senologie-op-planung.html) |
| Profil | [Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.html) |
| Profil | [Senologie_Implantat](StructureDefinition-senologie-implantat.html) |
| Questionnaire | [OP-Planung](Questionnaire-senologie-op-planung.html) |
| Questionnaire | [Postoperativ](Questionnaire-senologie-postop.html) |
| Beispiel | [Fall 1 — BET](Procedure-Fall1-Operation-BET.html) |
| Beispiel | [Fall 1 — SLNB](Procedure-Fall1-Operation-SLNB.html) |
| Beispiel | [Fall 1 — OP-Planung](ServiceRequest-Fall1-OP-Planung.html) |
