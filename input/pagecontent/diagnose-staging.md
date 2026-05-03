# Diagnose & Staging

<img src="senologie-diagnose.png" alt="UML Diagnose & Staging" style="max-width:100%"/>

## Spektrum der senologischen Diagnosen

Ein Brustzentrum versorgt nicht ausschließlich Krebspatientinnen. Das Diagnose-Spektrum umfasst:

| Kategorie | Beispiele | ICD-10-GM | Meldepflichtig |
|-----------|-----------|-----------|----------------|
| Invasives Karzinom | NST, lobulär, medullär | C50.x | Ja (oBDS, OncoBox, IQTIG) |
| Carcinoma in situ | DCIS | D05.x | Ja (oBDS, OncoBox, IQTIG) |
| Befunde unklarer Dignität | ADH, FEA, Papillom, LIN | D48.6 | Teilweise |
| Benigne Erkrankungen | Fibroadenom, Zysten, Mastopathie | D24, N60–N64 | Nein |
| Entzündliche Erkrankungen | Mastitis, Abszess | N61 | Nein |
| Risikoreduzierende Eingriffe | Prophylaktische Mastektomie (z.B. BRCA) | Z40 | Nein (ggf. Implantatregister) |
| Rekonstruktive Eingriffe | Brustrekonstruktion | Z42 | Nein (ggf. Implantatregister) |

Nicht alle Fälle erfordern ein vollständiges onkologisches Staging oder eine Krebsregistermeldung. Das Datenmodell muss das gesamte Spektrum abbilden können und dabei klar unterscheiden, welche Dokumentationstiefe für welche Diagnose erforderlich ist.

## Diagnose-Modellierung

Die Zuordnung einer Diagnose ist nicht immer von Beginn an eindeutig. Eine Patientin stellt sich mit einem auffälligen Befund vor — ob es sich um eine benigne Veränderung, eine Risikoläsion, ein Carcinoma in situ oder ein invasives Karzinom handelt, klärt sich oft erst im Verlauf des diagnostischen Prozesses (Bildgebung → Biopsie → Pathologie → ggf. OP-Präparat). DCIS etwa ist weder eindeutig benigne noch invasiv-maligne, wird aber für Meldung und Therapie wie ein Malignom behandelt. B3-Läsionen können sich nach Exzision als harmlos oder als Vorläufer eines Karzinoms herausstellen.

Das Datenmodell muss diesen diagnostischen Prozess abbilden können — von der initialen Verdachtsdiagnose bis zur gesicherten Diagnose mit vollständigem Staging.

Die Diagnose wird als FHIR Condition abgebildet. Zwei Profile decken das Spektrum ab:

- **Senologie_Diagnose_Maligne**: Für invasive Karzinome, DCIS und meldepflichtige Befunde. Erbt von MII Onko Primärtumor. Obligatorisch: ICD-10-GM, SNOMED CT. Optional: ICD-11 (Dual-Coding für Zukunftsvorsorge). Umfasst die onkologischen Staging-Felder.
- **Senologie_Diagnose_Benigne**: Für nicht-meldepflichtige Diagnosen (Fibroadenom, Zysten, Mastitis, Rekonstruktion). Gleiche Kodierungsstruktur, aber ohne onkologische Pflichtfelder.

## Staging

Das onkologische Staging ist nur bei malignen Diagnosen relevant und umfasst:

- **TNM-Klassifikation**: Klinisch (cTNM) und pathologisch (pTNM) als separate Staging-Einträge. Ergänzende Qualifier: y-Symbol (nach neoadjuvanter Therapie), m-Symbol (Multifokalität), L/V/Pn-Kategorie (Lymphgefäß-, Venen-, Perineurale Invasion).
- **UICC-Stadium**: Abgeleitet aus der TNM-Kombination.
- **Rezeptorstatus**: Östrogen (ER), Progesteron (PR), HER2 — sowohl qualitativ (positiv/negativ) als auch quantitativ (IRS-Score, IHC-Score, Anteil positive Zellen).
- **Ki-67 Proliferationsindex**: Prozent proliferierender Zellen, entscheidend für die Subtyp-Klassifikation.
- **Genexpressionstests**: Oncotype DX, EndoPredict, MammaPrint — Risikobewertung zur Therapieentscheidung.

Die TNM-Kategorien L, V und Pn werden als separate Observations nach MII Onko Profilen abgebildet (mii-pr-onko-tnm-l-kategorie, -v-kategorie, -pn-kategorie).

## Abbildung klinischer Szenarien

### Erstdiagnose

Die häufigste Konstellation: Eine Patientin wird mit einem neu diagnostizierten Tumor vorgestellt. Eine Condition mit `clinicalStatus = active` wird angelegt, das vollständige Staging durchgeführt.

### Rezidiv

Bei einem erneuten Auftreten nach vorheriger Behandlung wird ein neuer Fall angelegt. Die Rezidiv-Condition verweist über `occurredFollowing` auf die Ersterkrankung. Der Rezidivtyp (lokal, regionär, fern) wird als Staging-Information dokumentiert.

### Bilaterale synchrone Tumore

Zwei gleichzeitige Primärtumoren in beiden Brüsten werden als separate Conditions mit unterschiedlicher Seitenlokalisation (`bodySite`) dokumentiert. Alle nachfolgenden Ressourcen (Procedures, Observations) müssen explizit auf die jeweils zutreffende Condition referenzieren — hierfür wird SDC Choice Selection mit `candidateExpression` eingesetzt.

### Progression und Metastasierung

Ein Übergang von der kurativen in die palliative Situation wird über ein Status-Update der bestehenden Condition dokumentiert, begleitet von einer Verlaufs-Observation (MII Onko Verlauf).
