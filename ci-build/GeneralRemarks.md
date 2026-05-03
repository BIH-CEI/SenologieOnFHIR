# Allgemeines - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Hintergrund & Motivation**](hintergrund.md)
* **Allgemeines**

## Allgemeines

# Senologie-KDS

Allgemeine Beschreibung Beginnend bei der Darstellung der Operation wollen wir gemeinsam mit dem Brustzentrum der Charité einen allgemeingültigen, öffentlich publizierten, abgestimmten, semantisch annotierten und operablen Datensatz erstellen.

## Formular-First Darstellung

Die Abbildung der Datenpunkte über Formulare orientiert sich am tatsächlichen klinischen Workflow. Die Formulare werden als solche gespeichert. Im Hintergrund werden die Ergebnisse jedoch in Domänenbasierte Ressourcen umgewandelt - aus einer Operationsdokumentation werden daher einzelne Prozeduren, Implantate etc. extrahiert.

## Operationen als Unterprozeduren

Auch wenn im klinischen Alltag ein operativer Eingriff als eine Operation bezeichnet wird, ist zur datengenauen Darstellung die Unterscheidung in mehrere Sub-Eingriffe zwingend erforderlich. Dies umfasst bspw.:

* gleiche oder ähnliche Eingriffe an beiden Seiten (links, rechts) als getrennte Eingriffe
* intraoperatives Entfernen der Lymphknoten bei nachweislicher Lymphmetastasierung als getrennten Eingriff von der Resektion
* Rekonstruktion (autolog oder implantatbasiert) als getrennten Eingriff von Resektion

Es kann zur Vereinfachung eine übergeordnete Procedure definiert werden, auf die von den SubProzeduren über Procedure.partOf verwiesen wird. Diese Hauptprozedur sollte dann von extern referenziert werden. Ausnahme: Observations und Nebenwirkungen/Revisionen, die sich explizit auf eine bestimmte Subprozedur beziehen (z.B. Implantatrevision)

