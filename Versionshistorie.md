Aktuelle Version: XHochschule 1.1 Pre-Release / Rückmeldungen werden bis 13.12.2024 entgegengenommen


# XHochschule - Versionshistorie


## Pre-Release Version 1.1 - Veröffentlichungsdatum: 21.10.2024

### Strukturelle Änderungen
#### Codelisten
Die Codeliste „Lernzeitmodell“ wird zukünftig von XBildung bezogen und nicht mehr in XHochschule bereitgestellt. Die Codelistenwerte haben sich nicht geändert. Die aktuellen Versionen der Destatis-Codelisten „Beurlaubungsgrund“, „Hochschulsignatur“ und „Fächerschlüssel“ wurden referenziert.

#### Beziehung zu externen Modellen
Die Nachnutzung von XÖV-Kernkomponenten wurde systematisch geprüft. "Zeitraum" wird zukünftig als XÖV-Kernkomponente eingebunden und nicht mehr über XBildung. Die Klasse „Dokument“ wurde als Klasse in XHochschule modelliert und wird zukünftig nicht mehr von XBildung nachgenutzt. Die Einbindung der Namensraumpräfixe in den Instanzdateien wurde korrigiert.

#### Schematron
Die Schematron-Regel zur logischen Prüfung des Verbots leerer Elemente wurde entfernt um der gemeinsamen Handhabung der XBildung-Projekte zu entsprechen. Eine fehlerhafte Regel zum „Lernzeitmodell“ wurde korrigiert. Die Gesamtdarstellung der Schematron-Regeln wurde im Hinblick auf Verständlichkeit überarbeitet. Ein Satz zur Relevanz von Schematron wurde im Abschnitt „Hinweise zur Implementierung“ eingefügt.

### Änderungen am Modell
#### Nachweis „Diploma Supplement“
Das Diploma Supplement wurde um optionale Felder erweitert um bei "Sprache" sowie bei mehreren Elementen der " Dauer und Ebene der Qualifikation" sowie der Erzielte Ergebnisse" Codelistenwerte mit angeben zu können. Hiermit soll die Konsistenz und die Interoperabilität des Datenmodells erhöht werden.

#### Änderungen in Klasse „Leistung"
Um Darstellungen von Benotungen außerhalb eines Dezimalschemas zu ermöglichen, wurde als Stakeholder-Anforderung eine optionale alternative Repräsentation eingeführt.Ein neues Feld zur Angabe einer lehrenden oder prüfenden Person in Bezug auf eine Leistung wurde eingeführt. Die Beschreibung der „Leistungsart“ wurde präzisiert. Die Beschreibungen von „Leistungsstatus“, „Leistungsbenotungsstatus“ und „Benotet“ wurden präzisiert, um ihren logischen Zusammenhang zu verdeutlichen. Der Datentyp von "semesterDerLeistungserbringung" wurde geändert auf xhs:Studienzeitraum, um eine automatisierte Auswertung zu gewährleisten.
