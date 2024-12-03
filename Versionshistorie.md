# XHochschule - Versionshistorie

## Pre-Release Version 1.1 - Veröffentlichungsdatum: 21.10.2024

### 1. Strukturelle Änderungen
#### 1.1 Codelisten
Die Codeliste „Lernzeitmodell“ wird zukünftig von XBildung bezogen und nicht mehr in XHochschule bereitgestellt. Die Codelistenwerte haben sich nicht geändert. Die aktuellen Versionen der Destatis-Codelisten „Beurlaubungsgrund“, „Hochschulsignatur“ und „Fächerschlüssel“ wurden referenziert.

#### 1.2 Beziehung zu externen Modellen
Die Nachnutzung von XÖV-Kernkomponenten wurde systematisch geprüft. "Zeitraum" wird zukünftig als XÖV-Kernkomponente eingebunden und nicht mehr über XBildung. Die Klasse „Dokument“ wurde als Klasse in XHochschule modelliert und wird zukünftig nicht mehr von XBildung nachgenutzt. Die Einbindung der Namensraumpräfixe in den Instanzdateien wurde korrigiert.

#### 1.3 Schematron
Die Schematron-Regel zur logischen Prüfung des Verbots leerer Elemente wurde entfernt um der gemeinsamen Handhabung der XBildung-Projekte zu entsprechen. Eine fehlerhafte Regel zum „Lernzeitmodell“ wurde korrigiert. Die Gesamtdarstellung der Schematron-Regeln wurde im Hinblick auf Verständlichkeit überarbeitet. Ein Satz zur Relevanz von Schematron wurde im Abschnitt „Hinweise zur Implementierung“ eingefügt.

### 2. Änderungen am Modell
#### 2.1 Nachweis „Diploma Supplement“
Das Diploma Supplement wurde um optionale Felder erweitert um bei "Sprache" sowie bei mehreren Elementen der " Dauer und Ebene der Qualifikation" sowie der Erzielte Ergebnisse" Codelistenwerte mit angeben zu können. Hiermit soll die Konsistenz und die Interoperabilität des Datenmodells erhöht werden.

#### 2.2 Änderungen in Klasse „Leistung"
Um Darstellungen von Benotungen außerhalb eines Dezimalschemas zu ermöglichen, wurde als Stakeholder-Anforderung eine optionale alternative Repräsentation eingeführt.Ein neues Feld zur Angabe einer lehrenden oder prüfenden Person in Bezug auf eine Leistung wurde eingeführt. Die Beschreibung der „Leistungsart“ wurde präzisiert. Die Beschreibungen von „Leistungsstatus“, „Leistungsbenotungsstatus“ und „Benotet“ wurden präzisiert, um ihren logischen Zusammenhang zu verdeutlichen. Der Datentyp von "semesterDerLeistungserbringung" wurde geändert auf xhs:Studienzeitraum, um eine automatisierte Auswertung zu gewährleisten.

### 3. Sonstiges
Die URIs aller Codelisten wurden auf Übereinstimmung mit dem XRepository geprüft. Es wurden keine Auffälligkeiten festgestellt.

### 4. Liste der umgestezten Tickets
* XHS-630 Darstellung von Schematron-Regeln überarbeiten
* XHS-647 Systematisch Prüfen: Rückmeldung aus CaMS-Gesprächen zu XHS v 0.95
* XHS-657 Tbd: Leistungsarten inhaltlich definieren?
* XHS-662 Diploma Supplement stärker strukturiert modellieren
* XHS-676 Prüfen: zeigeNamensraumpraefix
* XHS-678 "4,0-Bescheinigung" - noch nicht endgültig benotete Leistung als bestanden kennzeichnen können
* XHS-679 Neue Version von Destatis-Codelisten einbinden
* XHS-680 Verlinkung zum Glossar anpassen / Vereinheitlichung mit XBD
* XHS-681 Anpassen der Anleitung für Schematron-Prüfung nach XBildung
* XHS-685 Tabelle der Schematron-Regeln: Spalten umbenennen
* XHS-686 Fehlerhafte Schematronregel "Lernzeitmodell"
* XHS-687 RDF-Erzeugung aktualisieren
* XHS-688 Modellierung von Ausstellungsort in XHS-Dokumenten überarbeiten
* XHS-689 Release Routine nach Vorbild von XBildung anpassen oder übernehmen
* XHS-690 Codelisten-URNs auf Konsistenz mit XRepository prüfen
* XHS-695 Versionsangaben bei externen Codelisten überprüfen und ggf. nachziehen
* XHS-698 Prüfen und Diskutieren: Feld "Prüfende/Lehrende" bei Leistungen
* XHS-700 Einheitlich "Ortsangabe" verwenden
* XHS-701 Übernahme von Satz aus XBD-Spezifikation
* XHS-704 Konsistente Nachnutzung von XBD- und XÖV-Datentypen sicherstellen
* XHS-705 Codeliste "Lernzeitmodell" von XBD neu einbinden
* XHS-707 Datentyp anpassen für "semesterDerLeistungserbringung"
